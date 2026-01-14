<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("Login.jsp");
        return; 
    }

    if (!"petugas_sekolah".equals(user.getRole())) {
        session.invalidate(); 
 
        HttpSession newSession = request.getSession(true);
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script defer src="js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                background: #f7f7fb;
                color: #1f2937;
                font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", "Apple Color Emoji", "Segoe UI Emoji";
            }
            .page-wrap {
                max-width: 960px;
                margin: 40px auto;
                padding: 0 20px;
            }
            .card-stat-new {
                border: 2px solid #e5e7eb;
                border-radius: 12px;
                background: #fdfcf7; 
                padding: 20px;
                position: relative;
                border-left: 6px solid #fbbf24;
                min-height: 120px;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .card-stat-new.diterima {
                border-left: 6px solid #22c55e; 
                background: #f7fdfa; 
            }

            .card-stat-new .stat-label {
                font-size: 14px;
                color: #6b7280;
                margin-bottom: 8px;
                font-weight: 500;
            }

            .card-stat-new .stat-value {
                font-size: 32px;
                font-weight: 800;
                color: #111827;
            }

            .card-stat-new .stat-icon {
                position: absolute;
                top: 20px;
                right: 20px;
                font-size: 20px;
            }

            .icon-yellow {
                color: #fbbf24;
            }
            .icon-green {
                color: #22c55e;
            }

            .alert-travel {
                background: #fff;
                border: 2px solid #fbbf24;
                border-radius: 12px;
                padding: 15px 20px;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .icon-bell-wrapper {
                background: #fef3c7;
                color: #d97706;
                width: 50px;
                height: 50px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 20px;
                margin-right: 15px;
            }

            .btn-konfirmasi-travel {
                background-color: #2ecc71;
                color: white;
                border: none;
                border-radius: 12px;
                padding: 12px 30px;
                font-weight: 700;
                transition: 0.3s;
            }

            .btn-konfirmasi-travel:hover {
                background-color: #27ae60;
                transform: scale(1.02);
            }
            .badge-soft {
                background: #f3f4f6;
                color: #111827;
                border: 1px solid #e5e7eb;
                border-radius: 999px;
                padding: 6px 12px;
                font-weight: 600;
            }
            .delivery-container {
                background: #ffffff;
                border: 1px solid #e5e7eb;
                border-radius: 12px;
                padding: 20px;
            }

            .inner-delivery-card {
                border: 2px solid #e5e7eb;
                border-radius: 12px;
                padding: 16px;
                margin-bottom: 20px;
                background: #fff;
            }

            .icon-box {
                background-color: #ecfdf5;
                color: #10b981;
                width: 48px;
                height: 48px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 8px;
                font-size: 20px;
            }

            .badge-dikirim {
                color: #000;
                border-radius: 20px;
                padding: 4px 12px;
                font-size: 12px;
                font-weight: 600;
            }

            .info-text {
                color: #4b5563;
                font-size: 14px;
            }

            .btn-confirm-wide {
                background-color: #22c55e;
                color: white;
                border: none;
                border-radius: 10px;
                width: 100%;
                padding: 12px;
                font-weight: 600;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                transition: background 0.2s;
            }

            .btn-confirm-wide:hover {
                background-color: #16a34a;
                color: white;
            }

            .delivery-header-icon {
                color: #22c55e;
                margin-right: 8px;
            }
        </style>
    </head>
    <body>
        <header>
            <%@include file="header.jsp"%>
        </header>
        <div class="page-wrap mb-2">
            <div class="mb-4">
                <h1 class="headline mb-1">Selamat Datang</h1>
                <p class="subheadline"> tanggal</p>
            </div>

            <div class="row g-4 mb-4">
                <div class="col-12 col-md-6">
                    <div class="card-stat-new">
                        <div class="stat-label">Menunggu</div>
                        <div class="stat-value"> menunggu</div>
                        <div class="stat-icon icon-yellow">
                            <i class="fa-solid fa-truck-fast"></i>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="card-stat-new diterima">
                        <div class="stat-label">Diterima</div>
                        <div class="stat-value">diterima</div>
                        <div class="stat-icon icon-green">
                            <i class="fa-regular fa-circle-check"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="alert-travel mb-4">
                <div class="d-flex align-items-center">
                    <div class="icon-bell-wrapper">
                        <i class="fa-solid fa-bell"></i>
                    </div>
                    <div>
                        <div class="fw-bold" style="color: #111827;">Pengiriman Dalam Perjalanan!</div>
                        <div class="small text-muted">dalamPerjalanan pengiriman sedang menuju sekolah Anda</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-wrap">
            <div class="delivery-container">
                <div class="mb-4">
                    <h5 class="fw-bold mb-1 d-flex align-items-center">
                        <i class="fa-solid fa-box-open delivery-header-icon"></i> Pengiriman Hari Ini
                    </h5>
                    <p class="text-muted small">Daftar pengiriman untuk sekolah Anda</p>
                </div>
                <div class="inner-delivery-card">
                    <div class="d-flex justify-content-between align-items-start mb-3">
                        <div class="d-flex align-items-center">
                            <div class="icon-box me-3">
                                <i class="fa-solid fa-truck"></i>
                            </div>
                            <div>
                                <h6 class="fw-bold mb-0">Dapur Pusat Jakarta Selatan</h6>
                                <small class="text-muted">Box Truck 03</small>
                            </div>
                        </div>
                        <span class="badge-dikirim">
                            <i class="fa-solid fa-box small me-1"></i> Dikirim
                        </span>
                    </div>
                    <div class="d-flex justify-content-between info-text mb-3">
                        <span><i class="fa-solid fa-boxes-stacked me-1"></i> 390 porsi</span>
                        <span><i class="fa-regular fa-clock me-1"></i> Kirim: 14.31</span>
                    </div>
                    <form action="konfirmasi-penerimaan" method="POST">
                        <button type="submit" class="btn-confirm-wide">
                            <i class="fa-regular fa-circle-check"></i> Konfirmasi Penerimaan
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>