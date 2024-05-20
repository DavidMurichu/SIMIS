<?php

namespace App\Traits;


use App\Mail\RegEmail;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Log;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Support\Facades\Mail;
use App\Mail\OtpEmail;
use App\Models\User;
use Illuminate\Support\Str; 
use App\Models\Role;
use Carbon\Carbon;



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
            'exp' => Carbon::now()->addHours(24)->timestamp
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

    public function send_reg_mail( $user, $password){
        // Send logins via email
        try {
        Mail::to($user->email)->send(new RegEmail($user->email, $password));
        $data=[
            'message'=>'Login sent to your email. Please check and enter the code to proceed.',
            'status'=>200
        ];
        
        return $data;
    } catch (\Exception $e) {
        Log::error(' sending Login error: ' . $e->getMessage());
        $data=[
            'message'=>$e->getMessage(),
            'status'=>500
        ];
        return $data;
    }
    }
    
    


public function handle()
{
    $inactiveThreshold = Carbon::now()->subMinutes(5); 

    //Using Database (if storing timestamp in database)
    $lastActive = User::where('id', auth()->user()->id)->pluck('last_active')->first();

    if ($lastActive && $lastActive < $inactiveThreshold) {
        JWTAuth::invalidate(JWTAuth::getToken()); 
    }
}


    public function generate_otpcode($user){
        // Generate and store OTP code
        $otpCode = $this->generateRandomString();
        $user->otp_code = $this->encrptCode( $otpCode);
        $user->otp_expires_at = Carbon::now()->addMinutes(5);
        $user->save();
        return $otpCode;
    }



    public function generateRandomString()
{
    $numbers = str_pad(strval(random_int(100, 999)), 3, '0', STR_PAD_LEFT);
    $letters = Str::upper(Str::random(3));
    $randomString = str_shuffle($numbers . $letters);
    return $randomString;
}

//encrypt otp data
public function encrptCode($otpCode){
    $encryptedcode=hash('sha256', $otpCode);
    return $encryptedcode;
}

//generate random email and password



public function twoFA($user){
    $otpCode=$this->generate_otpcode($user);
    $message=$this->send_mail($user, $otpCode);

    $status=$message['status'];
    $data=[
        'status'=> $status,
        'message'=>$message['message'],
  
    ];
    return $data;

}



}




