package com.quiz.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String question = request.getParameter("question");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String correct_option = request.getParameter("correct_option"); // "A", "B", "C", "D"

        // Basic validation
        if (question == null || question.trim().isEmpty() ||
            option1 == null || option1.trim().isEmpty() ||
            option2 == null || option2.trim().isEmpty() ||
            option3 == null || option3.trim().isEmpty() ||
            option4 == null || option4.trim().isEmpty() ||
            correct_option == null || correct_option.trim().isEmpty()) {

            response.sendRedirect("admin_dashboard.jsp?error=All fields are required");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO questions (question_id, question_text, option_a, option_b, option_c, option_d, correct_option) " +
                "VALUES (questions_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)"
            );

            ps.setString(1, question.trim());
            ps.setString(2, option1.trim());
            ps.setString(3, option2.trim());
            ps.setString(4, option3.trim());
            ps.setString(5, option4.trim());
            ps.setString(6, correct_option.trim());

            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("admin_dashboard.jsp?msg=Question added successfully");
            } else {
                response.sendRedirect("admin_dashboard.jsp?error=Failed to add question");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin_dashboard.jsp?error=" + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("admin_dashboard.jsp");
    }
}
