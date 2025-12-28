# 🏗️ Software Design Document (SDD): NutriLog System

**Teknologi:** Java Enterprise (JSP/Servlet), JDBC, PostgreSQL 15+

---

## 1. Arsitektur Sistem & Database

Sistem tetap menggunakan pola **MVC**, namun dengan optimasi pada layer data untuk memanfaatkan fitur-fitur PostgreSQL seperti tipe data `TIMESTAMPTZ` (Timezone aware) untuk akurasi audit lintas wilayah.

## 2. Desain Database (PostgreSQL Schema)


```sql

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
    tanggal DATE NOT NULL DEFAULT CURRENT_DATE,
    kitchen_id INT REFERENCES kitchens(id),
    school_id INT REFERENCES schools(id),
    vehicle_id INT REFERENCES vehicles(id),
    account_id_pengirim INT REFERENCES accounts(id),
    
    -- Pengiriman 
    waktu_kirim TIMESTAMPTZ DEFAULT NOW(),
    jumlah_kirim INT NOT NULL CHECK (jumlah_kirim > 0),
    status_pengiriman delivery_status DEFAULT 'pending',
    is_late_departure BOOLEAN GENERATED ALWAYS AS ((waktu_kirim::time > '09:00:00'::time)) STORED,
    
    -- Konfirmasi 
    waktu_terima TIMESTAMPTZ,
    jumlah_terima INT,
    kualitas_makanan food_quality DEFAULT NULL,
    foto_bukti_path VARCHAR(255),
    
    -- Field Audit Instan
    is_late_arrival BOOLEAN GENERATED ALWAYS AS ((waktu_terima::time > '11:00:00'::time)) STORED,
    selisih_porsi INT GENERATED ALWAYS AS (jumlah_kirim - jumlah_terima) STORED
);
```

---

## 3. Komponen Backend (Java & JDBC)

### 3.1 Driver & Koneksi

Aplikasi akan menggunakan driver `org.postgresql.Driver`.

* **Connection String:** `jdbc:postgresql://localhost:5432/dbnutrilog`
* **Keunggulan:** PostgreSQL menangani `TIMESTAMPTZ` dengan sangat baik, sehingga selisih waktu antara server dan database tidak akan menjadi masalah hukum saat audit.

### 3.2 Implementasi Logika Server-Side

Pengecekan SLA kini dilakukan secara otomatis di level database menggunakan **Generated Columns** (fitur unggul PostgreSQL), sehingga Controller di Java hanya perlu melakukan *query* sederhana.

---

## 4. Desain Penyimpanan Foto (Object Storage Friendly)

Mengingat PostgreSQL sangat handal dalam menangani data besar, kita akan menyimpan **URL/Path** foto saja di database.

* Foto disimpan di `/var/www/nutrilog/uploads/`
* Nama file di-hash menggunakan **SHA-256** untuk keamanan integritas bukti audit.

## 5. Keamanan Data (PostgreSQL Specific)

1. **Constraint Check:** Memastikan `qty_received` tidak mungkin negatif langsung di level database.

---

### 🏁 Final Tech Stack Summary

* **Language:** Java 11+ (JSP/Servlet)
* **Database:** PostgreSQL 15
* **Server:** Apache Tomcat 9
* **Lib:** PostgreSQL JDBC Driver, Apache POI (Excel), iText (PDF)
