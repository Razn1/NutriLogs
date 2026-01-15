<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="id">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Galeri | NutriLog</title>

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;800&display=swap" rel="stylesheet">

        <!-- Icons -->
        <script src="https://unpkg.com/lucide@latest"></script>

        <style>
            .gallery-item {
                overflow: hidden;
                border-radius: 1rem;
                position: relative;
                aspect-ratio: 4/3;
            }

            .gallery-item img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.3s ease;
            }

            .gallery-item:hover img {
                transform: scale(1.05);
            }

            .gallery-caption {
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                padding: 1rem;
                background: linear-gradient(to top, rgba(0, 0, 0, 0.7), transparent);
                color: white;
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .gallery-item:hover .gallery-caption {
                opacity: 1;
            }
        </style>
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
                    <a href="about.jsp"
                        class="text-decoration-none text-secondary hover:text-emerald transition">Tentang Kami</a>
                    <a href="gallery.jsp" class="text-decoration-none text-emerald fw-bold transition">Galeri</a>
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
                    <a href="about.jsp" class="text-secondary fw-bold">Tentang Kami</a>
                    <a href="gallery.jsp" class="text-emerald fw-bold">Galeri</a>
                    <a href="tolog.jsp" class="btn-primary-custom text-center">Masuk Sistem</a>
                </div>
            </div>
        </nav>

        <!-- Header Section -->
        <section class="pt-5 pb-5 px-3 mb-5" style="margin-top: 80px;">
            <div class="max-w-7xl mx-auto container-fluid text-center">
                <h1 class="display-custom text-dark mb-4 mt-5">
                    Galeri <span class="text-emerald">Kegiatan</span>
                </h1>
                <p class="lead text-secondary mx-auto" style="max-width: 40rem; line-height: 1.6;">
                    Dokumentasi Program Makan Bergizi Gratis di lapangan.
                </p>
            </div>
        </section>

        <!-- Gallery Grid -->
        <section class="py-5 px-3">
            <div class="max-w-7xl mx-auto">
                <div class="row g-4">
                    <!-- Gallery Item 1 -->
                    <div class="col-md-4">
                        <div
                            class="gallery-item shadow-sm border border-light bg-light d-flex align-items-center justify-content-center text-secondary">
                            <div class="text-center p-4">
                                <i data-lucide="chef-hat" style="width: 48px; height: 48px;"
                                    class="mb-3 text-emerald opacity-50"></i>
                                <h5 class="fw-bold fs-6">Persiapan di Dapur Pusat</h5>
                                <p class="small mb-0">Proses memasak yang higienis</p>
                            </div>
                        </div>
                    </div>
                    <!-- Gallery Item 2 -->
                    <div class="col-md-4">
                        <div
                            class="gallery-item shadow-sm border border-light bg-light d-flex align-items-center justify-content-center text-secondary">
                            <div class="text-center p-4">
                                <i data-lucide="truck" style="width: 48px; height: 48px;"
                                    class="mb-3 text-emerald opacity-50"></i>
                                <h5 class="fw-bold fs-6">Armada Distribusi</h5>
                                <p class="small mb-0">Pengiriman tepat waktu</p>
                            </div>
                        </div>
                    </div>
                    <!-- Gallery Item 3 -->
                    <div class="col-md-4">
                        <div
                            class="gallery-item shadow-sm border border-light bg-light d-flex align-items-center justify-content-center text-secondary">
                            <div class="text-center p-4">
                                <i data-lucide="school" style="width: 48px; height: 48px;"
                                    class="mb-3 text-emerald opacity-50"></i>
                                <h5 class="fw-bold fs-6">Penerimaan di Sekolah</h5>
                                <p class="small mb-0">Siswa menerima paket makan siang</p>
                            </div>
                        </div>
                    </div>
                    <!-- Gallery Item 4 -->
                    <div class="col-md-4">
                        <div
                            class="gallery-item shadow-sm border border-light bg-light d-flex align-items-center justify-content-center text-secondary">
                            <div class="text-center p-4">
                                <i data-lucide="check-circle" style="width: 48px; height: 48px;"
                                    class="mb-3 text-emerald opacity-50"></i>
                                <h5 class="fw-bold fs-6">Validasi Kualitas</h5>
                                <p class="small mb-0">Pengecekan standar gizi</p>
                            </div>
                        </div>
                    </div>
                    <!-- Gallery Item 5 -->
                    <div class="col-md-4">
                        <div
                            class="gallery-item shadow-sm border border-light bg-light d-flex align-items-center justify-content-center text-secondary">
                            <div class="text-center p-4">
                                <i data-lucide="users" style="width: 48px; height: 48px;"
                                    class="mb-3 text-emerald opacity-50"></i>
                                <h5 class="fw-bold fs-6">Tim Lapangan</h5>
                                <p class="small mb-0">Koordinasi tim di lokasi</p>
                            </div>
                        </div>
                    </div>
                    <!-- Gallery Item 6 -->
                    <div class="col-md-4">
                        <div
                            class="gallery-item shadow-sm border border-light bg-light d-flex align-items-center justify-content-center text-secondary">
                            <div class="text-center p-4">
                                <i data-lucide="smile" style="width: 48px; height: 48px;"
                                    class="mb-3 text-emerald opacity-50"></i>
                                <h5 class="fw-bold fs-6">Senyum Siswa</h5>
                                <p class="small mb-0">Dampak positif program</p>
                            </div>
                        </div>
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