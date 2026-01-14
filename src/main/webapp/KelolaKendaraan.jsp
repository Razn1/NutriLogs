<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .custom-card-container {
        background: #ffffff;
        border-radius: 16px;
        border: 1px solid #edf2f7;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        padding: 24px;
        margin-bottom: 30px;
    }

    .card-header-custom {
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 20px;
    }

    .icon-circle {
        width: 40px;
        height: 40px;
        background: #f0fff4;
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #38a169;
    }

    .table {
        border-collapse: separate;
        border-spacing: 0 8px;
    }

    .table thead th {
        border: none;
        color: #718096;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.75rem;
        letter-spacing: 0.025em;
        padding-bottom: 15px;
    }

    .table tbody tr {
        transition: transform 0.2s;
    }

    .table tbody td {
        background: #ffffff;
        border-top: 1px solid #f7fafc;
        border-bottom: 1px solid #f7fafc;
        padding: 16px;
    }

    .table tbody td:first-child {
        border-left: 1px solid #f7fafc;
        border-radius: 12px 0 0 12px;
    }
    .table tbody td:last-child {
        border-right: 1px solid #f7fafc;
        border-radius: 0 12px 12px 0;
    }

    .badge-soft-info {
        background-color: #e3f2fd;
        color: #1976d2;
        font-weight: 500;
        padding: 6px 12px;
    }

    .badge-soft-success {
        background-color: #f0fff4;
        color: #38a169;
        border: 1px solid #c6f6d5;
        padding: 6px 12px;
    }

    .table thead th {
        font-weight: 800 !important; /* Membuat teks sangat tebal */
        color: #1a202c !important;   /* Warna hitam pekat profesional */
        font-size: 0.95rem;          /* Ukuran sedikit lebih besar agar terbaca jelas */
        border-bottom: 2px solid #edf2f7; /* Garis bawah halus untuk pemisah */
        letter-spacing: 0.01em;      /* Spasi antar huruf agar lebih bersih */
        padding-bottom: 15px;        /* Jarak ke isi tabel */
        text-transform: none;        /* Menghilangkan uppercase jika ada */
    }

    /* Gaya untuk Tombol Aksi */
    .btn-action {
        width: 32px;
        height: 32px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 8px;
        transition: all 0.2s;
        border: none;
        text-decoration: none;
    }

    .btn-edit {
        background-color: #ebf8ff;
        color: #3182ce;
    }

    .btn-edit:hover {
        background-color: #3182ce;
        color: #ffffff;
    }

    .btn-delete {
        background-color: #fff5f5;
        color: #e53e3e;
    }

    .btn-delete:hover {
        background-color: #e53e3e;
        color: #ffffff;
    }

    .d-flex-gap {
        display: flex;
        gap: 8px;
    }

    /* Gaya untuk Tombol Tambah Sekolah */
    .btn-tambah {
        background-color: #38a169;
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 10px;
        font-weight: 600;
        font-size: 0.875rem;
        display: inline-flex;
        align-items: center;
        gap: 8px;
        transition: all 0.2s;
        text-decoration: none;
    }

    .btn-tambah:hover {
        background-color: #2f855a;
        color: white;
        transform: translateY(-1px);
        box-shadow: 0 4px 12px rgba(56, 161, 105, 0.2);
    }

</style>

<div class="page-wrap p-4"> 
    <div class="custom-card-container"> 
        <div class="card-header-custom d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center gap-3">
                <div class="icon-circle">
                    <i class="fa-solid fa-truck-fast"></i>
                </div>
                <div>
                    <h5 class="fw-bold mb-0">Data Kendaraan</h5>
                    <p class="text-muted small mb-0">Semua Data Kendaraan</p>
                </div>
            </div>

            <a href="addSchool.jsp" class="btn-tambah shadow-sm">
                <i class="fa-solid fa-plus"></i>
                <span>Tambah Sekolah</span>
            </a>
        </div>

        <div class="table-responsive">
            <table class="table align-middle">
                <thead>
                    <tr>
                        <th class="text-black">ID</th>
                        <th class="text-black">Nama Kendaraan</th>
                        <th class="text-black">Plat Nomor</th>
                        <th class="text-black">Jenis Kendaraan</th>
                        <th class="text-black">Kapasitas (Porsi)</th>
                        <th class="text-black">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="v" items="${dataKendaraan}">
                        <tr>
                            <td class="text-muted fw-bold">${v.id}</td>
                            <td>
                                <span class="fw-bold text-dark">${v.namaKendaraan}</span>
                            </td>
                            <td>
                                <span class="fw-bold text-dark">${v.platNomor}</span>
                            </td>
                            <td>
                                <span class="text-secondary small">${v.jenisKendaraan}</span>
                            </td>
                            <td>
                                <span class="badge badge-soft-info rounded-pill">${v.kapasitas} Porsi</span>
                            </td>
                            <td>
                                <div class="d-flex-gap">
                                    <a href="editVehicle?id=${v.id}" class="btn-action btn-edit">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                    <a href="deleteVehicle?id=${v.id}" class="btn-action btn-delete" 
                                       onclick="return confirm('Hapus ${v.namaKendaraan}?')">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty dataKendaraan}">
                        <tr>
                            <td colspan="6" class="text-center py-5 text-muted">
                                <i class="fa-solid fa-folder-open d-block mb-2 fs-3"></i>
                                Tidak ada data kendaraan di tabel 'vehicles'.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>