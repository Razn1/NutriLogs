<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    if (!"admin_dapur".equals(user.getRole())) {
        session.invalidate();

        HttpSession newSession = request.getSession(true);
        newSession.setAttribute("errorMessage", "Akses Ilegal! Anda telah dikeluarkan dari sistem.");

        response.sendRedirect("Login.jsp");
        return;
    }
%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!doctype html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard Pengiriman Sekolah</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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
            .school-card {
                background: #f8f9fa;
                border: none;
                border-radius: 12px;
                padding: 16px 20px;
                margin-bottom: 12px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                transition: transform 0.2s;
            }

            .school-card:hover {
                transform: translateY(-2px);
                background: #f1f3f5;
            }

            .school-info h6 {
                margin: 0;
                font-weight: 700;
                color: #334155;
                font-size: 1.05rem;
            }

            .school-info span {
                color: #94a3b8;
                font-size: 0.9rem;
            }

            .badge-pending {
                background-color: #e2e8f0;
                color: #64748b;
                border-radius: 20px;
                padding: 6px 16px;
                font-size: 0.85rem;
                font-weight: 600;
                border: none;
            }

            .header-icon {
                color: #2ecc71;
                font-size: 1.5rem;
                margin-right: 12px;
            }
            .delivery-card {
                background: #f8f9fa;
                border-radius: 16px;
                padding: 16px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                transition: all 0.3s ease;
            }

            .delivery-card:hover {
                background: #f1f3f5;
            }

            .icon-box {
                background-color: #f0fff4;
                color: #2ecc71;
                width: 45px;
                height: 45px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.2rem;
                margin-right: 15px;
            }

            .delivery-info h6 {
                margin: 0;
                font-weight: 700;
                color: #1e293b;
                font-size: 1rem;
            }

            .delivery-info span {
                color: #94a3b8;
                font-size: 0.9rem;
            }

            .badge-sent {
                background-color: #fcc419;
                color: #453000;
                border-radius: 20px;
                padding: 4px 12px;
                font-size: 0.8rem;
                font-weight: 600;
                border: none;
                display: flex;
                align-items: center;
                gap: 5px;
            }

            .time-text {
                display: block;
                text-align: right;
                color: #94a3b8;
                font-size: 0.85rem;
                margin-top: 4px;
            }

            .header-icon-blue {
                color: #2ecc71;
                font-size: 1.5rem;
                margin-right: 12px;
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

            .vehicle-list {
                display: flex;
                gap: 16px;
                padding-bottom: 10px;
                overflow-x: auto;
                overflow-y: hidden;
                flex-wrap: nowrap;
            }

            .vehicle-card {
                min-width: 220px;
                background: #f0fff4;
                border: 2px solid #dcfce7;
                border-radius: 16px;
                padding: 16px;
                transition: all 0.2s ease;
                flex-shrink: 0;
            }
            .vehicle-list::-webkit-scrollbar {
                height: 6px;
            }

            .vehicle-list::-webkit-scrollbar-thumb {
                background-color: #000;
                border-radius: 10px;
            }

            badge-pending {
                background-color: #f1f5f9;
                color: #64748b;
                border: none;
            }

            .badge-shipping {
                background-color: #fef9c3;
                color: #a16207;
            }

            .badge-received {
                background-color: #dcfce7;
                color: #15803d;
            }

            .vehicle-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 12px;
            }

            .vehicle-icon {
                color: #2ecc71;
                font-size: 1.2rem;
            }

            .badge-available {
                background-color: #f0fff4;
                color: #2ecc71;
                font-size: 0.75rem;
                font-weight: 600;
                padding: 4px 10px;
                border-radius: 20px;
                border: 1px solid #d1fae5;
            }

            .vehicle-name {
                font-weight: 700;
                font-size: 1rem;
                color: #1e293b;
                margin-bottom: 2px;
            }

            .vehicle-plate {
                font-size: 0.85rem;
                color: #94a3b8;
                margin-bottom: 8px;
                display: block;
            }

            .vehicle-capacity {
                font-size: 0.85rem;
                color: #64748b;
            }
            .btn-logout {
                color: #ff4d4f;
                background: transparent;
                border: none;
                font-weight: 600;
                display: flex;
                align-items: center;
                gap: 8px;
                padding: 10px 15px;
                text-decoration: none;
                transition: all 0.2s;
            }

            .btn-logout:hover {
                color: #d32f2f;
                background: rgba(255, 77, 79, 0.05);
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <div class="page-wrap">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="headline mb-1">Dashboard Dapur</h1>
                    <p class="subheadline">tanggal</p>
                </div>

                <div class="d-flex align-items-center gap-2">
                    <form action="auth" method="POST" class="m-0 p-0"> <input type="hidden" name="action" value="logout">
                        <button type="submit" class="btn-logout">
                            <i class="fa-solid fa-arrow-right-from-bracket"></i> 
                            Logout
                        </button>
                    </form>

                    <button class="btn btn-success btn-confirm" data-bs-toggle="modal" data-bs-target="#pengirimanModal">
                        <i class="fa-solid fa-truck me-2"></i>Input Pengiriman
                    </button>
                </div>
                <%@ include file="../inputPengiriman.jsp" %>
            </div>

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
                <div class="col-12 col-md-6">
                    <div class="card h-100 shadow-sm border-0" style="border-radius: 20px;">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-1">
                                <i class="fa-solid fa-city header-icon"></i>
                                <h4 class="fw-bold m-0" style="color: #1e293b;">Daftar Sekolah</h4>
                            </div>
                            <p class="text-muted mb-4" style="font-size: 0.95rem;">Sekolah yang dilayani hari ini</p>
                            <c:forEach var="s" items="${schools}">
                                <div class="school-list">
                                    <div class="school-card">
                                        <div class="school-info">
                                            <h6>${s.nama}</h6>
                                            <span>${s.jumlahSiswa} siswa</span>
                                        </div>
                                        <span class="badge badge-pending ">Belum Dikirim</span>
                                    </div>
                                </div>
                            </c:forEach>                            
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <div class="card h-100 shadow-sm border-0" style="border-radius: 20px;">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-1">
                                <i class="fa-regular fa-clock header-icon-blue"></i>
                                <h4 class="fw-bold m-0" style="color: #1e293b;">Pengiriman Terbaru</h4>
                            </div>
                            <p class="text-muted mb-4" style="font-size: 0.95rem;">5 pengiriman terakhir hari ini</p>

                            <div class="delivery-list">
                                <div class="delivery-card">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-box">
                                            <i class="fa-solid fa-truck-fast"></i>
                                        </div>
                                        <div class="delivery-info">
                                            <h6>SDN 12 Kebayoran</h6>
                                            <span>300 porsi</span>
                                        </div>
                                    </div>
                                    <div class="delivery-status">
                                        <span class="badge badge-sent">
                                            <i class="fa-solid fa-box-open" style="font-size: 0.7rem;"></i> Dikirim
                                        </span>
                                        <span class="time-text">Kirim: 20.56</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="confirm-section mt-4">
                <div class="vehicle-section mt-2">
                    <div class="d-flex align-items-center mb-1">
                        <i class="fa-solid fa-truck-moving header-icon" style="color: #2ecc71;"></i>
                        <h4 class="fw-bold m-0" style="color: #1e293b;">Status Kendaraan</h4>
                    </div>
                    <p class="text-muted mb-4" style="font-size: 0.95rem;">Daftar kendaraan yang tersedia</p>

                    <div class="vehicle-list">
                        <c:forEach var="v" items="${vehicles}">
                            <div class="vehicle-card">
                                <div class="vehicle-header d-inline-flex">
                                    <i class="fa-solid fa-truck vehicle-icon"></i>
                                    <span class="badge-available">Tersedia</span>
                                </div>
                                <div>${v.namaKendaraan}</div>
                                <span>${v.platNomor}</span>
                                <div class="vehicle-capacity">${v.kapasitas}</div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

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