<?php

namespace App\Traits;


use App\Service\OtpService;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Log;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Support\Facades\Mail;
use App\Mail\OtpEmail;
use Illuminate\Support\Str; 
use App\Models\Role;
use App\Helpers\EncryptionHelper;
use Illuminate\Http\Request;


trait AuthTrait
{
    
    public function generateToken($user)
    {

   
        try {
            // Generate a token for the user
            $token = JWTAuth::fromUser($user, $this->getCustomClaims($user));
            
            return $token;
        } catch (JWTException $e) {
            // Handle token generation errors
            return null;
        }
    }
    public function getCustomClaims($user)
    {
        $role= Role::find($user->role_id)->role;
        // Define custom claims to include in the token payload

        $data=[
            
            'username' => $user->username,
            'role' => $role, 
            'active' => $user->active ? 'active' : 'inactive',
            'user_id' => $user->id,
        ];
        return $data;

    }
    
    
    
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
    


    public function getEncryptionKey() {
        // Retrieve the key from a secure location, such as environment variables or a secure storage
        return 'Retrieve the key from a secure location, such as environment varia';
    }

public function handle()
{
    $inactiveThreshold = now()->subMinutes(30); // 30 minutes ago

    // Option 1: Using Session (if storing timestamp in session)
    $lastActive = session()->get('last_active');

    // Option 2: Using Database (if storing timestamp in database)
    // $lastActive = User::where('id', auth()->user()->id)->pluck('last_active')->first();

    if ($lastActive && $lastActive < $inactiveThreshold) {
        JWTAuth::invalidate(JWTAuth::getToken()); // Invalidate current token
        // Optionally, redirect to login page or display a logout message
    }
}


public function generatee_otpcode($user)
    {
        $encryptedData = EncryptionHelper::generateCode($user);
        return $encryptedData;
    }

    public function a_decrypt($encryptedData)
    {
        $decryptedData = EncryptionHelper::decryptCode($encryptedData);
        return  $decryptedData;
    }

    public function generate_otpcode($user){
        // Generate and store OTP code
        $otpCode = Str::random(6);
        $user->otp_code = $otpCode;
        $user->save();
        return $otpCode;
    }
}



