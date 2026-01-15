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

                <body class="bg-background min-h-screen">
                    <%@ include file="../navbar.jspf" %>

                        <main class="max-w-2xl mx-auto px-4 py-8 space-y-6">
                            <!-- Header -->
                            <div class="flex items-center gap-4">
                                <a href="<%= request.getContextPath() %>/kitchen/dashboard"
                                    class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground h-10 w-10">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round">
                                        <path d="m12 19-7-7 7-7" />
                                        <path d="M19 12H5" />
                                    </svg>
                                </a>
                                <div>
                                    <h1 class="text-2xl font-bold">Input Pengiriman</h1>
                                    <p class="text-muted-foreground">Catat pengiriman makanan ke sekolah</p>
                                </div>
                            </div>

                            <div class="rounded-xl border bg-card text-card-foreground shadow">
                                <div class="flex flex-col space-y-1.5 p-6">
                                    <h3 class="font-semibold leading-none tracking-tight flex items-center gap-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round" class="text-primary">
                                            <line x1="22" y1="2" x2="11" y2="13" />
                                            <polygon points="22 2 15 22 11 13 2 9 22 2" />
                                        </svg>
                                        Data Pengiriman
                                    </h3>
                                    <p class="text-sm text-muted-foreground">Lengkapi data pengiriman makanan</p>
                                </div>
                                <div class="p-6 pt-0">
                                    <form action="<%= request.getContextPath() %>/kitchen/delivery/submit" method="POST"
                                        class="space-y-6">

                                        <!-- School Selection -->
                                        <div class="space-y-2">
                                            <label for="school" class="text-sm font-medium leading-none">Sekolah
                                                Tujuan</label>
                                            <select name="schoolId" id="school" required
                                                class="flex h-12 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50">
                                                <option value="">Pilih sekolah tujuan</option>
                                                <% List<School> schools = (List<School>)
                                                        request.getAttribute("schools");
                                                        for(School s : schools) {
                                                        %>
                                                        <option value="<%= s.getId() %>">
                                                            <%= s.getNama() %> (<%= s.getJumlahSiswa() %> siswa)
                                                        </option>
                                                        <% } %>
                                            </select>
                                        </div>

                                        <!-- Vehicle Selection -->
                                        <div class="space-y-2">
                                            <label for="vehicle"
                                                class="text-sm font-medium leading-none">Kendaraan</label>
                                            <select name="vehicleId" id="vehicle" required
                                                class="flex h-12 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50">
                                                <option value="">Pilih kendaraan</option>
                                                <% List<Vehicle> vehicles = (List<Vehicle>)
                                                        request.getAttribute("vehicles");
                                                        for(Vehicle v : vehicles) {
                                                        %>
                                                        <option value="<%= v.getId() %>">
                                                            <%= v.getNamaKendaraan() %> - <%= v.getPlatNomor() %> (Max
                                                                    <%= v.getKapasitas() %>)
                                                        </option>
                                                        <% } %>
                                            </select>
                                        </div>

                                        <!-- Quantity -->
                                        <div class="space-y-2">
                                            <label for="quantity" class="text-sm font-medium leading-none">Jumlah
                                                Porsi</label>
                                            <input type="number" id="quantity" name="jumlahKirim" required min="1"
                                                class="flex h-12 w-full rounded-md border border-input bg-background px-3 py-2 text-lg ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                                                placeholder="Masukkan jumlah porsi">
                                        </div>

                                        <!-- Submit Button -->
                                        <button type="submit"
                                            class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-12 px-4 py-2 w-full shadow-lg">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round" class="mr-2">
                                                <line x1="22" y1="2" x2="11" y2="13" />
                                                <polygon points="22 2 15 22 11 13 2 9 22 2" />
                                            </svg>
                                            Kirim Pengiriman
                                        </button>

                                    </form>
                                </div>
                            </div>
                        </main>
                </body>

                </html>