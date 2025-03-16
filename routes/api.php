<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ResponseController;

Route::middleware('api')->group(function () {
    Route::get('/responses', [ResponseController::class, 'index']);
    Route::post('/responses', [ResponseController::class, 'store']);
    Route::put('/responses/{id}', [ResponseController::class, 'update']);
    Route::delete('/responses/{id}', [ResponseController::class, 'destroy']);
});

Route::get('/prediction-counts', function () {
    $data = DB::table('prediction_results')
        ->select('prediction', DB::raw('COUNT(*) as count'))
        ->groupBy('prediction')
        ->get();

    return response()->json($data);
});

