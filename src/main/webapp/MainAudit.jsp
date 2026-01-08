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
        <title>Dashboard Audit</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS & JS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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
                    <h1 class="headline mb-1">Dashboard Audit</h1>
                    <p class="subheadline"><%= tanggal%></p>
                </div>
            </div>
            <!-- Status Ringkas 4 Container -->
            <div class="row g-4 text-center mt-4">
                <div class="col-6 col-md-2">
                    <div class="card card-stat h-100">
                        <div class="card-body">
                            <h6 class="card-title">Total Pengiriman</h6>
                            <h2 class="card-value">0</h2>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-2">
                    <div class="card card-stat h-100">
                        <div class="card-body">
                            <h6 class="card-title">Selesai</h6>
                            <h2 class="card-value">0</h2>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-2">
                    <div class="card card-stat h-100">
                        <div class="card-body">
                            <h6 class="card-title">Dalam Perjalanan</h6>
                            <h2 class="card-value">0</h2>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-2">
                    <div class="card card-stat h-100">
                        <div class="card-body">
                            <h6 class="card-title">Menunggu</h6>
                            <h2 class="card-value">0</h2>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-2">
                    <div class="card card-stat h-100">
                        <div class="card-body">
                            <h6 class="card-title">Bermasalah</h6>
                            <h2 class="card-value">0</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-wrap">
            <!-- Detail Distribusi -->
            <div class="row g-10">
                <div class="col-6 col-md-4">
                    <div class="card card-stat h-100">
                        <div class="card-body">
                            <h6 class="card-title">Bermasalah</h6>
                            <h2 class="card-value">0</h2>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="card card-stat h-100">
                        <div class="card-body">
                            <h6 class="card-title">Bermasalah</h6>
                            <h2 class="card-value">0</h2>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="card card-stat h-100">
                        <div class="card-body">
                            <h6 class="card-title">Bermasalah</h6>
                            <h2 class="card-value">0</h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="confirm-section mt-4">
                <div class="d-flex flex-column flex-md-row align-items-md-center justify-content-between mb-3">
                    <div>
                        <h5 class="mb-1">Riwayat Pengiriman</h5>
                        <p class="text-muted mb-0">Status Transaksi Pengiriman</p>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table align-middle">
                        <thead>
                            <tr>
                                <th>Sekolah</th>
                                <th>Dapur</th>
                                <th>Waktu Kirim</th>
                                <th>Waktu Terima</th>
                                <th class="text-center">Jumlah</th>
                                <th>Kualitas</th>
                                <th>Status</th>
                                <th>Flags</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="table-danger">
                                <td>
                                    <div class="d-flex align-items-center gap-2">
                                        <i class="fa-solid fa-building text-muted"></i>
                                        <span class="fw-medium">SDN 01 Cakung</span>
                                    </div>
                                </td>
                                <td><span class="text-muted">Dapur Pusat Jakarta Timur</span></td>
                                <td>
                                    <div class="d-flex align-items-center gap-1 text-warning">
                                        <i class="fa-solid fa-clock"></i>
                                        <span class="fw-medium">22.45</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center gap-1 text-danger">
                                        <i class="fa-solid fa-clock"></i>
                                        <span class="fw-medium">22.46</span>
                                    </div>
                                </td>
                                <td class="text-center">500</td>
                                <td>
                                    <span class="badge bg-primary text-white">Sangat Baik</span>
                                </td>
                                <td>
                                    <span class="badge bg-light text-primary border border-primary">Diterima</span>
                                </td>
                                <td>
                                    <div class="d-flex flex-wrap gap-1">
                                        <span class="badge bg-danger text-white animate-pulse">
                                            <i class="fa-solid fa-clock me-1"></i>Terlambat Tiba
                                        </span>
                                        <span class="badge bg-warning text-dark">
                                            <i class="fa-solid fa-clock me-1"></i>Terlambat Kirim
                                        </span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>            <!-- Optional: interaksi ringan -->
            <script>
                // Placeholder untuk simulasi update (opsional)
                // Misal: fetch ke endpoint untuk update jumlah pengiriman realtime.
                // fetch('/api/pengiriman/status').then(...);
            </script>
    </body>
</html>