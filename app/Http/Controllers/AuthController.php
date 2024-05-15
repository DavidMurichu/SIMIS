<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Log;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str; 
use Illuminate\Support\Facades\Mail;
use App\Mail\OtpEmail;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Support\Facades\Auth;
class AuthController extends Controller
{ 

public function send_mail( $user, $otpCode){
    // Send OTP code via email
    try {
    Mail::to($user->email)->send(new OtpEmail($otpCode, $user));
    $data=[
        'message'=>'OTP sent to your email. Please check and enter the code to proceed.',
        'status'=>200
    ];
    
    return $data;
} catch (\Exception $e) {
    Log::error('OTP sending error: ' . $e->getMessage());
    $data=[
        'message'=>$e->getMessage(),
        'status'=>500
    ];
    return $data;
}
}

public function generate_otpcode($user){
    // Generate and store OTP code
    $otpCode = Str::random(6);
    $user->otp_code = $otpCode;
    $user->save();
    return $otpCode;
}

public function login(Request $request)
{
    try {
        // Validate and sanitize request data
        $request->validate([
            'email' => ['required', 'email', 'string', 'max:255'],
            'password' => ['required', 'string', 'min:8'],
        ]);
        // Find user by sanitized email
        $user = User::where('email', strtolower(trim($request->email)))->first();
        // Check user existence and verify password
        if (! $user || ! Hash::check($request->password, $user->password)) {
            return response()->json(['message' => 'Invalid login credentials'], 401);
        }
        $otpCode=$this->generate_otpcode($user);
        $message=$this->send_mail($user, $otpCode);
        $status=$message['status'];
        $data=[
            'message'=>$message['message'],
            'status'=> $status
        ];
        // Redirect to OTP verification route with success message
        return response()->json($data, $status);
    } catch (ValidationException $e) {
        return response()->json(['message' => 'The given data was invalid.', 'errors' => $e->errors()], 422);
    } catch (\Exception $e) {
        Log::error('Login error: ' . $e->getMessage());
        return response()->json(['message' => 'An unexpected error occurred. Please try again later.'], 500);
    }
}

public function otp_authenticate(Request $request){
     // Find the user based on the provided OTP
    $user = User::where('otp_code', $request->input('otp'))->first();

    if (!$user) {
         // Handle case where user is not found with the provided OTP
        return response()->json(['error' => 'Invalid OTP'], 401);}

    // Clear the OTP code from the user record (optional)
    $user->otp_code = null;
    $user->save();

        if ($user->is_verified) {
            try {
                $token = JWTAuth::fromUser($user);
                $data = [
                    'status' => 200,
                    'token' => $token,
                ];
            } catch (JWTException $e) {
                return response()->json(['error' => 'Could not create token'], 500);
            }
    } else{
    $user->is_verified=1;
    $user->save();

        $data=[
            'status'=>201,
            'message'=>'user activated successfully',
            'user'=>$user
        ];}
    return response()->json($data, 200);
}

public function show_login() {
    return response()->json(['message'=> 'Login Form'],200);
}
public function store(Request $request)
{
    try {
        // Validate the request data
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8'],
        ]);
            // Create the user
        $user = User::create([
            'name' => $request->name,
            'email' => strtolower(trim($request->email)),
            'password' => Hash::make($request->password),
        ]);      
        $otpCode=$this->generate_otpcode($user);
        $message=$this->send_mail($user, $otpCode);
        $status=$message['status'];
        $data=[
            'status'=>$status,
            'message'=> $message['message'],
        ];
        // User created successfully, return a JSON response with the user data
        return response()->json($data, $status);
    } catch (ValidationException $e) {
        // Validation errors occurred, return a JSON response with error details
        return response()->json(['message' => 'The given data was invalid.', 'errors' => $e->errors()], 422);
    } catch (\Exception $e) {
        // Unexpected error occurred, log the error and return a generic error message
        Log::error('User creation error: ' . $e->getMessage());
        return response()->json(['message' =>$e->getMessage() ], 500);
    }
}
    public function getToken()
    {
        $token = csrf_token();
        return response()->json(['csrf_token' => $token]);
    }

public function logout(Request $request)
{
    try {
        $token = JWTAuth::getToken();
        if (!$token) {
            return response()->json(['error' => 'Token not provided'], 400);
        }
        JWTAuth::invalidate($token);
        return response()->json(['message' => 'User logged out successfully']);
    } catch (\Exception $e) {
        // Determine the type of exception and set an appropriate response message and status code
        $status = 500;
        $message = 'An error occurred'. $e->getMessage();
        return response()->json(['error' => $message], $status);
    }
}
}
