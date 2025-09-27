<%@ page import="java.sql.*" %>
<%@ page import="com.quiz.servlets.DBConnection" %>
<%
    String role = (String) session.getAttribute("role");
    if(role == null || !role.equals("admin")) {
        response.sendRedirect("admin_login.jsp?error=Please login as admin");
        return;
    }

    // Capture messages from URL parameters
    String msg = request.getParameter("msg");
    String error = request.getParameter("error");
%>
<html>
<head>
<title>Admin Dashboard</title>
<style>
body { font-family: Arial, sans-serif; background: #f0f4f8; margin: 0; padding: 0; }
.container { width: 80%; margin: 30px auto; background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
h1 { text-align: center; color: #333; margin-bottom: 20px; }
h2 { color: #007BFF; margin-top: 40px; }
label { font-weight: bold; color: #555; }
input[type="text"], select { width: 100%; padding: 10px; margin: 8px 0 20px 0; border: 1px solid #ccc; border-radius: 8px; font-size: 16px; }
input[type="submit"] { background-color: #007BFF; color: white; font-size: 16px; padding: 10px; border: none; border-radius: 8px; cursor: pointer; transition: background 0.3s; }
input[type="submit"]:hover { background-color: #0056b3; }
table { width: 100%; border-collapse: collapse; margin-top: 20px; }
th, td { padding: 10px; text-align: center; border: 1px solid #ccc; }
th { background: #007BFF; color: white; }
.msg { color: green; font-weight: bold; margin-bottom: 20px; text-align: center; }
.error { color: red; font-weight: bold; margin-bottom: 20px; text-align: center; }
</style>
</head>
<body>
<div class="container">
<h1>Admin Dashboard</h1>

<!-- Display success or error message -->
<% if(msg != null) { %>
    <div class="msg"><%= msg %></div>
<% } %>
<% if(error != null) { %>
    <div class="error"><%= error %></div>
<% } %>

<!-- Add Question Form -->
<h2>Add New Question</h2>
<form action="addQuestion" method="post">
<label>Question:</label>
<input type="text" name="question" required>
<label>Option 1:</label><input type="text" name="option1" required>
<label>Option 2:</label><input type="text" name="option2" required>
<label>Option 3:</label><input type="text" name="option3" required>
<label>Option 4:</label><input type="text" name="option4" required>
<label>Correct Option:</label>
<select name="correct_option" required>
<option value="A">Option 1</option>
<option value="B">Option 2</option>
<option value="C">Option 3</option>
<option value="D">Option 4</option>
</select>
<input type="submit" value="Add Question">
</form>

<!-- Update Question Form -->
<h2>Update Question</h2>
<form action="updateQuestion" method="post">
<label>Question ID:</label><input type="text" name="q_id" required>
<label>New Question:</label><input type="text" name="question" required>
<label>Option 1:</label><input type="text" name="option1" required>
<label>Option 2:</label><input type="text" name="option2" required>
<label>Option 3:</label><input type="text" name="option3" required>
<label>Option 4:</label><input type="text" name="option4" required>
<label>Correct Option:</label>
<select name="correct_option" required>
<option value="A">Option 1</option>
<option value="B">Option 2</option>
<option value="C">Option 3</option>
<option value="D">Option 4</option>
</select>
<input type="submit" value="Update Question">
</form>

<!-- Delete Question Form -->
<h2>Delete Question</h2>
<form action="deleteQuestion" method="post">
<label>Question ID:</label><input type="text" name="q_id" required>
<input type="submit" value="Delete Question">
</form>

<!-- View All Questions -->
<h2>All Questions</h2>
<table>
<tr>
<th>ID</th><th>Question</th><th>Option 1</th><th>Option 2</th>
<th>Option 3</th><th>Option 4</th><th>Correct</th>
</tr>
<%
try {
    Connection con = DBConnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM questions ORDER BY question_id");
    while(rs.next()) {
        String correct = rs.getString("correct_option");
        String correctText = correct.equals("A") ? "Option 1" :
                             correct.equals("B") ? "Option 2" :
                             correct.equals("C") ? "Option 3" : "Option 4";
%>
<tr>
<td><%= rs.getInt("question_id") %></td>
<td><%= rs.getString("question_text") %></td>
<td><%= rs.getString("option_a") %></td>
<td><%= rs.getString("option_b") %></td>
<td><%= rs.getString("option_c") %></td>
<td><%= rs.getString("option_d") %></td>
<td><%= correctText %></td>
</tr>
<% } } catch(Exception e) { %>
<tr><td colspan="7">Error loading questions: <%= e.getMessage() %></td></tr>
<% } %>
</table>
</div>
</body>
</html>
