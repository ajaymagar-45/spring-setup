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

<title>Add Construction Site</title>

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

/* Inputs */
.form-control {
    background: rgba(255,255,255,0.08);
    border: none;
    color: white;
    border-radius: 10px;
}

.form-control:focus {
    background: rgba(255,255,255,0.12);
    box-shadow: none;
    color: white;
}

/* Labels */
label {
    color: #ccc;
}

/* Buttons */
.btn-save {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
    color: black;
    border-radius: 10px;
    padding: 0.5rem 1.2rem;
}

.btn-cancel {
    background: rgba(255,255,255,0.15);
    border: none;
    color: white;
    border-radius: 10px;
    padding: 0.5rem 1.2rem;
}

/* Message */
.message-box {
    color: #00f2fe;
    margin-bottom: 15px;
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


<!-- Title -->
<h4 class="mb-3">
    <i class="bi bi-building"></i> Add Construction Site
</h4>

<!-- Message -->
<div class="message-box">
    <c:out value="${message}"/>
</div>

<!-- Errors -->
<c:if test="${result != null}">
    <div class="alert alert-danger">
        <sf:errors path="*"/>
    </div>
</c:if>

<!-- Form -->
<sf:form action="/admin/save-cs" modelAttribute="cs" method="post">

    <div class="row g-3">

        <div class="col-md-6">
            <label>Building Name</label>
            <sf:input path="buildingName" cssClass="form-control"/>
        </div>

        <div class="col-md-6">
            <label>Building Code</label>
            <sf:input path="buildingCode" cssClass="form-control"/>
        </div>

        <div class="col-md-6">
            <label>Street</label>
            <sf:input path="constructionSiteAdress.street" cssClass="form-control"/>
        </div>

        <div class="col-md-6">
            <label>Street Number</label>
            <sf:input path="constructionSiteAdress.streetNumber" cssClass="form-control"/>
        </div>

        <div class="col-md-6">
            <label>Locality</label>
            <sf:input path="constructionSiteAdress.locality" cssClass="form-control"/>
        </div>

        <div class="col-md-6">
            <label>Zip Code</label>
            <sf:input path="constructionSiteAdress.zipCode" cssClass="form-control"/>
        </div>

        <div class="col-md-6">
            <label>Country</label>
            <sf:input path="constructionSiteAdress.country" cssClass="form-control"/>
        </div>

    </div>

    <!-- Hidden status -->
    <input type="hidden" value="0" name="status">

    <!-- Buttons -->
    <div class="mt-4 d-flex justify-content-end gap-2">

        <button type="submit" class="btn-save">
            <i class="bi bi-check-circle"></i> Save
        </button>

        <a href="/admin" class="btn-cancel">
            Cancel
        </a>

    </div>

</sf:form>


</div>

</body>
</html>
