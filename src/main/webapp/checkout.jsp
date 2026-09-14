<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head><title>Order Confirmed</title></head>
<body>
    <h1>Order Confirmed</h1>
    <p>Order #<c:out value="${order.id}" /> — Status: <c:out value="${order.status}" /></p>
    <p>Total: <fmt:formatNumber value="${order.totalAmount}" type="currency" /></p>
    <p><em>Mock payment confirmation — no real charge was made.</em></p>
    <a href="${pageContext.request.contextPath}/orders">View Order History</a>
</body>
</html>
