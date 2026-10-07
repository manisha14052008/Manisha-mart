<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>ManishaMart - Home</title>

</head>

<body>

<h1>🛍️ Welcome to ManishaMart</h1>

<hr>

<!-- USER INFORMATION -->

<c:choose>

    <c:when test="${not empty sessionScope.user}">

        <h2>
            Welcome,
            ${sessionScope.user.name} 👋
        </h2>

        <p>
            <b>Role:</b>
            ${sessionScope.user.role}
        </p>

    </c:when>

    <c:otherwise>

        <p>
            Welcome to ManishaMart!
        </p>

    </c:otherwise>

</c:choose>


<hr>


<!-- MAIN FEATURES -->

<h2>📌 Main Features</h2>

<p>
    <a href="${pageContext.request.contextPath}/products">
        🛍️ Browse Products
    </a>
</p>


<p>
    <a href="${pageContext.request.contextPath}/cart">
        🛒 My Cart
    </a>
</p>


<p>
    <a href="${pageContext.request.contextPath}/orders">
        📦 My Orders
    </a>
</p>


<!-- CHATBOT -->

<p>
    <a href="${pageContext.request.contextPath}/chatbot">
        🤖 AI Chatbot
    </a>
</p>


<hr>


<!-- SELLER FEATURE -->

<c:if test="${sessionScope.user.role == 'SELLER'}">

    <h2>🏪 Seller</h2>

    <p>
        <a href="${pageContext.request.contextPath}/products">
            ➕ Add / Manage Products
        </a>
    </p>

</c:if>


<!-- ADMIN FEATURE -->

<c:if test="${sessionScope.user.role == 'ADMIN'}">

    <h2>⚙️ Admin</h2>

    <p>
        <a href="${pageContext.request.contextPath}/admin">
            ⚙️ Admin Dashboard
        </a>
    </p>

</c:if>


<hr>


<!-- ACCOUNT -->

<h2>👤 Account</h2>

<c:choose>

    <c:when test="${not empty sessionScope.user}">

        <p>
            <a href="${pageContext.request.contextPath}/logout">
                🚪 Logout
            </a>
        </p>

    </c:when>

    <c:otherwise>

        <p>
            <a href="${pageContext.request.contextPath}/login">
                🔐 Login
            </a>
        </p>

        <p>
            <a href="${pageContext.request.contextPath}/register">
                📝 Register
            </a>
        </p>

    </c:otherwise>

</c:choose>


<hr>

<p>
    <b>ManishaMart</b>
</p>

<p>
    Simple Online Marketplace
</p>

</body>

</html>
