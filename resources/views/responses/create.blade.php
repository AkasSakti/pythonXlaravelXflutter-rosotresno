@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Tambah Response</h2>
    <form action="{{ route('responses.store') }}" method="POST">
        @csrf

        <div class="mb-3">
            <label class="form-label">User ID</label>
            <input type="number" name="user_id" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Sering Memikirkan</label>
            <select name="sering_memikirkan" class="form-control" required>
                <option value="Ya">Ya</option>
                <option value="Tidak">Tidak</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Merasa Bahagia (0-100)</label>
            <input type="number" name="merasa_bahagia" class="form-control" min="0" max="100">
        </div>

        <div class="mb-3">
            <label class="form-label">Cemburu</label>
            <select name="cemburu" class="form-control" required>
                <option value="Ya">Ya</option>
                <option value="Tidak">Tidak</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Nyaman Berbicara (0-100)</label>
            <input type="number" name="nyaman_berbicara" class="form-control" min="0" max="100">
        </div>

        <div class="mb-3">
            <label class="form-label">Sering Chat</label>
            <select name="sering_chat" class="form-control" required>
                <option value="Ya">Ya</option>
                <option value="Tidak">Tidak</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Mencari Kesempatan</label>
            <select name="mencari_kesempatan" class="form-control" required>
                <option value="Ya">Ya</option>
                <option value="Tidak">Tidak</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Perhatian (0-100)</label>
            <input type="number" name="perhatian" class="form-control" min="0" max="100">
        </div>

        <div class="mb-3">
            <label class="form-label">Frekuensi Menyebut</label>
            <select name="frekuensi_nyebut" class="form-control" required>
                <option value="Jarang">Jarang</option>
                <option value="Sedang">Sedang</option>
                <option value="Sering">Sering</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Jantung Berdebar</label>
            <select name="jantung_berdebar" class="form-control" required>
                <option value="Ya">Ya</option>
                <option value="Tidak">Tidak</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Sering Menatap</label>
            <select name="sering_menatap" class="form-control" required>
                <option value="Ya">Ya</option>
                <option value="Tidak">Tidak</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Gugup</label>
            <select name="gugup" class="form-control" required>
                <option value="Ya">Ya</option>
                <option value="Tidak">Tidak</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Senyum Saat Dengar Nama</label>
            <select name="senyum_saat_dengar_nama" class="form-control" required>
                <option value="Ya">Ya</option>
                <option value="Tidak">Tidak</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Membayangkan Masa Depan</label>
            <select name="membayangkan_masa_depan" class="form-control" required>
                <option value="Ya">Ya</option>
                <option value="Tidak">Tidak</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Prioritas (0-100)</label>
            <input type="number" name="prioritas" class="form-control" min="0" max="100">
        </div>

        <div class="mb-3">
            <label class="form-label">Mudah Memaafkan</label>
            <select name="mudah_memaafkan" class="form-control" required>
                <option value="Ya">Ya</option>
                <option value="Tidak">Tidak</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Kehilangan Motivasi (0-100)</label>
            <input type="number" name="kehilangan_motivasi" class="form-control" min="0" max="100">
        </div>

       
        <div class="mb-3">
            <label class="form-label">Label</label>
            <select name="label" class="form-control" required>
                <option value="Jatuh Cinta">Jatuh Cinta</option>
                <option value="Tidak Jatuh Cinta">Tidak Jatuh Cinta</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Simpan</button>
    </form>
</div>
@endsection
