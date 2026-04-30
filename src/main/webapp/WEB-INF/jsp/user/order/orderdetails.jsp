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
    font-family: 'Sora', sans-serif;
    min-height: 100vh;
}

/* Glass container */
#form-container {
    background: rgba(255,255,255,0.07);
    backdrop-filter: blur(20px);
    border-radius: 20px;
    padding: 25px;
    margin: 30px auto;
    max-width: 1000px;
    color: white;
}

/* Header */
#table-header {
    font-size: 1.4rem;
    font-weight: 600;
    margin-bottom: 20px;
}

/* Inputs display */
#inputs-area label {
    display: block;
    margin-bottom: 10px;
    color: rgba(255,255,255,0.7);
}

/* Table */
table {
    width: 100%;
    color: white;
    margin-top: 15px;
    border-collapse: collapse;
}

table th {
    background: rgba(255,255,255,0.1);
    padding: 10px;
}

table td {
    padding: 10px;
    border-top: 1px solid rgba(255,255,255,0.1);
}

/* Buttons */
input[type="submit"] {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
    color: #0f2027;
    border-radius: 10px;
    padding: 6px 15px;
    font-weight: 600;
}

input[type="button"] {
    background: rgba(255,255,255,0.15);
    border: none;
    color: white;
    border-radius: 10px;
    padding: 6px 15px;
}

input {
    margin-top: 15px;
    margin-right: 10px;
}
</style>

</head>

<body>
<div id="container">

    <%@include file="/WEB-INF/incl/header.jsp"%>

    <div id="bar4">
        <a href="/">Home </a><label>></label>
        <a href="/catalog"> Catalog </a><label>></label>
        <a href="/cart"> Cart</a><label>></label>
        <a href="/cart/order"> Order</a>
    </div>

    <%@include file="/WEB-INF/incl/navigation.jsp"%>

    <div id="bar3"></div>

    <div id="main-content">

        <div id="form-container">

            <div id="table-header">📄 Order Summary</div>

            <div id="inputs-area">
                <label>First name :
                    <c:out value="${orderDetails.firstName}"/>
                </label>

                <label>Last name :
                    <c:out value="${orderDetails.lastName}"/>
                </label>

                <label>Email :
                    <c:out value="${orderDetails.email}"/>
                </label>

                <label>Construction Site :
                    <c:out value="${orderDetails.order.constructionSite.buildingName}"/>
                </label>
            </div>

            <table>
                <tr>
                    <td colspan="6"><strong>Product List</strong></td>
                </tr>
                <tr>
                    <th>No.</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Quantity</th>
                    <th>Sub Price</th>
                </tr>

                <c:forEach items="${orderDetails.items}" var="item">
                    <tr>
                        <td><c:out value="${1}"></c:out></td>
                        <td><c:out value="${item.product.productCode}"></c:out></td>
                        <td><c:out value="${item.product.productName}"></c:out></td>
                        <td><c:out value="${item.product.productCategory}"></c:out></td>
                        <td><c:out value="${item.quantity}"></c:out></td>
                        <td><c:out value="${item.product.productPrice * item.quantity}"></c:out></td>
                    </tr>
                </c:forEach>

                <tr>
                    <td class="blank-cell"></td>
                    <td class="blank-cell"></td>
                    <td class="blank-cell"></td>
                    <td class="blank-cell"></td>
                    <td><strong>Total Price</strong></td>
                    <td><c:out value="${orderDetails.order.totalPrice}"/></td>
                </tr>
            </table>

            <input type="button" onclick="window.location.href = '/cart';" value="← BACK">
            <input type="submit" value="SEND">

        </div>

    </div>
</div>
</body>
</html>