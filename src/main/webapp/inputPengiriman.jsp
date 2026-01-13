<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="pengirimanModal" tabindex="-1" aria-labelledby="pengirimanLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content border-0">
            <div class="modal-header border-0 pb-0">
                <div class="ps-3">
                    <h5 class="modal-title fw-semibold" id="pengirimanLabel">
                        <i class="fa-solid fa-clipboard-list me-2"></i>Input Pengiriman
                    </h5>
                    <small class="text-muted">Catat pengiriman makanan ke sekolah</small>
                </div>
                <button type="button" class="btn-close pe-5" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="mx-3 mt-3">
                <div class="alert alert-warning d-flex align-items-center justify-content-between mb-0 py-2 px-3">
                    <div id="late-alert" style="display:none;" class="d-flex align-items-center">
                        <i class="fa-solid fa-triangle-exclamation me-3"></i>
                        <div>
                            <div class="fw-semibold">Peringatan: Terlambat Kirim</div>
                            <small class="text-muted">
                                Pengiriman ini akan ditandai sebagai terlambat (setelah 09:00)
                            </small>
                        </div>
                    </div>
                    <span id="late-time"
                          class="badge rounded-pill bg-warning text-dark px-3 py-2">
                        00.00
                    </span>
                </div>
            </div>

            <div class="modal-body">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h6 class="mb-3">
                            <i class="fa-solid fa-paper-plane me-2"></i>Data Pengiriman
                        </h6>
                        <p class="text-muted small mb-4">Lengkapi data pengiriman makanan</p>

                        <form action="kitchen" method="POST">
                            <div class="mb-3">
                                <input type="hidden" name="account_id_pengirim" value="${sessionScope.user.id}">
                                <label class="form-label">
                                    <i class="fa-solid fa-kitchen-set me-1"></i>Dapur Asal
                                </label>
                                <select name="kitchen_id" class="form-select" required>
                                    <option value="" selected disabled>Pilih dapur asal</option>
                                    <c:forEach var="k" items="${kitchens}">
                                        <option value="${k.id}">${k.nama}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">
                                    <i class="fa-solid fa-school me-1"></i>Sekolah Tujuan
                                </label>
                                <select name="school_id" id="school_select" class="form-select" required>
                                    <option selected disabled>Pilih sekolah tujuan</option>
                                    <c:forEach var="s" items="${schools}">
                                        <option value="${s.id}" data-siswa="${s.jumlahSiswa}">${s.nama}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">
                                    <i class="fa-solid fa-truck-front me-1"></i>Kendaraan
                                </label>
                                <select name="vehicle_id" class="form-select" required>
                                    <option value="" selected disabled>Pilih kendaraan</option>
                                    <c:forEach var="v" items="${vehicles}">
                                        <option value="${v.id}">${v.namaKendaraan}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">
                                    <i class="fa-solid fa-bowl-food me-1"></i>Jumlah Porsi
                                </label>
                                <input type="number" name="jumlah_kirim" id="input_porsi" class="form-control" placeholder="Masukkan jumlah porsi" required>

                                <div id="info_siswa" class="small mt-1 text-muted" style="display: none;">
                                    Jumlah siswa: <span id="text_jumlah_siswa" class="fw-bold">0</span>
                                </div>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success">
                                    <i class="fa-solid fa-paper-plane me-2"></i>Simpan Pengiriman
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const schoolSelect = document.getElementById('school_select');
        const infoSiswa = document.getElementById('info_siswa');
        const textJumlahSiswa = document.getElementById('text_jumlah_siswa');
        const inputPorsi = document.getElementById('input_porsi');

        // Fungsi saat sekolah dipilih
        schoolSelect.addEventListener('change', function () {
            const selectedOption = this.options[this.selectedIndex];
            const jumlahSiswa = selectedOption.getAttribute('data-siswa');

            if (jumlahSiswa) {
                infoSiswa.style.display = 'block';
                textJumlahSiswa.textContent = jumlahSiswa;

                // Set default input porsi sesuai jumlah siswa
                inputPorsi.value = jumlahSiswa;

                // Reset validasi warna
                inputPorsi.classList.remove('is-invalid');
                infoSiswa.classList.replace('text-danger', 'text-muted');
            } else {
                infoSiswa.style.display = 'none';
            }
        });

        // Fungsi validasi saat input porsi diketik
        inputPorsi.addEventListener('input', function () {
            const porsi = parseInt(this.value) || 0;
            const siswa = parseInt(textJumlahSiswa.textContent) || 0;

            if (porsi < siswa) {
                this.classList.add('is-invalid');
                infoSiswa.classList.replace('text-muted', 'text-danger');
            } else {
                this.classList.remove('is-invalid');
                infoSiswa.classList.replace('text-danger', 'text-muted');
            }
        });
    });
</script>