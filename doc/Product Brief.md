# Product Brief: Sistem Manajemen Distribusi MBG

## Ringkasan Eksekutif (Executive Summary)
Sistem Manajemen Distribusi MBG adalah platform logistik dan pemantauan kualitas yang dirancang untuk memastikan program pemberian makanan bergizi berjalan tepat waktu, tepat jumlah, dan memenuhi standar kesehatan. Sistem ini menghubungkan Dapur Pusat, Armada Kendaraan, dan Sekolah dalam satu ekosistem digital yang transparan dan dapat diaudit.

## Masalah & Peluang (Problem Statement)
- Masalah: Kurangnya visibilitas real-time terhadap status pengiriman makanan dan standarisasi pelaporan kualitas dari pihak sekolah.
- Peluang: Digitalisasi proses konfirmasi untuk meminimalisir keterlambatan dan memastikan akuntabilitas setiap porsi makanan yang didistribusikan.

## Visi Proyek 
Menciptakan transparansi dan akuntabilitas penuh dalam distribusi makan bergizi gratis, memastikan setiap anak menerima haknya dengan standar kualitas yang terjaga melalui validasi data yang ketat.

## Target Pengguna & Peran (User Personas)
- Admin Dapur (Web/Desktop): Mengelola jadwal, input data pengiriman, dan memantau distribusi harian.
- Petugas Sekolah (Mobile Web): Konfirmasi penerimaan real-time, penilaian kualitas (suhu, rasa, kebersihan), dan unggah foto bukti.
- Admin Audit (Web/Desktop): Hak akses penuh untuk mengawasi seluruh aliran data, melakukan rekonsiliasi jika ada ketidaksamaan data, dan menarik laporan performa (KPI) dapur serta vendor kendaraan secara periodik.

## Fitur Utama (MVP Scope)
A. Modul Logistik & Distribusi
    - Penjadwalan pengiriman berdasarkan kapasitas dapur dan jumlah siswa.
    - Pencatatan waktu keberangkatan (Departure Log).
    - Manajemen data kendaraan dan driver.

B. Modul Konfirmasi Mobile (Priority)
    - User Interface: Desain responsif khusus mobile untuk petugas lapangan.
    - Validasi Kamera: Pengambilan foto bukti penerimaan langsung dari kamera.
    - Form Kualitas: Input kategori kualitas (Sangat Layak/Layak/Tidak Layak) dan catatan tambahan.

C. Modul Audit & Pelaporan
    - Alert System: Notifikasi visual di dashboard untuk keterlambatan dan kualitas "Tidak Layak".
    - Reporting: Fitur ekspor data historis ke format Excel (untuk olah data) dan PDF (untuk laporan resmi).

## Aturan Bisnis & SLA (Service Level Agreement)
- Batas Waktu Kirim: Maksimal jam 09:00 WIB.
- Batas Waktu Terima: Maksimal jam 11:00 WIB (Target makan siang siswa).
- Integritas Data: Foto bukti bersifat wajib (Mandatory) untuk setiap transaksi penerimaan.
- Rekonsiliasi: Jika jumlah_terima < jumlah_kirim, sistem wajib menandai transaksi untuk diaudit.

## Spesifikasi Teknis Dasar
- Platform: Web-based Application.
- Stack: Jakarta Server Pages (JSP), Java Servlet, JDBC.
- Database: 5 tabel relasional (Accounts, Schools, Kitchens, Vehicles, Delivery History).
- Optimasi: Penyimpanan foto berbasis file system dengan referensi path di database.