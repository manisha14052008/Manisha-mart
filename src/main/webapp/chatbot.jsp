<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>ManishaMart AI Chatbot</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        .chat-box {
            max-width: 600px;
            border: 1px solid #ccc;
            padding: 20px;
        }

        textarea {
            width: 100%;
            box-sizing: border-box;
            padding: 10px;
        }

        button {
            padding: 10px 20px;
            cursor: pointer;
        }

        .response {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ccc;
        }

        .error {
            color: red;
        }
    </style>
</head>

<body>

<h1>🤖 ManishaMart AI Chatbot</h1>

<p>
    Ask me about ManishaMart products, cart, orders, checkout and reviews.
</p>

<hr>

<div class="chat-box">

    <h2>💬 Ask a Question</h2>

    <form action="${pageContext.request.contextPath}/chatbot"
          method="post">

        <label for="message">
            Your Question:
        </label>

        <br><br>

        <textarea
                id="message"
                name="message"
                rows="5"
                placeholder="Example: How do I add a product to cart?"
                required></textarea>

        <br><br>

        <button type="submit">
            🤖 Ask Chatbot
        </button>

    </form>


    <c:if test="${not empty chatbotResponse}">

        <div class="response">

            <h3>🤖 ManishaMart Assistant</h3>

            <p>
                ${chatbotResponse}
            </p>

        </div>

    </c:if>


    <c:if test="${not empty error}">

        <div class="error">

            <p>
                <b>Error:</b> ${error}
            </p>

        </div>

    </c:if>

</div>

<hr>

<h3>💡 Example Questions</h3>

<ul>
    <li>How do I register?</li>
    <li>How do I login?</li>
    <li>How do I add a product to cart?</li>
    <li>How do I checkout?</li>
    <li>How can I see my orders?</li>
    <li>How do I write a review?</li>
    <li>How can a seller add a product?</li>
</ul>

<hr>

<p>

    <a href="${pageContext.request.contextPath}/home.jsp">
        ← Back to Home
    </a>

    &nbsp;&nbsp;

    <a href="${pageContext.request.contextPath}/products">
        🛍️ Products
    </a>

</p>

</body>
</html>
