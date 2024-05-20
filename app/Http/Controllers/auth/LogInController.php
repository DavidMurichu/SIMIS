<?php

namespace App\Http\Controllers\auth;

use App\Traits\AuthTrait;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Tymon\JWTAuth\Facades\JWTAuth;




class LogInController extends Controller
{
    //Log in
    use AuthTrait;

public function login(Request $request)
{

    try {
        //Step 1 Validate and sanitize request data

        $request->validate([
            'email' => ['required', 'email', 'string', 'max:255'],
            'password' => ['required', 'string', 'min:8'],
        ]);


        // Find user by email
        $user = User::where('email', strtolower(trim($request->email)))->first();


        // Check user existence and verify password
        if (! $user || ! Hash::check($request->password, $user->password)) {
            $data=[
                "message"=> "Invalid login credentials",
                "status"=>401
            ];
            return response()->json($data, 200);
        }
        
        //check if user is active (if active login else move to 2FA)
        if(!$user->active){
        // 2FA 
        $data=$this->twoFA($user);
        return response()->json($data, $data['status']);
    }

   
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
}
