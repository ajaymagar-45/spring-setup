<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />

<!-- Bootstrap + Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    min-height: 100vh;
    font-family: 'Sora', sans-serif;
}

/* Glass Card */
.order-card {
    background: rgba(255, 255, 255, 0.07);
    backdrop-filter: blur(20px);
    border-radius: 20px;
    padding: 2rem;
    margin: 40px auto;
    max-width: 1100px;
    color: white;
}

/* Inputs */
.form-control, select {
    background: rgba(255,255,255,0.1) !important;
    border: 1px solid rgba(255,255,255,0.2) !important;
    color: white !important;
    border-radius: 10px;
}

label {
    display: flex;
    flex-direction: column;
    font-size: 0.9rem;
    margin-bottom: 15px;
}

/* Table */
.table {
    color: white;
}
.table thead {
    background: rgba(255,255,255,0.1);
}

/* Buttons */
.btn-custom {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
    color: #0f2027;
    font-weight: 600;
    border-radius: 10px;
}

.btn-secondary {
    border-radius: 10px;
}

/* Layout */
.form-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 15px;
}

.actions {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}
</style>
</head>

<body>

<div class="container">

    <div class="order-card">

        <h3 class="text-center mb-4">📦 Order Details</h3>

        <sf:form action="/cart/order/save" modelAttribute="orderDetails" method="post">

            <!-- FORM -->
            <div class="form-grid">

                <label>First Name
                    <sf:input path="firstName" cssClass="form-control"/>
                </label>

                <label>Last Name
                    <sf:input path="lastName" cssClass="form-control"/>
                </label>

                <label>Email
                    <sf:input path="email" cssClass="form-control"/>
                </label>

                <label>Construction Site
                    <sf:select path="order.constructionSite" cssClass="form-control">
                        <sf:options items="${constructionSiteList}"
                                    itemValue="id"
                                    itemLabel="buildingName"/>
                    </sf:select>
                </label>

            </div>

            <!-- TABLE -->
            <table class="table table-hover text-center mt-4">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Qty</th>
                        <th>Price</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${cart}" var="item" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${item.product.productCode}</td>
                            <td>${item.product.productName}</td>
                            <td>${item.product.productCategory}</td>
                            <td>${item.quantity}</td>
                            <td>₹ ${item.product.productPrice}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- TOTAL -->
            <div class="text-end">
                <h5>Total: ₹ ${totalPrice}</h5>
            </div>

            <!-- ACTIONS -->
            <div class="actions">

                <button type="button"
                        onclick="window.location.href='/cart'"
                        class="btn btn-secondary">
                    ← Back
                </button>

                <button type="submit" class="btn btn-custom">
                    Send Order →
                </button>

            </div>

        </sf:form>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>