<%@ page language="java" %>
<%@ page import="javax.servlet.http.*" %>
<html>
<head>
    <title>Quiz Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f7f9fc;
            margin: 0;
            padding: 0;
        }
        .result-container {
            width: 50%;
            margin: 100px auto;
            background: #fff;
            padding: 40px;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            font-size: 28px;
        }
        .score {
            font-size: 36px;
            color: #007BFF;
            margin: 20px 0;
            font-weight: bold;
        }
        a {
            display: inline-block;
            text-decoration: none;
            background: #28a745;
            color: white;
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 8px;
            margin-top: 20px;
            transition: background 0.3s;
        }
        a:hover {
            background: #1e7e34;
        }
    </style>
</head>
<body>
    <div class="result-container">
        <%
            HttpSession sessionObj = request.getSession(false);
            if (sessionObj != null) {
                Integer score = (Integer) sessionObj.getAttribute("score");
                Integer total = (Integer) sessionObj.getAttribute("total");
                if (score != null && total != null) {
        %>
            <h2>🎉 Your Quiz Result 🎉</h2>
            <div class="score"><%= score %> / <%= total %></div>
        <%
                } else {
        %>
            <h2>No Score Found</h2>
        <%
                }
            } else {
        %>
            <h2>Session Expired. Please try again.</h2>
        <%
            }
        %>
        <a href="index.jsp">🏠 Go to Home</a>
    </div>
</body>
</html>
