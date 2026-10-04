<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ManishaMart - Home</title>
</head>

<body>

    <h1>🛍️ Welcome to ManishaMart</h1>

    <h2>Hello, ${sessionScope.user.name}!</h2>

    <p>Login successful!</p>

    <hr>

    <h2>ManishaMart Marketplace</h2>

    <p>Buy and sell products easily.</p>

    <br>

    <!-- Browse Products -->
    <a href="${pageContext.request.contextPath}/products">
        <button type="button">Browse Products</button>
    </a>

    <br><br>

    <!-- My Cart -->
    <a href="${pageContext.request.contextPath}/cart">
        <button type="button">My Cart</button>
    </a>

    <br><br>

    <!-- My Orders -->
    <a href="${pageContext.request.contextPath}/orders">
        <button type="button">My Orders</button>
    </a>

    <hr>

    <!-- Logout -->
    <a href="${pageContext.request.contextPath}/login">
        Logout
    </a>

</body>
</html>
