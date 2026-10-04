<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Edit Product - ManishaMart</title>
</head>

<body>

<h1>✏️ Edit Product</h1>

<p>
    <a href="${pageContext.request.contextPath}/products">
        ← Back to Products
    </a>
</p>

<hr>

<form action="${pageContext.request.contextPath}/products"
      method="post">

    <!-- EDIT ACTION -->
    <input type="hidden"
           name="action"
           value="edit">

    <!-- PRODUCT ID -->
    <input type="hidden"
           name="id"
           value="${param.id}">


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
        💾 Update Product
    </button>

</form>

<br>

<a href="${pageContext.request.contextPath}/products">
    Cancel
</a>

</body>

</html>
