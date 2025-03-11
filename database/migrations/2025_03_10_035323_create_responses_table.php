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
        Schema::create('responses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->enum('sering_memikirkan', ['Ya', 'Tidak']);
            $table->integer('merasa_bahagia')->nullable();
            $table->enum('cemburu', ['Ya', 'Tidak']);
            $table->integer('nyaman_berbicara')->nullable();
            $table->enum('sering_chat', ['Ya', 'Tidak']);
            $table->enum('mencari_kesempatan', ['Ya', 'Tidak']);
            $table->integer('perhatian')->nullable();
            $table->enum('frekuensi_nyebut', ['Jarang', 'Sedang', 'Sering']);
            $table->enum('jantung_berdebar', ['Ya', 'Tidak']);
            $table->enum('sering_menatap', ['Ya', 'Tidak']);
            $table->enum('gugup', ['Ya', 'Tidak']);
            $table->enum('senyum_saat_dengar_nama', ['Ya', 'Tidak']);
            $table->enum('membayangkan_masa_depan', ['Ya', 'Tidak']);
            $table->integer('prioritas')->nullable();
            $table->enum('mudah_memaafkan', ['Ya', 'Tidak']);
            $table->integer('kehilangan_motivasi')->nullable();
            $table->enum('label', ['Jatuh Cinta', 'Tidak Jatuh Cinta']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('responses');
    }
};
