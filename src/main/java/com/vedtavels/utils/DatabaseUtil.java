package com.vedtravels.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/project";
<<<<<<< HEAD
    private static final String USER = "enter your username";
    private static final String PASSWORD = "enter your password";
=======
    private static final String USER = "Enter Your Username";
    private static final String PASSWORD = "Enter Your Password";
>>>>>>> 8626b33126b4dfe6944fba776ad915bc63bd970b

    public static Connection getConnection() throws SQLException {
        try {
            // Explicitly load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found!", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
