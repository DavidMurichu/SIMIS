<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;

use Illuminate\Support\Facades\Route;


Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function () {

// Define your routes
Route::middleware('throttle:apiLimiter')->get('/token', [AuthController::class, 'getToken']);
Route::middleware('throttle:apiLimiter')->post('/login', [AuthController::class, 'login'])->name('login');
Route::middleware('throttle:apiLimiter')->post("/register", [AuthController::class, "store"])->name('register');
Route::get("/dashboard", DashboardController::class)->middleware('jwt.auth');
Route::post("/logout", [AuthController::class, 'logout'])->middleware('jwt.auth');
Route::post("/otpcode", [AuthController::class, 'otp_authenticate'])->name('otpAuth');
});