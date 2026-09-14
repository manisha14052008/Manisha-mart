<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head><title>Order History</title></head>
<body>
    <h1>Your Orders</h1>
    <table border="1">
        <tr><th>Order ID</th><th>Status</th><th>Total</th><th>Date</th></tr>
        <c:forEach var="o" items="${orders}">
            <tr>
                <td><c:out value="${o.id}" /></td>
                <td><c:out value="${o.status}" /></td>
                <td><fmt:formatNumber value="${o.totalAmount}" type="currency" /></td>
                <td><c:out value="${o.createdAt}" /></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
