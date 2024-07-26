package com.service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.db.DBConnection;
import com.entity.Student;


public class StudentDAO {
    // Method to get pending students from the database
    public static List<Student> getPendingStudents(HttpSession session) {
        List<Student> pendingStudents = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Connection connection = null;

        try {
        	 String instituteCode = (String) session.getAttribute("addInfo");
            // Get a connection to the database using your DBUtil class or DriverManager
           connection = DBConnection.getConnection();

            // SQL query to retrieve pending students
            String query = "SELECT StudentName, DOB, AadharNumber, MobileNumber FROM student WHERE InstituteCode = ? and InstituteApproved = 'No'";

            // Create a prepared statement  
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, instituteCode);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            // Process the result set
            while (resultSet.next()) {
            	System.out.println("Data is taken");
                String studentName = resultSet.getString("studentName");
                Date dob = resultSet.getDate("dob");
                String aadharNumber = resultSet.getString("aadharNumber");
                String mobileNumber = resultSet.getString("mobileNumber");

                // Create Student objects and add them to the list
                Student student = new Student(studentName, dob, aadharNumber, mobileNumber);
                pendingStudents.add(student);
            }
        } catch (SQLException e) {
            // Handle exceptions here, log or throw as needed
        	System.out.println(e.getMessage());
        } 
        return pendingStudents;
    }
}
