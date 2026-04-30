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
body {
    font-family: 'Sora', sans-serif;
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
}

/* Navbar */
.navbar {
    backdrop-filter: blur(12px);
    background: rgba(0,0,0,0.25);
}

/* Card */
.page-card {
    max-width: 1200px;
    margin: 40px auto;
    background: rgba(255,255,255,0.08);
    border-radius: 20px;
    padding: 30px;
    color: white;
}

/* Search */
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

/* Table */
.table-custom {
    margin-top: 1rem;
    color: #fff;
}
.table-custom th {
    background: rgba(255,255,255,0.08);
}
.table-custom td, .table-custom th {
    border-color: rgba(255,255,255,0.1) !important;
}

/* Status */
.badge-progress {
    background: #00c853;
}
.badge-finished {
    background: #2196f3;
}

/* Buttons */
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

<!-- Navbar -->

<nav class="navbar navbar-dark px-4">
    <div class="container-fluid">
        <span class="navbar-brand fw-bold text-white">🚀 SiteManager</span>
    </div>
</nav>

<div class="page-card">


<!-- Title -->
<div class="d-flex justify-content-between align-items-center mb-3">
    <h4><i class="bi bi-building me-2"></i> Construction Sites</h4>
</div>

<!-- Search -->
<div class="search-box mb-3">
    <form class="d-flex gap-2">
        <input type="search" placeholder="Search site...">
        <button type="submit"><i class="bi bi-search"></i></button>
    </form>
</div>

<!-- Table -->
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

                <!-- Status -->
                <td>
                    <c:choose>
                        <c:when test="${cs.status == 0}">
                            <span class="badge badge-progress">IN PROGRESS</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-finished">FINISHED</span>
                        </c:otherwise>
                    </c:choose>
                </td>

                <!-- Options -->
                <td>
                    <sf:form action="/admin/construction-sites/edit" method="get">
                        <input type="hidden" value="${cs.id}" name="csid">
                        <button class="btn-action">
                            <i class="bi bi-pencil"></i>
                        </button>
                    </sf:form>
                </td>

            </tr>
        </c:forEach>
    </tbody>
</table>


</div>

</body>
</html>
