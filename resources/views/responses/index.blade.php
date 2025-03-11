@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Data Responses</h2>
    <a href="{{ route('responses.create') }}" class="btn btn-primary">Tambah Data</a>
    <table class="table table-bordered mt-3">
        <thead>
            <tr>
                <th>ID</th>
                <th>User ID</th>
                <th>Sering Memikirkan</th>
                <th>Merasa Bahagia</th>
                <th>Cemburu</th>
                <th>Nyaman Berbicara</th>
                <th>Sering Chat</th>
                <th>Mencari Kesempatan</th>
                <th>Perhatian</th>
                <th>Frekuensi Nyebut</th>
                <th>Jantung Berdebar</th>
                <th>Sering Menatap</th>
                <th>Gugup</th>
                <th>Senyum Saat Dengar Nama</th>
                <th>Membayangkan Masa Depan</th>
                <th>Prioritas</th>
                <th>Mudah Memaafkan</th>
                <th>Kehilangan Motivasi</th>
                <th>Label</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @foreach($responses as $response)
                <tr>
                    <td>{{ $response['id'] }}</td>
        <td>{{ $response['user_id'] }}</td>
        <td>{{ $response['sering_memikirkan'] ?? '' }}</td>
        <td>{{ $response['merasa_bahagia'] ?? '' }}</td>
        <td>{{ $response['cemburu'] ?? '' }}</td>
        <td>{{ $response['nyaman_berbicara'] ?? '' }}</td>
        <td>{{ $response['sering_chat'] ?? '' }}</td>
        <td>{{ $response['mencari_kesempatan'] ?? '' }}</td>
        <td>{{ $response['perhatian'] ?? '' }}</td>
        <td>{{ $response['frekuensi_nyebut'] ?? '' }}</td>
        <td>{{ $response['jantung_berdebar'] ?? '' }}</td>
        <td>{{ $response['sering_menatap'] ?? '' }}</td>
        <td>{{ $response['gugup'] ?? '' }}</td>
        <td>{{ $response['senyum_saat_dengar_nama'] ?? '' }}</td>
        <td>{{ $response['membayangkan_masa_depan'] ?? '' }}</td>
        <td>{{ $response['prioritas'] ?? '' }}</td>
        <td>{{ $response['mudah_memaafkan'] ?? '' }}</td>
        <td>{{ $response['kehilangan_motivasi'] ?? '' }}</td>
        <td>{{ $response['label'] ?? '' }}</td>
                    <td>
                        <a href="{{ route('responses.edit', $response['id']) }}" class="btn btn-warning">Edit</a>
<form action="{{ route('responses.destroy', $response['id']) }}" method="POST" class="d-inline">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger" onclick="return confirm('Yakin ingin menghapus?')">Hapus</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection