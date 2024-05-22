<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Seeder;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Define the roles to be inserted
        $roles = [
            ['role' => 'Sacco Management Committee'],
            ['role' => 'Treasurer'],
            ['role' => 'Members'],
            ['role' => 'Normal User'],
        ];

        // Insert the roles into the roles table
        foreach ($roles as $role) {
            Role::create($role);
        }
    }
}