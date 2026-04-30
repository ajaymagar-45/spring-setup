<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />

<!-- Bootstrap + Icons + Font -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;500;600&display=swap" rel="stylesheet">

<style>
body {
    font-family: 'Sora', sans-serif;
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    min-height: 100vh;
}

/* Glass Card */
.page-card {
    max-width: 900px;
    margin: 50px auto;
    background: rgba(255,255,255,0.07);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255,255,255,0.15);
    border-radius: 20px;
    padding: 30px;
    color: white;
}

/* Inputs */
.form-control {
    background: rgba(255,255,255,0.08) !important;
    border: 1px solid rgba(255,255,255,0.15) !important;
    color: white !important;
    border-radius: 12px;
}

.form-control:focus {
    background: rgba(255,255,255,0.12) !important;
    border-color: rgba(79,172,254,0.7) !important;
    box-shadow: 0 0 0 3px rgba(79,172,254,0.15);
}

/* Labels */
label {
    font-size: 0.85rem;
    color: rgba(255,255,255,0.6);
}

/* Buttons */
.btn-save {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
    color: #0f2027;
    border-radius: 12px;
    padding: 0.55rem 1.4rem;
    font-weight: 600;
}

.btn-cancel {
    background: rgba(255,255,255,0.12);
    border: none;
    color: white;
    border-radius: 12px;
    padding: 0.55rem 1.4rem;
}
</style>
</head>

<body>

<div class="container">

    <div class="page-card">

        <h4 class="mb-4">
            <i class="bi bi-building"></i> Edit Construction Site
        </h4>

        <sf:form action="/admin/construction-sites/update" modelAttribute="cs" method="post">

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

                <div class="col-md-6">
                    <label>Status</label>
                    <sf:select path="status" cssClass="form-control">
                        <sf:option value="0" label="IN PROGRESS"/>
                        <sf:option value="1" label="FINISHED"/>
                    </sf:select>
                </div>

            </div>

            <!-- Hidden -->
            <input type="hidden" name="csid" value="${cs.id}">

            <!-- Buttons -->
            <div class="mt-4 d-flex justify-content-end gap-2">

                <button type="submit" class="btn-save">
                    <i class="bi bi-check-circle"></i> Save
                </button>

                <button type="button" onclick="window.location.href='/admin'" class="btn-cancel">
                    Cancel
                </button>

            </div>

        </sf:form>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>