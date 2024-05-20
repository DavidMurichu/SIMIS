<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class RegEmail extends Mailable
{
    use Queueable, SerializesModels;

    public $username;
    public $password;

    public function __construct($username, $password)
    {
        $this->username = $username;
        $this->password = $password;
    }

    public function build()
    {
        return $this->subject('Your username and password')
                    ->view('emails.senduserdetails') 
                    ->with('username', $this->username)
                    ->with('password', $this->password);
    }
}
