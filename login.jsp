<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef2f3;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
            width: 350px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #0078d7;
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type=submit] {
            width: 100%;
            padding: 12px;
            background: #0078d7;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background: #005fa3;
        }
        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Student Login</h2>
        <form action="login" method="post">
            <input type="text" name="username" placeholder="Enter Username" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="Login">
        </form>
        <% if (request.getParameter("error") != null) { %>
            <p class="error">Invalid Credentials!</p>
        <% } %>
    </div>
</body>
</html>
