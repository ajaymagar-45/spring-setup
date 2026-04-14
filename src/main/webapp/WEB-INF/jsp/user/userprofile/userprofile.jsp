<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>My Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    font-family: 'Sora', sans-serif;
    min-height: 100vh;
}

/* Navbar */
.navbar {
    backdrop-filter: blur(12px);
    background: rgba(0,0,0,0.25);
}

/* Card */
.profile-card {
    max-width: 700px;
    margin: 50px auto;
    background: rgba(255,255,255,0.08);
    border-radius: 20px;
    padding: 30px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.4);
}

/* Title */
.profile-title {
    color: white;
    font-weight: 600;
    margin-bottom: 20px;
}

/* Labels */
.label-text {
    color: rgba(255,255,255,0.7);
    font-size: 0.85rem;
}

/* Values */
.value-text {
    color: white;
    font-weight: 500;
}

/* Inputs */
.form-control {
    background: rgba(255,255,255,0.08);
    border: none;
    color: white;
}

/* Buttons */
.btn-save {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
    color: black;
}
</style>

</head>

<body>

<!-- 🔥 Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <div class="container-fluid">
        <a class="navbar-brand text-white fw-bold">🚀 SiteManager</a>

```
    <div class="ms-auto d-flex gap-3">
        <a href="/admin" class="text-light"><i class="bi bi-speedometer2"></i></a>
        <a href="/logout" class="text-light"><i class="bi bi-box-arrow-right"></i></a>
    </div>
</div>
```

</nav>

<!-- 🔥 Profile Card -->

<div class="profile-card">

```
<h4 class="profile-title">
    <i class="bi bi-person-circle me-2"></i> My Profile
</h4>

<div class="alert alert-warning text-center">
    Username cannot be changed
</div>

<sf:form action="/my-profile/update" modelAttribute="userAccountDetails" method="post">

    <!-- Info -->
    <div class="row mb-3">
        <div class="col-md-6">
            <div class="label-text">Username</div>
            <div class="value-text">${userAccountDetails.userAccount.userName}</div>
        </div>
        <div class="col-md-6">
            <div class="label-text">Position</div>
            <div class="value-text">${userAccountDetails.position}</div>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-md-6">
            <div class="label-text">First Name</div>
            <div class="value-text">${userAccountDetails.firstName}</div>
        </div>
        <div class="col-md-6">
            <div class="label-text">Last Name</div>
            <div class="value-text">${userAccountDetails.lastName}</div>
        </div>
    </div>

    <div class="mb-3">
        <div class="label-text">Email</div>
        <div class="value-text">${userAccountDetails.email}</div>
    </div>

    <div class="mb-3">
        <div class="label-text">Phone Number</div>
        <div class="value-text">${userAccountDetails.phoneNumber}</div>
    </div>

    <div class="mb-4">
        <div class="label-text">Workplace</div>
        <div class="value-text">${userAccountDetails.constructionSites.buildingName}</div>
    </div>

    <!-- Password Section -->
    <hr class="text-light">

    <h6 class="text-light mb-3">Change Password</h6>

    <div class="mb-3">
        <input type="password" name="oldPassword" class="form-control" placeholder="Old Password">
    </div>

    <div class="mb-3">
        <input type="password" name="newPassword" class="form-control" placeholder="New Password">
    </div>

    <div class="mb-3">
        <input type="password" name="repeatPassword" class="form-control" placeholder="Repeat Password">
    </div>

    <input type="hidden" value="${userAccountDetails.id}" name="usId">

    <!-- Buttons -->
    <div class="d-flex justify-content-between mt-4">
        <button type="submit" class="btn btn-save px-4">Save</button>
        <a href="/admin" class="btn btn-outline-light">Cancel</a>
    </div>

</sf:form>
```

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
