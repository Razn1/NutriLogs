<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.School" %>
<%@ page import="model.Vehicle" %>
<!DOCTYPE html>
<html lang="id">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NutriLog - Input Pengiriman</title>
        <%@ include file="../header.jspf" %>
    </head>

    <body class="bg-light min-vh-100">
        <%@ include file="../navbar.jspf" %>

        <main class="container py-5">
            <div class="mx-auto d-flex flex-column gap-4" style="max-width: 42rem;">

                <!-- Header -->
                <div class="d-flex align-items-center gap-3">
                    <a href="<%= request.getContextPath()%>/kitchen/dashboard"
                       class="btn btn-outline-secondary d-inline-flex align-items-center justify-content-center p-2"
                       style="width: 2.5rem; height: 2.5rem;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                             stroke-linecap="round" stroke-linejoin="round">
                        <path d="m12 19-7-7 7-7" />
                        <path d="M19 12H5" />
                        </svg>
                    </a>
                    <div>
                        <h1 class="h3 fw-bold mb-0">Input Pengiriman</h1>
                        <p class="text-secondary mb-0">Catat pengiriman makanan ke sekolah</p>
                    </div>
                </div>

                <div class="card border-light shadow-sm rounded-4">
                    <div class="card-header bg-white border-bottom-0 pt-4 px-4 pb-0">
                        <h3 class="h5 fw-bold mb-1 d-flex align-items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                 viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                 stroke-linecap="round" stroke-linejoin="round" class="text-primary">
                            <line x1="22" y1="2" x2="11" y2="13" />
                            <polygon points="22 2 15 22 11 13 2 9 22 2" />
                            </svg>
                            Data Pengiriman
                        </h3>
                        <p class="small text-secondary mb-0">Lengkapi data pengiriman makanan</p>
                    </div>
                    <div class="card-body p-4">
                        <form action="<%= request.getContextPath()%>/kitchen/delivery/submit"
                              method="POST" class="d-flex flex-column gap-3">

                            <!-- School Selection -->
                            <div class="mb-1">
                                <label for="school" class="form-label small fw-medium">Sekolah
                                    Tujuan</label>
                                <select name="schoolId" id="school" required
                                        class="form-select form-select-lg">
                                    <option value="">Pilih sekolah tujuan</option>
                                    <% List<School> schools = (List<School>) request.getAttribute("schools");
                                        for (School s : schools) {
                                    %>
                                    <option value="<%= s.getId()%>">
                                        <%= s.getNama()%> (<%= s.getJumlahSiswa()%> siswa)
                                    </option>
                                    <% } %>
                                </select>
                            </div>

                            <!-- Vehicle Selection -->
                            <div class="mb-1">
                                <label for="vehicle"
                                       class="form-label small fw-medium">Kendaraan</label>
                                <select name="vehicleId" id="vehicle" required
                                        class="form-select form-select-lg">
                                    <option value="">Pilih kendaraan</option>
                                    <% List<Vehicle> vehicles = (List<Vehicle>) request.getAttribute("vehicles");
                                        for (Vehicle v : vehicles) {
                                    %>
                                    <option value="<%= v.getId()%>">
                                        <%= v.getNamaKendaraan()%> - <%= v.getPlatNomor()%>
                                        (Max
                                        <%= v.getKapasitas()%>)
                                    </option>
                                    <% }%>
                                </select>
                            </div>

                            <!-- Quantity -->
                            <div class="mb-1">
                                <label for="quantity" class="form-label small fw-medium">Jumlah
                                    Porsi</label>
                                <input type="number" id="quantity" name="jumlahKirim" required min="1"
                                       class="form-control form-control-lg"
                                       placeholder="Masukkan jumlah porsi">
                            </div>

                            <!-- Submit Button -->
                            <button type="submit"
                                    class="btn btn-primary-custom w-100 py-2 mt-2 shadow-sm d-inline-flex align-items-center justify-content-center">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                     class="me-2">
                                <line x1="22" y1="2" x2="11" y2="13" />
                                <polygon points="22 2 15 22 11 13 2 9 22 2" />
                                </svg>
                                Kirim Pengiriman
                            </button>

                        </form>
                    </div>
                </div>
            </div>
        </main>
    </body>

</html>