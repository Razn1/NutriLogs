# User Flow Sistem Manajemen MBG

## Alur Petugas Sekolah (Mobile - High Priority)

Ini adalah alur "Cepat & Akurat" yang didesain untuk penggunaan di lapangan.

    - Mulai: Petugas menerima notifikasi/melihat daftar kedatangan makanan hari ini di dashboard mobile.
    - Identifikasi: Memilih baris pengiriman yang sesuai dengan armada yang datang.
    - Input Data:
        - Mengisi jumlah paket yang diterima (Sistem akan otomatis membandingkan dengan jumlah_kirim).
        - Memilih Kategori Kualitas (Sangat Layak / Layak / Tidak Layak).
        - Menambah catatan jika ada ketidaksesuaian.
    - Bukti Visual: Menekan tombol "Buka Kamera", mengambil foto makanan, dan sistem otomatis melakukan kompresi & upload.
    - Selesai: Menekan "Kirim Konfirmasi". Sistem memberikan feedback visual (Centang Hijau) bahwa data telah aman di server.

## Alur Admin Dapur (Web Desktop)

    - Mulai: Login ke Dashboard Dapur.
    - Input Pengiriman: Memilih sekolah tujuan dan kendaraan yang tersedia.
    - Validasi Waktu: Jika input dilakukan di atas jam 09:00, sistem memunculkan peringatan "Terlambat Kirim".
    - Submit: Data terkirim dan status pengiriman berubah menjadi "Dalam Perjalanan".

## Alur Admin Audit (Web Desktop)

    - Mulai: Masuk ke Dashboard Utama.
    - Monitoring: Melihat peta atau daftar status pengiriman (Warna Merah untuk yang melewati jam 11:00 atau kualitas "Tidak Layak").
    - Deep Dive: Klik pada salah satu pengiriman untuk melihat foto bukti dan detail konfirmasi petugas sekolah.
    - Pelaporan: Memilih rentang tanggal dan menekan tombol "Export PDF/Excel" untuk laporan pertanggungjawaban.

---

### Visualisasi Logika (Sequence Design)
[ Petugas Sekolah ] --(Login)--> [ Daftar Hari Ini ] --(Pilih Pengiriman)--> [ Form Konfirmasi ] --(Foto & Submit)--> [ Success Screen ]
