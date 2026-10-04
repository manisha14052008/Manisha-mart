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

<!-- Back to Home -->
<p>
    <a href="${pageContext.request.contextPath}/home.jsp">
        ← Back to Home
    </a>
</p>

<hr>

<!-- Search Products -->
<h2>Browse Products</h2>

<form action="${pageContext.request.contextPath}/products" method="get">

    <label>Search:</label>
    <input type="text" name="keyword"
           placeholder="Search product">

    <label>Category:</label>
    <input type="text" name="category"
           placeholder="Category">

    <button type="submit">Search</button>

</form>

<hr>

<!-- Seller: Add Product -->
<c:if test="${sessionScope.user.role == 'SELLER'}">

    <h2>➕ Add Product</h2>

    <form action="${pageContext.request.contextPath}/products"
          method="post">

        <label>Product Name:</label><br>
        <input type="text"
               name="name"
               required>
        <br><br>

        <label>Description:</label><br>
        <input type="text"
               name="description">
        <br><br>

        <label>Price:</label><br>
        <input type="number"
               name="price"
               step="0.01"
               min="0.01"
               required>
        <br><br>

        <label>Stock Quantity:</label><br>
        <input type="number"
               name="stockQty"
               min="0"
               required>
        <br><br>

        <label>Category:</label><br>
        <input type="text"
               name="category">
        <br><br>

        <button type="submit">
            Add Product
        </button>

    </form>

    <hr>

</c:if>


<!-- Product List -->
<h2>Available Products</h2>

<c:choose>

    <c:when test="${not empty products}">

        <table border="1" cellpadding="10">

            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Category</th>
            </tr>

            <c:forEach var="product" items="${products}">

                <tr>

                    <td>
                        ${product.id}
                    </td>

                    <td>
                        ${product.name}
                    </td>

                    <td>
                        ${product.description}
                    </td>

                    <td>
                        ₹${product.price}
                    </td>

                    <td>
                        ${product.stockQty}
                    </td>

                    <td>
                        ${product.category}
                    </td>

                </tr>

            </c:forEach>

        </table>

    </c:when>

    <c:otherwise>

        <p>
            No products available yet.
        </p>

    </c:otherwise>

</c:choose>

<hr>

<!-- Cart and Orders -->
<p>
    <a href="${pageContext.request.contextPath}/cart">
        <button type="button">🛒 My Cart</button>
    </a>

    <a href="${pageContext.request.contextPath}/orders">
        <button type="button">📦 My Orders</button>
    </a>
</p>

<p>
    <a href="${pageContext.request.contextPath}/login">
        Logout
    </a>
</p>

</body>
</html>
