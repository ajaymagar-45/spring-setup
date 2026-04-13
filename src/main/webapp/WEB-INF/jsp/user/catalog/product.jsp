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
.catalog-card {
    max-width: 1100px;
    margin: 40px auto;
    background: rgba(255,255,255,0.08);
    border-radius: 20px;
    padding: 25px;
}

/* Table */
.table {
    color: white;
}
.table th {
    color: #4facfe;
}
.table td {
    vertical-align: middle;
}

/* Search */
.search-box input {
    background: rgba(255,255,255,0.1);
    border: none;
    color: white;
}
.search-box button {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
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
        <a href="/catalog" class="text-light"><i class="bi bi-grid"></i></a>
        <a href="/cart" class="text-light"><i class="bi bi-cart"></i></a>
        <a href="/logout" class="text-light"><i class="bi bi-box-arrow-right"></i></a>
    </div>
</div>
```

</nav>

<!-- 🔥 Catalog -->

<div class="catalog-card">

```
<h4 class="text-white mb-3">
    <i class="bi bi-grid me-2"></i> Catalog
</h4>

<!-- 🔍 Search -->
<sf:form action="/catalog/search" method="post" class="search-box mb-4">
    <div class="input-group">
        <input type="search" name="productName" class="form-control" placeholder="Search product...">
        <button class="btn"><i class="bi bi-search"></i></button>
    </div>
</sf:form>

<!-- 📊 Table -->
<div class="table-responsive">
    <table class="table table-hover text-center">
        <thead>
            <tr>
                <th>Code</th>
                <th>Name</th>
                <th>Category</th>
                <th>Availability</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Order</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${product.productCode}</td>
                <td>${product.productName}</td>
                <td>${product.productCategory}</td>
                <td>${product.availability}</td>
                <td>₹ ${product.productPrice}</td>

                <td>
                    <input type="number" name="quantity" value="1" class="form-control text-center">
                </td>

                <td>
                    <sf:form action="cart/add">
                        <input type="hidden" value="${product.productName}" name="productName">
                        <button type="submit" class="btn btn-success btn-sm">
                            <i class="bi bi-cart-plus"></i>
                        </button>
                    </sf:form>
                </td>
            </tr>
        </tbody>
    </table>
</div>
```

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
