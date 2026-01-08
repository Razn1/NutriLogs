<%-- 
    Document   : index
    Created on : 7 Jan 2026, 20.28.03
    Author     : Razn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MBG Monitor | Real-Time Nutritious Meal Distribution</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        <script src="https://unpkg.com/lucide@latest"></script>
        <style>
            :root {
                --primary-green: #2D6A4F;
                --accent-orange: #F97316;
                --soft-bg: #F8FAFC;
                --text-dark: #1E293B;
            }

            body {
                font-family: 'Inter', sans-serif;
                color: var(--text-dark);
                background-color: #fff;
            }

            .navbar-brand {
                font-weight: 700;
                color: var(--primary-green) !important;
            }

            /* Hero Section */
            .hero-section {
                padding: 100px 0;
                background: linear-gradient(135deg, #f0fdf4 0%, #ffffff 100%);
            }

            .btn-primary {
                background-color: var(--primary-green);
                border: none;
                padding: 12px 24px;
                font-weight: 600;
            }

            .btn-outline-primary {
                border-color: var(--primary-green);
                color: var(--primary-green);
            }

            /* Features */
            .feature-card {
                border: none;
                transition: transform 0.3s ease;
                height: 100%;
            }

            .feature-card:hover {
                transform: translateY(-5px);
            }

            .icon-box {
                width: 60px;
                height: 60px;
                background: #dcfce7;
                color: var(--primary-green);
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 12px;
                margin-bottom: 20px;
            }

            /* Workflow */
            .workflow-step {
                position: relative;
                text-align: center;
            }

            .step-number {
                width: 40px;
                height: 40px;
                background: var(--accent-orange);
                color: white;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 15px;
                font-weight: bold;
            }

            /* Dashboard Preview */
            .dashboard-preview {
                background: white;
                border-radius: 20px;
                box-shadow: 0 20px 40px rgba(0,0,0,0.05);
                padding: 30px;
            }

            .status-badge {
                padding: 5px 12px;
                border-radius: 20px;
                font-size: 0.85rem;
                font-weight: 600;
            }

            .bg-success-light {
                background: #dcfce7;
                color: #166534;
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top border-bottom">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="#">
                    <i data-lucide="shield-check" class="me-2"></i> NutriLogs
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item"><a class="nav-link mx-2" href="#features">Features</a></li>
                        <li class="nav-item"><a class="nav-link mx-2" href="#workflow">Workflow</a></li>
                        <li class="nav-item"><a class="nav-link mx-2" href="#monitoring">Live Dashboard</a></li>
                        <li class="nav-item ms-lg-3">
                            <a class="btn btn-outline-primary" href="#">Login</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <header class="hero-section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <span class="badge bg-success mb-3" style="background-color: var(--primary-green) !important;">
                            Real-Time Monitoring System
                        </span>
                        <h1 class="display-4 fw-bold text-black mb-4">Ensuring Quality & Punctuality for Every Student.</h1>
                        <p class="lead mb-5 text-muted">A digital ecosystem connecting central kitchens, logistics, and schools to guarantee the transparent distribution of free nutritious meals (MBG).</p>
                        <div class="d-flex gap-3">
                            <a href="#" class="btn btn-primary btn-lg">Access Dashboard</a>
                            <a href="#features" class="btn btn-outline-dark btn-lg d-inline-flex align-items-center justify-content-center">Learn More</a>
                        </div>
                    </div>
                    <div class="col-lg-6 mt-5 mt-lg-0">
                        <img src="https://images.unsplash.com/photo-1590604511246-0b168965076a?auto=format&fit=crop&q=80&w=800" alt="Logistics Tracking" class="img-fluid rounded-4 shadow-lg">
                    </div>
                </div>
            </div>
        </header>

        <section id="features" class="py-5">
            <div class="container py-5">
                <div class="text-center mb-5">
                    <h2 class="fw-bold">Operational Excellence</h2>
                    <p class="text-muted">Designed for efficiency, transparency, and accountability.</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="card bg-white feature-card p-4 shadow-sm">
                            <div class="icon-box"><i data-lucide="map-pin"></i></div>
                            <h4 class="text-black">Real-Time Tracking</h4>
                            <p class="text-dark">Monitor delivery vehicles from central kitchens to 1,200+ schools in real-time with GPS integration.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card bg-white feature-card p-4 shadow-sm">
                            <div class="icon-box"><i data-lucide="check-circle"></i></div>
                            <h4 class="text-black">Dual Confirmation</h4>
                            <p class="text-dark">Standardized workflow: Admin morning dispatch confirmation and School midday receipt logs.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card bg-white feature-card p-4 shadow-sm">
                            <div class="icon-box" style="background: #fff7ed; color: var(--accent-orange);"><i data-lucide="bar-chart-3"></i></div>
                            <h4 class="text-black">Data Transparency</h4>
                            <p class="text-dark">Instant access to distribution history, kitchen capacity, and student coverage data.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="workflow" class="py-5 bg-light">
            <div class="container py-5">
                <div class="text-center mb-5">
                    <h2 class="fw-bold">Distribution Workflow</h2>
                </div>
                <div class="row">
                    <div class="col-md-3 workflow-step">
                        <div class="step-number">1</div>
                        <h5>Central Kitchen</h5>
                        <p class="small text-muted">Meals prepared & quantity confirmed by Admin.</p>
                    </div>
                    <div class="col-md-3 workflow-step">
                        <div class="step-number">2</div>
                        <h5>Logistics</h5>
                        <p class="small text-muted">Assigned to vehicle (Truck/Van) for delivery.</p>
                    </div>
                    <div class="col-md-3 workflow-step">
                        <div class="step-number">3</div>
                        <h5>In-Transit</h5>
                        <p class="small text-muted">Real-time ETA tracking for school operators.</p>
                    </div>
                    <div class="col-md-3 workflow-step">
                        <div class="step-number">4</div>
                        <h5>School Receipt</h5>
                        <p class="small text-muted">Quality check & midday receipt confirmation.</p>
                    </div>
                </div>
            </div>
        </section>

        <section id="monitoring" class="py-5">
            <div class="container py-5">
                <div class="row align-items-center">
                    <div class="col-lg-5 mb-5 mb-lg-0">
                        <h2 class="fw-bold mb-4">Live Insights for Better Decisions</h2>
                        <p class="mb-4">Our monitoring dashboard provides a granular view of daily operations, ensuring no school is left behind.</p>
                        <ul class="list-unstyled">
                            <li class="mb-3 d-flex align-items-center"><i data-lucide="users" class="me-2 text-success"></i> <strong>School Data:</strong> Student count & address verified.</li>
                            <li class="mb-3 d-flex align-items-center"><i data-lucide="truck" class="me-2 text-success"></i> <strong>Fleet Management:</strong> Type, Plate No, & Capacity.</li>
                            <li class="mb-3 d-flex align-items-center"><i data-lucide="utensils" class="me-2 text-success"></i> <strong>Kitchen Capacity:</strong> Staffing & production monitoring.</li>
                        </ul>
                    </div>
                    <div class="col-lg-7">
                        <div class="dashboard-preview border shadow-sm">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h5 class="m-0 fw-bold">Daily Distribution Progress</h5>
                                <span class="status-badge bg-success-light">Live Update</span>
                            </div>
                            <canvas id="deliveryChart" height="250"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5" style="background: var(--primary-green);">
            <div class="container py-5 text-center text-white">
                <h2 class="fw-bold mb-4">Ready to optimize MBG operations?</h2>
                <p class="lead mb-5 opacity-75">Join our platform to ensure accountability in nutrition distribution.</p>
                <button class="btn btn-warning btn-lg px-5 fw-bold" style="background-color: var(--accent-orange); border: none; color: white;">Access Admin Portal</button>
            </div>
        </section>

        <footer class="py-4 border-top">
            <div class="container text-center">
                <p class="text-muted small m-0">&copy; 2026 MBG Monitoring System. Ensuring a healthier future for all students.</p>
            </div>
        </footer>

        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            // Initialize Lucide Icons
            lucide.createIcons();

            // Chart.js implementation
            const ctx = document.getElementById('deliveryChart').getContext('2d');
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['06:00', '08:00', '10:00', '12:00', '14:00', '16:00'],
                    datasets: [{
                            label: 'Meals Delivered',
                            data: [0, 2500, 8000, 15000, 14800, 15000],
                            borderColor: '#2D6A4F',
                            backgroundColor: 'rgba(45, 106, 79, 0.1)',
                            fill: true,
                            tension: 0.4
                        }]
                },
                options: {
                    responsive: true,
                    plugins: {legend: {display: false}},
                    scales: {
                        y: {beginAtZero: true, grid: {display: false}},
                        x: {grid: {display: false}}
                    }
                }
            });
        </script>
    </body>
</html>
