<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Str;


class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    
    public function run(): void
    {

        $faker = Faker::create();
        // Define the roles to be inserted
        $users = [
            [
            'created_by'=>1,
            'name' => 'paul',
            'fullname' => 'paul webo', 
            // 'username' => 'paulwebo38@gmail.com', 
            'department' => 'farming',
            'phone' => '0100010000', 
            'active' => 1,
            'email' => 'paulwebo38@gmail.com', 
            'email_verified_at' => now(),
            'password' => bcrypt('secret1234'), 
            'remember_token' => Str::random(10),
            'role_id' => 1, ],
            [
                'created_by'=>1,
                'name' => 'david',
                'fullname' => 'David Murichu', 
                // 'username' => 'hungry124monitor@gmail.com', 
                'department' => 'farming',
                'phone' => '0109010000', 
                'email' => 'hungry124monitor@gmail.com', 
                'password' => bcrypt('secret1234'), 
                'remember_token' => Str::random(10),
                'role_id' => 1, ],

        ];

        // Insert the roles into the roles table
        foreach ($users as $user) {
            User::create($user);
        }
    }
}