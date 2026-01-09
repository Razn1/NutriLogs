<style>
    :root {
        --accent-green: #2ecc71;
        --dark-text: #1f2937;
    }

    .brand-text {
        font-family: 'Poppins', sans-serif;
        font-weight: 700;
        font-size: 22px;
        color: var(--dark-text);
    }

    .logo-icon {
        background-color: var(--accent-green);
        padding: 8px;
        border-radius: 12px;
        width: 42px;
        height: 42px;
    }

    .menu-toggle-btn {
        background: white;
        /*border: 2px solid var(--accent-green);*/
        color: var(--dark-text);
        width: 40px;
        height: 40px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: 0.2s;
    }

    .navbar {
        position: fixed !important;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 1050; 
        height: 70px; 
        display: flex;
        align-items: center;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    body {
        padding-top: 75px !important; 
    }

    .menu-dropdown {
        position: fixed;
        top: 70px;
        left: 0;
        width: 100%;
        background: white;
        z-index: 1040;
        padding: 15px;
        opacity: 0;
        visibility: hidden;
        transform: translateY(-10px);
        transition: all 0.4s ease-in-out;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    .menu-dropdown.show {
        opacity: 1;
        visibility: visible;
        transform: translateY(0);
    }

    .menu-content {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .menu-item {
        text-decoration: none;
        color: var(--dark-text);
        padding: 12px 20px;
        border-radius: 12px;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: 15px;
        transition: 0.2s;
    }

    .menu-item.active {
        background-color: var(--accent-green);
        color: white;
    }

    .menu-item:hover:not(.active) {
        background-color: #f8f9fa;
    }
</style>

<nav class="navbar navbar-light bg-light border-bottom">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <a class="navbar-brand d-inline-flex align-items-center ms-2 gap-2" href="#">
            <div class="logo-icon text-white d-flex align-items-center justify-content-center">
                <i class="fa-solid fa-truck"></i>
            </div>
            <span class="brand-text">NutriLogs</span>
        </a>

        <button class="menu-toggle-btn me-2" id="menuBtn">
            <i class="fa-solid fa-bars" id="menuIcon"></i>
        </button>
    </div>
</nav>

<div class="menu-dropdown" id="menuDropdown">
    <div class="menu-content">
        <a href="#" class="menu-item active">
            <i class="fa-solid fa-table-columns"></i> Dashboard
        </a>
        <a href="#" class="menu-item">
            <i class="fa-solid fa-box-archive"></i> Konfirmasi
        </a>
        <a href="#" class="menu-item text-danger">
            <i class="fa-solid fa-arrow-right-from-bracket"></i> Keluar
        </a>
    </div>
</div>

<script>
    const menuBtn = document.getElementById('menuBtn');
    const menuDropdown = document.getElementById('menuDropdown');
    const menuIcon = document.getElementById('menuIcon');

    menuBtn.addEventListener('click', (e) => {
        // Mencegah event bubbling agar tidak langsung terpicu window click
        e.stopPropagation(); 
        
        const isShowing = menuDropdown.classList.toggle('show');
        
        // Animasi icon berganti
        if (isShowing) {
            menuIcon.classList.replace('fa-bars', 'fa-xmark');
        } else {
            menuIcon.classList.replace('fa-xmark', 'fa-bars');
        }
    });

    // Menutup menu jika user mengklik area di luar menu atau di dashboard
    window.addEventListener('click', (e) => {
        if (!menuDropdown.contains(e.target) && menuDropdown.classList.contains('show')) {
            menuDropdown.classList.remove('show');
            menuIcon.classList.replace('fa-xmark', 'fa-bars');
        }
    });
</script>