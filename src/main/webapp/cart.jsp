<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Shopping Cart | ManishaMart</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #faf7fc;
            color: #30243a;
        }

        .navbar {
            background: white;
            padding: 18px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 3px 15px rgba(0, 0, 0, 0.05);
        }

        .brand {
            color: #7628b8;
            font-size: 25px;
            font-weight: bold;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 22px;
        }

        .nav-links a {
            color: #51445c;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
        }

        .page-container {
            max-width: 1000px;
            margin: 45px auto;
            padding: 0 20px;
        }

        .page-heading {
            margin-bottom: 25px;
        }

        .page-heading h1 {
            font-size: 32px;
            margin: 0 0 10px;
        }

        .page-heading p {
            color: #817589;
            margin: 0;
        }

        .cart-card {
            background: white;
            border-radius: 18px;
            padding: 25px;
            box-shadow: 0 8px 30px rgba(70, 30, 100, 0.07);
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-table th {
            text-align: left;
            padding: 16px 12px;
            color: #806d8d;
            font-size: 13px;
            background: #faf6ff;
            border-bottom: 1px solid #eee5f5;
        }

        .cart-table td {
            padding: 20px 12px;
            border-bottom: 1px solid #f0eaf4;
            font-size: 15px;
        }

        .product-name {
            font-weight: bold;
            color: #382047;
        }

        .quantity {
            display: inline-block;
            padding: 7px 13px;
            background: #f3e8ff;
            color:
