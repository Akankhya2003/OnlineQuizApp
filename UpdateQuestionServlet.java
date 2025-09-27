package com.quiz.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String q_id_str = req.getParameter("q_id");
        String question = req.getParameter("question");
        String optionA = req.getParameter("option1");
        String optionB = req.getParameter("option2");
        String optionC = req.getParameter("option3");
        String optionD = req.getParameter("option4");
        String correct_option = req.getParameter("correct_option"); // "A", "B", "C", "D"

        // Validation
        if (q_id_str == null || q_id_str.trim().isEmpty() ||
            question == null || question.trim().isEmpty() ||
            optionA == null || optionA.trim().isEmpty() ||
            optionB == null || optionB.trim().isEmpty() ||
            optionC == null || optionC.trim().isEmpty() ||
            optionD == null || optionD.trim().isEmpty() ||
            correct_option == null || correct_option.trim().isEmpty()) {

            resp.sendRedirect("admin_dashboard.jsp?error=All fields are required");
            return;
        }

        try {
            int q_id = Integer.parseInt(q_id_str.trim());
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE questions SET question_text=?, option_a=?, option_b=?, option_c=?, option_d=?, correct_option=? WHERE question_id=?"
            );

            ps.setString(1, question.trim());
            ps.setString(2, optionA.trim());
            ps.setString(3, optionB.trim());
            ps.setString(4, optionC.trim());
            ps.setString(5, optionD.trim());
            ps.setString(6, correct_option.trim());
            ps.setInt(7, q_id);

            int i = ps.executeUpdate();
            if (i > 0) {
                resp.sendRedirect("admin_dashboard.jsp?msg=Question updated successfully");
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
