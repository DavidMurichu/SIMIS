<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Audits extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'activity_type',
        'activity_time',
        'ip_address',
        'user_agent',
        'additional_info',
    ];
}
