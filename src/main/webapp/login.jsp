<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login | ManishaMart</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .login-layout {
            flex: 1;
            display: grid;
            grid-template-columns: 1fr 1fr;
            align-items: center;
            gap: 40px;
            padding-top: 35px;
            padding-bottom: 35px;
        }

        .login-welcome {
            padding: 25px;
        }

        .login-welcome h1 {
            margin: 18px 0;
            font-size: clamp(35px, 5vw, 55px);
            line-height: 1.12;
            letter-spacing: -1px;
        }

        .login-welcome p {
            max-width: 450px;
            color: var(--muted);
            font-size: 16px;
        }

        .welcome-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 95px;
            height: 95px;
            border-radius: 28px;
            background: linear-gradient(135deg, #efedff, #fff0f5);
            font-size: 48px;
        }

        .login-card {
            width: 100%;
            max-width: 460px;
            margin: 0 auto;
            padding: 35px;
            background: white;
            border: 1px solid var(--border);
            border-radius: 25px;
            box-shadow: var(--shadow);
        }

        .login-card h2 {
            font-size: 29px;
            margin-bottom: 7px;
        }

        .login-description {
            color: var(--muted);
            margin-bottom: 25px;
        }

        .login-card .form-group {
            margin-bottom: 20px;
        }

        .login-card .btn {
            width: 100%;
            margin-top: 8px;
        }

        .login-extra {
            text-align: center;
            margin-top: 22px;
            font-size: 14px;
        }

        .login-extra a {
            color: var(--primary);
            font-weight: 700;
        }

        .back-home {
            display: inline-block;
            margin-top: 
