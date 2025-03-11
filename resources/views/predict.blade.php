<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prediksi Jatuh Cinta</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
     <!-- Menambahkan gambar di sini -->
        <div class="text-center mb-4">
            <img src="{{ asset('storage/pyXlara.jpg') }}" alt="Gambar Prediksi Jatuh Cinta" class="img-fluid" style="max-width: 100%; height: auto;">
        </div>
        <h2 class="text-center">Prediksi Jatuh Cinta Pakai Naive Bayes</h2>

        <form action="{{ route('predict.process') }}" method="POST">
            @csrf

            <div class="mb-3">
                <label class="form-label">Sering Memikirkan?</label>
                <select name="sering_memikirkan" class="form-control" required>
                    <option value="Ya">Ya</option>
                    <option value="Tidak">Tidak</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Seberapa Bahagia (1-10)?</label>
                <input type="number" name="merasa_bahagia" class="form-control" min="1" max="10" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Cemburu?</label>
                <select name="cemburu" class="form-control" required>
                    <option value="Ya">Ya</option>
                    <option value="Tidak">Tidak</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Nyaman Berbicara (1-10)?</label>
                <input type="number" name="nyaman_berbicara" class="form-control" min="1" max="10" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Sering Chat?</label>
                <select name="sering_chat" class="form-control" required>
                    <option value="Ya">Ya</option>
                    <option value="Tidak">Tidak</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Mencari Kesempatan?</label>
                <select name="mencari_kesempatan" class="form-control" required>
                    <option value="Ya">Ya</option>
                    <option value="Tidak">Tidak</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Perhatian (1-10)?</label>
                <input type="number" name="perhatian" class="form-control" min="1" max="10" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Frekuensi Menyebut Nama?</label>
                <select name="frekuensi_nyebut" class="form-control" required>
                    <option value="Jarang">Jarang</option>
                    <option value="Sedang">Sedang</option>
                    <option value="Sering">Sering</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Jantung Berdebar?</label>
                <select name="jantung_berdebar" class="form-control" required>
                    <option value="Ya">Ya</option>
                    <option value="Tidak">Tidak</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Sering Menatap?</label>
                <select name="sering_menatap" class="form-control" required>
                    <option value="Ya">Ya</option>
                    <option value="Tidak">Tidak</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Gugup?</label>
                <select name="gugup" class="form-control" required>
                    <option value="Ya">Ya</option>
                    <option value="Tidak">Tidak</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Senyum Saat Dengar Nama?</label>
                <select name="senyum_saat_dengar_nama" class="form-control" required>
                    <option value="Ya">Ya</option>
                    <option value="Tidak">Tidak</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Membayangkan Masa Depan?</label>
                <select name="membayangkan_masa_depan" class="form-control" required>
                    <option value="Ya">Ya</option>
                    <option value="Tidak">Tidak</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Prioritas (1-10)?</label>
                <input type="number" name="prioritas" class="form-control" min="1" max="10" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Mudah Memaafkan?</label>
                <select name="mudah_memaafkan" class="form-control" required>
                    <option value="Ya">Ya</option>
                    <option value="Tidak">Tidak</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Kehilangan Motivasi (1-10)?</label>
                <input type="number" name="kehilangan_motivasi" class="form-control" min="1" max="10" required>
            </div>

            <button type="submit" class="btn btn-primary">Prediksi</button>
        </form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
    $("form").on("submit", function (e) {
        e.preventDefault(); // Mencegah reload halaman

        $.ajax({
            url: "{{ route('predict.process') }}", // Pastikan route benar
            type: "POST",
            data: $(this).serialize(), // Mengirim semua input form
            success: function (response) {
                alert("Hasil Prediksi: " + response.data.prediction); // Tampilkan message box
            },
            error: function (xhr) {
                alert("Error: " + xhr.responseJSON.error); // Tampilkan error jika ada
            }
        });
    });
});
</script>
    </div>
</body>
</html>