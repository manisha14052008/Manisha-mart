<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Create Account | ManishaMart</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f5eaff, #fff7fb);
            display: flex;
            flex-direction: column;
        }

        .navbar {
            padding: 18px 7%;
            background: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 3px 15px rgba(0,0,0,0.06);
        }

        .brand {
            color: #7628b8;
            font-size: 25px;
            font-weight: bold;
            text-decoration: none;
        }

        .nav-link {
            color: #7628b8;
            text-decoration: none;
            font-weight: bold;
        }

        .register-container {
            width: 100%;
            max-width: 460px;
            margin: 40px auto;
            padding: 20px;
            flex: 1;
        }

        .register-card {
            background: white;
            padding: 32px;
            border-radius: 20px;
            box-shadow: 0 12px 40px rgba(100, 40, 140, 0.12);
        }

        .icon {
            width: 65px;
            height: 65px;
            margin: 0 auto 15px;
            border-radius: 18px;
            background: #f1e1ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
        }

        h1 {
            text-align: center;
            color: #382047;
            margin-bottom: 8px;
            font-size: 27px;
        }

        .subtitle {
            text-align: center;
            color: #777;
            margin-bottom: 28px;
            font-size: 14px;
            line-height: 1.6;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #382047;
            font-size: 14px;
            font-weight: bold;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 13px;
            border: 1px solid #ded3e8;
            border-radius: 10px;
            background: #fff;
            font-size: 15
