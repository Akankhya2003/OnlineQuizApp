package com.quiz.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.quiz.servlets.DBConnection;

public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname = req.getParameter("username");
        String pass = req.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Users WHERE username=? AND password=? AND role='admin'");
            ps.setString(1, uname);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("username", uname);
                session.setAttribute("role", "admin");
                resp.sendRedirect("admin_dashboard.jsp");
            } else {
                resp.sendRedirect("admin_login.jsp?error=Invalid credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("admin_login.jsp?error=Database error");
        }
    }
    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.sendRedirect("admin_login.jsp"); // or admin login page
}

}
