<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
body {
    font-family: 'Sora', sans-serif;
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    min-height: 100vh;
    overflow-x: hidden;
}

/* 🔥 Navbar */
.navbar {
    backdrop-filter: blur(12px);
    background: rgba(0,0,0,0.25) !important;
    border-bottom: 1px solid rgba(255,255,255,0.1);
}
.nav-link:hover {
    color: #4facfe !important;
}

/* 🔥 Floating Icons */
.float-icon {
    position: fixed;
    color: #fff;
    opacity: 0.06;
    font-size: 3rem;
    animation: float 6s ease-in-out infinite;
    pointer-events: none;
}
.float-icon:nth-child(1){top:10%; left:5%;}
.float-icon:nth-child(2){top:20%; right:5%;}
.float-icon:nth-child(3){bottom:10%; left:10%;}
.float-icon:nth-child(4){bottom:15%; right:10%;}

@keyframes float {
    0%,100%{transform:translateY(0);}
    50%{transform:translateY(-20px);}
}

/* Hero */
.hero-section {
    text-align: center;
    padding: 60px 20px;
}
.hero-section h1 {
    color: #fff;
}
.hero-section span {
    background: linear-gradient(90deg, #4facfe, #00f2fe);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}
.hero-section p {
    color: rgba(255,255,255,0.6);
}

/* Cards */
.quick-card {
    background: rgba(255,255,255,0.08);
    border-radius: 15px;
    padding: 20px;
    text-decoration: none;
    color: white;
    transition: 0.3s;
}
.quick-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.4);
}
.icon-box {
    font-size: 22px;
    margin-bottom: 10px;
}
</style>

</head>

<body>

<!-- 🔥 Floating Icons -->

<i class="bi bi-gear-fill float-icon"></i> <i class="bi bi-grid-3x3-gap float-icon"></i> <i class="bi bi-diagram-3 float-icon"></i> <i class="bi bi-shield-lock float-icon"></i>

<!-- 🔥 Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-white" href="#">🚀 SiteManager</a>


    <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#nav">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="nav">
        <ul class="navbar-nav gap-3">

            <li class="nav-item">
                <a class="nav-link text-light" href="/catalog">
                    <i class="bi bi-grid"></i> Catalog
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link text-light" href="/orders">
                    <i class="bi bi-cart"></i> Orders
                </a>
            </li>

            <sec:authorize access="hasRole('ADMIN')">
                <li class="nav-item">
                    <a class="nav-link text-light" href="/admin">
                        <i class="bi bi-speedometer2"></i> Admin
                    </a>
                </li>
            </sec:authorize>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle text-light" data-bs-toggle="dropdown">
                    <i class="bi bi-person-circle"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="#">Profile</a></li>
                    <li><a class="dropdown-item" href="/logout">Logout</a></li>
                </ul>
            </li>

        </ul>
    </div>
</div>


</nav>

<!-- 🔥 Hero -->

<div class="hero-section">
    <h1>Welcome to <span>SiteManager</span></h1>
    <p>Manage construction sites, orders and catalog in one place</p>


<div class="d-flex justify-content-center gap-3 mt-3">
    <sec:authorize access="hasRole('ADMIN')">
        <a href="/admin" class="btn btn-primary px-4">Admin Dashboard</a>
    </sec:authorize>
    <a href="/orders" class="btn btn-outline-light">Orders</a>
    <a href="/catalog" class="btn btn-outline-light">Catalog</a>
</div>


</div>

<!-- 🔥 Quick Access (With Icons) -->

<div class="container mt-5">
    <div class="row g-4 text-center">


    <sec:authorize access="hasRole('ADMIN')">
        <div class="col-md-3">
            <a href="/admin/users" class="quick-card d-block">
                <div class="icon-box"><i class="bi bi-people-fill text-primary"></i></div>
                Users
            </a>
        </div>
    </sec:authorize>

    <div class="col-md-3">
        <a href="/admin/construction-sites" class="quick-card d-block">
            <div class="icon-box"><i class="bi bi-building text-warning"></i></div>
            Construction Sites
        </a>
    </div>

    <div class="col-md-3">
        <a href="/admin/catalog/products" class="quick-card d-block">
            <div class="icon-box"><i class="bi bi-grid-fill text-info"></i></div>
            Catalog
        </a>
    </div>

    <div class="col-md-3">
        <a href="/admin/orders" class="quick-card d-block">
            <div class="icon-box"><i class="bi bi-cart-check-fill text-success"></i></div>
            Orders
        </a>
    </div>

</div>


</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
