<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Delivery" %>
<%@ page import="model.enums.DeliveryStatus" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="id">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NutriLog - Dashboard Sekolah</title>
        <%@ include file="../header.jspf" %>
    </head>

    <body class="bg-light min-vh-100">
        <%@ include file="../navbar.jspf" %>

        <main class="container py-5">
            <!-- Header -->
            <div class="mb-4">
                <h1 class="h2 fw-bold">Dashboard Sekolah</h1>
                <p class="text-secondary mt-1">Kelola penerimaan makanan</p>
            </div>

            <!-- Deliveries List -->
            <div class="card border-light shadow-sm rounded-4">
                <div class="card-header bg-white border-bottom-0 pt-4 px-4 pb-0">
                    <h3 class="h5 fw-bold mb-1">Daftar Pengiriman Masuk</h3>
                    <p class="small text-secondary mb-0">Konfirmasi penerimaan makanan yang tiba</p>
                </div>
                <div class="card-body p-4">
                    <div class="d-flex flex-column gap-3">
                        <% List<Delivery> deliveries = (List<Delivery>) request.getAttribute("deliveries");
                            if (deliveries.isEmpty()) {
                        %>
                        <div class="text-center py-5 text-secondary">
                            <p>Belum ada pengiriman untuk sekolah ini</p>
                        </div>
                        <% } else { %>
                        <% for (Delivery d : deliveries) {%>
                        <div
                            class="d-flex flex-column flex-md-row align-items-md-center justify-content-between p-3 rounded-4 border bg-light gap-3">
                            <div class="d-flex align-items-start gap-3">
                                <div class="d-flex align-items-center justify-content-center flex-shrink-0 rounded-circle bg-emerald-100 text-emerald"
                                     style="width: 3rem; height: 3rem;">
                                    <svg xmlns="http://www.w3.org/2000/svg"
                                         width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor"
                                         stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round">
                                    <rect width="16" height="13" x="1" y="6"
                                          rx="2" />
                                    <polygon points="17 6 23 11 23 19 17 19" />
                                    <circle cx="5.5" cy="18.5" r="2.5" />
                                    <circle cx="18.5" cy="18.5" r="2.5" />
                                    </svg>
                                </div>
                                <div>
                                    <div
                                        class="d-flex align-items-center gap-2 mb-1">
                                        <h4 class="fw-bold fs-6 mb-0">Pengiriman
                                            dari <%= d.getKitchen().getNama()%>
                                        </h4>
                                        <span class="badge rounded-pill
                                              <%= d.getStatusPengiriman() == DeliveryStatus.dikirim
                                                      ? " bg-warning text-dark"
                                                      : d.getStatusPengiriman() == DeliveryStatus.diterima
                                                      ? "bg-success" : "bg-danger"%>">
                                            <%=d.getStatusPengiriman().name().toUpperCase()%>
                                        </span>
                                    </div>
                                    <div class="small text-secondary">
                                        <p class="mb-0">Kendaraan:
                                            <%=d.getVehicle().getNamaKendaraan()%>
                                            (<%= d.getVehicle().getPlatNomor()%>
                                            )</p>
                                        <p class="mb-0">Jumlah Kirim: <%=d.getJumlahKirim()%>
                                            porsi</p>
                                            <% if (d.getWaktuKirim() != null) {%>
                                        <p class="mb-0">Waktu Kirim:
                                            <%=d.getWaktuKirim().format(DateTimeFormatter.ofPattern("HH:mm"))%>
                                        </p>
                                        <% } %>
                                    </div>
                                </div>
                            </div>

                            <% if (d.getStatusPengiriman() == DeliveryStatus.dikirim) {%>
                            <a href="<%= request.getContextPath()%>/school/confirm?id=<%= d.getId()%>"
                               class="btn btn-primary-custom btn-sm d-inline-flex align-items-center">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     width="16" height="16" viewBox="0 0 24 24"
                                     fill="none" stroke="currentColor"
                                     stroke-width="2" stroke-linecap="round"
                                     stroke-linejoin="round" class="me-2">
                                <polyline points="20 6 9 17 4 12" />
                                </svg>
                                Konfirmasi Terima
                            </a>
                            <% } else if (d.getStatusPengiriman() == DeliveryStatus.diterima
                                                                            || d.getStatusPengiriman() == DeliveryStatus.bermasalah) {%>
                            <div class="text-md-end text-start small">
                                <p class="fw-medium mb-0">Diterima:
                                    <%=d.getJumlahTerima()%> porsi</p>
                                <p class="text-secondary mb-0">Kualitas:
                                    <%= d.getKualitasMakanan().name()%>
                                </p>
                            </div>
                            <% } %>
                        </div>
                        <% } %>
                        <% }%>
                    </div>
                </div>
            </div>
        </main>
    </body>

</html>