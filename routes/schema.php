<?php

use App\Http\Controllers\giant\SchemaController;
use Illuminate\Support\Facades\Route;



Route::group([
        'middleware' => 'api',
        'prefix' => 'edit'
    ], function () {
Route::post('/update/users/{id}', [SchemaController::class,'update'])->name('');
    

    
    });