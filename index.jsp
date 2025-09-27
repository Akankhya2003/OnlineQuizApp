<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Quiz App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #9face6 100%);
            text-align: center;
            padding-top: 100px;
        }
        h1 {
            color: #222;
            margin-bottom: 40px;
        }
        .menu a {
            display: inline-block;
            margin: 15px;
            padding: 14px 24px;
            background: #0078d7;
            color: white;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            transition: 0.3s;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .menu a:hover {
            background: #005fa3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h1>Welcome to Online Quiz App</h1>
    <div class="menu">
        <!-- Student Section -->
        <a href="login.jsp">🎓 Student Login</a>
        <a href="register.jsp">📝 Student Register</a>

        <!-- Admin Section -->
        <a href="admin_login.jsp">🔑 Admin Login</a>
        <a href="admin_dashboard.jsp">➕ Admin Dashboard</a>
    </div>
</body>
</html>
