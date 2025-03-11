<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Response extends Model
{
    use HasFactory;
    protected $table = 'responses';

    protected $fillable = [
        'user_id',
        'sering_memikirkan',
        'merasa_bahagia',
        'cemburu',
        'nyaman_berbicara',
        'sering_chat',
        'mencari_kesempatan',
        'perhatian',
        'frekuensi_nyebut',
        'jantung_berdebar',
        'sering_menatap',
        'gugup',
        'senyum_saat_dengar_nama',
        'membayangkan_masa_depan',
        'prioritas',
        'mudah_memaafkan',
        'kehilangan_motivasi',
        'label',
    ];
}
