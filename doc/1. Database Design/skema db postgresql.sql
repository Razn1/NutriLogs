-- Buat Database baru
CREATE DATABASE sistemmbg;
\c sistemmbg;

-- 1. Membuat Tipe Data ENUM (Di PostgreSQL ENUM harus didefinisikan sebagai tipe data)
CREATE TYPE user_role AS ENUM ('admin_dapur', 'petugas_sekolah', 'admin_audit');
CREATE TYPE delivery_status AS ENUM ('pending', 'dikirim', 'diterima', 'bermasalah');
CREATE TYPE food_quality AS ENUM ('sangat_baik', 'baik', 'cukup', 'buruk');

-- 2. Tabel Akun (Master User)
CREATE TABLE accounts (
    id SERIAL PRIMARY KEY, -- AUTO_INCREMENT diganti SERIAL
    role user_role NOT NULL,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- 3. Tabel Sekolah (Master Sekolah)
CREATE TABLE schools (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(150) NOT NULL,
    alamat TEXT NOT NULL,
    jumlah_siswa INT NOT NULL
);

-- 4. Tabel Dapur MBG (Master Dapur)
CREATE TABLE kitchens (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(150) NOT NULL,
    alamat TEXT NOT NULL,
    kapasitas INT NOT NULL,
    jumlah_karyawan INT NOT NULL
);

-- 5. Tabel Kendaraan (Master Kendaraan)
CREATE TABLE vehicles (
    id SERIAL PRIMARY KEY,
    nama_kendaraan VARCHAR(100),
    jenis_kendaraan VARCHAR(50),
    plat_nomor VARCHAR(20) UNIQUE NOT NULL,
    kapasitas INT NOT NULL
);

-- 6. Tabel History Pengiriman Harian
CREATE TABLE delivery_history (
    id SERIAL PRIMARY KEY,
    tanggal DATE NOT NULL,
    kitchen_id INT REFERENCES kitchens(id),
    school_id INT REFERENCES schools(id),
    vehicle_id INT REFERENCES vehicles(id),
    account_id_pengirim INT REFERENCES accounts(id),
    
    -- Detail Pengiriman (Pagi)
    waktu_kirim TIMESTAMP NULL,
    jumlah_kirim INT NOT NULL,
    status_pengiriman delivery_status DEFAULT 'pending',
    
    -- Detail Konfirmasi (Siang)
    waktu_terima TIMESTAMP NULL,
    jumlah_terima INT,
    kualitas_makanan food_quality DEFAULT NULL,
    catatan_kualitas TEXT,
    foto_bukti_path VARCHAR(255)
);