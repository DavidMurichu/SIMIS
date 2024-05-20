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
    $data=$request->validate([
        'surname' => 'required|string|max:255',
        'fullname' => 'required|string|max:255',
        'department' => 'nullable|string|max:255',
        'phone' => 'nullable|string|max:10|unique:users,phone',
        'email' => 'required|string|email|max:255|unique:users,email',
        'role_id' => 'required|exists:roles,id',
    ]);

    //generate unique username and password for user
    $data['password'] = Str::random(8);
    $data['username'] = $request->email;

    //create user to the db
    $user = User::create($data);


    //initialize 2FA
    $data=$this->send_reg_mail($user, $data['password']);

    return response()->json($data, $data['status']);


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
