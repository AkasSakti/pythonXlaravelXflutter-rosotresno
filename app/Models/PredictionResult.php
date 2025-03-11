<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PredictionResult extends Model
{
    use HasFactory;
    protected $fillable = [
        'input_data',
        'prediction',
    ];
}
