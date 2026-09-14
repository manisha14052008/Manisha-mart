<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>ManishaMart — Register</title>
</head>
<body>
    <h1>Create an Account</h1>

    <c:if test="${not empty error}">
        <p style="color:red;"><c:out value="${error}" /></p>
    </c:if>

    <form action="${pageContext.request.contextPath}/register" method="post">
        <label>Name: <input type="text" name="name" required></label><br>
        <label>Email: <input type="email" name="email" required></label><br>
        <label>Password: <input type="password" name="password" required minlength="8"></label><br>
        <label>Role:
            <select name="role">
                <option value="BUYER">Buyer</option>
                <option value="SELLER">Seller</option>
            </select>
        </label><br>
        <button type="submit">Register</button>
    </form>

    <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Log in</a></p>
</body>
</html>
