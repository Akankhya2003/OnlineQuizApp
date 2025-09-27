package com.quiz.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.quiz.servlets.DBConnection;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname = req.getParameter("username");
        String pass = req.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Users WHERE username=? AND password=? AND role='student'");
            ps.setString(1, uname);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("username", uname);
                session.setAttribute("role", "student");
                resp.sendRedirect("quiz.jsp");
            } else {
                resp.sendRedirect("login.jsp?error=Invalid credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("login.jsp?error=Database error");
        }
    }
    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.sendRedirect("login.jsp");
}

}
