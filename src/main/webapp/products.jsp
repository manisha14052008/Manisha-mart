<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ManishaMart - Products</title>
</head>

<body>

<h1>🛍️ ManishaMart Products</h1>

<p>
    Welcome,
    <b>${sessionScope.user.name}</b>
</p>

<p>
    <a href="${pageContext.request.contextPath}/home.jsp">
        ← Back to Home
    </a>
</p>

<hr>

<!-- ================= SEARCH PRODUCTS ================= -->

<h2>🔍 Browse Products</h2>

<form action="${pageContext.request.contextPath}/products" method="get">

    <label>Search:</label>

    <input type="text"
           name="keyword"
           placeholder="Search product">

    &nbsp;&nbsp;

    <label>Category:</label>

    <input type="text"
           name="category"
           placeholder="Category">

    &nbsp;&nbsp;

    <button type="submit">
        Search
    </button>

</form>

<hr>

<!-- ================= ADD PRODUCT - SELLER ONLY ================= -->

<c:if test="${sessionScope.user.role
