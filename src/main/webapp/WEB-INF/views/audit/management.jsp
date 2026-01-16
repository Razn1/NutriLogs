<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="model.School" %>
            <%@ page import="model.Vehicle" %>
                <!DOCTYPE html>
                <html lang="id">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>NutriLog - Kelola Data</title>
                    <%@ include file="../header.jspf" %>
                </head>

                <body class="bg-light min-vh-100">
                    <%@ include file="../navbar.jspf" %>

                        <main class="container py-5 d-flex flex-column gap-5">

                            <!-- Header -->
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <h1 class="h2 fw-bold mb-1">Kelola Data</h1>
                                    <p class="text-secondary mb-0">Manajemen Sekolah dan Kendaraan</p>
                                </div>
                                <a href="<%= request.getContextPath()%>/audit/dashboard"
                                    class="btn btn-outline-secondary">
                                    <i class="bi bi-arrow-left me-2"></i>Kembali ke Dashboard
                                </a>
                            </div>

                            <!-- Schools Section -->
                            <div class="card border-light shadow-sm rounded-4">
                                <div
                                    class="card-header bg-white border-bottom-0 pt-4 px-4 pb-0 d-flex justify-content-between align-items-center">
                                    <h3 class="h5 fw-bold mb-0 d-flex align-items-center gap-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round" class="text-primary">
                                            <path d="M3 21h18" />
                                            <path d="M5 21V7l8-4 8 4v14" />
                                            <path d="M17 21v-8H7v8" />
                                        </svg>
                                        Daftar Sekolah
                                    </h3>
                                    <button class="btn btn-primary-custom btn-sm d-inline-flex align-items-center"
                                        data-bs-toggle="modal" data-bs-target="#addSchoolModal">
                                        <i class="bi bi-plus-lg me-2"></i>Tambah Sekolah
                                    </button>
                                </div>
                                <div class="card-body p-4">
                                    <div class="table-responsive">
                                        <table class="table table-hover align-middle">
                                            <thead class="table-light">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Nama Sekolah</th>
                                                    <th>Alamat</th>
                                                    <th>Jumlah Siswa</th>
                                                    <th class="text-end">Aksi</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% List<School> schools = (List<School>)
                                                        request.getAttribute("schools");
                                                        if (schools != null && !schools.isEmpty()) {
                                                        for (School s : schools) {%>
                                                        <tr>
                                                            <td>
                                                                <%= s.getId()%>
                                                            </td>
                                                            <td class="fw-medium">
                                                                <%= s.getNama()%>
                                                            </td>
                                                            <td>
                                                                <%= s.getAlamat()%>
                                                            </td>
                                                            <td>
                                                                <%= s.getJumlahSiswa()%>
                                                            </td>
                                                            <td class="text-end">
                                                                <button class="btn btn-sm btn-outline-primary me-1"
                                                                    onclick="editSchool('<%= s.getId()%>', '<%= s.getNama()%>', '<%= s.getAlamat()%>', '<%= s.getJumlahSiswa()%>')">
                                                                    Edit
                                                                </button>
                                                                <form
                                                                    action="<%= request.getContextPath()%>/audit/management"
                                                                    method="post" class="d-inline"
                                                                    onsubmit="return confirm('Hapus sekolah ini?')">
                                                                    <input type="hidden" name="action"
                                                                        value="deleteSchool">
                                                                    <input type="hidden" name="id"
                                                                        value="<%= s.getId()%>">
                                                                    <button type="submit"
                                                                        class="btn btn-sm btn-outline-danger">Hapus</button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                        <% } } else { %>
                                                            <tr>
                                                                <td colspan="5" class="text-center py-4 text-secondary">
                                                                    Belum ada data sekolah.</td>
                                                            </tr>
                                                            <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <!-- Vehicles Section -->
                            <div class="card border-light shadow-sm rounded-4">
                                <div
                                    class="card-header bg-white border-bottom-0 pt-4 px-4 pb-0 d-flex justify-content-between align-items-center">
                                    <h3 class="h5 fw-bold mb-0 d-flex align-items-center gap-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round" class="text-warning">
                                            <rect width="16" height="13" x="1" y="6" rx="2" />
                                            <polygon points="17 6 23 11 23 19 17 19" />
                                            <circle cx="5.5" cy="18.5" r="2.5" />
                                            <circle cx="18.5" cy="18.5" r="2.5" />
                                        </svg>
                                        Daftar Kendaraan
                                    </h3>
                                    <button class="btn btn-primary-custom btn-sm d-inline-flex align-items-center"
                                        data-bs-toggle="modal" data-bs-target="#addVehicleModal">
                                        <i class="bi bi-plus-lg me-2"></i>Tambah Kendaraan
                                    </button>
                                </div>
                                <div class="card-body p-4">
                                    <div class="table-responsive">
                                        <table class="table table-hover align-middle">
                                            <thead class="table-light">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Nama Kendaraan</th>
                                                    <th>Jenis</th>
                                                    <th>Plat Nomor</th>
                                                    <th>Kapasitas</th>
                                                    <th class="text-end">Aksi</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% List<Vehicle> vehicles = (List<Vehicle>)
                                                        request.getAttribute("vehicles");
                                                        if (vehicles != null && !vehicles.isEmpty()) {
                                                        for (Vehicle v : vehicles) {%>
                                                        <tr>
                                                            <td>
                                                                <%= v.getId()%>
                                                            </td>
                                                            <td class="fw-medium">
                                                                <%= v.getNamaKendaraan()%>
                                                            </td>
                                                            <td>
                                                                <%= v.getJenisKendaraan()%>
                                                            </td>
                                                            <td><span class="badge bg-light text-dark border">
                                                                    <%= v.getPlatNomor()%>
                                                                </span></td>
                                                            <td>
                                                                <%= v.getKapasitas()%>
                                                            </td>
                                                            <td class="text-end">
                                                                <button class="btn btn-sm btn-outline-primary me-1"
                                                                    onclick="editVehicle('<%= v.getId()%>', '<%= v.getNamaKendaraan()%>', '<%= v.getJenisKendaraan()%>', '<%= v.getPlatNomor()%>', '<%= v.getKapasitas()%>')">
                                                                    Edit
                                                                </button>
                                                                <form
                                                                    action="<%= request.getContextPath()%>/audit/management"
                                                                    method="post" class="d-inline"
                                                                    onsubmit="return confirm('Hapus kendaraan ini?')">
                                                                    <input type="hidden" name="action"
                                                                        value="deleteVehicle">
                                                                    <input type="hidden" name="id"
                                                                        value="<%= v.getId()%>">
                                                                    <button type="submit"
                                                                        class="btn btn-sm btn-outline-danger">Hapus</button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                        <% } } else { %>
                                                            <tr>
                                                                <td colspan="6" class="text-center py-4 text-secondary">
                                                                    Belum ada data kendaraan.</td>
                                                            </tr>
                                                            <% }%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <!-- Users Section -->
                            <div class="card border-light shadow-sm rounded-4">
                                <div
                                    class="card-header bg-white border-bottom-0 pt-4 px-4 pb-0 d-flex justify-content-between align-items-center">
                                    <h3 class="h5 fw-bold mb-0 d-flex align-items-center gap-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round" class="text-success">
                                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="12" cy="7" r="4"></circle>
                                        </svg>
                                        Daftar Pengguna
                                    </h3>
                                    <button class="btn btn-primary-custom btn-sm d-inline-flex align-items-center"
                                        data-bs-toggle="modal" data-bs-target="#addUserModal">
                                        <i class="bi bi-plus-lg me-2"></i>Tambah Pengguna
                                    </button>
                                </div>
                                <div class="card-body p-4">
                                    <div class="table-responsive">
                                        <table class="table table-hover align-middle">
                                            <thead class="table-light">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Nama</th>
                                                    <th>Email</th>
                                                    <th>Role</th>
                                                    <th class="text-end">Aksi</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% List<model.User> users = (List<model.User>)
                                                        request.getAttribute("users");
                                                        if (users != null && !users.isEmpty()) {
                                                        for (model.User u : users) {%>
                                                        <tr>
                                                            <td>
                                                                <%= u.getId()%>
                                                            </td>
                                                            <td class="fw-medium">
                                                                <%= u.getNama()%>
                                                            </td>
                                                            <td>
                                                                <%= u.getEmail()%>
                                                            </td>
                                                            <td><span class="badge bg-light text-dark border">
                                                                    <%= u.getRole()%>
                                                                </span></td>
                                                            <td class="text-end">
                                                                <button class="btn btn-sm btn-outline-primary me-1"
                                                                    onclick="editUser('<%= u.getId()%>', '<%= u.getNama()%>', '<%= u.getEmail()%>', '<%= u.getRole()%>')">
                                                                    Edit
                                                                </button>
                                                                <form
                                                                    action="<%= request.getContextPath()%>/audit/management"
                                                                    method="post" class="d-inline"
                                                                    onsubmit="return confirm('Hapus pengguna ini?')">
                                                                    <input type="hidden" name="action"
                                                                        value="deleteUser">
                                                                    <input type="hidden" name="id"
                                                                        value="<%= u.getId()%>">
                                                                    <button type="submit"
                                                                        class="btn btn-sm btn-outline-danger">Hapus</button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                        <% } } else { %>
                                                            <tr>
                                                                <td colspan="5" class="text-center py-4 text-secondary">
                                                                    Belum ada data pengguna.</td>
                                                            </tr>
                                                            <% }%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </main>

                        <!-- Modals -->

                        <!-- Add School Modal -->
                        <div class="modal fade" id="addSchoolModal" tabindex="-1">
                            <div class="modal-dialog">
                                <form class="modal-content" action="<%= request.getContextPath()%>/audit/management"
                                    method="post">
                                    <input type="hidden" name="action" value="addSchool">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Tambah Sekolah</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label class="form-label">ID Sekolah</label>
                                            <input type="text" class="form-control" name="id" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Nama Sekolah</label>
                                            <input type="text" class="form-control" name="nama" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Alamat</label>
                                            <textarea class="form-control" name="alamat" rows="2" required></textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Jumlah Siswa</label>
                                            <input type="number" class="form-control" name="jumlahSiswa" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Batal</button>
                                        <button type="submit" class="btn btn-primary-custom">Simpan</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Edit School Modal -->
                        <div class="modal fade" id="editSchoolModal" tabindex="-1">
                            <div class="modal-dialog">
                                <form class="modal-content" action="<%= request.getContextPath()%>/audit/management"
                                    method="post">
                                    <input type="hidden" name="action" value="updateSchool">
                                    <input type="hidden" name="id" id="editSchoolId">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Edit Sekolah</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- ID displayed but not editable in this simple logic, or purely hidden if auto-inc -->
                                        <div class="mb-3">
                                            <label class="form-label">ID Sekolah</label>
                                            <input type="text" class="form-control" id="editSchoolIdInd" disabled>
                                            <small class="text-muted">ID tidak dapat diubah</small>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Nama Sekolah</label>
                                            <input type="text" class="form-control" name="nama" id="editSchoolName"
                                                required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Alamat</label>
                                            <textarea class="form-control" name="alamat" id="editSchoolAddress" rows="2"
                                                required></textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Jumlah Siswa</label>
                                            <input type="number" class="form-control" name="jumlahSiswa"
                                                id="editSchoolStudents" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Batal</button>
                                        <button type="submit" class="btn btn-primary-custom">Simpan Perubahan</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Add Vehicle Modal -->
                        <div class="modal fade" id="addVehicleModal" tabindex="-1">
                            <div class="modal-dialog">
                                <form class="modal-content" action="<%= request.getContextPath()%>/audit/management"
                                    method="post">
                                    <input type="hidden" name="action" value="addVehicle">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Tambah Kendaraan</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label class="form-label">ID Kendaraan</label>
                                            <input type="text" class="form-control" name="id" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Nama Kendaraan</label>
                                            <input type="text" class="form-control" name="namaKendaraan" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Jenis Kendaraan</label>
                                            <select class="form-select" name="jenisKendaraan" required>
                                                <option value="Mobil Box">Mobil Box</option>
                                                <option value="Pick Up">Pick Up</option>
                                                <option value="Motor">Motor</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Plat Nomor</label>
                                            <input type="text" class="form-control" name="platNomor" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Kapasitas (Porsi)</label>
                                            <input type="number" class="form-control" name="kapasitas" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Batal</button>
                                        <button type="submit" class="btn btn-primary-custom">Simpan</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Edit Vehicle Modal -->
                        <div class="modal fade" id="editVehicleModal" tabindex="-1">
                            <div class="modal-dialog">
                                <form class="modal-content" action="<%= request.getContextPath()%>/audit/management"
                                    method="post">
                                    <input type="hidden" name="action" value="updateVehicle">
                                    <input type="hidden" name="id" id="editVehicleId">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Edit Kendaraan</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label class="form-label">ID Kendaraan</label>
                                            <input type="text" class="form-control" id="editVehicleIdInd" disabled>
                                            <small class="text-muted">ID tidak dapat diubah</small>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Nama Kendaraan</label>
                                            <input type="text" class="form-control" name="namaKendaraan"
                                                id="editVehicleName" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Jenis Kendaraan</label>
                                            <select class="form-select" name="jenisKendaraan" id="editVehicleType"
                                                required>
                                                <option value="Mobil Box">Mobil Box</option>
                                                <option value="Pick Up">Pick Up</option>
                                                <option value="Motor">Motor</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Plat Nomor</label>
                                            <input type="text" class="form-control" name="platNomor"
                                                id="editVehiclePlate" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Kapasitas (Porsi)</label>
                                            <input type="number" class="form-control" name="kapasitas"
                                                id="editVehicleCapacity" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Batal</button>
                                        <button type="submit" class="btn btn-primary-custom">Simpan Perubahan</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Add User Modal -->
                        <div class="modal fade" id="addUserModal" tabindex="-1">
                            <div class="modal-dialog">
                                <form class="modal-content" action="<%= request.getContextPath()%>/audit/management"
                                    method="post">
                                    <input type="hidden" name="action" value="addUser">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Tambah Pengguna</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label class="form-label">ID Pengguna</label>
                                            <input type="text" class="form-control" name="id" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Nama</label>
                                            <input type="text" class="form-control" name="nama" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Email</label>
                                            <input type="email" class="form-control" name="email" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Password</label>
                                            <input type="password" class="form-control" name="password" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Role</label>
                                            <select class="form-select" name="role" required>
                                                <option value="admin_dapur">Admin Dapur</option>
                                                <option value="petugas_sekolah">Petugas Sekolah</option>
                                                <option value="admin_audit">Admin Audit</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Batal</button>
                                        <button type="submit" class="btn btn-primary-custom">Simpan</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Edit User Modal -->
                        <div class="modal fade" id="editUserModal" tabindex="-1">
                            <div class="modal-dialog">
                                <form class="modal-content" action="<%= request.getContextPath()%>/audit/management"
                                    method="post">
                                    <input type="hidden" name="action" value="updateUser">
                                    <input type="hidden" name="id" id="editUserId">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Edit Pengguna</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label class="form-label">ID Pengguna</label>
                                            <input type="text" class="form-control" id="editUserIdInd" disabled>
                                            <small class="text-muted">ID tidak dapat diubah</small>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Nama</label>
                                            <input type="text" class="form-control" name="nama" id="editUserName"
                                                required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Email</label>
                                            <input type="email" class="form-control" name="email" id="editUserEmail"
                                                required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Password</label>
                                            <input type="password" class="form-control" name="password" required>
                                            <small class="text-muted">Isi untuk mengganti password</small>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Role</label>
                                            <select class="form-select" name="role" id="editUserRole" required>
                                                <option value="admin_dapur">Admin Dapur</option>
                                                <option value="petugas_sekolah">Petugas Sekolah</option>
                                                <option value="admin_audit">Admin Audit</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Batal</button>
                                        <button type="submit" class="btn btn-primary-custom">Simpan Perubahan</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
                        <script>
                            function editSchool(id, nama, alamat, jumlah) {
                                document.getElementById('editSchoolId').value = id;
                                document.getElementById('editSchoolIdInd').value = id;
                                document.getElementById('editSchoolName').value = nama;
                                document.getElementById('editSchoolAddress').value = alamat;
                                document.getElementById('editSchoolStudents').value = jumlah;

                                const modal = new bootstrap.Modal(document.getElementById('editSchoolModal'));
                                modal.show();
                            }

                            function editVehicle(id, nama, jenis, plat, kapasitas) {
                                document.getElementById('editVehicleId').value = id;
                                document.getElementById('editVehicleIdInd').value = id;
                                document.getElementById('editVehicleName').value = nama;
                                document.getElementById('editVehicleType').value = jenis; // Ensure values match options
                                document.getElementById('editVehiclePlate').value = plat;
                                document.getElementById('editVehicleCapacity').value = kapasitas;

                                const modal = new bootstrap.Modal(document.getElementById('editVehicleModal'));
                                modal.show();
                            }

                            function editUser(id, nama, email, role) {
                                document.getElementById('editUserId').value = id;
                                document.getElementById('editUserIdInd').value = id;
                                document.getElementById('editUserName').value = nama;
                                document.getElementById('editUserEmail').value = email;
                                document.getElementById('editUserRole').value = role;

                                const modal = new bootstrap.Modal(document.getElementById('editUserModal'));
                                modal.show();
                            }
                        </script>
                </body>

                </html>