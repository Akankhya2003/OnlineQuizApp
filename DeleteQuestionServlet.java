package com.quiz.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String q_id_str = req.getParameter("q_id");

        if (q_id_str == null || q_id_str.trim().isEmpty()) {
            resp.sendRedirect("admin_dashboard.jsp?error=Question ID is required");
            return;
        }

        try {
            int question_id = Integer.parseInt(q_id_str.trim());
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM questions WHERE question_id=?"
            );
            ps.setInt(1, question_id);

            int i = ps.executeUpdate();
            if (i > 0) {
                resp.sendRedirect("admin_dashboard.jsp?msg=Question deleted successfully");
            } else {
                resp.sendRedirect("admin_dashboard.jsp?error=Question not found");
            }
        } catch (NumberFormatException nfe) {
            resp.sendRedirect("admin_dashboard.jsp?error=Invalid Question ID");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("admin_dashboard.jsp?error=" + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("admin_dashboard.jsp");
    }
}
