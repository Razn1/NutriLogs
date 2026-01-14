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
                    <i class="fa-solid fa-building-columns"></i>
                </div>
                <div>
                    <h5 class="fw-bold mb-0">Data Sekolah</h5>
                    <p class="text-muted small mb-0">Semua Data Sekolah</p>
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
                        <th class="text-black text-solid">ID</th>
                        <th class="text-black">Nama Sekolah</th>
                        <th class="text-black">Alamat</th>
                        <th class="text-black">Jumlah Siswa</th>
                        <th class="text-black">Status</th>
                        <th class="text-black">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${dataSekolah}">
                        <tr>
                            <td class="text-muted fw-bold">${s.id}</td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <span class="fw-bold text-dark">${s.nama}</span>
                                </div>
                            </td>
                            <td><span class="text-secondary small">${s.alamat}</span></td>
                            <td>
                                <span class="badge badge-soft-info rounded-pill">${s.jumlahSiswa} Siswa</span>
                            </td>
                            <td>
                                <span class="badge badge-soft-success rounded-pill">Aktif</span>
                            </td>
                            <td>
                                <div class="d-flex-gap">
                                    <a href="editSchool?id=${s.id}" class="btn-action btn-edit" title="Edit Data">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>

                                    <a href="deleteSchool?id=${s.id}" 
                                       class="btn-action btn-delete" 
                                       title="Hapus Data"
                                       onclick="return confirm('Apakah Anda yakin ingin menghapus sekolah ${s.nama}?')">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty dataSekolah}">
                        <tr>
                            <td colspan="5" class="text-center text-muted py-5">
                                <i class="fa-solid fa-folder-open d-block mb-2 fs-3"></i>
                                Tidak ada data sekolah ditemukan.
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>