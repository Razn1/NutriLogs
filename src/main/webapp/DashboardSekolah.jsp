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

    <!-- Styling tambahan agar mirip tampilan contoh -->
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
        .card-stat {
            border: none;
            border-radius: 16px;
            background: #ffffff;
            box-shadow: 0 8px 24px rgba(31,41,55,0.08);
        }
        .card-stat .card-title {
            font-weight: 600;
            color: #374151;
        }
        .card-stat .card-value {
            font-size: 36px;
            font-weight: 700;
            color: #111827;
        }
        .headline {
            font-weight: 800;
            letter-spacing: -0.5px;
        }
        .subheadline {
            color: #6b7280;
        }
        .alert-custom {
            border-radius: 14px;
            background: #eff6ff; /* biru muda */
            border: 1px solid #bfdbfe;
            color: #1e3a8a;
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
        .badge-soft {
            background: #f3f4f6;
            color: #111827;
            border: 1px solid #e5e7eb;
            border-radius: 999px;
            padding: 6px 12px;
            font-weight: 600;
        }
    </style>
</head>
<body>
<div class="page-wrap">

    <!-- Header -->
    <div class="text-text-align: left;
 mb-4">
        <h1 class="headline mb-1">Selamat Datang</h1>
        <p class="subheadline"><%= tanggal %></p>
    </div>

    <!-- Status ringkas -->
    <div class="row g-4 mb-4">
        <div class="col-12 col-md-6">
            <div class="card card-stat">
                <div class="card-body text-center">
                    <div class="card-title mb-1">Menunggu</div>
                    <div class="card-value"><%= menunggu %></div>
                    <div class="mt-2">
                        <span class="badge-soft">Status: Menunggu konfirmasi</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-6">
            <div class="card card-stat">
                <div class="card-body text-center">
                    <div class="card-title mb-1">Diterima</div>
                    <div class="card-value"><%= diterima %></div>
                    <div class="mt-2">
                        <span class="badge-soft">Status: Sudah di sekolah</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Alert pengiriman dalam perjalanan -->
    <div class="alert alert-custom d-flex align-items-center justify-content-between mb-3" role="alert">
        <div>
            <strong>Pengiriman Dalam Perjalanan!</strong>
            <div class="small mt-1"><%= dalamPerjalanan %> pengiriman sedang menuju sekolah Anda</div>
        </div>
        <div>
            <span class="badge-soft">Realtime update</span>
        </div>
    </div>

    <!-- Section konfirmasi -->
    <div class="confirm-section mt-4">
        <div class="d-flex flex-column flex-md-row align-items-md-center justify-content-between">
            <div class="mb-3 mb-md-0">
                <h5 class="mb-1">Konfirmasi</h5>
                <p class="text-muted mb-0">Silakan konfirmasi pengiriman yang sudah diterima untuk pembaruan status.</p>
            </div>
            <form method="post" action="konfirmasi">
                <!-- Contoh: kirim nilai konfirmasi (dummy). Ganti dengan id pengiriman nyata. -->
                <input type="hidden" name="aksi" value="konfirmasi-semua"/>
                <button type="submit" class="btn btn-success btn-confirm">
                    Konfirmasi
                </button>
            </form>
        </div>
    </div>

</div>

<!-- Section: Pengiriman Hari Ini -->
<style>
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
        border-radius: 10px;
        padding: 10px 18px;
        font-weight: 600;
    }
</style>

<div class="page-wrap">
    <h4 class="fw-bold mb-3">Pengiriman Hari Ini</h4>
    <p class="text-muted mb-4">Daftar pengiriman untuk sekolah Anda</p>

    <!-- Card Pengiriman 1 -->
    <div class="card card-delivery">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <div>
                    <h6>Dapur Pusat Jakarta Selatan</h6>
                    <small>Box Truck 03</small>
                </div>
                <span class="badge bg-success badge-status">Diterima</span>
            </div>
            <div class="row mb-2">
                <div class="col-6">
                    <strong>500 porsi</strong>
                </div>
                <div class="col-6 text-end">
                    <small>Kirim: 23.30</small><br>
                    <small>Diterima: 23.32</small>
                </div>
            </div>
            <span class="text-success fw-semibold">Sangat baik</span>
        </div>
    </div>

    <!-- Card Pengiriman 2 -->
    <div class="card card-delivery">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <div>
                    <h6>Dapur Pusat Jakarta Selatan</h6>
                    <small>Box Truck 03</small>
                </div>
                <span class="badge bg-warning text-dark badge-status">Dikirim</span>
            </div>
            <div class="row mb-2">
                <div class="col-6">
                    <strong>500 porsi</strong>
                </div>
                <div class="col-6 text-end">
                    <small>Kirim: 21.33</small>
                </div>
            </div>
        </div>
    </div>

    <!-- Tombol Konfirmasi -->
    <div class="text-end mt-4">
        <form method="post" action="konfirmasi-penerimaan">
            <button type="submit" class="btn btn-success btn-confirm">
                Konfirmasi Penerimaan
            </button>
        </form>
    </div>
</div>
        
<!-- Optional: interaksi ringan -->
<script>
    // Placeholder untuk simulasi update (opsional)
    // Misal: fetch ke endpoint untuk update jumlah pengiriman realtime.
    // fetch('/api/pengiriman/status').then(...);
</script>
</body>
</html>