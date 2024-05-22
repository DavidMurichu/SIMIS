<?php
use App\Http\Controllers\auth\RegisterController;
use App\Http\Controllers\auth\VerifyOtpController;
// use App\Http\Controllers\AuthController;
use App\Http\Controllers\auth\LogInController;
use App\Http\Controllers\auth\LogOutController;
use App\Http\Controllers\giant\SchemaController;
use Illuminate\Support\Facades\Route;



Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function () {

Route::middleware('throttle:apiLimiter')->post("/2FAcode", [VerifyOtpController::class, 'otp_authenticate'])->name('otpAuth');
Route::middleware('throttle:apiLimiter')->post('/login', [LogInController::class, 'login'])->name('login');
Route::middleware('throttle:apiLimiter')->post("/register", [RegisterController::class, "register"])->name('register');
Route::post("/logout", [LogOutController::class, 'logout'])->middleware('jwt.auth');


Route::get("/{tableName}", [SchemaController::class, 'get_table_data']);
Route::post("/edit/{tableName}", [SchemaController::class, 'update']);
Route::post("/users/deactivate", [SchemaController::class, 'deactivate']);

});