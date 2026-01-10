<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // Data dummy (bisa nanti diisi dari servlet/database)
    int menunggu = 2;
    int diterima = 2;
    int dalamPerjalanan = 2;

    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEEE, d MMMM yyyy", new java.util.Locale("id", "ID"));
    String tanggal = sdf.format(new java.util.Date());
%>
<!doctype html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard Pengiriman Sekolah</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS & JS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!--Font Awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

        <style>
            body {
                background: #f7f7fb;
                color: #1f2937;
                font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans";
            }
            .page-wrap {
                max-width: 960px;
                margin: 40px auto;
                padding: 0 20px;
            }
            .headline {
                font-weight: 800;
                letter-spacing: -0.5px;
            }
            .subheadline {
                color: #6b7280;
            }
            .confirm-section {
                border-radius: 16px;
                background: #ffffff;
                box-shadow: 0 8px 24px rgba(31,41,55,0.08);
                padding: 24px;
            }
            .btn-confirm {
                border-radius: 10px;
                padding: 10px 18px;
                font-weight: 600;
            }
            .card-stat {
                border: none;
                border-radius: 16px;
                background: #ffffff;
                box-shadow: 0 8px 24px rgba(31,41,55,0.08);
                padding: 20px;
                min-height: 140px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }
            .card-stat .card-title {
                font-weight: 600;
                color: #374151;
            }
            .card-stat .card-value {
                font-size: 32px;
                font-weight: 700;
                color: #111827;
            }
            .card-delivery {
                border: none;
                border-radius: 16px;
                background: #ffffff;
                box-shadow: 0 6px 18px rgba(31,41,55,0.08);
                margin-bottom: 16px;
            }
            .card-delivery .card-body {
                padding: 16px 20px;
            }
            .card-delivery h6 {
                font-weight: 600;
                margin-bottom: 4px;
            }
            .card-delivery small {
                color: #6b7280;
            }
            .badge-status {
                border-radius: 999px;
                padding: 6px 12px;
                font-weight: 600;
            }
            .btn-confirm {
                background-color: #2ecc70;
                border: none;
                color: white;
                border-radius: 10px;
                padding: 10px 18px;
                font-weight: 600;
                transition: background-color 0.3s ease;
            }
            .btn-confirm:hover {
                background-color: #28b765;
            }
            .card {
                border-radius: 16px;
                background: #ffffff;
            }
            .list-group-item {
                font-size: 14px;
            }

        </style>
    </head>
    <body>
        <div class="page-wrap">

            <!-- Header -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="headline mb-1">Dashboard Dapur</h1>
                    <p class="subheadline"><%= tanggal%></p>
                </div>
                <div>
                    <button class="btn btn-success btn-confirm" data-bs-toggle="modal" data-bs-target="#pengirimanModal">
                        <i class="fa-solid fa-truck me-2"></i>Input Pengiriman
                    </button>
                </div>

                <!-- Include file modal -->
                <%@ include file="inputPengiriman.jsp" %>

            </div>

            <!-- Section konfirmasi -->
            <!-- Peringatan -->
            <div class="alert alert-warning confirm-section mt-4">
                <div id="late-alert-page" class="d-flex align-items-center justify-content-between mb-0 py-2 px-3" style="display:none;">
                    <div class="d-flex align-items-center">
                        <i class="fa-solid fa-triangle-exclamation me-3"></i>
                        <div>
                            <div class="fw-semibold">Peringatan: Terlambat Kirim</div>
                            <small class="text-muted">
                                Pengiriman ini akan ditandai sebagai terlambat (setelah 09:00)
                            </small>
                        </div>
                    </div>
                    <span id="late-time-page"
                          class="badge rounded-pill bg-warning text-dark px-3 py-2">
                        00.00
                    </span>
                </div>
            </div>

            <!-- Status Ringkas 4 Container -->
            <div class="row g-4 text-center mt-4">
                <div class="col-6 col-md-3">
                    <div class="card card-stat h-100">
                        <div class="card-body">
                            <h6 class="card-title">Total Hari Ini</h6>
                            <h2 class="card-value">0</h2>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="card card-stat h-100">
                        <div class="card-body">
                            <h6 class="card-title">Selesai</h6>
                            <h2 class="card-value">0</h2>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="card card-stat h-100">
                        <div class="card-body">
                            <h6 class="card-title">Dalam Perjalanan</h6>
                            <h2 class="card-value">0</h2>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="card card-stat h-100">
                        <div class="card-body">
                            <h6 class="card-title">Bermasalah</h6>
                            <h2 class="card-value">0</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row gx-4 gy-4 mt-4">
                <!-- Container Kiri -->
                <div class="col-12 col-md-6">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body">
                            <h5 class="fw-bold mb-3">Daftar Sekolah</h5>
                            <!-- isi daftar -->
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    SDN 01 Cakung <span class="badge bg-secondary">Belum Dikirim</span>
                                </li>
                            </ul>

                        </div>
                    </div>
                </div>

                <!-- Container Kanan -->
                <div class="col-12 col-md-6">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body">
                            <h5 class="fw-bold mb-3">Pengiriman Terbaru</h5>
                            <!-- isi pengiriman -->
                            <div class="confirm-section mt-4">
                                <div class="d-flex flex-column flex-md-row align-items-md-center justify-content-between">
                                    <div class="mb-3 mb-md-0">
                                        <h5 class="mb-1">SDN 08 Cengkareng</h5>
                                        <div class="small mt-1"><%= dalamPerjalanan%> pengiriman sedang menuju sekolah Anda</div>
                                    </div>
                                    <form method="post" action="konfirmasi">
                                        <!-- Contoh: kirim nilai konfirmasi (dummy). Ganti dengan id pengiriman nyata. -->
                                        <input type="hidden" name="aksi" value="konfirmasi-semua"/>
                                        <button type="submit" class="btn btn-success btn-confirm">
                                            Dikirim
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Status kendaraan -->
            <div class="confirm-section mt-4">
                <div class="d-flex flex-column flex-md-row align-items-md-center justify-content-between">

                    <form method="post" action="konfirmasi">
                        <input type="hidden" name="aksi" value="konfirmasi-semua"/>
                        <strong>Status kendaraan</strong>
                        <div class="small mt-1">Daftar kendaraan yang tersedia</div>
                </div>
                <div class="card card-stat col-3 p-10 shadow">
                    <div class="card-body">
                        <h6 class="card-title">Selesai</h6>
                        <h2 class="card-value">0</h2>
                    </div>
                </div>

                </form>
            </div>
        </div>
    </div>


    <!-- Optional: interaksi ringan -->
    <script>
        function updateLateAlerts() {
            const now = new Date();
            const h = now.getHours();
            const m = now.getMinutes();

            const hh = String(h).padStart(2, '0');
            const mm = String(m).padStart(2, '0');
            const formatted = hh + '.' + mm;

            // helper untuk show/hide + isi waktu
            function applyAlert(alertId, timeId) {
                const alertEl = document.getElementById(alertId);
                const timeEl = document.getElementById(timeId);
                if (!alertEl || !timeEl)
                    return; // kalau elemen tidak ada (misal di halaman lain)

                if (h > 9 || (h === 9 && m > 0)) {
                    alertEl.style.display = 'flex';
                    timeEl.textContent = formatted;
                } else {
                    alertEl.style.display = 'none';
                }
            }

            // alert di halaman utama
            applyAlert('late-alert-page', 'late-time-page');
            // alert di dalam modal
            applyAlert('late-alert', 'late-time');
        }

        updateLateAlerts();
        setInterval(updateLateAlerts, 1000);
    </script>

</body>
</html>