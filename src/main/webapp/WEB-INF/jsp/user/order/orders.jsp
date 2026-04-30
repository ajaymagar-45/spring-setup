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

<title>Orders</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;500;600&display=swap" rel="stylesheet">

<style>

/* ===== GLOBAL ===== */
body {
    margin: 0;
    font-family: 'Sora', sans-serif;
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
}

/* ===== LAYOUT ===== */
.app-wrapper {
    display: flex;
    min-height: 100vh;
}

/* ===== SIDEBAR ===== */
#navigation {
    width: 260px;
    min-height: 100vh;

    background: rgba(0,0,0,0.35);
    backdrop-filter: blur(15px);

    border-right: 1px solid rgba(255,255,255,0.08);
    padding: 20px;
    color: white;
}

.nav-section {
    font-size: 0.75rem;
    opacity: 0.6;
    margin: 18px 5px 8px;
    text-transform: uppercase;
}

.nav-item {
    display: flex;
    align-items: center;
    gap: 10px;

    padding: 10px 12px;
    margin: 6px 0;

    border-radius: 10px;

    color: rgba(255,255,255,0.9);
    text-decoration: none;   /* ✅ FIXED: removes link style */

    background: rgba(255,255,255,0.05);

    transition: 0.2s ease;
}

.nav-item:hover {
    background: rgba(79, 172, 254, 0.25);
    transform: translateX(4px);
    color: white;
}

.nav-item i {
    font-size: 1.1rem;
}

/* ===== CONTENT ===== */
.content {
    flex: 1;
    padding: 30px;
}

.page-card {
    background: rgba(255,255,255,0.07);
    backdrop-filter: blur(20px);
    border-radius: 20px;
    padding: 25px;
    color: #fff;
}

.page-title {
    font-size: 1.4rem;
    font-weight: 600;
}

/* TABLE */
.table-custom {
    color: #fff;
}

.table-custom th {
    background: rgba(255,255,255,0.08);
}

.table-custom td, .table-custom th {
    border-color: rgba(255,255,255,0.1) !important;
}

/* STATUS */
.status-progress { color: #4facfe; font-weight: 500; }
.status-canceled { color: #ff5252; font-weight: 500; }
.status-finished { color: #00c853; font-weight: 500; }

/* BUTTON */
.btn-view {
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

```
<!-- SIDEBAR (FIXED) -->
<div id="navigation">

    <div class="nav-section">Main</div>

    <a href="/" class="nav-item">
        <i class="bi bi-house"></i> Home
    </a>

    <!-- ✅ FIXED DASHBOARD -->
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

        <div class="page-title mb-3">
            <i class="bi bi-cart me-2"></i> Orders
        </div>

        <!-- TABLE -->
        <table class="table table-bordered table-custom text-center align-middle">

            <thead>
                <tr>
                    <th>Site</th>
                    <th>Party</th>
                    <th>Total</th>
                    <th>Date</th>
                    <th>Details</th>
                    <th>Status</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>

                        <td>${order.constructionSite.buildingName}</td>
                        <td>${order.orderingParty}</td>
                        <td>${order.totalPrice}</td>
                        <td>${order.date}</td>

                        <td>
                            <sf:form action="/orders/details" method="get">
                                <input type="hidden" value="${order.orderDetails.id}" name="orderDetailsId">
                                <button class="btn-view">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </sf:form>
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${order.status == 0}">
                                    <span class="status-progress">IN PROGRESS</span>
                                </c:when>
                                <c:when test="${order.status == 1}">
                                    <span class="status-canceled">CANCELED</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-finished">FINISHED</span>
                                </c:otherwise>
                            </c:choose>
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
