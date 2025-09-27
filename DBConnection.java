package com.quiz.servlets;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection con = null;

    public static Connection getConnection() {
        try {
            if (con == null) {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:xe",  // change xe if your DB service name differs
                    "system", 
                    "kiit"
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
