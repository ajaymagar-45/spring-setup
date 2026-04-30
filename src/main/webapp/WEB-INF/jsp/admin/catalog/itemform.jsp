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

<title>Add Product</title>

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

/* SECTION TITLE */
.nav-section {
    font-size: 0.75rem;
    opacity: 0.6;
    margin: 20px 5px 8px;
    text-transform: uppercase;
    letter-spacing: 1px;
}

/* NAV ITEMS */
.nav-item {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 10px 12px;
    margin: 8px 0;
    border-radius: 10px;
    color: rgba(255,255,255,0.9);
    text-decoration: none;
    background: rgba(255,255,255,0.05);
}

/* ❌ NO HOVER */

/* ✅ ACTIVE SAME AS NORMAL (NO BLUE) */
.nav-item.active {
    background: rgba(255,255,255,0.05);
    color: rgba(255,255,255,0.9);
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

/* TABLE */
table {
    width: 100%;
    color: white;
}

td {
    padding: 10px;
}

/* INPUT */
input {
    background: rgba(255,255,255,0.1);
    border: none;
    color: white;
    border-radius: 8px;
    padding: 6px;
    width: 100%;
}

/* BUTTONS */
input[type="submit"] {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
    padding: 8px 15px;
    border-radius: 10px;
    color: black;
    margin-top: 10px;
}

input[type="button"] {
    background: rgba(255,255,255,0.2);
    border: none;
    padding: 8px 15px;
    border-radius: 10px;
    color: white;
    margin-top: 10px;
}

</style>

</head>

<body>

<div class="app-wrapper">


<!-- ===== SIDEBAR ===== -->
<div id="navigation">

    <div class="nav-section">Main</div>

    <a href="/" class="nav-item">
        <i class="bi bi-house"></i> Home
    </a>

    <a href="/admin" class="nav-item">
        <i class="bi bi-speedometer2"></i> Dashboard
    </a>

    <div class="nav-section">Management</div>

    <!-- ACTIVE BUT NO BLUE NOW -->
    <a href="/admin/catalog" class="nav-item active">
        <i class="bi bi-box-seam"></i> Catalog
    </a>

    <a href="/admin/users" class="nav-item">
        <i class="bi bi-people"></i> Users
    </a>

    <a href="/admin/construction-sites" class="nav-item">
        <i class="bi bi-building"></i> Construction Sites
    </a>

    <div class="nav-section">System</div>

    <a href="/logout" class="nav-item">
        <i class="bi bi-box-arrow-right"></i> Logout
    </a>

</div>

<!-- ===== CONTENT ===== -->
<div class="content">

    <div class="page-card">

        <h4>Add New Item</h4>

        <div id="messagebar">
            <c:out value="${message}"/>
        </div>

        <c:if test="${result != null}">
            <sf:form modelAttribute="product">
                <sf:errors path="*" />
            </sf:form>
        </c:if>

        <sf:form action="/admin/catalog/save-item" modelAttribute="product" method="post">

            <table>
                <tr>
                    <td>Product Code</td>
                    <td><sf:input path="productCode" /></td>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td><sf:input path="productName" /></td>
                </tr>
                <tr>
                    <td>Category</td>
                    <td><sf:input path="productCategory" /></td>
                </tr>
                <tr>
                    <td>Availability</td>
                    <td><sf:input path="availability" /></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><sf:input path="productPrice" /></td>
                </tr>
            </table>

            <input type="submit" value="Save">
            <input type="button" value="Cancel" onclick="window.location.href='/admin/catalog'">

        </sf:form>

    </div>

</div>


</div>

</body>
</html>
