-- 1. Tabel Akun (Master User)
CREATE TABLE accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    role ENUM('admin_dapur', 'petugas_sekolah', 'admin_audit') NOT NULL,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL -- Disarankan menggunakan hashing di level aplikasi JSP
);

-- 2. Tabel Sekolah (Master Sekolah)
CREATE TABLE schools (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(150) NOT NULL,
    alamat TEXT NOT NULL,
    jumlah_siswa INT NOT NULL
);

-- 3. Tabel Dapur MBG (Master Dapur)
CREATE TABLE kitchens (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(150) NOT NULL,
    alamat TEXT NOT NULL,
    kapasitas INT NOT NULL,
    jumlah_karyawan INT NOT NULL
);

-- 4. Tabel Kendaraan (Master Kendaraan)
CREATE TABLE vehicles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_kendaraan VARCHAR(100),
    jenis_kendaraan VARCHAR(50),
    plat_nomor VARCHAR(20) UNIQUE NOT NULL,
    kapasitas INT NOT NULL
);

-- 5. Tabel History Pengiriman Harian (Tabel Transaksi & Audit)
-- Tabel ini menghubungkan hampir semua tabel di atas (Relation Table)
CREATE TABLE delivery_history (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tanggal DATE NOT NULL,
    kitchen_id INT,
    school_id INT,
    vehicle_id INT,
    account_id_pengirim INT, -- Admin Dapur yang input
    
    -- Detail Pengiriman (Pagi)
    waktu_kirim TIMESTAMP NULL,
    jumlah_kirim INT NOT NULL,
    status_pengiriman ENUM('pending', 'dikirim', 'diterima', 'bermasalah') DEFAULT 'pending',
    
    -- Detail Konfirmasi (Siang - Untuk Audit)
    waktu_terima TIMESTAMP NULL,
    jumlah_terima INT,
    kualitas_makanan ENUM('sangat_baik', 'baik', 'cukup', 'buruk') DEFAULT NULL,
    catatan_kualitas TEXT,
    foto_bukti_path VARCHAR(255), -- Lokasi file foto yang diunggah
    
    FOREIGN KEY (kitchen_id) REFERENCES kitchens(id),
    FOREIGN KEY (school_id) REFERENCES schools(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id),
    FOREIGN KEY (account_id_pengirim) REFERENCES accounts(id)
);