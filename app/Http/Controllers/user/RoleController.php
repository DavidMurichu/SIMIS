<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Role;
use Log;

class RoleController extends Controller
{
    public function index()
    {
        try {
            $roles = Role::all();
            return response()->json($roles, 200);
        } catch (\Exception $e) {
            Log::error($e->getMessage());

            $data = [
                'status'=>500,
                'message' => $e->getMessage(),
            ];
        return response()->json($data, 200);
    }
    
}
}