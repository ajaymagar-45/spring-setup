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

<title>User Details</title>

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
    max-width: 900px;
    margin: 40px auto;
    background: rgba(255,255,255,0.08);
    border-radius: 20px;
    padding: 30px;
    color: white;
}

/* Label title */
.username-title {
    font-size: 1.4rem;
    font-weight: 600;
    margin-bottom: 20px;
    color: #fff;
}

/* Detail rows */
.detail-item {
    background: rgba(255,255,255,0.05);
    padding: 12px 15px;
    border-radius: 10px;
    margin-bottom: 10px;
    display: flex;
    justify-content: space-between;
}

/* Label */
.detail-label {
    color: #aaa;
}

/* Value */
.detail-value {
    color: #fff;
    font-weight: 500;
}
</style>

</head>

<body>

<nav class="navbar navbar-dark px-4">
    <div class="container-fluid">
        <span class="navbar-brand fw-bold text-white">🚀 SiteManager</span>
    </div>
</nav>

<div class="page-card">


<!-- Username -->
<div class="username-title">
    <i class="bi bi-person-circle me-2"></i>
    ${user.userAccount.userName}
</div>

<!-- Details -->
<div class="detail-item">
    <span class="detail-label">First Name</span>
    <span class="detail-value">${user.firstName}</span>
</div>

<div class="detail-item">
    <span class="detail-label">Last Name</span>
    <span class="detail-value">${user.lastName}</span>
</div>

<div class="detail-item">
    <span class="detail-label">Email</span>
    <span class="detail-value">${user.email}</span>
</div>

<div class="detail-item">
    <span class="detail-label">Phone Number</span>
    <span class="detail-value">${user.phoneNumber}</span>
</div>

<div class="detail-item">
    <span class="detail-label">Position</span>
    <span class="detail-value">${user.position}</span>
</div>

<div class="detail-item">
    <span class="detail-label">Workplace</span>
    <span class="detail-value">${user.constructionSites.buildingName}</span>
</div>

<!-- Back Button -->
<div class="mt-4 text-end">
    <a href="/admin/users" class="btn btn-action">
        <i class="bi bi-arrow-left"></i> Back
    </a>
</div>


</div>

</body>
</html>
