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
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;500;600&display=swap" rel="stylesheet">

<style>
body {
  background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: 'Sora', sans-serif;
}

/* Card */
.order-card {
  background: rgba(255,255,255,0.07);
  backdrop-filter: blur(20px);
  border: 1px solid rgba(255,255,255,0.15);
  border-radius: 20px;
  padding: 2rem;
  width: 95%;
  max-width: 900px;
  color: #fff;
}

/* Header */
.order-title {
  font-size: 1.5rem;
  font-weight: 600;
}

/* Labels */
.info-label {
  font-size: 0.9rem;
  color: rgba(255,255,255,0.7);
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
.btn-custom {
  border-radius: 10px;
  padding: 0.5rem 1rem;
  font-weight: 500;
}
.btn-back {
  background: rgba(255,255,255,0.1);
  color: #fff;
}
.btn-submit {
  background: linear-gradient(135deg, #4facfe, #00f2fe);
  color: #0f2027;
}
</style>

</head>

<body>

<div class="order-card">

  <!-- Header -->
  <div class="text-center mb-3">
    <h3 class="order-title">Order Summary 🧾</h3>
  </div>

  <!-- User Info -->
  <div class="row mb-3">
    <div class="col-md-6 info-label">
      <strong>First Name:</strong> <c:out value="${orderDetails.firstName}"/>
    </div>
    <div class="col-md-6 info-label">
      <strong>Last Name:</strong> <c:out value="${orderDetails.lastName}"/>
    </div>
    <div class="col-md-6 info-label">
      <strong>Email:</strong> <c:out value="${orderDetails.email}"/>
    </div>
    <div class="col-md-6 info-label">
      <strong>Site:</strong> <c:out value="${orderDetails.order.constructionSite.buildingName}"/>
    </div>
  </div>

  <!-- Table -->
  <table class="table table-custom table-bordered text-center align-middle">
    <thead>
      <tr>
        <th>No.</th>
        <th>Code</th>
        <th>Name</th>
        <th>Category</th>
        <th>Qty</th>
        <th>Price</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${orderDetails.items}" var="item" varStatus="i">
        <tr>
          <td>${i.index + 1}</td>
          <td>${item.product.productCode}</td>
          <td>${item.product.productName}</td>
          <td>${item.product.productCategory}</td>
          <td>${item.quantity}</td>
          <td>${item.product.productPrice * item.quantity}</td>
        </tr>
      </c:forEach>

      <tr>
        <td colspan="4"></td>
        <td><strong>Total</strong></td>
        <td><strong>${orderDetails.order.totalPrice}</strong></td>
      </tr>
    </tbody>
  </table>

  <!-- Buttons -->
  <div class="d-flex justify-content-between mt-3">
    <button class="btn btn-custom btn-back" onclick="window.location.href='/cart'">
      ← Back
    </button>

    <button class="btn btn-custom btn-submit">
      Send Order
    </button>
  </div>

</div>

</body>
</html>