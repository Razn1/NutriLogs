<%-- 
    Document   : index
    Created on : 7 Jan 2026, 20.28.03
    Author     : Razn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NutriLog | MBG Distribution Management System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;800&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        :root {
            --primary: #10B981;
            --primary-hover: #059669;
            --surface: #F9FAFB;
            --text-primary: #111827;
            --text-secondary: #4B5563;
            --success: #10B981;
            --warning: #F59E0B;
            --error: #EF4444;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--surface);
            color: var(--text-primary);
            overflow-x: hidden;
        }

        /* Updated Animated Mesh Gradient Background to Emerald Tones */
        .bg-mesh {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background-color: #f9fafb;
            background-image: 
                radial-gradient(at 0% 0%, hsla(161, 68%, 91%, 1) 0, transparent 50%), 
                radial-gradient(at 50% 0%, hsla(161, 68%, 95%, 1) 0, transparent 50%), 
                radial-gradient(at 100% 0%, hsla(161, 68%, 91%, 1) 0, transparent 50%);
            filter: blur(80px);
            animation: meshMove 20s ease infinite alternate;
        }

        @keyframes meshMove {
            0% { transform: scale(1); }
            100% { transform: scale(1.1); }
        }

        .glass {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .btn-primary {
            background-color: var(--primary);
            transition: all 0.2s ease;
            box-shadow: 0 4px 14px 0 rgba(16, 185, 129, 0.3);
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(16, 185, 129, 0.4);
        }

        .card-hover:hover {
            transform: translateY(-4px);
            transition: transform 0.3s ease;
        }

        .status-badge {
            padding: 4px 12px;
            border-radius: 9999px;
            font-size: 12px;
            font-weight: 600;
        }

        .step-line::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 100%;
            width: 40px;
            height: 2px;
            background: #E5E7EB;
        }

        @media (max-width: 768px) {
            .step-line::after { display: none; }
        }
    </style>
</head>
<body>
    <div class="bg-mesh"></div>

    <!-- Navigation -->
    <nav class="fixed top-0 w-full z-50 glass border-b border-gray-200">
        <div class="max-w-7xl mx-auto px-6 h-20 flex items-center justify-between">
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-[#10B981] rounded-lg flex items-center justify-center text-white shrink-0">
                    <i data-lucide="truck"></i>
                </div>
                <div class="flex flex-col">
                    <span class="text-xl font-bold tracking-tight leading-none">Nutri<span class="text-[#10B981]">Log</span></span>
                    <span class="text-[10px] text-gray-500 font-medium uppercase tracking-wider mt-0.5">MBG Distribution Management System</span>
                </div>
            </div>
            
            <div class="hidden md:flex items-center gap-8 text-sm font-medium text-gray-600">
                <a href="#dashboard" class="hover:text-emerald-600 transition">Dashboard</a>
                <a href="#workflow" class="hover:text-emerald-600 transition">Alur Kerja</a>
                <a href="#features" class="hover:text-emerald-600 transition">Fitur Utama</a>
                <a href="#roles" class="hover:text-emerald-600 transition">Peran User</a>
                <a href="#" class="btn-primary text-white px-6 py-2.5 rounded-lg">Masuk Sistem</a>
            </div>

            <button class="md:hidden text-gray-600">
                <i data-lucide="menu"></i>
            </button>
        </div>
    </nav>

    <!-- Hero Section -->
    <section id="dashboard" class="pt-40 pb-20 px-6">
        <div class="max-w-7xl mx-auto grid md:grid-cols-2 gap-12 items-center">
            <div>
                <span class="inline-block py-1 px-3 rounded-full bg-emerald-100 text-emerald-700 text-xs font-bold mb-4">LOGISTIK TERUKUR & TRANSPARAN</span>
                <h1 class="text-5xl md:text-6xl font-extrabold text-gray-900 leading-[1.1] mb-6">
                    Setiap Porsi, <br>
                    <span class="text-[#10B981]">Tepat Waktu,</span> <br>
                    Tepat Kualitas.
                </h1>
                <p class="text-lg text-gray-600 mb-8 max-w-lg leading-relaxed">
                    Sistem Manajemen Distribusi MBG memastikan program makanan bergizi tepat jumlah dan memenuhi standar kesehatan melalui validasi data real-time.
                </p>
                <div class="flex flex-wrap gap-4">
                    <a href="#dashboard" class="btn-primary text-white px-8 py-4 rounded-lg font-bold">Pantau Distribusi</a>
                    <a href="#" class="glass px-8 py-4 rounded-lg font-bold border border-gray-200 hover:bg-white transition">Pelajari Alur</a>
                </div>
            </div>
            <div class="relative">
                <div class="glass p-6 rounded-2xl shadow-2xl relative z-10">
                    <div class="flex justify-between items-center mb-6">
                        <h3 class="font-bold">Live Status Delivery</h3>
                        <span class="flex items-center gap-2 text-xs text-emerald-600 font-bold">
                            <span class="w-2 h-2 bg-emerald-500 rounded-full animate-pulse"></span>
                            Updating Live
                        </span>
                    </div>
                    <div class="space-y-4">
                        <div class="flex items-center justify-between p-4 bg-gray-50 rounded-xl border border-gray-100">
                            <div class="flex gap-3 items-center">
                                <div class="w-10 h-10 bg-emerald-500/10 rounded-lg flex items-center justify-center text-emerald-600">
                                    <i data-lucide="map-pin" class="w-5 h-5"></i>
                                </div>
                                <div>
                                    <p class="text-sm font-bold">SDN 01 Menteng</p>
                                    <p class="text-xs text-gray-500">Armada B-2930-XYZ</p>
                                </div>
                            </div>
                            <span class="status-badge bg-emerald-100 text-emerald-700">En Route</span>
                        </div>
                        <div class="flex items-center justify-between p-4 bg-gray-50 rounded-xl border border-gray-100">
                            <div class="flex gap-3 items-center">
                                <div class="w-10 h-10 bg-emerald-500/10 rounded-lg flex items-center justify-center text-emerald-600">
                                    <i data-lucide="check-circle" class="w-5 h-5"></i>
                                </div>
                                <div>
                                    <p class="text-sm font-bold">SMPN 04 Jakarta</p>
                                    <p class="text-xs text-gray-500">240 Porsi Terverifikasi</p>
                                </div>
                            </div>
                            <span class="status-badge bg-emerald-100 text-emerald-700">Delivered</span>
                        </div>
                    </div>
                </div>
                <div class="absolute -top-4 -right-4 w-32 h-32 bg-emerald-200 rounded-full mix-blend-multiply filter blur-xl opacity-70"></div>
                <div class="absolute -bottom-8 -left-8 w-48 h-48 bg-emerald-100 rounded-full mix-blend-multiply filter blur-2xl opacity-50"></div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="py-12 bg-white/40 backdrop-blur-sm border-y border-gray-100">
        <div class="max-w-7xl mx-auto px-6">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-8">
                <div class="text-center">
                    <p class="text-3xl font-extrabold text-[#10B981]">12.4K+</p>
                    <p class="text-sm font-medium text-gray-500 uppercase tracking-wider">Porsi Terdistribusi</p>
                </div>
                <div class="text-center border-l border-gray-100">
                    <p class="text-3xl font-extrabold text-gray-900">98.2%</p>
                    <p class="text-sm font-medium text-gray-500 uppercase tracking-wider">On-Time Delivery</p>
                </div>
                <div class="text-center border-l border-gray-100">
                    <p class="text-3xl font-extrabold text-emerald-500">4.9/5</p>
                    <p class="text-sm font-medium text-gray-500 uppercase tracking-wider">Rating Kualitas</p>
                </div>
                <div class="text-center border-l border-gray-100">
                    <p class="text-3xl font-extrabold text-gray-900">42</p>
                    <p class="text-sm font-medium text-gray-500 uppercase tracking-wider">Dapur Terintegrasi</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Alur Kerja -->
    <section id="workflow" class="py-24 px-6">
        <div class="max-w-7xl mx-auto">
            <div class="text-center mb-16">
                <h2 class="text-3xl font-bold mb-4">Satu Ekosistem, Transparansi Penuh</h2>
                <p class="text-gray-600 max-w-2xl mx-auto">Menghubungkan Dapur Pusat, Armada, dan Sekolah dalam satu aliran data yang dapat diaudit setiap saat.</p>
            </div>
            
            <div class="grid md:grid-cols-3 gap-12 text-center">
                <div class="relative flex flex-col items-center">
                    <div class="w-16 h-16 bg-white shadow-xl rounded-2xl flex items-center justify-center text-[#10B981] mb-6 step-line">
                        <i data-lucide="chef-hat" class="w-8 h-8"></i>
                    </div>
                    <h4 class="font-bold mb-2">1. Dapur Pusat</h4>
                    <p class="text-sm text-gray-500">Pencatatan produksi harian dan log keberangkatan armada secara digital.</p>
                </div>
                <div class="relative flex flex-col items-center">
                    <div class="w-16 h-16 bg-white shadow-xl rounded-2xl flex items-center justify-center text-[#10B981] mb-6 step-line">
                        <i data-lucide="truck" class="w-8 h-8"></i>
                    </div>
                    <h4 class="font-bold mb-2">2. Distribusi Real-time</h4>
                    <p class="text-sm text-gray-500">Pemantauan armada menuju titik sekolah dengan estimasi kedatangan akurat.</p>
                </div>
                <div class="relative flex flex-col items-center">
                    <div class="w-16 h-16 bg-white shadow-xl rounded-2xl flex items-center justify-center text-emerald-600 mb-6">
                        <i data-lucide="school" class="w-8 h-8"></i>
                    </div>
                    <h4 class="font-bold mb-2">3. Validasi Sekolah</h4>
                    <p class="text-sm text-gray-500">Konfirmasi penerimaan via mobile dengan bukti foto dan penilaian kualitas.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Mobile Confirmation Spotlight -->
    <section id="features" class="py-24 px-6 bg-[#111827] text-white overflow-hidden">
        <div class="max-w-7xl mx-auto grid md:grid-cols-2 gap-16 items-center">
            <div class="order-2 md:order-1 relative">
                <!-- Mockup Smartphone -->
                <div class="w-[280px] h-[560px] bg-gray-800 rounded-[40px] border-8 border-gray-700 mx-auto overflow-hidden relative shadow-2xl">
                    <div class="bg-white h-full p-4 flex flex-col">
                        <div class="flex justify-between items-center mb-4 mt-2">
                            <span class="text-xs font-bold text-gray-400">09:41</span>
                            <div class="w-16 h-4 bg-gray-100 rounded-full"></div>
                        </div>
                        <h5 class="text-gray-900 font-bold text-sm mb-4">Konfirmasi Penerimaan</h5>
                        <div class="bg-emerald-50 p-3 rounded-lg border border-emerald-100 mb-4">
                            <p class="text-[10px] text-emerald-600 font-bold uppercase mb-1">DATA PENGIRIMAN</p>
                            <p class="text-xs text-gray-900 font-bold">240 Porsi - Nasi Ayam Suwir</p>
                        </div>
                        <div class="flex-1 border-2 border-dashed border-gray-200 rounded-lg flex flex-col items-center justify-center mb-4">
                            <i data-lucide="camera" class="text-gray-300 mb-2"></i>
                            <p class="text-[10px] text-gray-400">Klik untuk Ambil Foto</p>
                        </div>
                        <div class="grid grid-cols-3 gap-2 mb-4">
                            <div class="text-center p-2 rounded bg-emerald-100 border border-emerald-200">
                                <p class="text-[8px] font-bold text-emerald-700">LAYAK</p>
                            </div>
                            <div class="text-center p-2 rounded bg-gray-50 border border-gray-100">
                                <p class="text-[8px] font-bold text-gray-400">KURANG</p>
                            </div>
                            <div class="text-center p-2 rounded bg-gray-50 border border-gray-100">
                                <p class="text-[8px] font-bold text-gray-400">TIDAK</p>
                            </div>
                        </div>
                        <button class="w-full bg-emerald-600 text-white py-3 rounded-lg text-xs font-bold">Konfirmasi Sekarang</button>
                    </div>
                </div>
                <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[500px] h-[500px] bg-emerald-500/20 rounded-full blur-[100px] -z-10"></div>
            </div>
            <div class="order-1 md:order-2">
                <h2 class="text-4xl font-bold mb-6">Validasi Lapangan <br><span class="text-[#10B981]">Tanpa Celah.</span></h2>
                <div class="space-y-8">
                    <div class="flex gap-4">
                        <div class="w-12 h-12 rounded-xl bg-emerald-500/10 flex items-center justify-center text-[#10B981] shrink-0">
                            <i data-lucide="camera"></i>
                        </div>
                        <div>
                            <h4 class="font-bold text-xl mb-2">Validasi Kamera</h4>
                            <p class="text-gray-400">Setiap penerimaan wajib menyertakan foto bukti porsi makanan langsung dari lokasi.</p>
                        </div>
                    </div>
                    <div class="flex gap-4">
                        <div class="w-12 h-12 rounded-xl bg-emerald-500/10 flex items-center justify-center text-emerald-500 shrink-0">
                            <i data-lucide="clipboard-check"></i>
                        </div>
                        <div>
                            <h4 class="font-bold text-xl mb-2">Penilaian Kualitas Instan</h4>
                            <p class="text-gray-400">Input kategori kelayakan untuk memastikan gizi yang diterima siswa sesuai standar.</p>
                        </div>
                    </div>
                    <div class="flex gap-4">
                        <div class="w-12 h-12 rounded-xl bg-rose-500/10 flex items-center justify-center text-rose-500 shrink-0">
                            <i data-lucide="alert-triangle"></i>
                        </div>
                        <div>
                            <h4 class="font-bold text-xl mb-2">Sistem Alert Otomatis</h4>
                            <p class="text-gray-400">Notifikasi langsung ke Admin Audit jika terdapat temuan porsi "Tidak Layak".</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Roles Section -->
    <section id="roles" class="py-24 px-6">
        <div class="max-w-7xl mx-auto">
            <div class="text-center mb-16">
                <h2 class="text-3xl font-bold mb-4">Siapa yang Menggunakan Sistem?</h2>
                <p class="text-gray-600">Hak akses yang dirancang khusus untuk setiap tanggung jawab.</p>
            </div>
            
            <div class="grid md:grid-cols-3 gap-8">
                <div class="glass p-8 rounded-2xl border border-gray-100 card-hover">
                    <div class="w-14 h-14 bg-emerald-50 rounded-xl flex items-center justify-center text-emerald-600 mb-6">
                        <i data-lucide="users"></i>
                    </div>
                    <h4 class="text-xl font-bold mb-4">Admin Dapur</h4>
                    <ul class="space-y-3 text-sm text-gray-600 mb-8">
                        <li class="flex items-center gap-2"><i data-lucide="check" class="w-4 h-4 text-emerald-500"></i> Kelola Jadwal Harian</li>
                        <li class="flex items-center gap-2"><i data-lucide="check" class="w-4 h-4 text-emerald-500"></i> Input Data Armada</li>
                        <li class="flex items-center gap-2"><i data-lucide="check" class="w-4 h-4 text-emerald-500"></i> Monitor Status Delivery</li>
                    </ul>
                    <a href="#" class="text-[#10B981] font-bold text-sm flex items-center gap-1 hover:gap-2 transition-all">Lihat Dashboard <i data-lucide="arrow-right" class="w-4 h-4"></i></a>
                </div>
                
                <div class="glass p-8 rounded-2xl border-2 border-emerald-500/20 shadow-xl card-hover relative">
                    <span class="absolute top-0 right-8 -translate-y-1/2 bg-emerald-600 text-white text-[10px] font-bold px-3 py-1 rounded-full uppercase">Priority</span>
                    <div class="w-14 h-14 bg-emerald-600 rounded-xl flex items-center justify-center text-white mb-6">
                        <i data-lucide="user-check"></i>
                    </div>
                    <h4 class="text-xl font-bold mb-4">Petugas Sekolah</h4>
                    <ul class="space-y-3 text-sm text-gray-600 mb-8">
                        <li class="flex items-center gap-2"><i data-lucide="check" class="w-4 h-4 text-emerald-500"></i> Konfirmasi Real-time</li>
                        <li class="flex items-center gap-2"><i data-lucide="check" class="w-4 h-4 text-emerald-500"></i> Upload Bukti Foto</li>
                        <li class="flex items-center gap-2"><i data-lucide="check" class="w-4 h-4 text-emerald-500"></i> Feedback Kualitas</li>
                    </ul>
                    <a href="#" class="text-[#10B981] font-bold text-sm flex items-center gap-1 hover:gap-2 transition-all">Login Mobile Web <i data-lucide="arrow-right" class="w-4 h-4"></i></a>
                </div>

                <div class="glass p-8 rounded-2xl border border-gray-100 card-hover">
                    <div class="w-14 h-14 bg-emerald-50 rounded-xl flex items-center justify-center text-emerald-600 mb-6">
                        <i data-lucide="shield-check"></i>
                    </div>
                    <h4 class="text-xl font-bold mb-4">Admin Audit</h4>
                    <ul class="space-y-3 text-sm text-gray-600 mb-8">
                        <li class="flex items-center gap-2"><i data-lucide="check" class="w-4 h-4 text-emerald-500"></i> Laporan KPI Bulanan</li>
                        <li class="flex items-center gap-2"><i data-lucide="check" class="w-4 h-4 text-emerald-500"></i> Rekonsiliasi Data</li>
                        <li class="flex items-center gap-2"><i data-lucide="check" class="w-4 h-4 text-emerald-500"></i> Manajemen Hak Akses</li>
                    </ul>
                    <a href="#" class="text-[#10B981] font-bold text-sm flex items-center gap-1 hover:gap-2 transition-all">Portal Laporan <i data-lucide="arrow-right" class="w-4 h-4"></i></a>
                </div>
            </div>
        </div>
    </section>
<!-- Developers Section -->
    <section id="developers" class="py-24 px-6 bg-emerald-50/30">
        <div class="max-w-7xl mx-auto">
            <div class="text-center mb-16">
                <span class="text-[#10B981] font-bold text-sm uppercase tracking-widest">The Brains Behind NutriLog</span>
                <h2 class="text-3xl font-bold mt-2">Anggota Pengembang</h2>
                <div class="w-20 h-1 bg-[#10B981] mx-auto mt-4 rounded-full"></div>
            </div>
            
            <div class="grid grid-cols-2 md:grid-cols-5 gap-6">
                <!-- Developer 1 -->
                <div class="text-center group">
                    <div class="relative w-32 h-32 mx-auto mb-4">
                        <div class="absolute inset-0 bg-emerald-200 rounded-full scale-0 group-hover:scale-110 transition duration-300"></div>
                        <div class="relative w-full h-full bg-white rounded-full border-2 border-emerald-500 flex items-center justify-center overflow-hidden">
                            <i data-lucide="user" class="w-16 h-16 text-emerald-600 opacity-20"></i>
                            <!-- Placeholder for Image -->
                        </div>
                    </div>
                    <h5 class="font-bold text-gray-900">Faisa Al Farrel</h5>
                    <p class="text-xs font-medium uppercase">0110224149</p>
                    <p class="text-xs text-emerald-600 font-medium uppercase tracking-tighter">BackEnd</p>
                </div>
                
                <!-- Developer 2 -->
                <div class="text-center group">
                    <div class="relative w-32 h-32 mx-auto mb-4">
                        <div class="absolute inset-0 bg-emerald-200 rounded-full scale-0 group-hover:scale-110 transition duration-300"></div>
                        <div class="relative w-full h-full bg-white rounded-full border-2 border-emerald-500 flex items-center justify-center overflow-hidden">
                            <i data-lucide="user" class="w-16 h-16 text-emerald-600 opacity-20"></i>
                        </div>
                    </div>
                    <h5 class="font-bold text-gray-900">Muhammad Jibril Ibrahim</h5>
                    <p class="text-xs font-medium uppercase">0110224002</p>
                    <p class="text-xs text-emerald-600 font-medium uppercase tracking-tighter">BackEnd</p>
                </div>

                <!-- Developer 3 -->
                <div class="text-center group">
                    <div class="relative w-32 h-32 mx-auto mb-4">
                        <div class="absolute inset-0 bg-emerald-200 rounded-full scale-0 group-hover:scale-110 transition duration-300"></div>
                        <div class="relative w-full h-full bg-white rounded-full border-2 border-emerald-500 flex items-center justify-center overflow-hidden">
                            <i data-lucide="user" class="w-16 h-16 text-emerald-600 opacity-20"></i>
                        </div>
                    </div>
                    <h5 class="font-bold text-gray-900">Tri Nurjulyanti</h5>
                    <p class="text-xs font-medium uppercase">0110224194</p>
                    <p class="text-xs text-emerald-600 font-medium uppercase tracking-tighter">Documentation </p>
                </div>

                <!-- Developer 4 -->
                <div class="text-center group">
                    <div class="relative w-32 h-32 mx-auto mb-4">
                        <div class="absolute inset-0 bg-emerald-200 rounded-full scale-0 group-hover:scale-110 transition duration-300"></div>
                        <div class="relative w-full h-full bg-white rounded-full border-2 border-emerald-500 flex items-center justify-center overflow-hidden">
                            <i data-lucide="user" class="w-16 h-16 text-emerald-600 opacity-20"></i>
                        </div>
                    </div>
                    <h5 class="font-bold text-gray-900">Fi'Adn Fauzul Azzim</h5>
                    <p class="text-xs font-medium uppercase">0110224121</p>
                    <p class="text-xs text-emerald-600 font-medium uppercase tracking-tighter">FrontEnd</p>
                </div>

                <!-- Developer 5 -->
                <div class="text-center group">
                    <div class="relative w-32 h-32 mx-auto mb-4">
                        <div class="absolute inset-0 bg-emerald-200 rounded-full scale-0 group-hover:scale-110 transition duration-300"></div>
                        <div class="relative w-full h-full bg-white rounded-full border-2 border-emerald-500 flex items-center justify-center overflow-hidden">
                            <i data-lucide="user" class="w-16 h-16 text-emerald-600 opacity-20"></i>
                        </div>
                    </div>
                    <h5 class="font-bold text-gray-900">Azzam Firdaus</h5>
                    <p class="text-xs font-medium uppercase">0110224121</p>
                    <p class="text-xs text-emerald-600 font-medium uppercase tracking-tighter">FrontEnd</p>
                </div>
            </div>
        </div>
    </section>
    <!-- Footer -->
    <footer class="bg-white py-16 px-6 border-t border-gray-100">
        <div class="max-w-7xl mx-auto flex flex-col md:flex-row justify-between items-center gap-8">
            <div>
                <div class="flex items-center gap-2 mb-4">
                    <div class="w-8 h-8 bg-emerald-600 rounded flex items-center justify-center text-white">
                        <i data-lucide="truck" class="w-4 h-4"></i>
                    </div>
                    <span class="text-lg font-bold">NutriLog</span>
                </div>
                <p class="text-sm text-gray-500 max-w-xs">Solusi digital untuk akuntabilitas program makanan bergizi di seluruh Indonesia.</p>
            </div>
            
            <div class="flex gap-12">
                <div>
                    <h5 class="font-bold text-sm mb-4 uppercase text-gray-400">Legal</h5>
                    <ul class="text-sm text-gray-600 space-y-2">
                        <li><a href="#" class="hover:text-emerald-600">Privacy Policy</a></li>
                        <li><a href="#" class="hover:text-emerald-600">Terms of Service</a></li>
                    </ul>
                </div>
                <div>
                    <h5 class="font-bold text-sm mb-4 uppercase text-gray-400">Kontak</h5>
                    <ul class="text-sm text-gray-600 space-y-2">
                        <li>support@nutrilog.id</li>
                        <li>(+62) 882-0025-19272</li>
                </div>
            </div>
        </div>
        <div class="max-w-7xl mx-auto mt-16 pt-8 border-t border-gray-50 text-center text-xs text-gray-400">
            &copy; 2026 NutriLog | MBG Distribution Management System. All Rights Reserved.
        </div>
    </footer>

    <script>
        // Initialize Lucide Icons
        lucide.createIcons();

        // Smooth Scroll
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>