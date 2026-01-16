<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NutriLog - Login</title>
        <%@ include file="header.jspf" %>
    </head>

    <body class="min-vh-100 d-flex align-items-center justify-content-center p-4">
        <div class="bg-mesh"></div>
        <div class="glass p-5 rounded-4 shadow-lg border-light w-100" style="max-width: 30rem;">
            <div class="text-center mb-4">
                <div class="d-inline-flex align-items-center justify-content-center rounded-3 bg-emerald-100 text-emerald mb-3"
                    style="width: 3rem; height: 3rem;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M14 18V6a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v11a1 1 0 0 0 1 1h2" />
                        <path d="M15 18H9" />
                        <path d="M19 18h2a1 1 0 0 0 1-1v-3.65a1 1 0 0 0-.22-.624l-3.48-4.35A1 1 0 0 0 17.52 8H14" />
                        <circle cx="7" cy="18" r="2" />
                        <circle cx="17" cy="18" r="2" />
                    </svg>
                </div>
                <h1 class="h3 fw-bold tracking-tight text-dark">Selamat Datang di NutriLog</h1>
                <p class="text-secondary">Sistem Manajemen Distribusi Makan Bergizi Gratis</p>
            </div>

            <% if (request.getAttribute("error") !=null) { %>
                <div class="alert alert-danger py-2 px-3 small fw-medium mb-4 rounded-3 text-center">
                    <%= request.getAttribute("error") %>
                </div>
                <% } %>

                    <form action="<%= request.getContextPath() %>/login" method="POST" class="d-flex flex-column gap-3">
                        <div class="mb-1">
                            <label for="email" class="form-label small fw-medium">Email</label>
                            <input type="email" id="email" name="email" required class="form-control"
                                placeholder="admin@example.com">
                        </div>

                        <div class="mb-1">
                            <label for="password" class="form-label small fw-medium">Password</label>
                            <input type="password" id="password" name="password" required class="form-control" placeholder="********">
                        </div>

                        <button type="submit" class="btn btn-primary-custom w-100 py-2 mt-2 shadow-sm">
                            Masuk
                        </button>
                    </form>

                    <div class="mt-4 text-center border-top border-light pt-4">
                        <a href="${pageContext.request.contextPath}/"
                            class="btn-glass text-decoration-none d-inline-flex align-items-center gap-2 small">
                            <i data-lucide="arrow-left" style="width: 16px;"></i>
                            Kembali ke Beranda
                        </a>
                    </div>
        </div>
        <script>
            lucide.createIcons();
        </script>
    </body>

    </html>