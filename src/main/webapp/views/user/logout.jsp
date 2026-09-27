<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout | Blog</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            background: #eef5fb;
            color: #1f2d3d;
            font-family: Arial, sans-serif;
            padding-bottom: 100px;
        }

        .page {
            max-width: 900px;
            margin: auto;
            padding: 26px 20px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #d5e2ed;
            padding-bottom: 18px;
        }

        .logo {
            color: #229ed9;
            font-size: 22px;
            font-weight: bold;
            letter-spacing: 3px;
        }

        .logo span {
            color: #168ac1;
        }

        .status {
            color: #7b91a4;
            font-size: 12px;
        }

        .logout-card {
            max-width: 430px;
            margin: 100px auto 0;
            padding: 35px;
            background: white;
            border: 1px solid #dce8f1;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 12px 30px rgba(90, 121, 149, .14);
        }

        .logout-card h1 {
            margin: 0 0 12px;
            font-size: 34px;
        }

        .logout-card p {
            margin-bottom: 28px;
            color: #718696;
            line-height: 1.6;
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 12px;
        }

        .button {
            display: inline-block;
            min-width: 130px;
            padding: 13px 18px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }

        .confirm-button {
            border: 0;
            background: #e45770;
            color: white;
        }

        .confirm-button:hover {
            background: #c9435b;
        }

        .cancel-button {
            border: 1px solid #c8dce9;
            background: #f8fbfd;
            color: #168ac1;
        }

        .cancel-button:hover {
            background: #e3f4fc;
        }

        .nav {
            position: fixed;
            z-index: 20;
            left: 50%;
            bottom: 18px;
            transform: translateX(-50%);
            display: flex;
            gap: 4px;
            padding: 8px;
            background: white;
            border: 1px solid #dce8f1;
            border-radius: 18px;
            box-shadow: 0 10px 28px rgba(90, 121, 149, .22);
        }

        .nav a {
            min-width: 72px;
            padding: 9px 8px;
            border-radius: 12px;
            color: #8ba0b0;
            font-size: 11px;
            text-align: center;
            text-decoration: none;
        }

        .nav a:hover {
            background: #e3f4fc;
            color: #168ac1;
        }

        .icon {
            display: block;
            margin-bottom: 4px;
            font-size: 22px;
        }

        @media (max-width: 600px) {
            .actions {
                flex-direction: column;
            }

            .button {
                width: 100%;
            }

            .nav {
                width: calc(100% - 20px);
                justify-content: space-between;
            }

            .nav a {
                min-width: 0;
                flex: 1;
                padding: 8px 3px;
                font-size: 10px;
            }
        }
    </style>
</head>
<body>
<div class="page">
    <header>
        <div class="logo">Blog<span>+</span></div>
        <div class="status">ACCOUNT</div>
    </header>

    <main class="logout-card">
        <h1>Are you sure?</h1>
        <p>You will be signed out of your account.</p>

        <div class="actions">
            <form action="${pageContext.request.contextPath}/logout" method="post">
                <button class="button confirm-button" type="submit">
                    Yes, log out
                </button>
            </form>

            <a class="button cancel-button"
               href="${pageContext.request.contextPath}/">
                Cancel
            </a>
        </div>
    </main>
</div>

<nav class="nav">
    <a href="${pageContext.request.contextPath}/">
        <span class="icon">⌂</span>
        <span>Home</span>
    </a>

    <a href="${pageContext.request.contextPath}/create">
        <span class="icon">＋</span>
        <span>Create</span>
    </a>

    <a href="${pageContext.request.contextPath}/my_uploads">
        <span class="icon">↥</span>
        <span>Uploads</span>
    </a>

    <a href="${pageContext.request.contextPath}/logout">
        <span class="icon">⇥</span>
        <span>Logout</span>
    </a>
</nav>
</body>
</html>
