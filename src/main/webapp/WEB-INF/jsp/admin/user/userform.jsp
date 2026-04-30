<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Add User</title>

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
.form-card {
    max-width: 900px;
    margin: 40px auto;
    background: rgba(255,255,255,0.08);
    border-radius: 20px;
    padding: 30px;
}

/* Floating input fix */
.form-floating .form-control,
.form-floating .form-select {
    background: rgba(255,255,255,0.08);
    border: none;
    color: white;
}

.form-floating label {
    color: rgba(255,255,255,0.6);
}

.form-control:focus {
    box-shadow: none;
}

/* Dropdown fix */
.form-select option {
    background: #203a43;
    color: white;
}

/* Error styling */
.error-text {
    font-size: 0.8rem;
    color: #ff6b6b;
    margin-top: 3px;
}

/* Button */
.btn-submit {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
    color: black;
}
</style>

</head>

<body>

<!-- 🔥 Navbar -->
<nav class="navbar navbar-dark px-4">
    <div class="container-fluid">
        <span class="navbar-brand fw-bold text-white">🚀 SiteManager</span>
    </div>
</nav>

<!-- 🔥 Form -->
<div class="form-card">

    <h4 class="text-white mb-4">
        <i class="bi bi-person-plus-fill me-2"></i> Add New User
    </h4>

    <!-- GLOBAL ERRORS -->
    <c:if test="${result.hasErrors()}">
        <div class="alert alert-danger">
            <ul class="mb-0">
                <sf:errors path="*" element="li"/>
            </ul>
        </div>
    </c:if>

    <!-- SUCCESS -->
    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>

    <sf:form action="/admin/save-user" modelAttribute="user" method="post">

        <!-- USER INFO -->
        <div class="row g-3">

            <div class="col-md-6">
                <div class="form-floating">
                    <sf:input path="userAccount.userName" cssClass="form-control" placeholder="Username"/>
                    <label>Username</label>
                </div>
                <sf:errors path="userAccount.userName" cssClass="error-text"/>
            </div>

            <div class="col-md-6">
                <div class="form-floating">
                    <sf:input path="userAccount.userPassword" type="password" cssClass="form-control" placeholder="Password"/>
                    <label>Password</label>
                </div>
                <sf:errors path="userAccount.userPassword" cssClass="error-text"/>
            </div>

            <div class="col-md-6">
                <div class="form-floating">
                    <sf:input path="firstName" cssClass="form-control" placeholder="First Name"/>
                    <label>First Name</label>
                </div>
                <sf:errors path="firstName" cssClass="error-text"/>
            </div>

            <div class="col-md-6">
                <div class="form-floating">
                    <sf:input path="lastName" cssClass="form-control" placeholder="Last Name"/>
                    <label>Last Name</label>
                </div>
                <sf:errors path="lastName" cssClass="error-text"/>
            </div>

            <div class="col-md-6">
                <div class="form-floating">
                    <sf:input path="email" cssClass="form-control" placeholder="Email"/>
                    <label>Email</label>
                </div>
                <sf:errors path="email" cssClass="error-text"/>
            </div>

            <div class="col-md-6">
                <div class="form-floating">
                    <sf:input path="phoneNumber" cssClass="form-control" placeholder="Phone"/>
                    <label>Phone</label>
                </div>
                <sf:errors path="phoneNumber" cssClass="error-text"/>
            </div>

            <div class="col-md-6">
                <div class="form-floating">
                    <sf:input path="position" cssClass="form-control" placeholder="Position"/>
                    <label>Position</label>
                </div>
                <sf:errors path="position" cssClass="error-text"/>
            </div>

            <div class="col-md-6">
                <div class="form-floating">
                    <sf:select path="constructionSites" cssClass="form-select">
                        <sf:option value="" label="Select Workplace"/>
                        <sf:options items="${constructionSiteList}" itemValue="id" itemLabel="buildingName"/>
                    </sf:select>
                    <label>Workplace</label>
                </div>
            </div>

        </div>

        <!-- SECURITY -->
        <div class="mt-4">

            <div class="row g-3">

                <div class="col-md-6">
                    <div class="form-floating">
                        <sf:select path="userAccount.userEnabled" cssClass="form-select">
                            <sf:option value="1">Enabled</sf:option>
                            <sf:option value="0">Disabled</sf:option>
                        </sf:select>
                        <label>Status</label>
                    </div>
                </div>

                <div class="col-md-6 text-white">
                    <label class="mb-2 d-block">Role</label>

                    <div class="form-check form-check-inline">
                        <sf:radiobutton path="userAccount.role" value="1" cssClass="form-check-input"/>
                        <label class="form-check-label">Admin</label>
                    </div>

                    <div class="form-check form-check-inline">
                        <sf:radiobutton path="userAccount.role" value="2" cssClass="form-check-input"/>
                        <label class="form-check-label">User</label>
                    </div>
                </div>

            </div>

        </div>

        <!-- BUTTON -->
        <div class="text-end mt-4">
            <button type="submit" class="btn btn-submit px-4">
                <i class="bi bi-check-circle"></i> Add User
            </button>
        </div>

    </sf:form>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>