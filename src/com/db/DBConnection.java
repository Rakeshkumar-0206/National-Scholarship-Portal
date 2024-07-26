package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Modify these constants according to your database configuration
    private static final String URL = "jdbc:mysql://localhost:3306/NationalScholarship";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new SQLException("Database connection error: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        try {
            // Test the database connection
            Connection connection = DBConnection.getConnection();
            if (connection != null) {
                System.out.println("Database connection established successfully.");
                connection.close(); // Close the connection when done
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error: " + e.getMessage());
        }
    }
}
