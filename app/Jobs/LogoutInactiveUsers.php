<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\User;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Carbon;

class LogoutInactiveUsers implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $inactiveThreshold = Carbon::now()->subSeconds(30); 
        //Using session
        $lastActive = session()->get('last_active');
    
        if ($lastActive && $lastActive < $inactiveThreshold) {
            JWTAuth::invalidate(JWTAuth::getToken()); // Invalidate current token
            // Optionally, redirect to login page or display a logout message
        }
    }
}
