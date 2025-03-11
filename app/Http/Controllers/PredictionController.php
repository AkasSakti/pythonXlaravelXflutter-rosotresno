<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Models\PredictionResult;

class PredictionController extends Controller
{
    public function index() {
        return view('predict'); // Tampilkan halaman form
    }

    public function predict(Request $request)
    {
        // Ambil input dari request, kecuali _token
        $inputData = $request->except('_token'); // Menghapus token CSRF

        // Mengonversi input menjadi JSON
        $jsonInput = json_encode($inputData, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

        // Log input JSON untuk debugging
        Log::info('Input JSON: ' . $jsonInput);

        // Jalankan Python dengan input JSON
        $command = 'python C:\laragon\www\klasifikasicinta\public\python\predict.py';
$process = proc_open(
    $command,
    [
        0 => ['pipe', 'r'], // STDIN
        1 => ['pipe', 'w'], // STDOUT
        2 => ['pipe', 'w'], // STDERR
    ],
    $pipes
);

if (is_resource($process)) {
    fwrite($pipes[0], $jsonInput); // Kirim JSON ke Python
    fclose($pipes[0]);

    $output = stream_get_contents($pipes[1]); // Ambil output
    fclose($pipes[1]);

    $errorOutput = stream_get_contents($pipes[2]); // Ambil error jika ada
    fclose($pipes[2]);

    proc_close($process);
}

// Log output Python
Log::info('Output dari Python: ' . $output);

// Jika Python error, tampilkan ke response
if (!empty($errorOutput)) {
    return response()->json(["error" => "Python Error", "detail" => $errorOutput], 500);
}

// Parsing hasil output Python
$jsonLines = explode("\n", trim($output));
$lastJson = end($jsonLines); // Ambil baris JSON terakhir

$result = json_decode($lastJson, true);
if (is_null($result)) {
    return response()->json(['error' => 'Output dari Python tidak valid.', 'raw_output' => $output], 400);
}

// Simpan ke database
$prediction = new PredictionResult();
$prediction->input_data = $jsonInput;
$prediction->prediction = $result['prediction'];
$prediction->save();

return response()->json([
    "message" => "Prediksi berhasil disimpan!",
    "data" => $prediction
]);

        

        // Log output dari skrip Python
       // Log::info('Output dari Python: ' . $output);

        // Parsing hasil output Python
        //$result = json_decode($output, true);

        // Cek apakah $result adalah null atau tidak
        //if (is_null($result)) {
          //  return response()->json(['error' => 'Output dari Python tidak valid.'], 400);
        //}

        // Jika ada error dari Python
        //if (isset($result['error'])) {
          //  return response()->json($result, 400);
        //}

        // Simpan ke database
        //$prediction = new PredictionResult();
        //$prediction->input_data = $jsonInput;
        //$prediction->prediction = $result['prediction']; // Simpan hasil prediksi
        //$prediction->save();

        // Kembalikan response
        //return response()->json([
          //  "message" => "Prediksi berhasil disimpan!",
            //"data" => $prediction
        //]);
    }
}