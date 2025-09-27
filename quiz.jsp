<%@ page import="java.sql.*" %>
<%@ page import="com.quiz.servlets.DBConnection" %>
<%
    // Ensure only logged-in students can access
    String role = (String) session.getAttribute("role");
    if(role == null || !role.equals("student")) {
        response.sendRedirect("login.jsp?error=Please login as student");
        return;
    }
%>
<html>
<head>
    <title>Online Quiz</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f7f9fc; margin: 0; padding: 0; }
        .container { width: 70%; margin: 30px auto; padding: 20px; }
        .quiz-card { background: #fff; padding: 20px; margin-bottom: 20px; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .quiz-card p { font-size: 18px; font-weight: bold; color: #333; }
        .quiz-option { margin: 8px 0; font-size: 16px; }
        .quiz-option input { margin-right: 10px; }
        .submit-btn { display: inline-block; background: #007BFF; color: white; padding: 12px 25px; font-size: 16px; border: none; border-radius: 8px; cursor: pointer; transition: background 0.3s; }
        .submit-btn:hover { background: #0056b3; }
        h1 { text-align: center; color: #444; }
    </style>
</head>
<body>
<div class="container">
    <h1>Take the Quiz</h1>
    <form action="quiz" method="post">
        <%
            try {
                Connection con = DBConnection.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM questions");
                while(rs.next()) {
                    int qid = rs.getInt("question_id");
        %>
        <div class="quiz-card">
            <p><%= rs.getString("question_text") %></p>
            <div class="quiz-option">
                <input type="radio" name="q<%= qid %>" value="A"/> <%= rs.getString("option_a") %>
            </div>
            <div class="quiz-option">
                <input type="radio" name="q<%= qid %>" value="B"/> <%= rs.getString("option_b") %>
            </div>
            <div class="quiz-option">
                <input type="radio" name="q<%= qid %>" value="C"/> <%= rs.getString("option_c") %>
            </div>
            <div class="quiz-option">
                <input type="radio" name="q<%= qid %>" value="D"/> <%= rs.getString("option_d") %>
            </div>
        </div>
        <%      }
            } catch(Exception e) {
                out.println("<p style='color:red;'>Error loading questions: " + e.getMessage() + "</p>");
            }
        %>
        <center><input type="submit" value="Submit Quiz" class="submit-btn"/></center>
    </form>
</div>
</body>
</html>
