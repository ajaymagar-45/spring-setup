<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
body {
    font-family: 'Sora', sans-serif;
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    min-height: 100vh;
}

/* 🔥 Navbar */
.navbar {
    backdrop-filter: blur(12px);
    background: rgba(0,0,0,0.25);
    border-bottom: 1px solid rgba(255,255,255,0.1);
}

/* 🔥 Floating Icons */
.float-icon {
    position: fixed;
    color: #fff;
    opacity: 0.06;
    font-size: 3rem;
    animation: float 6s ease-in-out infinite;
}
@keyframes float {
    0%,100%{transform:translateY(0);}
    50%{transform:translateY(-20px);}
}

/* 🔥 FIXED GRID */
.dashboard-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); /* ✅ bigger cards */
    gap: 25px;
    padding: 40px;
    max-width: 1100px;   /* ✅ center layout */
    margin: 0 auto;
}

/* 🔥 Cards */
.dbpanel {
    background: rgba(255,255,255,0.08);
    border-radius: 20px;
    padding: 20px;
    min-height: 180px; /* ✅ bigger height */
    transition: 0.3s;
}
.dbpanel:hover {
    transform: translateY(-6px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.4);
}

.panel-header {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 15px;
}
.panel-icon {
    width: 45px;
    height: 45px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
}

.panel-tiles a {
    display: block;
    padding: 10px 12px;
    margin-bottom: 8px;
    border-radius: 10px;
    background: rgba(255,255,255,0.05);
    text-decoration: none;
    color: white;
    font-size: 0.9rem;
    transition: 0.2s;
}
.panel-tiles a:hover {
    background: rgba(79,172,254,0.2);
}
</style>

</head>

<body>

<!-- Floating Icons -->

<i class="bi bi-gear-fill float-icon" style="top:10%;left:5%"></i> <i class="bi bi-grid-3x3 float-icon" style="top:20%;right:5%"></i> <i class="bi bi-diagram-3 float-icon" style="bottom:10%;left:10%"></i> <i class="bi bi-shield-lock float-icon" style="bottom:15%;right:10%"></i>

<!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <div class="container-fluid">
        <a class="navbar-brand text-white fw-bold">🚀 SiteManager</a>


    <div class="ms-auto d-flex gap-3">
        <a href="/catalog" class="text-light"><i class="bi bi-grid"></i></a>
        <a href="/orders" class="text-light"><i class="bi bi-cart"></i></a>
        <a href="/logout" class="text-light"><i class="bi bi-box-arrow-right"></i></a>
    </div>
</div>


</nav>

<!-- Dashboard -->

<div class="dashboard-grid">


<!-- Users -->
<div class="dbpanel">
    <div class="panel-header">
        <div class="panel-icon" style="background: rgba(79,172,254,0.2)">
            <i class="bi bi-people-fill text-primary"></i>
        </div>
        <strong class="text-white">Users</strong>
    </div>
    <div class="panel-tiles">
        <a href="/admin/user-form"><i class="bi bi-person-plus-fill"></i> Add New</a>
        <a href="/admin/users"><i class="bi bi-search"></i> Search Account</a>
        <a href="/admin/security"><i class="bi bi-shield-lock-fill"></i> Security</a>
    </div>
</div>

<!-- Construction Sites -->
<div class="dbpanel">
    <div class="panel-header">
        <div class="panel-icon" style="background: rgba(250,199,75,0.2)">
            <i class="bi bi-building-fill-gear text-warning"></i>
        </div>
        <strong class="text-white">Construction Sites</strong>
    </div>
    <div class="panel-tiles">
        <a href="/admin/cs-form"><i class="bi bi-plus-circle-fill"></i> Add New</a>
        <a href="/admin/construction-sites"><i class="bi bi-search"></i> Search</a>
        <a href="/admin/construction-site/stock-list"><i class="bi bi-boxes"></i> Stock</a>
    </div>
</div>

<!-- Catalog -->
<div class="dbpanel">
    <div class="panel-header">
        <div class="panel-icon" style="background: rgba(0,230,200,0.2)">
            <i class="bi bi-grid-fill text-info"></i>
        </div>
        <strong class="text-white">Catalog</strong>
    </div>
    <div class="panel-tiles">
        <a href="/admin/catalog/add-item"><i class="bi bi-plus-circle-fill"></i> Add Item</a>
        <a href="/admin/catalog/products"><i class="bi bi-pencil-fill"></i> Edit</a>
    </div>
</div>

<!-- Orders -->
<div class="dbpanel">
    <div class="panel-header">
        <div class="panel-icon" style="background: rgba(97,199,100,0.2)">
            <i class="bi bi-cart-check-fill text-success"></i>
        </div>
        <strong class="text-white">Orders</strong>
    </div>
    <div class="panel-tiles">
        <a href="/admin/orders"><i class="bi bi-clipboard-check-fill"></i> Check</a>
        <a href="/admin/orders/history"><i class="bi bi-clock-history"></i> History</a>
    </div>
</div>

<!-- Liabilities -->
<div class="dbpanel">
    <div class="panel-header">
        <div class="panel-icon" style="background: rgba(240,83,158,0.2)">
            <i class="bi bi-bar-chart-fill text-danger"></i>
        </div>
        <strong class="text-white">Liabilities</strong>
    </div>
    <div class="panel-tiles">
        <a href="/admin/liabilities"><i class="bi bi-graph-up-arrow"></i> View</a>
    </div>
</div>


</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
