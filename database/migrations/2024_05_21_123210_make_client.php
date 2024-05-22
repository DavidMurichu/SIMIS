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
        //
        Schema::create('clients', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 32)->comment('Client Name');
            $table->string('city', 32)->nullable()->comment('City');
            $table->string('town', 32)->nullable()->comment('Town');
            $table->string('neighbourhood', 32)->nullable()->comment('Neighbourhood');
            $table->string('contactname', 64)->nullable()->comment('Contact Name');
            $table->string('website', 32)->nullable()->comment('Website');
            $table->text('streetaddress')->nullable()->comment('Street Address');
            $table->string('mobile', 20)->comment('Mobile No');
            $table->string('email', 64)->comment('Email Address');
            $table->text('remarks')->nullable()->comment('Remarks');
            $table->integer('createdby')->nullable();
            $table->date('createdon')->nullable();
            $table->enum('is_active', ['0', '1'])->default('1')->comment('Enabled');
            $table->string('ipaddress', 32)->nullable();
            $table->integer('lasteditedby')->nullable();
            $table->dateTime('lasteditedon')->nullable();
            $table->string('plotno', 32)->comment('Plot No');
            $table->integer('clientno')->comment('Client No');
            $table->string('contactmobile', 32)->nullable()->comment('Contact Person Mobile');
            $table->string('companyLocation')->nullable()->comment('Company Location');
            $table->string('companyFacebook')->nullable()->comment('Company Facebook');
            $table->string('companyTwitter')->nullable()->comment('Company Twitter');
            $table->string('companyYoutube')->nullable()->comment('Company Youtube');
            $table->boolean('showCompanyLogo')->nullable()->comment('Show Company Logo');
            
            $table->timestamps(); // Adds created_at and updated_at columns
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
        Schema::dropIfExists('clients');
    }
};
