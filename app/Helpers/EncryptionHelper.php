<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Crypt;

class EncryptionHelper
{
    /**
     * Generate a 6-character code based on user details and encrypt it.
     *
     * @param  \App\Models\User  $user
     * @return string
     */
    public static function generateCode($user)
    {
        // Concatenate user details to create a string
        $data = $user->id . '|' . $user->email . '|' . $user->name;
        
        // Encrypt the data
        $encryptedData = Crypt::encryptString($data);

        // Generate a 6-character code
        $code = substr(md5($encryptedData), 0, 6);

        return $code;
    }

    /**
     * Decrypt the code to retrieve the user details.
     *
     * @param  string  $code
     * @param  \App\Models\User  $user
     * @return array
     */
    public static function decryptCode($code, $user)
    {
        // Recreate the original encrypted data based on the user details
        $data = $user->id . '|' . $user->email . '|' . $user->name;
        $encryptedData = Crypt::encryptString($data);
        $originalCode = substr(md5($encryptedData), 0, 6);

        // Check if the provided code matches the original code
        if ($code === $originalCode) {
            // Decrypt the data
            $decryptedData = Crypt::decryptString($encryptedData);
            $details = explode('|', $decryptedData);

            return [
                'id' => $details[0],
                'email' => $details[1],
                'name' => $details[2]
            ];
        }

        throw new \Exception("Invalid code");
    }
}