<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>ManishaMart — Login</title>
</head>
<body>
    <h1>ManishaMart Login</h1>

    <c:if test="${not empty error}">
        <p style="color:red;"><c:out value="${error}" /></p>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <label>Email: <input type="email" name="email" required></label><br>
        <label>Password: <input type="password" name="password" required></label><br>
        <button type="submit">Log In</button>
    </form>

    <p>No account? <a href="${pageContext.request.contextPath}/register">Register</a></p>
</body>
</html>
