<?php

namespace App\Http\Controllers;

use App\Models\Response;
use Illuminate\Http\Request;

class ResponseWebController extends Controller
{
    public function index()
    {
        // Menampilkan semua data dalam halaman Blade
        $responses = Response::all();
        return view('responses.index', compact('responses'));
    }

    public function create()
    {
        // Menampilkan form tambah data
        return view('responses.create');
    }

    // Jangan lupa import model

public function store(Request $request)
{
    // Cek apakah request masuk
   // dd($request->all()); // Jika ini muncul, berarti request sampai ke controller

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
    Response::create($validated);

    // Redirect ke halaman index dengan pesan sukses
    return redirect()->route('responses.index')->with('success', 'Data berhasil ditambahkan!');
}


    public function show($id)
    {
        // Menampilkan detail data
        $response = Response::findOrFail($id);
        return view('responses.show', compact('response'));
    }

    public function edit($id)
    {
        // Menampilkan form edit data
        $response = Response::findOrFail($id);
        return view('responses.edit', compact('response'));
    }

    public function update(Request $request, $id)
    {
        $response = Response::findOrFail($id);
        
        // Validasi input
        $validated = $request->validate([
            'user_id' => 'required|integer',
            'sering_memikirkan' => 'required|string',
            'merasa_bahagia' => 'nullable|integer',
            'cemburu' => 'required|string',
            'nyaman_berbicara' => 'nullable|integer',
            'sering_chat' => 'required|string',
            'mencari_kesempatan' => 'required|string',
            'perhatian' => 'nullable|integer',
            'frekuensi_nyebut' => 'required|string',
            'jantung_berdebar' => 'required|string',
            'sering_menatap' => 'required|string',
            'gugup' => 'required|string',
            'senyum_saat_dengar_nama' => 'required|string',
            'membayangkan_masa_depan' => 'required|string',
            'prioritas' => 'nullable|integer',
            'mudah_memaafkan' => 'required|string',
            'kehilangan_motivasi' => 'nullable|integer',
            'label' => 'required|string',
        ]);

        // Update data
        $response->update($validated);
        
        // Redirect kembali dengan pesan sukses
        return redirect()->route('responses.index')->with('success', 'Data berhasil diperbarui.');
    }

    public function destroy($id)
    {
        // Hapus data
        $response = Response::findOrFail($id);
        $response->delete();
        
        // Redirect kembali dengan pesan sukses
        return redirect()->route('responses.index')->with('success', 'Data berhasil dihapus.');
    }
}
