# 📅 Estimasi Project Timeline: Sistem MBG (Durasi 4 Minggu)

Proyek ini dibagi menjadi 4 fase utama untuk memastikan kualitas dan akurasi data audit terjaga.

---

## **Minggu 1: Fondasi & Backend (Sprint 1A)**

* **Fokus:** Penyiapan database dan infrastruktur server JSP.
* **Target:** Database 5 tabel terhubung sempurna & Sistem Login berjalan.
* **Milestone:** Admin Dapur bisa login dan melihat data sekolah tujuan.

## **Minggu 2: Distribusi & Logistik (Sprint 1B)**

* **Fokus:** Implementasi form pengiriman dapur.
* **Target:** Logika "Batas Jam 09:00" aktif. Jika input terlambat, sistem mencatat bendera kuning secara otomatis.
* **Milestone:** Sistem bisa mencatat jadwal pengiriman harian ke database.

## **Minggu 3: Konfirmasi Mobile (Sprint 2A)**

* **Fokus:** Antarmuka petugas sekolah (Mobile-first).
* **Target:** Fitur kamera aktif, kompresi foto di sisi klien (agar hemat kuota), dan validasi jumlah porsi.
* **Milestone:** Petugas sekolah bisa mengirim konfirmasi penerimaan dengan bukti foto.

## **Minggu 4: Audit, Reporting & Launch (Sprint 2B)**

* **Fokus:** Dashboard Auditor dan fitur Export.
* **Target:** Logika "Batas Jam 11:00" (Merah jika telat). Fitur download Excel/PDF siap pakai.
* **Milestone:** **UAT (User Acceptance Testing)** dan peluncuran resmi (Production).

---

## 🚦 Jalur Kritis (Critical Path)
Ada dua hal yang tidak boleh terlambat:
1. **Integrasi Upload Foto (Minggu 3):** Jika gagal, Admin Audit tidak punya bukti fisik.
2. **Validasi Jam Real-time:** Pastikan waktu server sinkron agar tidak ada perdebatan "Jam 11:00" antara sekolah dan dapur.

---
