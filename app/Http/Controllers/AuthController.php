<?php

namespace App\Http\Controllers;
use App\Traits\AuthTrait;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Support\Facades\Log;
use Nette\Schema\ValidationException;

class AuthController extends Controller
{ 

use AuthTrait;


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
            $data=[
                "message"=> "Invalid login credentials",
                "status"=>401
            ];
            return response()->json($data, 200);
        }

        if(!$user->active){
        $otpCode=$this->generate_otpcode($user);
        $message=$this->send_mail($user, $otpCode);
        $status=$message['status'];
        $data=[
            'status'=> $status,
            'message'=>$message['message'],
            
        ];
        // Redirect to OTP verification route with success message
        return response()->json($data, $status);
    }
    // $user->active= 0;
    // $user->save();
    $data=[
        'status'=>200,
        'activated'=>true,
        'redirect'=>'mainPage'
    ];
    return response()->json($data,200);
    

    } catch (\Exception $e) {
        Log::error('Login error: ' . $e->getMessage());
        $data=[
            'message'=>'Some error occured Try again later',
            'status'=> 500
        ];
        return response()->json($data, 500);
    }
}





public function otp_authenticate(Request $request){
    // // Find the user based on the provided OTP
    $user = User::where('otp_code',$request->input('code'))->first();
    if (!$user) {
            // Handle case where user is not found with the provided OTP
            $data=[

                'message' => 'Invalid OTP',
                'status'=> 401
            ];
        return response()->json($data, 200);
        }

    try {
        $token = $this->generateToken($user);
        $data = [
            'status' => 200,
            'token' => $token,
        ];

    // Clear the OTP code from the user record (optional)
    $user->otp_code = null;
    $user->save();
    return response()->json($data, 200);
    } catch (JWTException $e) {
        return response()->json(['message' => 'Could not create token'], 500);
    }
    
}


public function show_login() {
    return response()->json(['message'=> 'Login Form'],200);
}
public function register(Request $request)
{
    try {
        // Validate the request data
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8'],
            'role_id' => 'required|exists:roles,id',
        ]);
            // Create the user
        $user = User::create([
            'name' => $request->name,
            'email' => strtolower(trim($request->email)),
            'password' => Hash::make($request->password),
            'role_id'=> $request->role_id,
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
        return response()->json(['message' => 'The given data was invalid.', 'errors' => $e->getMessage()], 422);
    } catch (\Exception $e) {
        // Unexpected error occurred, log the error and return a generic error message
        Log::error('User creation error: ' . $e->getMessage());
        return response()->json(['message' =>$e->getMessage() ], 500);
    }
}


    public function getToken(Request $request)
    
    {
        $token = $request->session()->token();

        return response()->json(['token' => $token]);
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
        $status = 500;
        $message = 'An error occurred'. $e->getMessage();
        return response()->json(['error' => $message], $status);
    }
}


public function add_role(Request $request){
    $request->validate([
        'role'=>['required','string','max:100'],
    ]);

}

}
