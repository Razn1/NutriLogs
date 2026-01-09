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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
                border: 1px solid #e5e7eb;
                border-radius: 12px;
                background: #ffffff;
                padding: 16px;
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                box-shadow: none;
                position: relative;
                text-align: left;
            }

            .border-left-success {
                border-left: 4px solid #22c55e !important;
            }
            .border-left-warning {
                border-left: 4px solid #facc15 !important;
            }
            .border-left-danger {
                border-left: 4px solid #ef4444 !important;
            }
            .card-stat .card-title {
                font-size: 0.9rem;
                font-weight: 500;
                color: #6b7280;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .card-stat .card-value {
                font-size: 28px;
                font-weight: 700;
                color: #111827;
                margin-top: 8px;
                margin-bottom: 0;
            }

            .card-stat .sub-text {
                font-size: 0.75rem;
                color: #9ca3af;
                margin-top: 4px;
            }

            .icon-box {
                font-size: 1.2rem;
            }

            /* Warna khusus ikon */
            .text-success-icon {
                color: #22c55e;
            }
            .text-warning-icon {
                color: #facc15;
            }
            .text-danger-icon {
                color: #ef4444;
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

            .table {
                border-collapse: separate;
                border-spacing: 0 12px;
            }

            .table tbody tr {
                background-color: #fff4f4;
                border-left: 4px solid #ef4444;
            }

            .table td {
                padding: 16px 12px !important;
                border: none !important;
            }

            .badge-quality {
                background-color: #2ecc71;
                color: white;
                padding: 10px 20px;
                border-radius: 50px;
                font-weight: 600;
                display: inline-block;
                min-width: 100px;
                text-align: center;
            }

            .badge-received {
                background-color: #e8f8f0;
                color: #2ecc71;
                padding: 6px 15px;
                border-radius: 50px;
                border: 1px solid #d1f2e1;
                font-weight: 500;
            }

            .badge-flag {
                padding: 6px 14px;
                border-radius: 50px;
                font-size: 13px;
                font-weight: 500;
            }

            .bg-flag-red {
                background-color: #e74c3c;
                color: white;
            }
            .bg-flag-yellow {
                background-color: #f1c40f;
                color: #34495e;
            }

            .time-warning {
                color: #f1c40f;
                font-weight: 500;
            }
            .time-danger {
                color: #e74c3c;
                font-weight: 500;
            }

            .text-school {
                font-weight: 700;
                color: #2c3e50;
            }
            .text-kitchen {
                color: #7f8c8d;
                font-size: 0.95rem;
                line-height: 1.2;
            }

            .card-summary {
                border: 1px solid #e5e7eb;
                border-radius: 16px;
                background: #ffffff;
                padding: 20px;
                height: 100%;
                transition: all 0.3s ease;
            }

            .card-summary:hover {
                box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            }

            .card-summary .card-header-custom {
                display: flex;
                align-items: center;
                gap: 8px;
                margin-bottom: 12px;
            }

            .card-summary .card-title-custom {
                font-size: 1rem;
                font-weight: 600;
                color: #1f2937;
                margin: 0;
            }

            .card-summary .card-value-custom {
                font-size: 32px;
                font-weight: 800;
                color: #111827;
                margin-bottom: 4px;
                display: block;
            }

            .card-summary .card-desc-custom {
                font-size: 0.85rem;
                color: #6b7280;
                margin: 0;
            }

            .icon-dapur {
                color: #22c55e;
            }
            .icon-sekolah {
                color: #22c55e;
            }
            .icon-porsi {
                color: #22c55e;
            }

        </style>
    </head>
    <body>
        <div class="page-wrap">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="headline mb-1">Dashboard Audit</h1>
                    <p class="subheadline"><%= tanggal%></p>
                </div>
            </div>
            <div class="row g-3 mt-2">
                <div class="col">
                    <div class="card card-stat">
                        <div class="card-title">
                            Total Pengiriman <i class="fa-solid fa-box-archive text-muted"></i>
                        </div>
                        <h2 class="card-value">2</h2>
                    </div>
                </div>

                <div class="col">
                    <div class="card card-stat border-left-success" style="background-color: #f9fdfa;">
                        <div class="card-title">
                            Selesai <i class="fa-regular fa-circle-check text-success-icon"></i>
                        </div>
                        <h2 class="card-value">0</h2>
                    </div>
                </div>

                <div class="col">
                    <div class="card card-stat border-left-warning" style="background-color: #fffdf5;">
                        <div class="card-title">
                            Dalam Perjalanan <i class="fa-solid fa-truck-fast text-warning-icon"></i>
                        </div>
                        <h2 class="card-value">2</h2>
                    </div>
                </div>

                <div class="col">
                    <div class="card card-stat">
                        <div class="card-title">
                            Menunggu <i class="fa-regular fa-clock text-muted"></i>
                        </div>
                        <h2 class="card-value">0</h2>
                    </div>
                </div>

                <div class="col">
                    <div class="card card-stat border-left-danger" style="background-color: #fef9f9;">
                        <div class="card-title">
                            Bermasalah <i class="fa-solid fa-triangle-exclamation text-danger-icon"></i>
                        </div>
                        <h2 class="card-value">19</h2>
                        <p class="sub-text">Perlu perhatian</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-wrap">
            <div class="row g-4">
                <div class="col-12 col-md-4">
                    <div class="card-summary">
                        <div class="card-header-custom">
                            <i class="fa-solid fa-utensils icon-dapur"></i>
                            <h6 class="card-title-custom">Dapur Aktif</h6>
                        </div>
                        <span class="card-value-custom">3</span>
                        <p class="card-desc-custom">dapur pusat beroperasi</p>
                    </div>
                </div>

                <div class="col-12 col-md-4">
                    <div class="card-summary">
                        <div class="card-header-custom">
                            <i class="fa-solid fa-school icon-sekolah"></i>
                            <h6 class="card-title-custom">Sekolah Terlayani</h6>
                        </div>
                        <span class="card-value-custom">5</span>
                        <p class="card-desc-custom">sekolah hari ini</p>
                    </div>
                </div>

                <div class="col-12 col-md-4">
                    <div class="card-summary">
                        <div class="card-header-custom">
                            <i class="fa-solid fa-box icon-porsi"></i>
                            <h6 class="card-title-custom">Total Porsi</h6>
                        </div>
                        <span class="card-value-custom">10,165</span>
                        <p class="card-desc-custom">porsi didistribusikan</p>
                    </div>
                </div>
            </div>

            <div class="confirm-section mt-4">
                <div class="mb-3">
                    <div class="d-flex align-items-center">
                        <i class="fa-solid fa-clock-rotate-left me-1"></i>
                        <h5 class="mb-0">Riwayat Pengiriman</h5>
                    </div>
                    <div>
                        <p class="text-muted mb-0">Semua Transaksi Pengiriman</p>
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
                            <tr class="">
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
            </div>           
        </div>    
    </body>
</html>