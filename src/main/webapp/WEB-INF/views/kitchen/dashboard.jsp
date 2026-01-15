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

    <body class="bg-background min-h-screen">
        <%@ include file="../navbar.jspf" %>

        <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-8">
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
                class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
                <div>
                    <h1 class="text-3xl font-bold">Dashboard Dapur</h1>
                    <p class="text-muted-foreground mt-1">
                        <%= today%>
                    </p>
                </div>
                <a href="<%= request.getContextPath()%>/kitchen/delivery"
                   class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-8 py-2 shadow-lg">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                         viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2" stroke-linecap="round"
                         stroke-linejoin="round" class="mr-2">
                    <line x1="22" y1="2" x2="11" y2="13" />
                    <polygon points="22 2 15 22 11 13 2 9 22 2" />
                    </svg>
                    Input Pengiriman Baru
                </a>
            </div>

            <% if (currentHour >= 9) { %>
            <!-- Late Warning Banner -->
            <div
                class="p-4 rounded-xl bg-warning/10 border border-warning/30 flex items-center gap-3 animate-fade-in">
                <div
                    class="w-10 h-10 rounded-full bg-warning/20 flex items-center justify-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20"
                         height="20" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2"
                         stroke-linecap="round" stroke-linejoin="round"
                         class="text-warning">
                    <path
                        d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z" />
                    <line x1="12" y1="9" x2="12" y2="13" />
                    <line x1="12" y1="17" x2="12.01" y2="17" />
                    </svg>
                </div>
                <div>
                    <p class="font-semibold text-warning-foreground">Peringatan:
                        Sudah Lewat Jam 09:00</p>
                    <p class="text-sm text-muted-foreground">Pengiriman setelah
                        jam 09:00 akan ditandai sebagai terlambat</p>
                </div>
            </div>
            <% }%>

            <!-- Stats Grid -->
            <div class="grid grid-cols-2 lg:grid-cols-4 gap-4">
                <!-- Total -->
                <div
                    class="p-6 rounded-xl border bg-card text-card-foreground shadow-sm card-interactive">
                    <div
                        class="flex items-center justify-between space-y-0 pb-2">
                        <p
                            class="text-sm font-medium text-muted-foreground">
                            Total Hari Ini</p>
                        <svg xmlns="http://www.w3.org/2000/svg" width="20"
                             height="20" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2"
                             stroke-linecap="round" stroke-linejoin="round"
                             class="text-muted-foreground">
                        <path
                            d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z" />
                        <polyline
                            points="3.27 6.96 12 12.01 20.73 6.96" />
                        <line x1="12" y1="22.08" x2="12" y2="12" />
                        </svg>
                    </div>
                    <div class="text-2xl font-bold">
                        <%= total%>
                    </div>
                </div>

                <!-- Completed -->
                <div
                    class="p-6 rounded-xl border bg-card text-card-foreground shadow-sm card-interactive border-l-4 border-l-primary">
                    <div
                        class="flex items-center justify-between space-y-0 pb-2">
                        <p
                            class="text-sm font-medium text-muted-foreground">
                            Selesai</p>
                        <svg xmlns="http://www.w3.org/2000/svg" width="20"
                             height="20" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2"
                             stroke-linecap="round" stroke-linejoin="round"
                             class="text-primary">
                        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14" />
                        <polyline points="22 4 12 14.01 9 11.01" />
                        </svg>
                    </div>
                    <div class="text-2xl font-bold text-primary">
                        <%= completed%>
                    </div>
                </div>

                <!-- In Progress -->
                <div
                    class="p-6 rounded-xl border bg-card text-card-foreground shadow-sm card-interactive border-l-4 border-l-warning">
                    <div
                        class="flex items-center justify-between space-y-0 pb-2">
                        <p
                            class="text-sm font-medium text-muted-foreground">
                            Dalam Perjalanan</p>
                        <svg xmlns="http://www.w3.org/2000/svg" width="20"
                             height="20" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2"
                             stroke-linecap="round" stroke-linejoin="round"
                             class="text-warning">
                        <rect width="16" height="13" x="1" y="6"
                              rx="2" />
                        <polygon points="17 6 23 11 23 19 17 19" />
                        <circle cx="5.5" cy="18.5" r="2.5" />
                        <circle cx="18.5" cy="18.5" r="2.5" />
                        </svg>
                    </div>
                    <div class="text-2xl font-bold text-warning">
                        <%= inProgress%>
                    </div>
                </div>

                <!-- Issues -->
                <div
                    class="p-6 rounded-xl bg-card text-card-foreground shadow-sm card-interactive border-l-4 border-l-destructive border">
                    <div
                        class="flex items-center justify-between space-y-0 pb-2">
                        <p
                            class="text-sm font-medium text-muted-foreground">
                            Bermasalah</p>
                        <svg xmlns="http://www.w3.org/2000/svg" width="20"
                             height="20" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2"
                             stroke-linecap="round" stroke-linejoin="round"
                             class="text-destructive">
                        <path
                            d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z" />
                        <line x1="12" y1="9" x2="12" y2="13" />
                        <line x1="12" y1="17" x2="12.01" y2="17" />
                        </svg>
                    </div>
                    <div class="text-2xl font-bold text-destructive">
                        <%= issues%>
                    </div>
                </div>
            </div>

            <!-- Recent Deliveries -->
            <div
                class="rounded-xl border bg-card text-card-foreground shadow">
                <div class="flex flex-col space-y-1.5 p-6">
                    <h3
                        class="font-semibold leading-none tracking-tight flex items-center gap-2">
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
                    <p class="text-sm text-muted-foreground">Daftar
                        pengiriman hari ini</p>
                </div>
                <div class="p-6 pt-0">
                    <div class="space-y-3">
                        <% if (deliveries.isEmpty()) { %>
                        <div
                            class="text-center py-8 text-muted-foreground">
                            <p>Belum ada pengiriman hari ini</p>
                        </div>
                        <% } else { %>
                        <% for (Delivery d : deliveries) {%>
                        <div
                            class="flex items-center justify-between p-3 rounded-lg bg-muted/50">
                            <div
                                class="flex items-center gap-3">
                                <div
                                    class="w-10 h-10 rounded-lg bg-accent flex items-center justify-center">
                                    <svg xmlns="http://www.w3.org/2000/svg"
                                         width="20" height="20"
                                         viewBox="0 0 24 24"
                                         fill="none"
                                         stroke="currentColor"
                                         stroke-width="2"
                                         stroke-linecap="round"
                                         stroke-linejoin="round"
                                         class="text-primary">
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
                                    <p class="font-medium">
                                        <%= d.getSchool().getNama()%>
                                    </p>
                                    <p
                                        class="text-sm text-muted-foreground">
                                        <%= d.getJumlahKirim()%> porsi
                                    </p>
                                </div>
                            </div>
                            <div class="text-right">
                                <span class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 
                                      <%= d.getStatusPengiriman() == DeliveryStatus.dikirim
                                              ? "border-transparent bg-warning text-warning-foreground hover:bg-warning/80"
                                              : d.getStatusPengiriman() == DeliveryStatus.diterima
                                              ? "border-transparent bg-primary text-primary-foreground hover:bg-primary/80"
                                              : "border-transparent bg-destructive text-destructive-foreground hover:bg-destructive/80"%>">
                                    <%= d.getStatusPengiriman().name()%>
                                </span>
                                <% if (d.getWaktuKirim() != null) {%>
                                <p
                                    class="text-xs text-muted-foreground mt-1">
                                    Kirim: <%=d.getWaktuKirim().format(DateTimeFormatter.ofPattern("HH:mm"))%>
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