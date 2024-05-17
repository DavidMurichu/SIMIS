<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\RoleController;

use Illuminate\Support\Facades\Route;


Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function () {

// Define your routes
Route::middleware('throttle:apiLimiter')->get('/csrf_token', [AuthController::class, 'getToken']);


Route::middleware('throttle:apiLimiter')->post("/2FAcode", [AuthController::class, 'otp_authenticate'])->name('otpAuth');
Route::middleware('throttle:apiLimiter')->post('/login', [AuthController::class, 'login'])->name('login');
Route::middleware('throttle:apiLimiter')->post("/register", [AuthController::class, "register"])->name('register');
Route::get("/dashboard", DashboardController::class)->middleware('jwt.auth');
Route::post("/logout", [AuthController::class, 'logout'])->middleware('jwt.auth');

// Roles Routes
Route::post("/role/add", [RoleController::class, 'createRole'])->name('createrole');
});