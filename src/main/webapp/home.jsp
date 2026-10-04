<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>ManishaMart Home</title>
</head>
<body>

<h1>Welcome to ManishaMart 🎉</h1>

<p>Login successful!</p>

<p>You are logged in as:</p>

<p>
    <strong>${sessionScope.user.name}</strong>
</p>

<a href="${pageContext.request.contextPath}/login">Logout</a>

</body>
</html>
