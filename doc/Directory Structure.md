NutriLog/
├── src/main/java/                 # Source code Java (Backend)
│   ├── com.nutrilog.config/       # Konfigurasi Database (JDBC)
│   ├── com.nutrilog.controller/   # Servlet (Logika navigasi & request)
│   │   ├── LoginServlet.java
│   │   ├── DeliveryServlet.java   # Handle input dapur
│   │   ├── ConfirmServlet.java    # Handle konfirmasi sekolah
│   │   └── AuditServlet.java      # Handle dashboard & export
│   ├── com.nutrilog.dao/          # Data Access Object (Query SQL)
│   │   ├── UserDAO.java
│   │   ├── DeliveryDAO.java
│   │   └── ReportDAO.java
│   └── com.nutrilog.model/        # Data Models (POJO/Entities)
│       ├── User.java
│       ├── Delivery.java
│       └── School.java
├── src/main/webapp/               # Frontend & Web Resources
│   ├── assets/                    # Static Files
│   │   ├── css/                   # Stylesheet files
│   │   ├── js/                    # Client-side validation & upload
│   │   └── img/                   # Logo & Icons
│   ├── views/                     # JSP Files (Tampilan)
│   │   ├── auth/                  # Login pages
│   │   ├── dapur/                 # Dashboard Dapur (Input pengiriman)
│   │   ├── sekolah/               # Interface Mobile (Konfirmasi & Kamera)
│   │   └── audit/                 # Dashboard Auditor (Tabel & Export)
│   ├── WEB-INF/                   # Konfigurasi internal (Secure)
│   │   ├── web.xml                # Servlet Mapping
│   │   └── lib/                   # External Library (.jar)
│   │       ├── mysql-connector.jar
│   │       ├── poi-excel.jar      # Untuk export excel
│   │       └── itext-pdf.jar       # Untuk export PDF
│   └── index.jsp                  # Landing page
├── uploads/                       # Folder penyimpanan foto bukti (Luar webapp)
├── sql/                           # Script Database
│   └── nutrilog_schema.sql        # Rancangan tabel
├── pom.xml                        # Maven Dependencies
└── README.md                      # Dokumentasi Proyek

--- 
Penjelasan Komponen Utama:

    src/main/java/: Semua logika cerdas seperti validasi jam 09:00 dan 11:00 diletakkan di dalam folder controller.

    webapp/views/: Folder ini dipisahkan berdasarkan role pengguna (Dapur, Sekolah, Audit) agar hak akses tidak tertukar.

    uploads/: Direkomendasikan folder ini diletakkan di luar webapp agar saat Anda melakukan re-deploy aplikasi, foto-foto bukti kiriman sekolah tidak terhapus.

    WEB-INF/: File di sini bersifat privat. Pengguna tidak bisa mengakses file .jsp secara langsung tanpa melewati Servlet, sehingga keamanan data audit lebih terjamin.