package com.quiz.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO Users(username, password, role) VALUES(?, ?, ?)"
            );
            ps.setString(1, username);
            ps.setString(2, password); // ⚠️ In real apps, hash passwords!
            ps.setString(3, role);

            int i = ps.executeUpdate();

            if(i > 0) {
                // Redirect based on role
                if(role.equalsIgnoreCase("admin")) {
                    response.sendRedirect("admin_login.jsp");  // Admin login page
                } else {
                    response.sendRedirect("login.jsp");        // Student login page
                }
            } else {
                out.println("<script>alert('Registration failed. Try again.'); window.location='register.jsp';</script>");
            }

        } catch(Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error: " + e.getMessage() + "'); window.location='register.jsp';</script>");
        }
    }
}
