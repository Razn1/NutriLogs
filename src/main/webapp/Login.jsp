<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | NutriLogs MBG System</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

        <style>
            :root {
                --primary-green: #2D6A4F;
                --bright-green: #22C55E;
                --dark-navy: #1E293B;
                --soft-bg: #F8FAFC;
            }

            body {
                font-family: 'Inter', sans-serif;
                background-color: var(--soft-bg);
                height: 100vh;
                margin: 0;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .login-card {
                background: white;
                border-radius: 24px;
                overflow: hidden;
                box-shadow: 0 20px 40px rgba(0,0,0,0.1);
                width: 100%;
                max-width: 1000px;
                min-height: 600px;
                display: flex;
            }

            .login-visual {
                background-color: var(--dark-navy);
                flex: 1.1;
                padding: 45px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                color: white;
            }

            .brand-header {
                display: flex;
                align-items: center;
                gap: 20px;
                margin-bottom: 8px;
            }

            .logo-box {
                background-color: var(--bright-green);
                width: 56px;
                height: 56px;
                border-radius: 14px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                box-shadow: 0 8px 20px rgba(34, 197, 94, 0.2);
            }

            .brand-name {
                font-size: 2.8rem;
                font-weight: 700;
                margin: 0;
                line-height: 1;
            }

            .sub-title {
                font-size: 1.1rem;
                color: rgba(255,255,255,0.5);
                margin-left: 76px;
                margin-bottom: 30px;
            }

            .divider {
                width: 100%;
                height: 1px;
                background: rgba(255,255,255,0.1);
                margin: 20px 0 40px 0;
            }

            .feature-item {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
                font-size: 1.05rem;
            }

            .feature-item i {
                color: var(--bright-green);
                margin-right: 15px;
                font-size: 1.2rem;
            }

            .login-form-section {
                flex: 0.9;
                padding: 60px;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .btn-login {
                background-color: var(--primary-green);
                color: white;
                padding: 14px;
                border-radius: 12px;
                font-weight: 700;
                border: none;
                transition: all 0.3s;
                margin-top: 20px;
            }

            .btn-login:hover {
                background-color: #1b4332;
                transform: translateY(-2px);
                color: white;
            }

            .form-control {
                padding: 12px 16px;
                border-radius: 12px;
                border: 1px solid #E2E8F0;
                background-color: #F8FAFC;
            }

            .form-control:focus {
                border-color: var(--primary-green);
                box-shadow: 0 0 0 3px rgba(45, 106, 79, 0.1);
            }

            @media (max-width: 992px) {
                .login-visual {
                    padding: 40px;
                }
                .login-form-section {
                    padding: 40px;
                }
            }

            @media (max-width: 768px) {
                .login-visual {
                    display: none;
                }
                .login-card {
                    max-width: 450px;
                }
            }
        </style>
    </head>
    <body>

        <div class="container d-flex justify-content-center">
            <div class="login-card">
                <div class="login-visual">
                    <div class="brand-header">
                        <div class="logo-box">
                            <i class="fa-solid fa-truck-fast"></i>
                        </div>
                        <h1 class="brand-name">NutriLogs</h1>
                    </div>

                    <p class="sub-title">Monitoring System</p>

                    <div class="divider"></div>

                    <div class="features">
                        <div class="feature-item">
                            <i class="fa-solid fa-circle-check"></i>
                            <span>Distribusi Real-time Terpantau</span>
                        </div>
                        <div class="feature-item">
                            <i class="fa-solid fa-circle-check"></i>
                            <span>Konfirmasi Penerimaan Sekolah</span>
                        </div>
                    </div>
                </div>

                <div class="login-form-section">
                    <div class="mb-5">
                        <h2 class="fw-bold" style="color: var(--dark-navy);">Selamat Datang</h2>
                        <p class="text-muted">Gunakan akun Anda untuk masuk ke sistem.</p>
                    </div>
                    
                    <%
                        if ("error".equals(request.getParameter("status"))) {
                    %>
                    <div class="alert alert-danger d-flex align-items-center" role="alert" style="border-radius: 12px; font-size: 0.85rem;">
                        <i class="fa-solid fa-circle-exclamation me-2"></i>
                        <div>Email atau password salah!</div>
                    </div>
                    <% }%>

                    <form action="auth" method="POST">
                        <input type="hidden" name="action" value="Login">

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Email</label>
                            <input type="text" name="email" class="form-control" placeholder="Masukkan email" required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-semibold">Password</label>
                            <input type="password" name="password" class="form-control" placeholder="••••••••" required>
                        </div>

                        <button type="submit" class="btn btn-login w-100 shadow-sm">
                            Masuk Sekarang
                        </button>
                    </form>

                    <div class="text-center mt-5">
                        <p class="small text-muted">&copy; 2026 MBG Monitoring System</p>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>