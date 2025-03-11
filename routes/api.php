<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ResponseController;

Route::middleware('api')->group(function () {
    Route::get('/responses', [ResponseController::class, 'index']);
    Route::post('/responses', [ResponseController::class, 'store']);
    Route::put('/responses/{id}', [ResponseController::class, 'update']);
    Route::delete('/responses/{id}', [ResponseController::class, 'destroy']);
});

