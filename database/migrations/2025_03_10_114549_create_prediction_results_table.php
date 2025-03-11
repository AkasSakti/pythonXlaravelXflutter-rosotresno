<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('prediction_results', function (Blueprint $table) {
            $table->id(); // Auto increment
             $table->text('prediction')->change(); // Ubah kolom prediction menjadi TEXT
            $table->string('prediction'); // Kolom untuk menyimpan hasil prediksi
            $table->timestamps(); // Kolom created_at dan updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('prediction_results', function (Blueprint $table) {
            $table->string('prediction')->change(); // Kembalikan ke string jika rollback
        });
    }
};
