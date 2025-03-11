<?php

namespace App\Http\Controllers;

use App\Models\Response;
use Illuminate\Http\Request;

class ResponseController extends Controller
{
    public function index()
    {
        return Response::all();
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'user_id' => 'required|integer',
            'sering_memikirkan' => 'required|string',
            'merasa_bahagia' => 'required|integer',
            'cemburu' => 'required|string',
            'nyaman_berbicara' => 'required|integer',
            'sering_chat' => 'required|string',
            'mencari_kesempatan' => 'required|string',
            'perhatian' => 'required|integer',
            'frekuensi_nyebut' => 'required|string',
            'jantung_berdebar' => 'required|string',
            'sering_menatap' => 'required|string',
            'gugup' => 'required|string',
            'senyum_saat_dengar_nama' => 'required|string',
            'membayangkan_masa_depan' => 'required|string',
            'prioritas' => 'required|integer',
            'mudah_memaafkan' => 'required|string',
            'kehilangan_motivasi' => 'required|integer',
            'label' => 'required|string',
        ]);
    
        $response = Response::create($validated);
    return response()->json($response, 201);
    }

    public function show($id)
    {
        return Response::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $response = Response::findOrFail($id);
        $validated = $request->validate([
            'user_id' => 'required|exists:users,id',
            'sering_memikirkan' => 'required|in:Ya,Tidak',
            'merasa_bahagia' => 'nullable|integer',
            'cemburu' => 'required|in:Ya,Tidak',
            'nyaman_berbicara' => 'nullable|integer',
            'sering_chat' => 'required|in:Ya,Tidak',
            'mencari_kesempatan' => 'required|in:Ya,Tidak',
            'perhatian' => 'nullable|integer',
            'frekuensi_nyebut' => 'required|in:Jarang,Sedang,Sering',
            'jantung_berdebar' => 'required|in:Ya,Tidak',
            'sering_menatap' => 'required|in:Ya,Tidak',
            'gugup' => 'required|in:Ya,Tidak',
            'senyum_saat_dengar_nama' => 'required|in:Ya,Tidak',
            'membayangkan_masa_depan' => 'required|in:Ya,Tidak',
            'prioritas' => 'nullable|integer',
            'mudah_memaafkan' => 'required|in:Ya,Tidak',
            'kehilangan_motivasi' => 'nullable|integer',
            'label' => 'required|in:Jatuh Cinta,Tidak Jatuh Cinta',
        ]);

        $response->update($validated);
        return $response;
    }

    public function destroy($id)
    {
        $response = Response::findOrFail($id);
        $response->delete();
        return response()->json(['message' => 'Deleted successfully'], 200);
    }
}
