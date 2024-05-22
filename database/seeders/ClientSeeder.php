<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ClientSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('clients')->insert([
            'name' => 'JOYSEEN SCHOOL',
            'email' => 'joyseelyn@gmail.com',
            'mobile' => '0112795876',
            'website' => 'joyseen.co.ke',
            'companyLocation' => 'Great Wall',
            'showCompanyLogo' => false,
            'createdby' => 1, // or the appropriate user ID
            'createdon' => now(), // current date
            'is_active' => '1',
            // Add other fields with default or appropriate values
            'city' => null,
            'town' => null,
            'neighbourhood' => null,
            'contactname' => null,
            'streetaddress' => null,
            'remarks' => null,
            'ipaddress' => null,
            'lasteditedby' => null,
            'lasteditedon' => null,
            'plotno' => 'Plot No',
            'clientno' => 1,
            'contactmobile' => null,
            'companyFacebook' => null,
            'companyTwitter' => null,
            'companyYoutube' => null,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}