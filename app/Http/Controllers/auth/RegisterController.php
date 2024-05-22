<?php

namespace App\Http\Controllers\auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Traits\AuthTrait;
use Illuminate\Support\Str; 
use App\Models\User;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;


class RegisterController extends Controller
{
    use AuthTrait;
    public function register(Request $request)
{
    try{
        
    //validate data for regestration data
   

    
    $request->validate([
        'user.name' => 'required|string|max:255',
        'user.fullname' => 'required|string|max:255',
        'user.department' => 'nullable|string|max:255',
        'user.phone' => 'nullable|string|max:10|unique:users,phone',
        'user.email' => 'required|string|email|max:255|unique:users,email',
        'user.role_id' => 'required|exists:roles,id',
    ]);



    $user_details=$request->user;
    //generate unique username and password for user
    $user_details['password'] = Str::random(8);
    $user_details['created_by']=$request->admin_id;
    


    //create user to the db
    $user = User::create($user_details);


    // //initialize 2FA
    $data=$this->send_reg_mail($user, $user_details['password']);


    return response()->json($data, $data['status']);
    // return response()->json($user, 200);


}
catch(ValidationException $e){
    Log::error($e->getMessage());
    $data=[
        'message'=> $e->getMessage(),
        'status'=>401
    ];
    return response()->json($data, 401); 
}catch(\Exception $e){
    Log::error($e->getMessage());
    $data=[
        'message'=> $e->getMessage(),
        'status'=>500
    ];
    return response()->json($data,500);

}
}

public function update(Request $request, $id){
    
}

}
