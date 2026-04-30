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

<title>Users</title>

<!-- Bootstrap + Icons + Font -->

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
    max-width: 1100px;
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

/* Buttons */
.btn-action {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
    border-radius: 8px;
    padding: 0.3rem 0.6rem;
    color: black;
}

/* Status */
.badge-active {
    background: #00c853;
}
.badge-inactive {
    background: #ff5252;
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
    <h4><i class="bi bi-people-fill me-2"></i> Users</h4>
</div>

<!-- Search -->
<div class="search-box mb-3">
    <sf:form action="/admin/users/user" method="get" class="d-flex gap-2">
        <input type="search" name="userName" placeholder="Search user...">
        <button type="submit"><i class="bi bi-search"></i></button>
    </sf:form>
</div>

<!-- Table -->
<table class="table table-bordered table-custom text-center align-middle">
    <thead>
        <tr>
            <th>Username</th>
            <th>Role</th>
            <th>Status</th>
            <th>Details</th>
            <th>Options</th>
        </tr>
    </thead>

    <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.userAccount.userName}</td>
                <td>${user.userAccount.role.userRole}</td>

                <!-- Status -->
                <td>
                    <c:choose>
                        <c:when test="${user.userAccount.userEnabled == 0}">
                            <span class="badge badge-inactive">NO</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-active">YES</span>
                        </c:otherwise>
                    </c:choose>
                </td>

                <!-- Details -->
                <td>
                    <form action="/admin/users/user-details" method="get">
                        <input type="hidden" value="${user.id}" name="usid">
                        <button class="btn-action">
                            <i class="bi bi-eye"></i>
                        </button>
                    </form>
                </td>

                <!-- Options -->
                <td class="d-flex justify-content-center gap-2">

                    <sf:form action="/admin/users/edit-user">
                        <input type="hidden" value="${user.id}" name="usid">
                        <button class="btn-action">
                            <i class="bi bi-pencil"></i>
                        </button>
                    </sf:form>

                    <sf:form action="/admin/users/delete-user">
                        <input type="hidden" value="${user.id}" name="usid">
                        <button class="btn-action">
                            <i class="bi bi-trash"></i>
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
