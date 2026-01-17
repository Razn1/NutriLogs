<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="id">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NutriLog | MBG Distribution Management System</title>

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;800&display=swap" rel="stylesheet">

        <!-- Icons -->
        <script src="https://unpkg.com/lucide@latest"></script>

    </head>

    <body>
        <div class="bg-mesh"></div>

        <!-- Navigation -->
        <nav class="fixed-top w-100 glass border-bottom border-light" style="z-index: 1050;">
            <div class="max-w-7xl px-4 d-flex align-items-center justify-content-between" style="height: 80px;">
                <div class="d-flex align-items-center gap-3">
                    <div class="bg-emerald rounded-3 d-flex align-items-center justify-content-center text-white flex-shrink-0"
                        style="width: 40px; height: 40px;">
                        <i data-lucide="truck"></i>
                    </div>
                    <div class="d-flex flex-column">
                        <span class="fs-4 fw-bold tracking-tight lh-1">Nutri<span class="text-emerald">Log</span></span>
                        <span class="text-secondary fw-medium text-uppercase mt-1"
                            style="font-size: 10px; letter-spacing: 0.05em;">MBG Distribution Management System</span>
                    </div>
                </div>

                <div class="d-none d-md-flex align-items-center gap-4 small fw-medium text-secondary">
                    <a href="${pageContext.request.contextPath}/" class="text-decoration-none text-emerald fw-bold transition">Beranda</a>
                    <a href="about.jsp"
                        class="text-decoration-none text-secondary hover:text-emerald transition">Tentang Kami</a>
                    <a href="gallery.jsp"
                        class="text-decoration-none text-secondary hover:text-emerald transition">Galeri</a>
                    <a href="tolog.jsp" class="btn-primary-custom text-decoration-none">Masuk Sistem</a>
                </div>

                <button class="d-md-none btn btn-link text-secondary border-0" type="button" data-bs-toggle="collapse"
                    data-bs-target="#mobileMenu">
                    <i data-lucide="menu"></i>
                </button>
            </div>
            <!-- Mobile Menu Placeholder -->
            <div class="collapse d-md-none glass border-top border-light p-3" id="mobileMenu">
                <div class="d-flex flex-column gap-3">
                    <a href="${pageContext.request.contextPath}/" class="text-emerald fw-bold">Beranda</a>
                    <a href="about.jsp" class="text-secondary fw-bold">Tentang Kami</a>
                    <a href="gallery.jsp" class="text-secondary fw-bold">Galeri</a>
                    <a href="tolog.jsp" class="btn-primary-custom text-center">Masuk Sistem</a>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <section id="dashboard" class="pt-5 pb-5 px-3" style="margin-top: 80px;">
            <div class="max-w-7xl mx-auto container-fluid">
                <div class="row align-items-center gy-5">
                    <div class="col-md-6 pt-5 mt-5">
                        <span class="d-inline-block py-1 px-3 rounded-pill bg-emerald-100 text-emerald-700 fw-bold mb-4"
                            style="font-size: 0.75rem;">LOGISTIK TERUKUR & TRANSPARAN</span>
                        <h1 class="display-custom text-dark mb-4">
                            Setiap Porsi, <br>
                            <span class="text-emerald">Tepat Waktu,</span> <br>
                            Tepat Kualitas.
                        </h1>
                        <p class="lead text-secondary mb-4" style="line-height: 1.6;">
                            Sistem Manajemen Distribusi MBG memastikan program makanan bergizi tepat jumlah dan memenuhi
                            standar kesehatan melalui validasi data real-time.
                        </p>
                        <div class="d-flex flex-wrap gap-3">
                            <a href="#dashboard" class="btn-primary-custom text-decoration-none">Pantau Distribusi</a>
                            <a href="#workflow" class="btn-glass text-decoration-none text-dark">Pelajari Alur</a>
                        </div>
                    </div>
                    <div class="col-md-6 position-relative">
                        <div class="glass p-4 rounded-2xl shadow-lg position-relative z-2">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h3 class="fw-bold h5 mb-0">Live Status Delivery</h3>
                                <span class="d-flex align-items-center gap-2 small text-emerald-600 fw-bold">
                                    <span class="d-inline-block bg-emerald rounded-circle"
                                        style="width: 8px; height: 8px;"></span>
                                    Updating Live
                                </span>
                            </div>
                            <div class="d-flex flex-column gap-3">
                                <div
                                    class="d-flex align-items-center justify-content-between p-3 bg-light rounded-xl border border-light">
                                    <div class="d-flex gap-3 align-items-center">
                                        <div class="bg-emerald-100 rounded-lg d-flex align-items-center justify-content-center text-emerald-600"
                                            style="width: 40px; height: 40px;">
                                            <i data-lucide="map-pin" class="w-5 h-5"></i>
                                        </div>
                                        <div>
                                            <p class="small fw-bold mb-0">SDN 01 Menteng</p>
                                            <p class="card-text text-secondary mb-0" style="font-size: 0.75rem;">Armada
                                                B-2930-XYZ</p>
                                        </div>
                                    </div>
                                    <span class="status-badge bg-emerald-100 text-emerald-700">En Route</span>
                                </div>
                                <div
                                    class="d-flex align-items-center justify-content-between p-3 bg-light rounded-xl border border-light">
                                    <div class="d-flex gap-3 align-items-center">
                                        <div class="bg-emerald-100 rounded-lg d-flex align-items-center justify-content-center text-emerald-600"
                                            style="width: 40px; height: 40px;">
                                            <i data-lucide="check-circle" class="w-5 h-5"></i>
                                        </div>
                                        <div>
                                            <p class="small fw-bold mb-0">SMPN 04 Jakarta</p>
                                            <p class="text-secondary mb-0" style="font-size: 0.75rem;">240 Porsi
                                                Terverifikasi</p>
                                        </div>
                                    </div>
                                    <span class="status-badge bg-emerald-100 text-emerald-700">Delivered</span>
                                </div>
                            </div>
                        </div>
                        <!-- Decorative blobs -->
                        <div class="position-absolute bg-emerald-100 rounded-circle"
                            style="top: -1rem; right: -1rem; width: 8rem; height: 8rem; filter: blur(40px); opacity: 0.7; z-index: 0;">
                        </div>
                        <div class="position-absolute bg-emerald-100 rounded-circle"
                            style="bottom: -2rem; left: -2rem; width: 12rem; height: 12rem; filter: blur(50px); opacity: 0.5; z-index: 0;">
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Stats Section -->
        <section class="py-5 bg-white bg-opacity-50 border-top border-bottom border-light backdrop-blur">
            <div class="max-w-7xl mx-auto px-4">
                <div class="row g-4">
                    <div class="col-6 col-md-3 text-center">
                        <p class="display-6 fw-bold text-emerald mb-0">12.4K+</p>
                        <p class="small fw-medium text-secondary text-uppercase tracking-wider">Porsi Terdistribusi</p>
                    </div>
                    <div class="col-6 col-md-3 text-center border-start border-light">
                        <p class="display-6 fw-bold text-dark mb-0">98.2%</p>
                        <p class="small fw-medium text-secondary text-uppercase tracking-wider">On-Time Delivery</p>
                    </div>
                    <div class="col-6 col-md-3 text-center border-start border-light">
                        <p class="display-6 fw-bold text-emerald mb-0">4.9/5</p>
                        <p class="small fw-medium text-secondary text-uppercase tracking-wider">Rating Kualitas</p>
                    </div>
                    <div class="col-6 col-md-3 text-center border-start border-light">
                        <p class="display-6 fw-bold text-dark mb-0">42</p>
                        <p class="small fw-medium text-secondary text-uppercase tracking-wider">Dapur Terintegrasi</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Alur Kerja -->
        <section id="workflow" class="py-5 my-5 px-3">
            <div class="max-w-7xl mx-auto">
                <div class="text-center mb-5">
                    <h2 class="h1 fw-bold mb-3">Satu Ekosistem, Transparansi Penuh</h2>
                    <p class="text-secondary mx-auto" style="max-width: 40rem;">Menghubungkan Dapur Pusat, Armada, dan
                        Sekolah dalam satu aliran data yang dapat diaudit setiap saat.</p>
                </div>

                <div class="row g-5 text-center">
                    <div class="col-md-4 position-relative d-flex flex-column align-items-center">
                        <div class="bg-white shadow rounded-2xl d-flex align-items-center justify-content-center text-emerald mb-4 step-line"
                            style="width: 64px; height: 64px;">
                            <i data-lucide="chef-hat" style="width: 32px; height: 32px;"></i>
                        </div>
                        <h4 class="fw-bold mb-2">1. Dapur Pusat</h4>
                        <p class="small text-secondary">Pencatatan produksi harian dan log keberangkatan armada secara
                            digital.</p>
                    </div>
                    <div class="col-md-4 position-relative d-flex flex-column align-items-center">
                        <div class="bg-white shadow rounded-2xl d-flex align-items-center justify-content-center text-emerald mb-4 step-line"
                            style="width: 64px; height: 64px;">
                            <i data-lucide="truck" style="width: 32px; height: 32px;"></i>
                        </div>
                        <h4 class="fw-bold mb-2">2. Distribusi Real-time</h4>
                        <p class="small text-secondary">Pemantauan armada menuju titik sekolah dengan estimasi
                            kedatangan akurat.</p>
                    </div>
                    <div class="col-md-4 position-relative d-flex flex-column align-items-center">
                        <div class="bg-white shadow rounded-2xl d-flex align-items-center justify-content-center text-emerald mb-4"
                            style="width: 64px; height: 64px;">
                            <i data-lucide="school" style="width: 32px; height: 32px;"></i>
                        </div>
                        <h4 class="fw-bold mb-2">3. Validasi Sekolah</h4>
                        <p class="small text-secondary">Konfirmasi penerimaan via mobile dengan bukti foto dan penilaian
                            kualitas.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Tentang Sekilas Section -->
        <section id="features" class="py-5 px-3 bg-gray-900 text-white position-relative overflow-hidden"
            style="background-color: #111827;">
            <!-- Decorative background elements -->
            <div class="position-absolute top-0 end-0 translate-middle-y bg-emerald-500 rounded-circle"
                style="width: 300px; height: 300px; filter: blur(120px); opacity: 0.15; z-index: 0;"></div>
            <div class="position-absolute bottom-0 start-0 translate-middle-y bg-emerald-500 rounded-circle"
                style="width: 200px; height: 200px; filter: blur(80px); opacity: 0.1; z-index: 0;"></div>

            <div class="max-w-7xl mx-auto position-relative z-1">
                <div class="row align-items-center gy-5">
                    <div class="col-lg-6">
                        <span
                            class="d-inline-block py-1 px-3 rounded-pill bg-emerald-900 text-emerald-300 fw-bold mb-4 border border-emerald-800"
                            style="font-size: 0.75rem; letter-spacing: 0.05em;">TENTANG SEKILAS</span>
                        <h2 class="display-5 fw-bold mb-4">Membangun Ekosistem <br><span class="text-emerald">Gizi
                                Terpercaya</span></h2>
                        <p class="lead text-gray-400 mb-4" style="line-height: 1.8; color: #9CA3AF;">
                            NutriLog adalah platform manajemen distribusi end-to-end yang dirancang untuk mengawal
                            program Makan Bergizi Gratis (MBG). Kami memastikan transparansi penuh dari dapur hingga
                            ruang kelas.
                        </p>
                        <div class="d-flex gap-4 mt-4">
                            <div>
                                <h3 class="h2 fw-bold text-white mb-0">100%</h3>
                                <p class="small text-emerald-400 text-uppercase tracking-wider">Terlacak</p>
                            </div>
                            <div class="border-start border-gray-700 mx-2"></div>
                            <div>
                                <h3 class="h2 fw-bold text-white mb-0">0%</h3>
                                <p class="small text-emerald-400 text-uppercase tracking-wider">Kebocoran</p>
                            </div>
                        </div>
                        <div class="mt-5">
                            <a href="about.jsp" class="btn btn-primary-custom text-decoration-none">Pelajari Lebih
                                Lanjut</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <!-- Glass Card Visual -->
                        <div
                            class="p-4 rounded-3xl border border-gray-700 bg-gray-800 bg-opacity-50 shadow-2xl position-relative overflow-hidden">
                            <div class="position-absolute top-0 end-0 p-3 opacity-10">
                                <i data-lucide="quote" style="width: 100px; height: 100px;"></i>
                            </div>
                            <div class="d-flex flex-column gap-4">
                                <div class="d-flex gap-3 align-items-start">
                                    <div class="bg-emerald-500 bg-opacity-20 p-2 rounded-lg text-emerald-400">
                                        <i data-lucide="shield-check"></i>
                                    </div>
                                    <div>
                                        <h4 class="h6 fw-bold text-white mb-1">Integritas Data</h4>
                                        <p class="small text-gray-400 mb-0">Setiap porsi dicatat dan divalidasi secara
                                            digital untuk mencegah manipulasi.</p>
                                    </div>
                                </div>
                                <div class="d-flex gap-3 align-items-start">
                                    <div class="bg-emerald-500 bg-opacity-20 p-2 rounded-lg text-emerald-400">
                                        <i data-lucide="clock"></i>
                                    </div>
                                    <div>
                                        <h4 class="h6 fw-bold text-white mb-1">Ketepatan Waktu</h4>
                                        <p class="small text-gray-400 mb-0">Monitoring armada real-time memastikan
                                            makanan tiba hangat saat jam makan siang.</p>
                                    </div>
                                </div>
                                <div class="d-flex gap-3 align-items-start">
                                    <div class="bg-emerald-500 bg-opacity-20 p-2 rounded-lg text-emerald-400">
                                        <i data-lucide="heart"></i>
                                    </div>
                                    <div>
                                        <h4 class="h6 fw-bold text-white mb-1">Fokus Kesehatan</h4>
                                        <p class="small text-gray-400 mb-0">Sistem feedback instan untuk menjamin
                                            kualitas dan kandungan gizi yang layak.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Roles Section -->
        <section id="roles" class="py-5 my-5 px-3">
            <div class="max-w-7xl mx-auto">
                <div class="text-center mb-5">
                    <h2 class="h2 fw-bold mb-3">Siapa yang Menggunakan Sistem?</h2>
                    <p class="text-secondary">Hak akses yang dirancang khusus untuk setiap tanggung jawab.</p>
                </div>

                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="glass p-4 rounded-2xl border border-light card-hover h-100">
                            <div class="bg-emerald-50 rounded-xl d-flex align-items-center justify-content-center text-emerald mb-4"
                                style="width: 56px; height: 56px;">
                                <i data-lucide="users"></i>
                            </div>
                            <h4 class="h5 fw-bold mb-3">Admin Dapur</h4>
                            <ul class="list-unstyled d-flex flex-column gap-2 small text-secondary mb-4">
                                <li class="d-flex align-items-center gap-2"><i data-lucide="check" class="text-emerald"
                                        style="width: 16px;"></i> Kelola Jadwal Harian</li>
                                <li class="d-flex align-items-center gap-2"><i data-lucide="check" class="text-emerald"
                                        style="width: 16px;"></i> Input Data Armada</li>
                                <li class="d-flex align-items-center gap-2"><i data-lucide="check" class="text-emerald"
                                        style="width: 16px;"></i> Monitor Status Delivery</li>
                            </ul>
                            <a href="#"
                                class="text-emerald fw-bold small text-decoration-none d-flex align-items-center gap-1 hover-arrow">Lihat
                                Dashboard <i data-lucide="arrow-right" style="width: 16px;"></i></a>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div
                            class="glass p-4 rounded-2xl border border-2 border-emerald-100 shadow h-100 position-relative card-hover">
                            <span
                                class="position-absolute top-0 end-0 translate-middle-y me-4 bg-emerald text-white small fw-bold px-2 py-1 rounded-pill text-uppercase"
                                style="font-size: 0.65rem;">Priority</span>
                            <div class="bg-emerald rounded-xl d-flex align-items-center justify-content-center text-white mb-4"
                                style="width: 56px; height: 56px;">
                                <i data-lucide="user-check"></i>
                            </div>
                            <h4 class="h5 fw-bold mb-3">Petugas Sekolah</h4>
                            <ul class="list-unstyled d-flex flex-column gap-2 small text-secondary mb-4">
                                <li class="d-flex align-items-center gap-2"><i data-lucide="check" class="text-emerald"
                                        style="width: 16px;"></i> Konfirmasi Real-time</li>
                                <li class="d-flex align-items-center gap-2"><i data-lucide="check" class="text-emerald"
                                        style="width: 16px;"></i> Upload Bukti Foto</li>
                                <li class="d-flex align-items-center gap-2"><i data-lucide="check" class="text-emerald"
                                        style="width: 16px;"></i> Feedback Kualitas</li>
                            </ul>
                            <a href="#"
                                class="text-emerald fw-bold small text-decoration-none d-flex align-items-center gap-1 hover-arrow">Login
                                Mobile Web <i data-lucide="arrow-right" style="width: 16px;"></i></a>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="glass p-4 rounded-2xl border border-light card-hover h-100">
                            <div class="bg-emerald-50 rounded-xl d-flex align-items-center justify-content-center text-emerald mb-4"
                                style="width: 56px; height: 56px;">
                                <i data-lucide="shield-check"></i>
                            </div>
                            <h4 class="h5 fw-bold mb-3">Admin Audit</h4>
                            <ul class="list-unstyled d-flex flex-column gap-2 small text-secondary mb-4">
                                <li class="d-flex align-items-center gap-2"><i data-lucide="check" class="text-emerald"
                                        style="width: 16px;"></i> Laporan KPI Bulanan</li>
                                <li class="d-flex align-items-center gap-2"><i data-lucide="check" class="text-emerald"
                                        style="width: 16px;"></i> Rekonsiliasi Data</li>
                                <li class="d-flex align-items-center gap-2"><i data-lucide="check" class="text-emerald"
                                        style="width: 16px;"></i> Manajemen Hak Akses</li>
                            </ul>
                            <a href="#"
                                class="text-emerald fw-bold small text-decoration-none d-flex align-items-center gap-1 hover-arrow">Portal
                                Laporan <i data-lucide="arrow-right" style="width: 16px;"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Developers Section -->
        <section id="developers" class="py-5 px-3 bg-emerald-50 bg-opacity-50">
            <div class="max-w-7xl mx-auto">
                <div class="text-center mb-5">
                    <span class="text-emerald fw-bold small text-uppercase tracking-widest">The Brains Behind
                        NutriLog</span>
                    <h2 class="h2 fw-bold mt-2">Anggota Pengembang</h2>
                    <div class="bg-emerald mx-auto mt-3 rounded-pill" style="width: 80px; height: 4px;"></div>
                </div>

                <div class="row row-cols-2 row-cols-md-5 g-4 justify-content-center">
                    <!-- Developer 1 -->
                    <div class="text-center group">
                        <div class="position-relative mx-auto mb-3" style="width: 8rem; height: 8rem;">
                            <img src="img/faisa.jpeg" alt="Faisa Al Farrel" class="rounded-circle"
                                style="width: 8rem; height: 8rem;">
                        </div>
                        <h5 class="fw-bold text-dark mb-0">Faisa Al Farrel</h5>
                        <p class="small fw-medium text-uppercase mb-0">0110224149</p>
                        <p class="small text-emerald fw-bold text-uppercase">BackEnd</p>
                    </div>

                    <!-- Developer 2 -->
                    <div class="text-center group">
                        <div class="position-relative mx-auto mb-3" style="width: 8rem; height: 8rem;">
                            <div
                                class="position-absolute w-100 h-100 bg-white rounded-circle border border-2 border-emerald-500 d-flex align-items-center justify-content-center overflow-hidden">
                                <img src="img/jibril.png" alt="Jibril Ibrahim" class="rounded-circle"
                                style="width: 8rem; height: 8rem;">
                            </div>
                        </div>
                        <h5 class="fw-bold text-dark mb-0">Jibril Ibrahim</h5>
                        <p class="small fw-medium text-uppercase mb-0">0110224002</p>
                        <p class="small text-emerald fw-bold text-uppercase">BackEnd</p>
                    </div>

                    <!-- Developer 3 -->
                    <div class="text-center group">
                        <div class="position-relative mx-auto mb-3" style="width: 8rem; height: 8rem;">
                            <div
                                class="position-absolute w-100 h-100 bg-white rounded-circle border border-2 border-emerald-500 d-flex align-items-center justify-content-center overflow-hidden">
                                <img src="img/tri.jpeg" alt="Tri Nurjulyanti" class="rounded-circle"
                                style="width: 8rem; height: 8rem;">
                            </div>
                        </div>
                        <h5 class="fw-bold text-dark mb-0">Tri Nurjulyanti</h5>
                        <p class="small fw-medium text-uppercase mb-0">0110224194</p>
                        <p class="small text-emerald fw-bold text-uppercase">Documentation</p>
                    </div>

                    <!-- Developer 4 -->
                    <div class="text-center group">
                        <div class="position-relative mx-auto mb-3" style="width: 8rem; height: 8rem;">
                            <div
                                class="position-absolute w-100 h-100 bg-white rounded-circle border border-2 border-emerald-500 d-flex align-items-center justify-content-center overflow-hidden">
                                <img src="img/fiadn.JPEG" alt="Fi'adn Fawzul Adzhim" class="rounded-circle"
                                style="width: 8rem; height: 8rem;">
                            </div>
                        </div>
                        <h5 class="fw-bold text-dark mb-0">Fi'adn Fawzul Adzhim</h5>
                        <p class="small fw-medium text-uppercase mb-0">0110224103</p>
                        <p class="small text-emerald fw-bold text-uppercase">FrontEnd</p>
                    </div>

                    <!-- Developer 5 -->
                    <div class="text-center group">
                        <div class="position-relative mx-auto mb-3" style="width: 8rem; height: 8rem;">
                            <div
                                class="position-absolute w-100 h-100 bg-white rounded-circle border border-2 border-emerald-500 d-flex align-items-center justify-content-center overflow-hidden">
                                <img src="img/azzam.jpeg" alt="Azzam Firdaus" class="rounded-circle"
                                style="width: 8rem; height: 8rem;">
                            </div>
                        </div>
                        <h5 class="fw-bold text-dark mb-0">Azzam Firdaus</h5>
                        <p class="small fw-medium text-uppercase mb-0">0110224121</p>
                        <p class="small text-emerald fw-bold text-uppercase">FrontEnd</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="bg-white py-5 px-3 border-top border-light">
            <div
                class="max-w-7xl mx-auto d-flex flex-column flex-md-row justify-content-between align-items-center gap-4">
                <div>
                    <div class="d-flex align-items-center gap-2 mb-3">
                        <div class="bg-emerald rounded-3 d-flex align-items-center justify-content-center text-white flex-shrink-0"
                            style="width: 40px; height: 40px;">
                            <i data-lucide="truck"></i>
                        </div>
                        <span class="fs-5 fw-bold">NutriLog</span>
                    </div>
                    <p class="small text-secondary mb-0" style="max-width: 300px;">Solusi digital untuk akuntabilitas
                        program makanan bergizi di seluruh Indonesia.</p>
                </div>

                <div class="d-flex gap-5">
                    <div>
                        <h5 class="fw-bold small mb-3 text-secondary text-uppercase text-muted">Legal</h5>
                        <ul class="list-unstyled small text-secondary d-flex flex-column gap-2 mb-0">
                            <li><a href="#" class="text-decoration-none text-secondary hover:text-emerald">Privacy
                                    Policy</a></li>
                            <li><a href="#" class="text-decoration-none text-secondary hover:text-emerald">Terms of
                                    Service</a></li>
                        </ul>
                    </div>
                    <div>
                        <h5 class="fw-bold small mb-3 text-secondary text-uppercase text-muted">Kontak</h5>
                        <ul class="list-unstyled small text-secondary d-flex flex-column gap-2 mb-0">
                            <li>support@nutrilog.id</li>
                            <li>(+62) 882-0025-19272</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="max-w-7xl mx-auto mt-5 pt-4 border-top border-light text-center small text-muted">
                &copy; 2026 NutriLog | MBG Distribution Management System. All Rights Reserved.
            </div>
        </footer>

        <!-- Initialize Scripts -->
        <script src="js/bootstrap.min.js"></script>
        <script>
            // Initialize Lucide Icons
            lucide.createIcons();

            // Smooth Scroll
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    const target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        target.scrollIntoView({
                            behavior: 'smooth'
                        });
                    }
                });
            });
        </script>
    </body>

    </html>