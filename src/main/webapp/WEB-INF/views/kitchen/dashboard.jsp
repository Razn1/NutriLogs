<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Delivery" %>
<%@ page import="model.enums.DeliveryStatus" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="id">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NutriLog - Dashboard Dapur</title>
        <%@ include file="../header.jspf" %>
    </head>

    <body class="bg-light min-vh-100">
        <%@ include file="../navbar.jspf" %>

        <main class="container py-5 d-flex flex-column gap-4">
            <% List<Delivery> deliveries = (List<Delivery>) request.getAttribute("deliveries");
                int total = deliveries.size();
                int completed = 0;
                int inProgress = 0;
                int issues = 0;
                for (Delivery d : deliveries) {
                    if (d.getStatusPengiriman() == DeliveryStatus.diterima) {
                        completed++;
                    } else if (d.getStatusPengiriman() == DeliveryStatus.dikirim) {
                        inProgress++;
                    } else if (d.getStatusPengiriman() == DeliveryStatus.bermasalah) {
                        issues++;
                    }
                }

                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("EEEE, d MMMM yyyy",
                        new Locale("id", "ID"));
                String today = LocalDate.now().format(dtf);
                int currentHour = java.time.LocalTime.now().getHour();
            %>

            <!-- Header -->
            <div
                class="d-flex flex-column flex-sm-row align-items-sm-center justify-content-between gap-3">
                <div>
                    <h1 class="h2 fw-bold mb-1">Dashboard Dapur</h1>
                    <p class="text-secondary mb-0">
                        <%= today%>
                    </p>
                </div>
                <a href="<%= request.getContextPath()%>/kitchen/delivery"
                   class="btn btn-primary-custom d-inline-flex align-items-center shadow-lg px-4">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                         viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2" stroke-linecap="round"
                         stroke-linejoin="round" class="me-2">
                    <line x1="22" y1="2" x2="11" y2="13" />
                    <polygon points="22 2 15 22 11 13 2 9 22 2" />
                    </svg>
                    Input Pengiriman Baru
                </a>
            </div>

            <% if (currentHour >= 9) { %>
            <!-- Late Warning Banner -->
            <div
                class="alert alert-warning d-flex align-items-center gap-3 border-warning shadow-sm mb-0">
                <div class="d-flex align-items-center justify-content-center flex-shrink-0 rounded-circle bg-white text-warning"
                     style="width: 2.5rem; height: 2.5rem;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20"
                         height="20" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2"
                         stroke-linecap="round" stroke-linejoin="round">
                    <path
                        d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z" />
                    <line x1="12" y1="9" x2="12" y2="13" />
                    <line x1="12" y1="17" x2="12.01" y2="17" />
                    </svg>
                </div>
                <div>
                    <h6 class="alert-heading fw-bold mb-0">Peringatan: Sudah
                        Lewat Jam 09:00</h6>
                    <p class="mb-0 small">Pengiriman setelah jam 09:00 akan
                        ditandai sebagai terlambat</p>
                </div>
            </div>
            <% }%>

            <!-- Stats Grid -->
            <div class="row g-3">
                <!-- Total -->
                <div class="col-6 col-lg-3">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-body">
                            <div
                                class="d-flex align-items-center justify-content-between mb-2">
                                <p
                                    class="small fw-medium text-secondary mb-0">
                                    Total Hari Ini</p>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     width="20" height="20"
                                     viewBox="0 0 24 24" fill="none"
                                     stroke="currentColor" stroke-width="2"
                                     stroke-linecap="round"
                                     stroke-linejoin="round"
                                     class="text-secondary">
                                <path
                                    d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z" />
                                <polyline
                                    points="3.27 6.96 12 12.01 20.73 6.96" />
                                <line x1="12" y1="22.08" x2="12"
                                      y2="12" />
                                </svg>
                            </div>
                            <h3 class="fw-bold mb-0">
                                <%= total%>
                            </h3>
                        </div>
                    </div>
                </div>

                <!-- Completed -->
                <div class="col-6 col-lg-3">
                    <div
                        class="card h-100 shadow-sm border-0 border-start border-4 border-success">
                        <div class="card-body">
                            <div
                                class="d-flex align-items-center justify-content-between mb-2">
                                <p
                                    class="small fw-medium text-secondary mb-0">
                                    Selesai</p>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     width="20" height="20"
                                     viewBox="0 0 24 24" fill="none"
                                     stroke="currentColor" stroke-width="2"
                                     stroke-linecap="round"
                                     stroke-linejoin="round"
                                     class="text-success">
                                <path
                                    d="M22 11.08V12a10 10 0 1 1-5.93-9.14" />
                                <polyline
                                    points="22 4 12 14.01 9 11.01" />
                                </svg>
                            </div>
                            <h3 class="fw-bold text-success mb-0">
                                <%= completed%>
                            </h3>
                        </div>
                    </div>
                </div>

                <!-- In Progress -->
                <div class="col-6 col-lg-3">
                    <div
                        class="card h-100 shadow-sm border-0 border-start border-4 border-warning">
                        <div class="card-body">
                            <div
                                class="d-flex align-items-center justify-content-between mb-2">
                                <p
                                    class="small fw-medium text-secondary mb-0">
                                    Dalam Perjalanan</p>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     width="20" height="20"
                                     viewBox="0 0 24 24" fill="none"
                                     stroke="currentColor" stroke-width="2"
                                     stroke-linecap="round"
                                     stroke-linejoin="round"
                                     class="text-warning">
                                <rect width="16" height="13" x="1" y="6"
                                      rx="2" />
                                <polygon
                                    points="17 6 23 11 23 19 17 19" />
                                <circle cx="5.5" cy="18.5" r="2.5" />
                                <circle cx="18.5" cy="18.5" r="2.5" />
                                </svg>
                            </div>
                            <h3 class="fw-bold text-warning mb-0">
                                <%= inProgress%>
                            </h3>
                        </div>
                    </div>
                </div>

                <!-- Issues -->
                <div class="col-6 col-lg-3">
                    <div
                        class="card h-100 shadow-sm border-0 border-start border-4 border-danger">
                        <div class="card-body">
                            <div
                                class="d-flex align-items-center justify-content-between mb-2">
                                <p
                                    class="small fw-medium text-secondary mb-0">
                                    Bermasalah</p>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     width="20" height="20"
                                     viewBox="0 0 24 24" fill="none"
                                     stroke="currentColor" stroke-width="2"
                                     stroke-linecap="round"
                                     stroke-linejoin="round"
                                     class="text-danger">
                                <path
                                    d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z" />
                                <line x1="12" y1="9" x2="12" y2="13" />
                                <line x1="12" y1="17" x2="12.01"
                                      y2="17" />
                                </svg>
                            </div>
                            <h3 class="fw-bold text-danger mb-0">
                                <%= issues%>
                            </h3>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Deliveries -->
            <div class="card border-light shadow-sm rounded-4">
                <div
                    class="card-header bg-white border-bottom-0 pt-4 px-4 pb-0">
                    <h3
                        class="h5 fw-bold mb-1 d-flex align-items-center gap-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20"
                             height="20" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2"
                             stroke-linecap="round" stroke-linejoin="round"
                             class="text-primary">
                        <circle cx="12" cy="12" r="10" />
                        <polyline points="12 6 12 12 16 14" />
                        </svg>
                        Pengiriman Terbaru
                    </h3>
                    <p class="small text-secondary mb-0">Daftar pengiriman
                        hari ini</p>
                </div>
                <div class="card-body p-4">
                    <div class="d-flex flex-column gap-3">
                        <% if (deliveries.isEmpty()) { %>
                        <div class="text-center py-5 text-secondary">
                            <p>Belum ada pengiriman hari ini</p>
                        </div>
                        <% } else { %>
                        <% for (Delivery d : deliveries) {%>
                        <div
                            class="d-flex align-items-center justify-content-between p-3 rounded-3 bg-light border">
                            <div
                                class="d-flex align-items-center gap-3">
                                <div class="d-flex align-items-center justify-content-center rounded-3 bg-emerald-100 text-emerald"
                                     style="width: 2.5rem; height: 2.5rem;">
                                    <svg xmlns="http://www.w3.org/2000/svg"
                                         width="20" height="20"
                                         viewBox="0 0 24 24"
                                         fill="none"
                                         stroke="currentColor"
                                         stroke-width="2"
                                         stroke-linecap="round"
                                         stroke-linejoin="round">
                                    <rect width="16"
                                          height="13" x="1"
                                          y="6" rx="2" />
                                    <polygon
                                        points="17 6 23 11 23 19 17 19" />
                                    <circle cx="5.5"
                                            cy="18.5" r="2.5" />
                                    <circle cx="18.5"
                                            cy="18.5" r="2.5" />
                                    </svg>
                                </div>
                                <div>
                                    <p class="fw-bold mb-0">
                                        <%=d.getSchool().getNama()%>
                                    </p>
                                    <p
                                        class="small text-secondary mb-0">
                                        <%= d.getJumlahKirim()%>
                                        porsi
                                    </p>
                                </div>
                            </div>
                            <div class="text-end">
                                <span class="badge rounded-pill
                                      <%= d.getStatusPengiriman() == DeliveryStatus.dikirim
                                              ? " bg-warning text-dark" : d.getStatusPengiriman() == DeliveryStatus.diterima
                                              ? "bg-success" : "bg-danger"%>">
                                    <%=d.getStatusPengiriman().name()%>
                                </span>
                                <% if (d.getWaktuKirim() != null) {%>
                                <p
                                    class="small text-secondary mt-1 mb-0">
                                    Kirim:
                                    <%=d.getWaktuKirim().format(DateTimeFormatter.ofPattern("HH:mm"))%>
                                </p>
                                <% } %>
                            </div>
                        </div>
                        <% } %>
                        <% }%>
                    </div>
                </div>
            </div>
        </main>
    </body>

</html>