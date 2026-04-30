<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Catalog</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;500;600&display=swap" rel="stylesheet">

<style>

body {
    font-family: 'Sora', sans-serif;
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    margin: 0;
}

/* ===== LAYOUT ===== */
.app-wrapper {
    display: flex;
    min-height: 100vh;
}

/* ===== SIDEBAR (FIXED VERSION) ===== */
#navigation {
    width: 260px;
    min-height: 100vh;

    background: rgba(0, 0, 0, 0.35);
    backdrop-filter: blur(15px);

    border-right: 1px solid rgba(255,255,255,0.08);

    padding: 20px;
    color: white;
}

/* sidebar sections */
.nav-section {
    font-size: 0.75rem;
    opacity: 0.6;
    margin: 18px 5px 8px;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: rgba(255,255,255,0.7);
}

/* sidebar links */
.nav-item {
    display: flex;
    align-items: center;
    gap: 10px;

    padding: 10px 12px;
    margin: 6px 0;

    border-radius: 10px;

    color: rgba(255,255,255,0.9);
    text-decoration: none;

    background: rgba(255,255,255,0.05);

    transition: all 0.2s ease;
}

/* hover */
.nav-item:hover {
    background: rgba(79, 172, 254, 0.25);
    transform: translateX(4px);
    color: white;
}

/* icons */
.nav-item i {
    font-size: 1.1rem;
}

/* ===== CONTENT ===== */
.content {
    flex: 1;
    padding: 30px;
}

/* glass card */
.page-card {
    background: rgba(255,255,255,0.08);
    border-radius: 20px;
    padding: 25px;
    color: white;
}

/* title */
.page-title {
    font-size: 1.4rem;
    font-weight: 600;
    margin-bottom: 20px;
}

/* search */
.search-box input {
    background: rgba(255,255,255,0.1);
    border: none;
    color: white;
    border-radius: 10px;
    padding: 0.4rem 0.7rem;
}
.search-box button {
    border-radius: 10px;
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
    padding: 0.4rem 0.8rem;
}

/* table */
.table-custom {
    color: #fff;
}
.table-custom th {
    background: rgba(255,255,255,0.08);
}
.table-custom td, .table-custom th {
    border-color: rgba(255,255,255,0.1) !important;
}

/* button */
.btn-action {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
    border-radius: 8px;
    padding: 0.3rem 0.6rem;
    color: black;
}

</style>

</head>

<body>

<div class="app-wrapper">


<!-- SIDEBAR -->
<div id="navigation">

    <div class="nav-section">Main</div>

    <a href="/" class="nav-item">
        <i class="bi bi-house"></i> Home
    </a>

    <a href="/admin" class="nav-item">
        <i class="bi bi-speedometer2"></i> Dashboard
    </a>

    <div class="nav-section">Management</div>

    <a href="/admin/users" class="nav-item">
        <i class="bi bi-people"></i> Users
    </a>

    <a href="/admin/catalog" class="nav-item">
        <i class="bi bi-box-seam"></i> Catalog
    </a>

    <a href="/admin/construction-sites" class="nav-item">
        <i class="bi bi-building"></i> Construction Sites
    </a>

    <div class="nav-section">System</div>

    <a href="/logout" class="nav-item">
        <i class="bi bi-box-arrow-right"></i> Logout
    </a>

</div>

<!-- CONTENT -->
<div class="content">

    <div class="page-card">

        <div class="page-title">
            <i class="bi bi-box-seam me-2"></i> Catalog
        </div>

        <!-- SEARCH -->
        <div class="search-box mb-3">
            <sf:form action="/admin/catalog/product" method="get" class="d-flex gap-2">
                <input type="search" name="productName" placeholder="Search product...">
                <button type="submit"><i class="bi bi-search"></i></button>
            </sf:form>
        </div>

        <!-- TABLE -->
        <table class="table table-bordered table-custom text-center align-middle">
            <thead>
                <tr>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Availability</th>
                    <th>Price / Day</th>
                    <th>Details</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td>${product.productCode}</td>
                        <td>${product.productName}</td>
                        <td>${product.productCategory}</td>
                        <td>${product.availability}</td>
                        <td>${product.productPrice}</td>

                        <td>
                            <sf:form action="/admin/catalog/edit-item" method="get">
                                <input type="hidden" value="${product.id}" name="itemId">
                                <button class="btn-action">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </sf:form>
                        </td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </div>

</div>


</div>

</body>
</html>
