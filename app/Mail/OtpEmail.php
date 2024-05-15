<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OtpEmail extends Mailable
{
    use Queueable, SerializesModels;

    public $otpCode;
    public $user;

    public function __construct($otpCode, $user)
    {
        $this->otpCode = $otpCode;
        $this->user = $user;
    }

    public function build()
    {
        return $this->subject('Your OTP Code')
                    ->view('emails.otp') 
                    ->with('otpCode', $this->otpCode)
                    ->with('user', $this->user);
    }
}
