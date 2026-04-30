<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE = edge,chrome=1" />
    <link rel="stylesheet" href="/css/style.css" type="text/css">
    <link rel="stylesheet" href="/css/searchuserstable.css" type="text/css">
</head>
<body>
    <div id="container">
        <%@include file="/WEB-INF/incl/header.jsp"%>
        <div id="bar4">
            <a href="/">Home </a><label>></label><a href="/catalog"> Catalog </a><label>></label><a href="/cart"> Cart </a>
        </div>
        <%@include file="/WEB-INF/incl/navigation.jsp"%>
        <div id="bar3"></div>
        <div id="main-content">
            <div id="table-container">
                <div id="table-header"> Catalog </div>
                <div id="searchbox">
                    <!-- FIX 1: </form> closing tag was written as <form> (missing slash) -->
                    <form action="/admin/catalog/product" method="get">
                        <label>Search: </label>
                        <input type="search" name="productName">
                        <input type="image" src="/img/searchicon.png" title="Search" id="search-icon">
                    </form>
                </div>
                <table>
                    <tr>
                        <th>Construction Site</th>
                        <th>Building Code</th>
                        <th>Stock List</th>
                    </tr>
                    <c:forEach var="cs" items="${constructionSiteList}">
                        <tr>
                            <td><c:out value="${cs.buildingName}"/></td>
                            <td><c:out value="${cs.buildingCode}"/></td>
                            <!-- FIX 2: form moved inside <td>, method="get" added -->
                            <td>
                                <sf:form action="/admin/construction-site/stock-list/details" method="get">
                                    <input type="hidden" value="${cs.id}" name="csId">
                                    <input type="submit" value="View">
                                </sf:form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</body>
</html>