package com.quiz.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class QuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int score = 0;
        int total = 0;

        try {
            Connection con = DBConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM questions");

            while (rs.next()) {
                total++;
                int qid = rs.getInt("question_id");
                String correct = rs.getString("correct_option"); // A, B, C, D
                String userAns = req.getParameter("q" + qid);    // student's chosen answer

                if (userAns != null && correct.equalsIgnoreCase(userAns)) {
                    score++;
                }
            }

            // store both score and total in session
            HttpSession session = req.getSession();
            session.setAttribute("score", score);
            session.setAttribute("total", total);

            // redirect to result page
            resp.sendRedirect("result.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("text/html");
            resp.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
