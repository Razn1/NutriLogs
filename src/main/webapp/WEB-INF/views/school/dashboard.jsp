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

    <body class="bg-background min-h-screen">
        <%@ include file="../navbar.jspf" %>

        <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-8">
            <!-- Header -->
            <div>
                <h1 class="text-3xl font-bold">Dashboard Sekolah</h1>
                <p class="text-muted-foreground mt-1">Kelola penerimaan makanan</p>
            </div>

            <!-- Deliveries List -->
            <div class="rounded-xl border bg-card text-card-foreground shadow">
                <div class="flex flex-col space-y-1.5 p-6">
                    <h3 class="font-semibold leading-none tracking-tight">Daftar Pengiriman Masuk
                    </h3>
                    <p class="text-sm text-muted-foreground">Konfirmasi penerimaan makanan yang tiba
                    </p>
                </div>
                <div class="p-6 pt-0">
                    <div class="space-y-4">
                        <% List<Delivery> deliveries = (List<Delivery>) request.getAttribute("deliveries");
                            if (deliveries.isEmpty()) {
                        %>
                        <div class="text-center py-12 text-muted-foreground">
                            <p>Belum ada pengiriman untuk sekolah ini</p>
                        </div>
                        <% } else { %>
                        <% for (Delivery d : deliveries) {%>
                        <div
                            class="flex flex-col md:flex-row md:items-center justify-between p-4 rounded-xl border bg-muted/30 gap-4">
                            <div class="flex items-start gap-4">
                                <div
                                    class="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center flex-shrink-0">
                                    <svg xmlns="http://www.w3.org/2000/svg"
                                         width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor"
                                         stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round"
                                         class="text-primary">
                                    <rect width="16" height="13" x="1" y="6"
                                          rx="2" />
                                    <polygon points="17 6 23 11 23 19 17 19" />
                                    <circle cx="5.5" cy="18.5" r="2.5" />
                                    <circle cx="18.5" cy="18.5" r="2.5" />
                                    </svg>
                                </div>
                                <div>
                                    <div class="flex items-center gap-2 mb-1">
                                        <h4 class="font-semibold text-lg">Pengiriman
                                            dari <%= d.getKitchen().getNama()%>
                                        </h4>
                                        <span class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2
                                              <%= d.getStatusPengiriman() == DeliveryStatus.dikirim
                                                      ? "border-transparent bg-warning text-warning-foreground"
                                                      : d.getStatusPengiriman() == DeliveryStatus.diterima
                                                      ? "border-transparent bg-primary text-primary-foreground"
                                                      : "border-transparent bg-destructive text-destructive-foreground"%>">
                                            <%= d.getStatusPengiriman().name().toUpperCase()%>
                                        </span>
                                    </div>
                                    <div
                                        class="text-sm text-muted-foreground space-y-1">
                                        <p>Kendaraan: <%=d.getVehicle().getNamaKendaraan()%>
                                            (<%= d.getVehicle().getPlatNomor()%>)</p>
                                        <p>Jumlah Kirim: <%= d.getJumlahKirim()%>
                                            porsi</p>
                                            <% if (d.getWaktuKirim() != null) {%>
                                        <p>Waktu Kirim: <%=d.getWaktuKirim().format(DateTimeFormatter.ofPattern("HH:mm"))%>
                                        </p>
                                        <% } %>
                                    </div>
                                </div>
                            </div>

                            <% if (d.getStatusPengiriman() == DeliveryStatus.dikirim) {%>
                            <a href="<%= request.getContextPath()%>/school/confirm?id=<%= d.getId()%>"
                               class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 shadow-sm">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     width="16" height="16" viewBox="0 0 24 24"
                                     fill="none" stroke="currentColor"
                                     stroke-width="2" stroke-linecap="round"
                                     stroke-linejoin="round" class="mr-2">
                                <polyline points="20 6 9 17 4 12" />
                                </svg>
                                Konfirmasi Terima
                            </a>
                            <% } else if (d.getStatusPengiriman() == DeliveryStatus.diterima
                                                                            || d.getStatusPengiriman() == DeliveryStatus.bermasalah) {%>
                            <div class="text-right text-sm">
                                    <p class="font-medium">Diterima: <%=d.getJumlahTerima()%> porsi</p>
                                <p class="text-muted-foreground">Kualitas:
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