<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head><title>Your Cart</title></head>
<body>
    <h1>Your Cart</h1>
    <table border="1">
        <tr><th>Product</th><th>Qty</th><th>Unit Price</th></tr>
        <c:forEach var="item" items="${items}">
            <tr>
                <td><c:out value="${item.productName}" /></td>
                <td><c:out value="${item.quantity}" /></td>
                <td><fmt:formatNumber value="${item.unitPrice}" type="currency" /></td>
            </tr>
        </c:forEach>
    </table>
    <a href="${pageContext.request.contextPath}/checkout">Proceed to Checkout</a>
</body>
</html>
