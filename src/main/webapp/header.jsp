<style>
    .text {
        color: #000;
        font-size: 1.5rem;
        font-weight: bold;
    }

    .nav-link {
        transition: background-color 0.3s ease;
        border-radius: 0.25rem;
        padding: 0.5rem 1rem;
        font-size: 1rem;
        font-weight: bold;
    }

    .nav-link.active {
        color: white;
        background-color: #115e59; /* teal-800 */
    }

    .nav-link:hover {
        background-color: #148f87; /* lebih terang */
        color: white;
    }
</style>

<nav class="navbar bg-body-tertiary">
    <div class="container-fluid my-5">
        <div class="container-fluid d-flex justify-content-start mx-3 gap-5">
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand headline" href="">NutriLog</a>
        </div>
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header bg-body-tertiary">
                <h5 class="offcanvas-title headline" id="offcanvasNavbarLabel">NutriLog</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav flex-column gap-2">

                    <!-- Admin Sekolah -->
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="index.jsp?halaman=dashboard">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp?halaman=konfirmasiPengiriman">Konfirmasi</a>
                    </li>

                    <!-- Admin Dapur -->
                    <li class="nav-item">
                        <a class="nav-link" href="#">Dashboard</a>
                    </li>

                    <!-- Admin Audit -->
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</nav>