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


<!-- ========================= -->
<!-- SEARCH -->
<!-- ========================= -->

<h2>🔍 Browse Products</h2>

<form action="${pageContext.request.contextPath}/products"
      method="get">

    <label>Search:</label>

    <input type="text"
           name="keyword"
           placeholder="Search product">

    &nbsp;

    <label>Category:</label>

    <input type="text"
           name="category"
           placeholder="Category">

    &nbsp;

    <button type="submit">
        Search
    </button>

</form>

<hr>


<!-- ========================= -->
<!-- SELLER: ADD PRODUCT -->
<!-- ========================= -->

<c:if test="${sessionScope.user.role == 'SELLER'}">

    <h2>➕ Add Product</h2>

    <form action="${pageContext.request.contextPath}/products"
          method="post">

        <input type="hidden"
               name="action"
               value="add">

        <label>Product Name:</label>
        <br>

        <input type="text"
               name="name"
               required>

        <br><br>


        <label>Description:</label>
        <br>

        <input type="text"
               name="description">

        <br><br>


        <label>Price:</label>
        <br>

        <input type="number"
               name="price"
               step="0.01"
               min="0.01"
               required>

        <br><br>


        <label>Stock Quantity:</label>
        <br>

        <input type="number"
               name="stockQty"
               min="0"
               required>

        <br><br>


        <label>Category:</label>
        <br>

        <input type="text"
               name="category">

        <br><br>


        <button type="submit">
            ➕ Add Product
        </button>

    </form>

    <hr>

</c:if>


<!-- ========================= -->
<!-- PRODUCT LIST -->
<!-- ========================= -->

<h2>📦 Available Products</h2>

<c:choose>

    <c:when test="${not empty products}">

        <table border="1"
               cellpadding="8"
               cellspacing="0">

            <tr>

                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Category</th>
                <th>Cart</th>

                <c:if test="${sessionScope.user.role == 'SELLER'}">
                    <th>Manage</th>
                </c:if>

            </tr>


            <c:forEach var="product"
                       items="${products}">

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


                    <!-- ========================= -->
                    <!-- ADD TO CART -->
                    <!-- ========================= -->

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

                                <span>
                                    ❌ Out of Stock
                                </span>

                            </c:otherwise>

                        </c:choose>

                    </td>


                    <!-- ========================= -->
                    <!-- SELLER MANAGEMENT -->
                    <!-- ========================= -->

                    <c:if test="${sessionScope.user.role == 'SELLER'
                                  && sessionScope.user.id == product.sellerId}">

                        <td>

                            <!-- EDIT -->

                            <form action="${pageContext.request.contextPath}/edit-product"
                                  method="get"
                                  style="display:inline;">

                                <input type="hidden"
                                       name="id"
                                       value="${product.id}">

                                <button type="submit">
                                    ✏️ Edit
                                </button>

                            </form>


                            <!-- DELETE -->

                            <form action="${pageContext.request.contextPath}/products"
                                  method="post"
                                  style="display:inline;"
                                  onsubmit="return confirm('Are you sure you want to delete this product?');">

                                <input type="hidden"
                                       name="action"
                                       value="delete">

                                <input type="hidden"
                                       name="id"
                                       value="${product.id}">

                                <button type="submit">
                                    🗑️ Delete
                                </button>

                            </form>

                        </td>

                    </c:if>

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


<!-- ========================= -->
<!-- QUICK LINKS -->
<!-- ========================= -->

<h3>Quick Links</h3>

<p>

    <a href="${pageContext.request.contextPath}/cart">
        🛒 My Cart
    </a>

    &nbsp;&nbsp;

    <a href="${pageContext.request.contextPath}/orders">
        📦 My Orders
    </a>

</p>

<hr>


<!-- LOGOUT -->

<p>

    <a href="${pageContext.request.contextPath}/login">
        🚪 Logout
    </a>

</p>

</body>

</html>
