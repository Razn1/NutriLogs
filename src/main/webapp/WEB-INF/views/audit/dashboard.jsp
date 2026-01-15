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

<body class="bg-background min-h-screen">
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

                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("EEEE, d MMMM yyyy",
                        new Locale("id", "ID"));
                String today = LocalDate.now().format(dtf);
                int currentHour = java.time.LocalTime.now().getHour();
            %>

    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-8">
        <div>
            <h1 class="text-3xl font-bold">Dashboard Audit</h1>
            <p class="text-muted-foreground mt-1">Monitoring kepatuhan dan kualitas pengiriman</p>
        </div>
        

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
        <div class="rounded-xl border bg-card text-card-foreground shadow overflow-hidden">
            <div class="overflow-x-auto">
                <table class="w-full text-sm text-left">
                    <thead class="text-xs text-muted-foreground uppercase bg-muted/50">
                        <tr>
                            <th class="px-6 py-4 font-medium">Waktu</th>
                            <th class="px-6 py-4 font-medium">Dari</th>
                            <th class="px-6 py-4 font-medium">Ke</th>
                            <th class="px-6 py-4 font-medium">Status Pengiriman</th>
                            <th class="px-6 py-4 font-medium">Status Penerimaan</th>
                            <th class="px-6 py-4 font-medium">Audit Flags</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-border">
                        <% 
                        
                        // SAFETY CHECK: Only loop if list exists
                        if (deliveries != null && !deliveries.isEmpty()) {
                            for (Delivery d : deliveries) {
                                AuditFlags flags = AuditUtils.getAuditFlags(d);
                                boolean needsAttention = flags.isLate || 
                                                       flags.hasQuantityMismatch || 
                                                       flags.hasBadQuality || 
                                                       flags.hasIssues;
                        %>
                        <tr class="bg-card hover:bg-muted/30 transition-colors <%= needsAttention ? "bg-red-50/50" : "" %>">
                            <td class="px-6 py-4 whitespace-nowrap">
                                <p class="font-medium">
                                    <%= d.getTanggal() %>
                                </p>
                                <% if (d.getWaktuKirim() != null) { %>
                                    <p class="text-xs text-muted-foreground">Kirim:
                                        <%= d.getWaktuKirim().format(DateTimeFormatter.ofPattern("HH:mm")) %>
                                    </p>
                                <% } %>
                            </td>
                            <td class="px-6 py-4">
                                <p class="font-medium">
                                    <%= (d.getKitchen() != null) ? d.getKitchen().getNama() : "Unknown Kitchen" %>
                                </p>
                            </td>
                            <td class="px-6 py-4">
                                <p class="font-medium">
                                    <%= (d.getSchool() != null) ? d.getSchool().getNama() : "Unknown School" %>
                                </p>
                            </td>
                            <td class="px-6 py-4">
                                <div class="space-y-1">
                                    <p class="font-medium">
                                        <%= d.getStatusPengiriman() %>
                                    </p>
                                    <p class="text-xs text-muted-foreground">Qty:
                                        <%= d.getJumlahKirim() %>
                                    </p>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <% if (d.getWaktuTerima() != null) { %>
                                    <div class="space-y-1">
                                        <p class="font-medium">
                                            <%= d.getWaktuTerima().format(DateTimeFormatter.ofPattern("HH:mm")) %>
                                        </p>
                                        <p class="text-xs text-muted-foreground">
                                            Qty: <%= d.getJumlahTerima() %>
                                        </p>
                                        <p class="text-xs font-semibold <%= flags.hasBadQuality ? "text-destructive" : "text-primary" %>">
                                            <%= d.getKualitasMakanan() %>
                                        </p>
                                    </div>
                                <% } else { %>
                                    <span class="text-muted-foreground">-</span>
                                <% } %>
                            </td>
                            <td class="px-6 py-4">
                                <div class="flex flex-wrap gap-2">
                                    <% if (flags.isLate) { %>
                                        <span class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-destructive text-destructive-foreground hover:bg-destructive/80">
                                            Terlambat
                                        </span>
                                    <% } %>
                                    <% if (flags.hasQuantityMismatch) { %>
                                        <span class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-warning text-warning-foreground hover:bg-warning/80">
                                            Selisih Qty
                                        </span>
                                    <% } %>
                                    <% if (flags.hasBadQuality) { %>
                                        <span class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-destructive text-destructive-foreground hover:bg-destructive/80">
                                            Kualitas Buruk
                                        </span>
                                    <% } %>
                                    <% if (!needsAttention) { %>
                                        <span class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-primary/20 text-primary hover:bg-primary/30">
                                            OK
                                        </span>
                                    <% } %>
                                </div>
                            </td>
                        </tr>
                        <% 
                            } // End For Loop
                        } else { // Handle empty list 
                        %>
                            <tr>
                                <td colspan="6" class="px-6 py-4 text-center text-muted-foreground">
                                    Tidak ada data pengiriman.
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</body>
</html>