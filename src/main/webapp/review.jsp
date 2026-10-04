<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Reviews - ManishaMart</title>
</head>
<body>

<h1>⭐ Product Reviews</h1>

<p>
    <a href="${pageContext.request.contextPath}/products">
        ← Back to Products
    </a>
</p>

<hr>

<h2>Write a Review</h2>

<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

<form action="${pageContext.request.contextPath}/reviews" method="post">

    <input type="hidden" name="productId" value="${productId}">

    <label>Rating:</label><br>
    <select name="rating" required>
        <option value="">Select Rating</option>
        <option value="1">⭐ 1</option>
        <option value="2">⭐⭐ 2</option>
        <option value="3">⭐⭐⭐ 3</option>
        <option value="4">⭐⭐⭐⭐ 4</option>
        <option value="5">⭐⭐⭐⭐⭐ 5</option>
    </select>

    <br><br>

    <label>Comment:</label><br>
    <textarea name="comment" rows="5" cols="40"
              placeholder="Write your review"></textarea>

    <br><br>

    <button type="submit">Submit Review</button>

</form>

<hr>

<h2>Customer Reviews</h2>

<c:choose>

    <c:when test="${not empty reviews}">

        <c:forEach var="review" items="${reviews}">

            <div>
                <p>
                    <b>Rating:</b>
                    ${review.rating} / 5 ⭐
                </p>

                <p>
                    <b>Comment:</b>
                    ${review.comment}
                </p>

                <hr>
            </div>

        </c:forEach>

    </c:when>

    <c:otherwise>

        <p>No reviews yet.</p>

    </c:otherwise>

</c:choose>

</body>
</html>
