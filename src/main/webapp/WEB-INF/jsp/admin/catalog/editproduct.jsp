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

<title>Edit Product</title>

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
.form-card {
    max-width: 650px;
    margin: 60px auto;
    background: rgba(255,255,255,0.08);
    border-radius: 20px;
    padding: 30px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.4);
}

/* Title */
.form-title {
    color: white;
    font-weight: 600;
    margin-bottom: 25px;
}

/* Input group */
.input-group-text {
    background: rgba(255,255,255,0.1);
    border: none;
    color: white;
}

.form-control {
    background: rgba(255,255,255,0.08);
    border: none;
    color: white;
}

.form-control::placeholder {
    color: rgba(255,255,255,0.5);
}

/* Buttons */
.btn-save {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
    color: black;
}

.btn-save:hover {
    transform: translateY(-2px);
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
        <a href="/catalog" class="text-light"><i class="bi bi-grid"></i></a>
        <a href="/logout" class="text-light"><i class="bi bi-box-arrow-right"></i></a>
    </div>
</div>
```

</nav>

<!-- 🔥 Form -->

<div class="form-card">

```
<h4 class="form-title">
    <i class="bi bi-pencil-square me-2"></i> Edit Product
</h4>

<sf:form action="/admin/catalog/update-item" modelAttribute="product" method="post">

    <div class="mb-3">
        <label class="text-light mb-1">Product Code</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-upc-scan"></i></span>
            <sf:input path="productCode" cssClass="form-control"/>
        </div>
    </div>

    <div class="mb-3">
        <label class="text-light mb-1">Product Name</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-tag"></i></span>
            <sf:input path="productName" cssClass="form-control"/>
        </div>
    </div>

    <div class="mb-3">
        <label class="text-light mb-1">Category</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-grid"></i></span>
            <sf:input path="productCategory" cssClass="form-control"/>
        </div>
    </div>

    <div class="mb-3">
        <label class="text-light mb-1">Availability</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-check-circle"></i></span>
            <sf:input path="availability" cssClass="form-control"/>
        </div>
    </div>

    <div class="mb-3">
        <label class="text-light mb-1">Price per day</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-currency-rupee"></i></span>
            <sf:input path="productPrice" cssClass="form-control"/>
        </div>
    </div>

    <input type="hidden" value="${product.id}" name="itemId">

    <div class="d-flex justify-content-between mt-4">
        <button type="submit" class="btn btn-save px-4">Save</button>
        <a href="/admin/catalog/products" class="btn btn-outline-light">Cancel</a>
    </div>

</sf:form>


</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
