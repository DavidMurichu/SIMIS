<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function __invoke(){
        $user=auth()->user();
        $data=[
            "status"=>200,
            "user"=>$user
        ];
        return response()->json($data,200);
    }
}
