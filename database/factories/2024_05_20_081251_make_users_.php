<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        
        Schema::create('users', function (Blueprint $table) {
        $table->id();
        $table->string('name')->nullable(false);
        $table->string('fullname')->nullable(false);
        $table->string('username')->unique()->nullable(false);
        $table->string('department')->nullable(true);
        $table->string('phone')->nullable(true)->unique();
        $table->integer('created_by')->nullable(false);
        $table->foreignId('role_id')->constrained('roles')->onDelete('cascade');
        $table->boolean('active')->default(false);
        $table->string('otp_code')->nullable();
        $table->timestamp('otp_expires_at')->nullable();
        $table->string('email')->unique()->nullable(false);
        $table->timestamp('email_verified_at')->nullable();
        $table->string('password');
        $table->rememberToken();
        $table->timestamps();


    });
   

     
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    
    }
};