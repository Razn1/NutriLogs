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

        <body class="bg-background min-h-screen">
            <%@ include file="../navbar.jspf" %>

                <main class="max-w-2xl mx-auto px-4 py-8 space-y-6">
                    <% Delivery d=(Delivery) request.getAttribute("delivery"); %>

                        <!-- Header -->
                        <div class="flex items-center gap-4">
                            <a href="<%= request.getContextPath() %>/school/dashboard"
                                class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground h-10 w-10">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round">
                                    <path d="m12 19-7-7 7-7" />
                                    <path d="M19 12H5" />
                                </svg>
                            </a>
                            <div>
                                <h1 class="text-2xl font-bold">Konfirmasi Penerimaan</h1>
                                <p class="text-muted-foreground">Verifikasi makanan yang diterima</p>
                            </div>
                        </div>

                        <div class="rounded-xl border bg-card text-card-foreground shadow">
                            <div class="p-6 space-y-6">
                                <!-- Delivery Info -->
                                <div class="p-4 rounded-lg bg-accent/50 space-y-2">
                                    <h4 class="font-semibold">Info Pengiriman</h4>
                                    <div class="grid grid-cols-2 gap-4 text-sm">
                                        <div>
                                            <p class="text-muted-foreground">Kitchen</p>
                                            <p class="font-medium">
                                                <%= d.getKitchen().getNama() %>
                                            </p>
                                        </div>
                                        <div>
                                            <p class="text-muted-foreground">Jumlah Kirim</p>
                                            <p class="font-medium">
                                                <%= d.getJumlahKirim() %> porsi
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <form action="<%= request.getContextPath() %>/school/confirm" method="POST"
                                    class="space-y-6">
                                    <input type="hidden" name="id" value="<%= d.getId() %>">

                                    <!-- Received Quantity -->
                                    <div class="space-y-2">
                                        <label for="jumlahTerima" class="text-sm font-medium leading-none">Jumlah
                                            Diterima</label>
                                        <input type="number" id="jumlahTerima" name="jumlahTerima" required
                                            class="flex h-12 w-full rounded-md border border-input bg-background px-3 py-2 text-lg ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                                            placeholder="<%= d.getJumlahKirim() %>" value="<%= d.getJumlahKirim() %>">
                                        <p class="text-sm text-mudted-foreground">Sesuaikan jika jumlah berbeda</p>
                                    </div>

                                    <!-- Quality -->
                                    <div class="space-y-2">
                                        <label for="kualitasMakanan" class="text-sm font-medium leading-none">Kualitas
                                            Makanan</label>
                                        <select name="kualitasMakanan" id="kualitasMakanan" required
                                            class="flex h-12 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50">
                                            <option value="sangat_baik">Sangat Baik</option>
                                            <option value="baik">Baik</option>
                                            <option value="cukup">Cukup</option>
                                            <option value="buruk">Buruk (Komplain)</option>
                                        </select>
                                    </div>

                                    <!-- Notes -->
                                    <div class="space-y-2">
                                        <label for="catatanKualitas" class="text-sm font-medium leading-none">Catatan /
                                            Kualitas</label>
                                        <textarea id="catatanKualitas" name="catatanKualitas" rows="3"
                                            class="flex w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                                            placeholder="Tambahkan catatan jika ada masalah..."></textarea>
                                    </div>

                                    <!-- Submit Button -->
                                    <button type="submit"
                                        class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-12 px-4 py-2 w-full shadow-lg">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round" class="mr-2">
                                            <polyline points="20 6 9 17 4 12" />
                                        </svg>
                                        Konfirmasi Penerimaan
                                    </button>

                                </form>
                            </div>
                        </div>
                </main>
        </body>

        </html>