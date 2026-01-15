<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Delivery" %>
<!DOCTYPE html>
<html lang="id">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NutriLog - Konfirmasi Penerimaan</title>
        <%@ include file="../header.jspf" %>
    </head>

    <body class="bg-light min-vh-100">
        <%@ include file="../navbar.jspf" %>

        <main class="container py-5">
            <div class="mx-auto d-flex flex-column gap-4" style="max-width: 42rem;">
                <% Delivery d = (Delivery) request.getAttribute("delivery");%>

                <!-- Header -->
                <div class="d-flex align-items-center gap-3">
                    <a href="<%= request.getContextPath()%>/school/dashboard"
                       class="btn btn-outline-secondary d-inline-flex align-items-center justify-content-center p-2"
                       style="width: 2.5rem; height: 2.5rem;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                             fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                             stroke-linejoin="round">
                        <path d="m12 19-7-7 7-7" />
                        <path d="M19 12H5" />
                        </svg>
                    </a>
                    <div>
                        <h1 class="h3 fw-bold mb-0">Konfirmasi Penerimaan</h1>
                        <p class="text-secondary mb-0">Verifikasi makanan yang diterima</p>
                    </div>
                </div>

                <div class="card border-light shadow-sm rounded-4">
                    <div class="card-body p-4 p-md-5 d-flex flex-column gap-4">
                        <!-- Delivery Info -->
                        <div class="p-3 rounded-3 bg-light border">
                            <h4 class="h6 fw-bold mb-3">Info Pengiriman</h4>
                            <div class="row g-3 small">
                                <div class="col-6">
                                    <p class="text-secondary mb-1">Kitchen</p>
                                    <p class="fw-medium mb-0">
                                        <%= d.getKitchen().getNama()%>
                                    </p>
                                </div>
                                <div class="col-6">
                                    <p class="text-secondary mb-1">Jumlah Kirim</p>
                                    <p class="fw-medium mb-0">
                                        <%= d.getJumlahKirim()%> porsi
                                    </p>
                                </div>
                            </div>
                        </div>

                        <form action="<%= request.getContextPath()%>/school/confirm" method="POST"
                              class="d-flex flex-column gap-3">
                            <input type="hidden" name="id" value="<%= d.getId()%>">

                            <!-- Received Quantity -->
                            <div class="mb-1">
                                <label for="jumlahTerima" class="form-label small fw-medium">Jumlah
                                    Diterima</label>
                                <input type="number" id="jumlahTerima" name="jumlahTerima" required
                                       class="form-control form-control-lg"
                                       placeholder="<%= d.getJumlahKirim()%>"
                                       value="<%= d.getJumlahKirim()%>">
                                <p class="form-text text-secondary small">Sesuaikan jika jumlah berbeda</p>
                            </div>

                            <!-- Quality -->
                            <div class="mb-1">
                                <label for="kualitasMakanan" class="form-label small fw-medium">Kualitas
                                    Makanan</label>
                                <select name="kualitasMakanan" id="kualitasMakanan" required
                                        class="form-select">
                                    <option value="sangat_baik">Sangat Baik</option>
                                    <option value="baik">Baik</option>
                                    <option value="cukup">Cukup</option>
                                    <option value="buruk">Buruk (Komplain)</option>
                                </select>
                            </div>

                            <!-- Notes -->
                            <div class="mb-1">
                                <label for="catatanKualitas" class="form-label small fw-medium">Catatan /
                                    Kualitas</label>
                                <textarea id="catatanKualitas" name="catatanKualitas" rows="3"
                                          class="form-control"
                                          placeholder="Tambahkan catatan jika ada masalah..."></textarea>
                            </div>

                            <!-- Submit Button -->
                            <button type="submit"
                                    class="btn btn-primary-custom w-100 py-2 mt-2 shadow-sm d-inline-flex align-items-center justify-content-center">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                     stroke-linecap="round" stroke-linejoin="round" class="me-2">
                                <polyline points="20 6 9 17 4 12" />
                                </svg>
                                Konfirmasi Penerimaan
                            </button>

                        </form>
                    </div>
                </div>
            </div>
        </main>
    </body>

</html>