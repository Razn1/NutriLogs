<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Delivery" %>
<%@ page import="util.AuditUtils" %>
<%@ page import="util.AuditUtils.AuditFlags" %>
<%@ page import="model.enums.DeliveryStatus" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="id">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NutriLog - Dashboard Audit</title>
        <%@ include file="../header.jspf" %>
    </head>

    <body class="bg-light min-vh-100">
        <%@ include file="../navbar.jspf" %>
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

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("EEEE, d MMMM yyyy", new Locale("id", "ID"));
            String today = LocalDate.now().format(dtf);
            int currentHour = java.time.LocalTime.now().getHour();
        %>

        <main class="container py-5 d-flex flex-column gap-4">
            <div>
                <h1 class="h2 fw-bold mb-1">Dashboard Audit</h1>
                <p class="text-secondary mb-0">Monitoring kepatuhan dan
                    kualitas pengiriman</p>
            </div>


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
            <div
                class="card border-light shadow-sm rounded-4 overflow-hidden">
                <div class="table-responsive">
                    <table
                        class="table table-hover table-borderless mb-0 align-middle">
                        <thead
                            class="table-light small text-secondary text-uppercase border-bottom">
                            <tr>
                                <th class="px-4 py-3 fw-medium">Waktu</th>
                                <th class="px-4 py-3 fw-medium">Dari</th>
                                <th class="px-4 py-3 fw-medium">Ke</th>
                                <th class="px-4 py-3 fw-medium">Status
                                    Pengiriman</th>
                                <th class="px-4 py-3 fw-medium">Status
                                    Penerimaan</th>
                                <th class="px-4 py-3 fw-medium">Audit Flags
                                </th>
                            </tr>
                        </thead>
                        <tbody class="border-top-0">
                            <% // SAFETY CHECK: Only loop if list exists 
                                if (deliveries != null && !deliveries.isEmpty()) {
                                    for (Delivery d : deliveries) {
                                        AuditFlags flags = AuditUtils.getAuditFlags(d);
                                        boolean needsAttention = flags.isLate
                                                || flags.hasQuantityMismatch
                                                || flags.hasBadQuality || flags.hasIssues;%>
                            <tr class="<%= needsAttention ? " table - danger " : ""%> border-bottom">
                                <td class="px-4 py-3 whitespace-nowrap">
                                    <p class="fw-medium mb-0">
                                        <%= d.getTanggal()%>
                                    </p>
                                    <% if (d.getWaktuKirim() != null) {
                                    %>
                                    <p
                                        class="small text-secondary mb-0">
                                        Kirim:
                                        <%= d.getWaktuKirim().format(DateTimeFormatter.ofPattern("HH:mm"))%>
                                    </p>
                                    <% }%>
                                </td>
                                <td class="px-4 py-3">
                                    <p class="fw-medium mb-0">
                                        <%= (d.getKitchen() != null)
                                                ? d.getKitchen().getNama()
                                                : "Unknown Kitchen"%>
                                    </p>
                                </td>
                                <td class="px-4 py-3">
                                    <p class="fw-medium mb-0">
                                        <%= (d.getSchool() != null)
                                                ? d.getSchool().getNama()
                                                : "Unknown School"%>
                                    </p>
                                </td>
                                <td class="px-4 py-3">
                                    <div>
                                        <p class="fw-medium mb-0">
                                            <%= d.getStatusPengiriman()%>
                                        </p>
                                        <p
                                            class="small text-secondary mb-0">
                                            Qty:
                                            <%= d.getJumlahKirim()%>
                                        </p>
                                    </div>
                                </td>
                                <td class="px-4 py-3">
                                    <% if (d.getWaktuTerima() != null) {
                                    %>
                                    <div>
                                        <p class="fw-medium mb-0">
                                            <%= d.getWaktuTerima().format(DateTimeFormatter.ofPattern("HH:mm"))%>
                                        </p>
                                        <p
                                            class="small text-secondary mb-0">
                                            Qty: <%=d.getJumlahTerima()%>
                                        </p>
                                        <p class="small fw-bold mb-0 <%= flags.hasBadQuality ? "                                                                        text - danger"
                                                   : "text-success"%>">
                                            <%= d.getKualitasMakanan()%>
                                        </p>
                                    </div>
                                    <% } else { %>
                                    <span
                                        class="text-secondary">-</span>
                                    <% } %>
                                </td>
                                <td class="px-4 py-3">
                                    <div class="d-flex flex-wrap gap-1">
                                        <% if (flags.isLate) { %>
                                        <span
                                            class="badge rounded-pill bg-danger">
                                            Terlambat
                                        </span>
                                        <% } %>
                                        <% if (flags.hasQuantityMismatch) { %>
                                        <span
                                            class="badge rounded-pill bg-warning text-dark">
                                            Selisih Qty
                                        </span>
                                        <% } %>
                                        <% if (flags.hasBadQuality) { %>
                                        <span
                                            class="badge rounded-pill bg-danger">
                                            Kualitas
                                            Buruk
                                        </span>
                                        <% } %>
                                        <% if (!needsAttention) { %>
                                        <span
                                            class="badge rounded-pill bg-success-subtle text-success border border-success-subtle">
                                            OK
                                        </span>
                                        <% }
                                        %>
                                    </div>
                                </td>
                            </tr>
                            <% } // End For Loop
                            } else { // Handle empty list %>
                            <tr>
                                <td colspan="6"
                                    class="px-4 py-5 text-center text-secondary">
                                    Tidak ada data pengiriman.
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </body>

</html>