<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ResponseWebController; // Web Controller
use App\Http\Controllers\PredictionController;

Route::get('/', function () {
    return redirect()->route('login');
});

// Autentikasi
Route::get('/login', [AuthController::class, 'loginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

// Prediksi
Route::controller(PredictionController::class)->group(function () {
    Route::get('/predict', 'index')->name('predict.index'); // Menampilkan halaman prediksi
    Route::post('/predict', 'predict')->name('predict.process'); // Proses prediksi
});

// Web-only Routes (Gunakan Controller Khusus Web)
Route::middleware(['auth'])->group(function () {
    Route::resource('responses', ResponseWebController::class); // Gunakan Controller Web
});
