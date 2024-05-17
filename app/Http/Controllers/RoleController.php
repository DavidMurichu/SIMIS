<?php

namespace App\Http\Controllers;

use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Log;

class RoleController extends Controller
{

    public function getRoles() // Use camelCase for function names
    {
        try {
            $roles = Role::all();
            return Response::json($roles, 200); // Return only roles data
        } catch (\Exception $e) {
            $data = [
                'error' => 'Error retrieving roles: ' . $e->getMessage(),
            ];
            return Response::json($data, 500); // More specific error message
        }
    }

    public function createRole(Request $request)
    {
    try{  $request->validate([
            'role' => ['required', 'string', 'max:100', 'unique:roles,role'],
        ]);
        $role = Role::create([
            'role'=>$request->role
        ]);
        $data=[
            'status'=>200,
            'message'=>'role created successfully'
        ];
        return Response::json($data,200);
    } catch (ValidationException $e) {
        // Validation errors occurred, return a JSON response with error details
        return response()->json(['message' => 'The given data was invalid.', 'errors' => $e->getMessage()], 422);
    } catch (\Exception $e) {
        // Unexpected error occurred, log the error and return a generic error message
        Log::error('User creation error: ' . $e->getMessage());
        return response()->json(['message' =>$e->getMessage() ], 500);
    }
    }
}
