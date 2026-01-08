<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | NutriLog MBG System</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
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
                box-shadow: 0 20px 40px rgba(0,0,0,0.08);
                width: 100%;
                max-width: 1000px;
                min-height: 600px;
                display: flex;
            }

            .login-visual {
                background-color: var(--dark-navy);
                flex: 1;
                padding: 60px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                color: white;
            }

            .login-visual .logo-box {
                background-color: var(--bright-green);
                width: 50px;
                height: 50px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 24px;
            }

            .login-form-section {
                flex: 1;
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
            }

            .btn-login:hover {
                background-color: #1b4332;
                transform: translateY(-2px);
                color: white;
            }

            .form-control {
                padding: 12px 16px;
                border-radius: 12px;
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
                    <div class="logo-box">
                        <i data-lucide="truck" class="text-white"></i>
                    </div>
                    <h1 class="fw-bold display-5">NutriLog</h1>
                    <p class="text-white-50 lead">Monitoring System</p>
                    <hr class="my-4 opacity-25">
                    <div class="mt-2">
                        <div class="d-flex align-items-center mb-3">
                            <i data-lucide="check-circle-2" class="me-3" style="color: var(--bright-green);"></i>
                            <span>Distribusi Real-time</span>
                        </div>
                        <div class="d-flex align-items-center mb-3">
                            <i data-lucide="check-circle-2" class="me-3" style="color: var(--bright-green);"></i>
                            <span>Konfirmasi Penerimaan Sekolah</span>
                        </div>
                    </div>
                </div>

                <div class="login-form-section">
                    <div class="mb-5 text-center text-md-start">
                        <h2 class="fw-bold" style="color: var(--primary-green);">Selamat Datang</h2>
                        <p class="text-muted">Masuk untuk mengelola distribusi MBG.</p>
                    </div>

                    <form action="loginProcess.jsp" method="POST">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Username</label>
                            <div class="input-group">
                                <input type="text" name="username" class="form-control" placeholder="Username" required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <div class="d-flex justify-content-between">
                                <label class="form-label fw-semibold">Password</label>
                                <a href="#" class="text-decoration-none small fw-bold" style="color: var(--primary-green);">Lupa?</a>
                            </div>
                            <div class="input-group">
                                <input type="password" name="password" class="form-control" placeholder="••••••••" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-login w-100 shadow-sm mt-3">
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
        <script src="https://unpkg.com/lucide@latest"></script>
    </body>
</html>