<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head><title>Browse Products</title></head>
<body>
    <h1>Products</h1>

    <form action="${pageContext.request.contextPath}/products" method="get">
        <input type="text" name="keyword" placeholder="Search...">
        <input type="text" name="category" placeholder="Category">
        <button type="submit">Search</button>
    </form>

    <table border="1">
        <tr><th>Name</th><th>Price</th><th>Category</th><th>Stock</th></tr>
        <c:forEach var="p" items="${products}">
            <tr>
                <td><c:out value="${p.name}" /></td>
                <td><fmt:formatNumber value="${p.price}" type="currency" /></td>
                <td><c:out value="${p.category}" /></td>
                <td><c:out value="${p.stockQty}" /></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
