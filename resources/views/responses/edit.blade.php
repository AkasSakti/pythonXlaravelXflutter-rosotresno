@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Edit Response</h2>
    
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('responses.update', $response->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div class="mb-3">
    <label for="user_id" class="form-label">User</label>
    <input type="text" class="form-control" value="{{ $response->user->name ?? 'User Tidak Ditemukan' }}" readonly>
    <input type="hidden" name="user_id" value="{{ $response->user_id }}">
</div>

        @php
            $enumOptions = ['Ya' => 'Ya', 'Tidak' => 'Tidak'];
            $freqOptions = ['Jarang' => 'Jarang', 'Sedang' => 'Sedang', 'Sering' => 'Sering'];
        @endphp

        @foreach (['sering_memikirkan', 'cemburu', 'sering_chat', 'mencari_kesempatan', 'jantung_berdebar', 'sering_menatap', 'gugup', 'senyum_saat_dengar_nama', 'membayangkan_masa_depan', 'mudah_memaafkan'] as $field)
            <div class="mb-3">
                <label for="{{ $field }}" class="form-label">{{ ucfirst(str_replace('_', ' ', $field)) }}</label>
                <select name="{{ $field }}" id="{{ $field }}" class="form-control" required>
                    @foreach ($enumOptions as $key => $value)
                        <option value="{{ $key }}" {{ $response->$field == $key ? 'selected' : '' }}>{{ $value }}</option>
                    @endforeach
                </select>
            </div>
        @endforeach

        @foreach (['merasa_bahagia', 'nyaman_berbicara', 'perhatian', 'prioritas', 'kehilangan_motivasi'] as $field)
            <div class="mb-3">
                <label for="{{ $field }}" class="form-label">{{ ucfirst(str_replace('_', ' ', $field)) }} (1-10)</label>
                <input type="number" name="{{ $field }}" id="{{ $field }}" class="form-control" min="1" max="10" 
                    value="{{ old($field, $response->$field) }}">
            </div>
        @endforeach

        <div class="mb-3">
            <label for="frekuensi_nyebut" class="form-label">Frekuensi Menyebut Nama</label>
            <select name="frekuensi_nyebut" id="frekuensi_nyebut" class="form-control" required>
                @foreach ($freqOptions as $key => $value)
                    <option value="{{ $key }}" {{ $response->frekuensi_nyebut == $key ? 'selected' : '' }}>{{ $value }}</option>
                @endforeach
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Label</label>
            <input type="text" class="form-control" value="{{ $response->label }}" disabled>
            <small class="text-muted">Label akan ditentukan oleh sistem.</small>
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
        <a href="{{ route('responses.index') }}" class="btn btn-secondary">Kembali</a>
    </form>
</div>
@endsection
