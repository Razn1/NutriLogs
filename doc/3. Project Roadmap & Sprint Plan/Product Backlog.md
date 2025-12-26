# Product Backlog

## 🏃‍♂️ Sprint 1: Core Engine & Distribution (Minggu 1-2)

**Goal:** Membangun fondasi sistem dan memungkinkan Admin Dapur mengirim data.

| ID | User Story | Task Teknis |
| --- | --- | --- |
| **ST1.1** | Setup Lingkungan & Database | Konfigurasi Server (JSP/Servlet), Setup JDBC, dan Create 5 tabel (Winston's Schema). |
| **ST1.2** | Autentikasi Role-Based | Buat sistem Login untuk 3 role: Admin Dapur, Sekolah, dan Audit. |
| **ST1.3** | Master Data Management | CRUD (Create, Read, Update, Delete) untuk tabel Sekolah, Dapur, dan Kendaraan. |
| **ST1.4** | Input Pengiriman (Dapur) | Form input pengiriman harian dengan **Validasi Logika jam 09:00** (Jika > 09:00, status = Peringatan). |

---

## 🏃‍♂️ Sprint 2: Mobile Confirmation & Audit Power (Minggu 3-4)

**Goal:** Menyelesaikan alur konfirmasi mobile dan dashboard pengawasan.

| ID | User Story | Task Teknis |
| --- | --- | --- |
| **ST2.1** | Mobile Confirmation Form | Implementasi UI Sally di JSP dengan dukungan `capture="camera"` untuk upload foto bukti. |
| **ST2.2** | Business Logic Jam 11:00 | Script otomatis untuk menandai pengiriman "Terlambat" jika belum dikonfirmasi sekolah lewat jam 11:00. |
| **ST2.3** | Dashboard Audit (Live) | View terpusat untuk Auditor dengan filter kategori kualitas dan indikator warna (Merah/Kuning/Hijau). |
| **ST2.4** | Reporting Engine | Implementasi library untuk **Export to Excel** (POI) dan **Export to PDF** (iText) dari dashboard. |

---

## 🛠️ Definisi Selesai (Definition of Done)
setiap tugas di atas baru dianggap selesai jika:
1. Kode sudah diuji koneksinya ke Database.
2. Form mobile bisa mengunggah foto tanpa *error*.
3. Laporan yang di-export (Excel/PDF) menampilkan data yang sama dengan database.

---