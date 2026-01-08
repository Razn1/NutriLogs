<style>
    :root {
        --sidebar-bg: #1e293b; /* Biru gelap charcoal */
        --accent-green: #22c55e; /* Hijau NutriLog */
        --card-dark: #2d3a4f; /* Warna kartu admin */
    }

    body {
        background-color: #f8fafc;
    }

    .sidebar {
        position: sticky;
        overflow-y: auto;
        top: 0;
        width: 280px;
        height: 100vh;
        background-color: var(--sidebar-bg);
        color: white;
        padding: 24px;
        display: flex;
        flex-direction: column;
    }

    /* Logo Section */
    .logo-container {
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 32px;
    }

    .logo-icon {
        background-color: var(--accent-green);
        padding: 8px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* Admin Info Card */
    .admin-card {
        background-color: var(--card-dark);
        border-radius: 16px;
        padding: 12px 16px;
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 32px;
    }

    .admin-icon-circle {
        background-color: rgba(255, 255, 255, 0.1);
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 1px solid rgba(255,255,255,0.2);
    }

    /* Menu Navigation */
    .nav-link {
        color: #94a3b8; /* Abu-abu muted */
        font-weight: 500;
        padding: 12px 16px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        gap: 12px;
        transition: all 0.3s ease;
        margin-bottom: 8px;
        text-decoration: none;
    }

    /* Menu Dashboard (Active) */
    .nav-link.active {
        background-color: var(--accent-green);
        color: white !important;
    }

    .nav-link:hover:not(.active) {
        background-color: rgba(255,255,255,0.05);
    }

    /* Logout at bottom */
    .logout-container {
        margin-top: auto;
    }

    .small-text {
        font-size: 0.75rem;
        color: #94a3b8;
        display: block;
    }
</style>

<div class="sidebar shadow">
    <div class="logo-container">
        <div class="logo-icon text-white">
            <i class="fa-regular fa-truck"></i>
        </div>
        <div>
            <h5 class="m-0 fw-bold">NutriLog</h5>
            <span class="small-text">Distribution System</span>
        </div>
    </div>

    <div class="admin-card">
        <div class="admin-icon-circle logo-icon text-white">
            <i class="fa-solid fa-clipboard-check"></i>
        </div>
        <div>
            <p class="m-0 fw-semibold" style="font-size: 0.9rem;">adminaudit</p>
            <span class="small-text">Admin Audit</span>
        </div>
    </div>

    <nav class="nav flex-column">
        <a href="#" class="nav-link active d-inline-flex text-white">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-layout-dashboard w-5 h-5"><rect width="7" height="9" x="3" y="3" rx="1"></rect><rect width="7" height="5" x="14" y="3" rx="1"></rect><rect width="7" height="9" x="14" y="12" rx="1"></rect><rect width="7" height="5" x="3" y="16" rx="1"></rect></svg>
            Dashboard
        </a>
        <a href="#" class="nav-link d-inline-flex text-white">
            <i class="fa-solid fa-school-circle-check"></i>
            Kelola Data Sekolah
        </a>
    </nav>

    <div class="logout-container">
        <a href="#" class="nav-link p-2">
            <i class="fa-solid fa-arrow-right-from-bracket"></i>
            Keluar
        </a>
    </div>
</div>
