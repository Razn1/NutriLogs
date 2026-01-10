<!-- Modal -->
<div class="modal fade" id="pengirimanModal" tabindex="-1" aria-labelledby="pengirimanLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content border-0">
            <div class="modal-header border-0 pb-0">
                <div>
                    <h5 class="modal-title fw-semibold" id="pengirimanLabel">
                        <i class="fa-solid fa-clipboard-list me-2"></i>Input Pengiriman
                    </h5>
                    <small class="text-muted">Catat pengiriman makanan ke sekolah</small>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- Peringatan -->
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

            <!-- Body card -->
            <div class="modal-body">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h6 class="mb-3">
                            <i class="fa-solid fa-paper-plane me-2"></i>Data Pengiriman
                        </h6>
                        <p class="text-muted small mb-4">Lengkapi data pengiriman makanan</p>

                        <form>
                            <!-- Dapur Asal -->
                            <div class="mb-3">
                                <label class="form-label">
                                    <i class="fa-solid fa-kitchen-set me-1"></i>Dapur Asal
                                </label>
                                <select class="form-select">
                                    <option selected>Pilih dapur asal</option>
                                    <option value="1">Dapur 1</option>
                                    <option value="2">Dapur 2</option>
                                </select>
                            </div>

                            <!-- Sekolah Tujuan -->
                            <div class="mb-3">
                                <label class="form-label">
                                    <i class="fa-solid fa-school me-1"></i>Sekolah Tujuan
                                </label>
                                <select class="form-select">
                                    <option selected>Pilih sekolah tujuan</option>
                                    <option value="1">SD A</option>
                                    <option value="2">SD B</option>
                                </select>
                            </div>

                            <!-- Kendaraan -->
                            <div class="mb-3">
                                <label class="form-label">
                                    <i class="fa-solid fa-truck-front me-1"></i>Kendaraan
                                </label>
                                <select class="form-select">
                                    <option selected>Pilih kendaraan</option>
                                    <option value="1">Mobil Box 1</option>
                                    <option value="2">Mobil Box 2</option>
                                </select>
                            </div>

                            <!-- Jumlah Porsi -->
                            <div class="mb-4">
                                <label class="form-label">
                                    <i class="fa-solid fa-bowl-food me-1"></i>Jumlah Porsi
                                </label>
                                <input type="number" class="form-control" placeholder="Masukkan jumlah porsi">
                            </div>

                            <!-- Tombol Kirim -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success">
                                    <i class="fa-solid fa-paper-plane me-2"></i>Kirim Pengiriman
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>