<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>ManishaMart</title>
</head>
<body>

<h1>🛍️ ManishaMart</h1>

<h2>Welcome, ${sessionScope.user.name}!</h2>

<p>Login successful.</p>

<hr>

<h3>ManishaMart Marketplace</h3>

<p>Buy and sell products easily.</p>

<button>Browse Products</button>
<button>My Cart</button>
<button>My Orders</button>

<hr>

<p>
    <a href="${pageContext.request.contextPath}/login">Logout</a>
</p>

</body>
</html>
