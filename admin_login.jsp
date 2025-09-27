<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body { font-family: Arial; text-align:center; padding-top:80px; }
        input { margin:5px; padding:8px; width:200px; }
        input[type=submit] { background:#007bff; color:white; border:none; cursor:pointer; }
        input[type=submit]:hover { background:#0056b3; }
        .error { color:red; }
    </style>
</head>
<body>
    <h2>Admin Login</h2>
    <form action="adminLogin" method="post">
        <input type="text" name="username" placeholder="Username" required/><br/>
        <input type="password" name="password" placeholder="Password" required/><br/>
        <input type="submit" value="Login"/>
    </form>
    <%
        if ("1".equals(request.getParameter("error"))) {
    %>
        <p class="error">Invalid Credentials!</p>
    <%
        }
    %>
</body>
</html>
