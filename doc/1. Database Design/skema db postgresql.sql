-- Buat Database baru
CREATE DATABASE dbnutrilog;
\c dbnutrilog;

-- Enum Types (represented as VARCHAR/TEXT with Check constraints in standard SQL or just plain text)
-- User Roles: 'admin_dapur', 'petugas_sekolah', 'admin_audit'
-- Delivery Status: 'pending', 'dikirim', 'diterima', 'bermasalah'
-- Food Quality: 'sangat_baik', 'baik', 'cukup', 'buruk'

CREATE TABLE accounts (
    id VARCHAR(50) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, -- For simple auth
    role VARCHAR(20) NOT NULL CHECK (role IN ('admin_dapur', 'petugas_sekolah', 'admin_audit'))
);

CREATE TABLE kitchens (
    id VARCHAR(50) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT NOT NULL,
    kapasitas INT NOT NULL,
    jumlah_karyawan INT NOT NULL
);

CREATE TABLE schools (
    id VARCHAR(50) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT NOT NULL,
    jumlah_siswa INT NOT NULL
);

CREATE TABLE vehicles (
    id VARCHAR(50) PRIMARY KEY,
    nama_kendaraan VARCHAR(100) NOT NULL,
    jenis_kendaraan VARCHAR(50) NOT NULL,
    plat_nomor VARCHAR(20) UNIQUE NOT NULL,
    kapasitas INT NOT NULL
);

CREATE TABLE delivery_history (
    id VARCHAR(50) PRIMARY KEY,
    tanggal DATE NOT NULL,
    status_pengiriman VARCHAR(20) NOT NULL DEFAULT 'pending',
    
    -- Sending Info
    kitchen_id VARCHAR(50) NOT NULL REFERENCES kitchens(id),
    school_id VARCHAR(50) NOT NULL REFERENCES schools(id),
    vehicle_id VARCHAR(50) NOT NULL REFERENCES vehicles(id),
    waktu_kirim TIMESTAMP,
    jumlah_kirim INT NOT NULL,
    
    -- Receiving Info
    waktu_terima TIMESTAMP,
    jumlah_terima INT,
    kualitas_makanan VARCHAR(20),
    catatan_kualitas TEXT,
    foto_bukti_path TEXT
);

-- Initial Data Seeding
INSERT INTO accounts (id, nama, email, password, role) VALUES 
('u1', 'Admin Dapur', 'dapur@admin.com', 'password', 'admin_dapur'),
('u2', 'Petugas Sekolah', 'sekolah@admin.com', 'password', 'petugas_sekolah'),
('u3', 'Admin Audit', 'audit@admin.com', 'password', 'admin_audit');

INSERT INTO kitchens (id, nama, alamat, kapasitas, jumlah_karyawan) VALUES
('k1', 'Dapur Pusat Jakarta', 'Jl. Merdeka No. 1', 5000, 20),
('k2', 'Dapur Cabang Selatan', 'Jl. Fatmawati No. 10', 2000, 10);

INSERT INTO schools (id, nama, alamat, jumlah_siswa) VALUES
('s1', 'SDN 01 Pagi', 'Jl. Sekolah No. 1', 300),
('s2', 'SMP Negeri 1', 'Jl. Pendidikan No. 5', 500),
('s3', 'SMA Negeri 3', 'Jl. SMA No. 3', 800);

INSERT INTO vehicles (id, nama_kendaraan, jenis_kendaraan, plat_nomor, kapasitas) VALUES
('v1', 'Box A', 'Mobil Box', 'B 1234 ABC', 1000),
('v2', 'Box B', 'Mobil Box', 'B 5678 DEF', 1000),
('v3', 'Motor A', 'Motor', 'B 9012 GHI', 200);
