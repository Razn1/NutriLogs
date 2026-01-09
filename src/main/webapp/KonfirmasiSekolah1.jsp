<%-- 
    Document   : konfirmasi1
    Created on : 9 Jan 2026, 14.33.36
    Author     : AZAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Konfirmasi Penerimaan</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-50 p-6 font-sans">
        <div class="max-w-md mx-auto space-y-6">

            <!-- Header -->
            <div class="flex items-center gap-4 mb-6">
                <button class="h-10 w-10 rounded-lg hover:bg-gray-200 flex items-center justify-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-gray-700" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path d="M12 19L5 12L12 5" />
                    <path d="M19 12H5" />
                    </svg>
                </button>
                <div>
                    <h1 class="text-xl font-bold">Konfirmasi Penerimaan</h1>
                    <p class="text-sm text-gray-500">Langkah 1 dari 3</p>
                </div>
            </div>

            <!-- Status Terlambat -->
            <div class="bg-red-100 border border-red-300 text-red-800 rounded-xl p-4 mb-4">
                <h2 class="font-semibold">Terlambat Tiba</h2>
                <p class="text-sm">Pengiriman tiba setelah 11:00</p>
            </div>

            <!-- Info Dapur -->
            <div class="rounded-xl bg-white shadow-sm border border-green-300 p-4 mb-4">
                <div class="flex items-center gap-3">
                    <div class="w-14 h-14 rounded-xl bg-green-100 flex items-center justify-center">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-7 h-7 text-green-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path d="M14 18V6a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v11a1 1 0 0 0 1 1h2" />
                        <path d="M15 18H9" />
                        <path d="M19 18h2a1 1 0 0 0 1-1v-3.65a1 1 0 0 0-.22-.624l-3.48-4.35A1 1 0 0 0 17.52 8H14" />
                        <circle cx="17" cy="18" r="2" />
                        <circle cx="7" cy="18" r="2" />
                        </svg>
                    </div>
                    <div class="flex-1">
                        <p class="font-semibold">Dapur Pusat Jakarta Selatan</p>
                        <p class="text-sm text-gray-500">B 7890 NLG</p>
                        <div class="inline-flex items-center bg-yellow-300 text-yellow-900 rounded-full px-3 py-1 text-xs mt-1 animate-pulse">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-3 h-3 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path d="M11 21.73a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73z" />
                            <path d="M12 22V12" />
                            <path d="m3.3 7 7.703 4.734a2 2 0 0 0 1.994 0L20.7 7" />
                            <path d="m7.5 4.27 9 5.15" />
                            </svg>
                            390 porsi dikirim
                        </div>
                    </div>
                </div>
            </div>
            <!-- Form Jumlah Diterima -->
            <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-4 mt-4">
                <h2 class="text-base font-semibold mb-2">Jumlah Diterima</h2>
                <p class="text-sm text-gray-500 mb-4">Masukkan jumlah porsi yang diterima</p>

                <form action="prosesJumlah.jsp" method="post" class="space-y-4">
                    <div>
                        <label for="jumlahPorsi" class="block text-sm font-medium text-gray-700 mb-1">Jumlah Porsi</label>
                        <input
                            type="number"
                            id="jumlahPorsi"
                            name="jumlahPorsi"
                            class="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-primary"
                            placeholder="Masukkan jumlah"
                            required
                            />
                    </div>

                    <p class="text-xs text-gray-500">Jumlah dikirim: <strong>390 porsi</strong></p>

                    <button
                        type="submit"
                        class="mt-4 w-full bg-green-600 text-white text-sm font-semibold py-2 px-4 rounded-lg hover:bg-green-700 transition-colors"
                        >
                        Lanjut ke Kualitas
                    </button>
                </form>
            </div>
        </div>
    </body>

</html>