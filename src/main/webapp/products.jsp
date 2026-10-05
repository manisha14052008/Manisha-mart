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

<h2>🔍 Browse Products</h2>

<form action="${pageContext.request.contextPath}/products" method="get">

    <label>Search:</label>
    <input type="text" name="keyword" placeholder="Search product">

    &nbsp;&nbsp;

    <label>Category:</label>
    <input type="text" name="category" placeholder="Category">

    &nbsp;&nbsp;

    <button type="submit">Search</button>

</form>

<hr>

<c:if test="${sessionScope.user.role == 'SELLER'}">

    <h2>➕ Add Product</h2>

    <form action="${pageContext.request.contextPath}/products" method="post">

        <input type="hidden" name="action" value="add">

        <label>Product Name:</label><br>
        <input type="text" name="name" required>
        <br><br>

        <label>Description:</label><br>
        <input type="text" name="description">
        <br><br>

        <label>Price:</label><br>
        <input type="number" name="price" step="0.01" min="0.01" required>
        <br><br>

        <label>Stock Quantity:</label><br>
        <input type="number" name="stockQty" min="0" required>
        <br><br>

        <label>Category:</label><br>
        <input type="text" name="category">
        <br><br>

        <button type="submit">➕ Add Product</button>

    </form>

    <hr>

</c:if>

<h2>📦 Available Products</h2>

<c:choose>

    <c:when test="${not empty products}">

        <table border="1" cellpadding="8" cellspacing="0">

            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Category</th>
                <th>Cart</th>
                <th>Review</th>

                <c:if test="${sessionScope.user.role == 'SELLER'}">
                    <th>Manage</th>
                </c:if>
            </tr>

            <c:forEach var="product" items="${products}">

                <tr>

                    <td>${product.id}</td>

                    <td>
                        <b>${product.name}</b>
                    </td>

                    <td>${product.description}</td>

                    <td>₹${product.price}</td>

                    <td>${product.stockQty}</td>

                    <td>${product.category}</td>

                    <!-- CART -->

                    <td>

                        <c:choose>

                            <c:when test="${product.stockQty > 0}">

                                <form action="${pageContext.request.contextPath}/cart"
                                      method="post">

                                    <input type="hidden"
                                           name="productId"
                                           value="${product.id}">

                                    <input type="hidden"
                                           name="quantity"
                                           value="1">

                                    <button type="submit">
                                        🛒 Add to Cart
                                    </button>

                                </form>

                            </c:when>

                            <c:otherwise>

                                <span>❌ Out of Stock</span>

                            </c:otherwise>

                        </c:choose>

                    </td>

                    <!-- REVIEW -->

                    <td>

                        <a href="${pageContext.request.contextPath}/reviews?productId=${product.id}">
                            ⭐ Review
                        </a>

                    </td>

                    <!-- SELLER MANAGEMENT -->

                    <c:if test="${sessionScope.user.role == 'SELLER'
                                  && sessionScope.user.id == product.sellerId}">

                        <td>

                            <!-- EDIT -->

                            <form action="${pageContext.request.contextPath}/edit-product"
                                  method="get"
                                  style="display:inline;">

                                <input type="hidden"
                                       name
