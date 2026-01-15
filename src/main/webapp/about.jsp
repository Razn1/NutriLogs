<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="id">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tentang Kami | NutriLog</title>

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
                    <a href="index.jsp" class="d-flex align-items-center gap-3 text-decoration-none text-dark">
                        <div class="bg-emerald rounded-3 d-flex align-items-center justify-content-center text-white flex-shrink-0"
                            style="width: 40px; height: 40px;">
                            <i data-lucide="truck"></i>
                        </div>
                        <div class="d-flex flex-column">
                            <span class="fs-4 fw-bold tracking-tight lh-1">Nutri<span
                                    class="text-emerald">Log</span></span>
                            <span class="text-secondary fw-medium text-uppercase mt-1"
                                style="font-size: 10px; letter-spacing: 0.05em;">MBG Distribution Management
                                System</span>
                        </div>
                    </a>
                </div>

                <div class="d-none d-md-flex align-items-center gap-4 small fw-medium text-secondary">
                    <a href="index.jsp"
                        class="text-decoration-none text-secondary hover:text-emerald transition">Beranda</a>
                    <a href="about.jsp" class="text-decoration-none text-emerald fw-bold transition">Tentang Kami</a>
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
                    <a href="index.jsp" class="text-secondary fw-bold">Beranda</a>
                    <a href="about.jsp" class="text-emerald fw-bold">Tentang Kami</a>
                    <a href="gallery.jsp" class="text-secondary fw-bold">Galeri</a>
                    <a href="tolog.jsp" class="btn-primary-custom text-center">Masuk Sistem</a>
                </div>
            </div>
        </nav>

        <!-- Header Section -->
        <section class="pt-5 pb-5 px-3 mb-5" style="margin-top: 80px;">
            <div class="max-w-7xl mx-auto container-fluid text-center">
                <h1 class="display-custom text-dark mb-4 mt-5">
                    Mengenal <span class="text-emerald">NutriLog</span>
                </h1>
                <p class="lead text-secondary mx-auto" style="max-width: 40rem; line-height: 1.6;">
                    Sistem Manajemen Distribusi yang didedikasikan untuk memastikan transparansi dan kualitas Program
                    Makan Bergizi Gratis di Indonesia.
                </p>
            </div>
        </section>

        <!-- About Content -->
        <section class="py-5 px-3">
            <div class="max-w-7xl mx-auto">
                <div class="row align-items-center g-5">
                    <div class="col-md-6">
                        <div class="glass p-5 rounded-3xl border border-light position-relative">
                            <div class="position-absolute top-0 start-0 translate-middle rounded-circle bg-emerald-500"
                                style="width: 100px; height: 100px; filter: blur(40px); opacity: 0.2; z-index: -1;">
                            </div>
                            <h3 class="fw-bold mb-4">Visi Kami</h3>
                            <p class="text-secondary mb-4">
                                Mewujudkan generasi emas Indonesia melalui pemenuhan gizi yang terukur, tepat waktu, dan
                                transparan. Kami percaya bahwa setiap anak berhak mendapatkan asupan berkualitas untuk
                                mendukung tumbuh kembang mereka.
                            </p>
                            <h3 class="fw-bold mb-4">Misi Kami</h3>
                            <ul class="list-unstyled d-flex flex-column gap-3 text-secondary">
                                <li class="d-flex gap-3">
                                    <div class="bg-emerald-100 rounded-circle d-flex align-items-center justify-content-center text-emerald flex-shrink-0"
                                        style="width: 24px; height: 24px;">
                                        <i data-lucide="check" style="width: 14px; height: 14px;"></i>
                                    </div>
                                    <span>Menjamin ketepatan waktu distribusi makanan ke sekolah.</span>
                                </li>
                                <li class="d-flex gap-3">
                                    <div class="bg-emerald-100 rounded-circle d-flex align-items-center justify-content-center text-emerald flex-shrink-0"
                                        style="width: 24px; height: 24px;">
                                        <i data-lucide="check" style="width: 14px; height: 14px;"></i>
                                    </div>
                                    <span>Menyediakan platform validasi kualitas yang transparan.</span>
                                </li>
                                <li class="d-flex gap-3">
                                    <div class="bg-emerald-100 rounded-circle d-flex align-items-center justify-content-center text-emerald flex-shrink-0"
                                        style="width: 24px; height: 24px;">
                                        <i data-lucide="check" style="width: 14px; height: 14px;"></i>
                                    </div>
                                    <span>Memudahkan pemantauan dan audit program secara digital.</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row g-4">
                            <div class="col-6">
                                <div
                                    class="glass p-4 rounded-2xl text-center h-100 d-flex flex-column justify-content-center">
                                    <h2 class="display-4 fw-bold text-emerald mb-0">100%</h2>
                                    <p class="small text-uppercase tracking-wider text-secondary mt-2 mb-0">Transparansi
                                    </p>
                                </div>
                            </div>
                            <div class="col-6">
                                <div
                                    class="glass p-4 rounded-2xl text-center h-100 d-flex flex-column justify-content-center">
                                    <h2 class="display-4 fw-bold text-emerald mb-0">24/7</h2>
                                    <p class="small text-uppercase tracking-wider text-secondary mt-2 mb-0">Real-time
                                        Data</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Developers Section (Reused) -->
        <section id="developers" class="py-5 px-3 bg-emerald-50 bg-opacity-50 my-5">
            <div class="max-w-7xl mx-auto">
                <div class="text-center mb-5">
                    <span class="text-emerald fw-bold small text-uppercase tracking-widest">The Brains Behind
                        NutriLog</span>
                    <h2 class="h2 fw-bold mt-2">Tim Pengembang</h2>
                    <div class="bg-emerald mx-auto mt-3 rounded-pill" style="width: 80px; height: 4px;"></div>
                </div>

                <div class="row row-cols-2 row-cols-md-5 g-4 justify-content-center">
                    <!-- Developer 1 -->
                    <div class="text-center group">
                        <div class="position-relative mx-auto mb-3" style="width: 8rem; height: 8rem;">
                            <div
                                class="position-absolute w-100 h-100 bg-white rounded-circle border border-2 border-emerald-500 d-flex align-items-center justify-content-center overflow-hidden">
                                <i data-lucide="user" class="text-emerald opacity-20"
                                    style="width: 4rem; height: 4rem;"></i>
                            </div>
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
                                <i data-lucide="user" class="text-emerald opacity-20"
                                    style="width: 4rem; height: 4rem;"></i>
                            </div>
                        </div>
                        <h5 class="fw-bold text-dark mb-0">Muhammad Jibril Ibrahim</h5>
                        <p class="small fw-medium text-uppercase mb-0">0110224002</p>
                        <p class="small text-emerald fw-bold text-uppercase">BackEnd</p>
                    </div>

                    <!-- Developer 3 -->
                    <div class="text-center group">
                        <div class="position-relative mx-auto mb-3" style="width: 8rem; height: 8rem;">
                            <div
                                class="position-absolute w-100 h-100 bg-white rounded-circle border border-2 border-emerald-500 d-flex align-items-center justify-content-center overflow-hidden">
                                <i data-lucide="user" class="text-emerald opacity-20"
                                    style="width: 4rem; height: 4rem;"></i>
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
                                <i data-lucide="user" class="text-emerald opacity-20"
                                    style="width: 4rem; height: 4rem;"></i>
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
                                <i data-lucide="user" class="text-emerald opacity-20"
                                    style="width: 4rem; height: 4rem;"></i>
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
                        <div class="bg-emerald-600 rounded d-flex align-items-center justify-content-center text-white"
                            style="width: 32px; height: 32px;">
                            <i data-lucide="truck" style="width: 16px; height: 16px;"></i>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Initialize Lucide Icons
            lucide.createIcons();
        </script>
    </body>

    </html>