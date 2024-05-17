<?php
namespace App\Service;
class OtpService {

    private $encryptionKey;

    public function __construct($key) {
        $this->encryptionKey = $key;
    }

    public function encrypt($data) {
        $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length('aes-256-cbc'));
        $encrypted = openssl_encrypt($data, 'aes-256-cbc', $this->encryptionKey, 0, $iv);
        return base64_encode($encrypted . '::' . $iv);
    }

    public function decrypt($data) {
        list($encrypted_data, $iv) = array_pad(explode('::', base64_decode($data), 2), 2, null);
        return openssl_decrypt($encrypted_data, 'aes-256-cbc', $this->encryptionKey, 0, $iv);
    }

    public function generate_otpcode($user) {
        // Use user's unique email to generate a base code
        $baseCode = $user->email . '::' . time(); // Adding a timestamp to ensure uniqueness

        // Encrypt the base code
        $encryptedCode = $this->encrypt($baseCode);

        // Take the first 6 characters of the encrypted code to use as the OTP code
        $otpCode = substr($encryptedCode, 0, 6);

        // No need to save the OTP code, as it can be generated from user details
        return $otpCode;
    }

    public function generate_user($data) {
        // Use user's unique email to generate a base code
        // Encrypt the base code
        $encryptedCode = $this->decrypt($data);

        // Take the first 6 characters of the encrypted code to use as the OTP code
        $user= substr($encryptedCode, 0, 6);

        // No need to save the OTP code, as it can be generated from user details
        return $user;
    }
}
