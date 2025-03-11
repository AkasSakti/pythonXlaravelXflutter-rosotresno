<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangePredictionColumnInPredictionResultsTable extends Migration
{
    public function up()
    {
        Schema::table('prediction_results', function (Blueprint $table) {
            $table->text('prediction')->change(); // Ubah kolom prediction menjadi TEXT
        });
    }

    public function down()
    {
        Schema::table('prediction_results', function (Blueprint $table) {
            $table->string('prediction', 255)->change(); // Kembalikan ke varchar(255) jika rollback
        });
    }

};
