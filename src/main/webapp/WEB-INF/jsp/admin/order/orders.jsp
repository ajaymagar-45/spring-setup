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

<title>Construction Sites</title>

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
    text-decoration: none;

    background: rgba(255,255,255,0.05);
    transition: 0.2s;
}

.nav-item:hover {
    background: rgba(79, 172, 254, 0.25);
    transform: translateX(4px);
}

/* ===== CONTENT ===== */
.content {
    flex: 1;
    padding: 30px;
}

/* CARD */
.page-card {
    background: rgba(255,255,255,0.07);
    backdrop-filter: blur(20px);
    border-radius: 20px;
    padding: 25px;
    color: #fff;
}

/* TITLE */
.page-title {
    font-size: 1.4rem;
    font-weight: 600;
}

/* SEARCH */
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

/* BADGES */
.badge-success {
    background: #00c853;
}

.badge-finished {
    background: #2196f3;
}

/* BUTTON */
.btn-edit {
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


<!-- SIDEBAR (same as previous pages) -->
<div id="navigation">

    <div class="nav-section">Main</div>

    <a href="/" class="nav-item"><i class="bi bi-house"></i> Home</a>
    <a href="/admin" class="nav-item"><i class="bi bi-speedometer2"></i> Dashboard</a>

    <div class="nav-section">Management</div>

    <a href="/admin/users" class="nav-item"><i class="bi bi-people"></i> Users</a>
    <a href="/admin/catalog" class="nav-item"><i class="bi bi-box-seam"></i> Catalog</a>
    <a href="/admin/construction-sites" class="nav-item"><i class="bi bi-building"></i> Construction Sites</a>

    <div class="nav-section">System</div>

    <a href="/logout" class="nav-item"><i class="bi bi-box-arrow-right"></i> Logout</a>

</div>

<!-- CONTENT -->
<div class="content">

    <div class="page-card">

        <div class="page-title mb-3">
            <i class="bi bi-building me-2"></i> Construction Sites
        </div>

        <!-- SEARCH -->
        <div class="search-box mb-3">
            <form class="d-flex gap-2">
                <input type="search" placeholder="Search site...">
                <button type="submit"><i class="bi bi-search"></i></button>
            </form>
        </div>

        <!-- TABLE -->
        <table class="table table-bordered table-custom text-center align-middle">
            <thead>
                <tr>
                    <th>Building</th>
                    <th>Code</th>
                    <th>Street</th>
                    <th>No.</th>
                    <th>Locality</th>
                    <th>Zip</th>
                    <th>Country</th>
                    <th>Status</th>
                    <th>Options</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="cs" items="${cs}">
                    <tr>
                        <td>${cs.buildingName}</td>
                        <td>${cs.buildingCode}</td>
                        <td>${cs.constructionSiteAdress.street}</td>
                        <td>${cs.constructionSiteAdress.streetNumber}</td>
                        <td>${cs.constructionSiteAdress.locality}</td>
                        <td>${cs.constructionSiteAdress.zipCode}</td>
                        <td>${cs.constructionSiteAdress.country}</td>

                        <td>
                            <c:choose>
                                <c:when test="${cs.status == 0}">
                                    <span class="badge badge-success">IN PROGRESS</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-finished">FINISHED</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <sf:form action="/admin/construction-sites/edit" method="get">
                                <input type="hidden" value="${cs.id}" name="csid">
                                <button class="btn-edit">
                                    <i class="bi bi-pencil"></i>
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
