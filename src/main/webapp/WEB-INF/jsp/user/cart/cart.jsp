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
.cart-card {
    background: rgba(255, 255, 255, 0.07);
    backdrop-filter: blur(20px);
    border-radius: 20px;
    padding: 2rem;
    margin: 40px auto;
    max-width: 1100px;
    color: white;
}

/* Table */
.table {
    color: white;
}
.table thead {
    background: rgba(255,255,255,0.1);
}
.table th, .table td {
    vertical-align: middle;
}

/* Inputs */
input[type="number"] {
    background: rgba(255,255,255,0.1);
    border: 1px solid rgba(255,255,255,0.2);
    color: white;
    border-radius: 8px;
    padding: 5px;
    width: 70px;
}

/* Buttons */
.btn-custom {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
    color: #0f2027;
    font-weight: 600;
    border-radius: 10px;
    padding: 6px 12px;
}

.btn-danger-custom {
    background: rgba(226,75,74,0.85);
    border: none;
    border-radius: 8px;
    color: white;
}

/* Footer buttons */
.cart-actions {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}
</style>
</head>

<body>

<div class="container">

    <div class="cart-card">

        <h3 class="text-center mb-4">🛒 Your Cart</h3>

        <table class="table table-hover text-center">

            <thead>
                <tr>
                    <th>No</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Qty</th>
                    <th>Price</th>
                    <th>Sub Total</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${cart}" var="item" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${item.product.productCode}</td>
                        <td>${item.product.productName}</td>
                        <td>${item.product.productCategory}</td>

                        <td>
                            <sf:form action="/cart/update" method="post">
                                <input type="number" name="quantity" value="${item.quantity}">
                                <input type="hidden" name="itemId" value="${item.product.id}">
                                <button class="btn btn-custom btn-sm">Update</button>
                            </sf:form>
                        </td>

                        <td>₹ ${item.product.productPrice}</td>
                        <td>₹ ${item.quantity * item.product.productPrice}</td>

                        <td>
                            <sf:form action="/cart/delete-item" method="post">
                                <input type="hidden" name="itemId" value="${item.product.id}">
                                <button class="btn btn-danger-custom btn-sm">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </sf:form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Total -->
        <c:if test="${cart != null}">
            <div class="text-end mt-3">
                <h5>Total: ₹ ${totalPrice}</h5>
            </div>
        </c:if>

        <!-- Actions -->
        <div class="cart-actions">

            <button onclick="window.location.href='/catalog'" class="btn btn-secondary">
                ← Back
            </button>

            <form action="/cart/order" method="post">
                <button class="btn btn-custom">
                    Next →
                </button>
            </form>

        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>