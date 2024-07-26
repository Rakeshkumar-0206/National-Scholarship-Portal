package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.db.DBConnection; // Assuming you have a DBConnection class for establishing a database connection
import com.entity.StudentDetails;

public class StudentDetailsDAO {

    public static List<StudentDetails> getAllStudents(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String aadharNumber = (String) session.getAttribute("aadharNumber");
        List<StudentDetails> students = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String query = "SELECT s.StudentName, s.EmailID, s.MobileNumber, s.DOB, s.InstituteCode, i.InstituteName " +
                           "FROM Student s INNER JOIN Institutes i ON s.InstituteCode = i.InstituteCode WHERE AadharNumber=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, aadharNumber);
            rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("StudentName");
                String email = rs.getString("EmailID");
                String mobile = rs.getString("MobileNumber");
                Date dateOfBirth = rs.getDate("DOB");
                String instituteCode = rs.getString("InstituteCode");
                String instituteName = rs.getString("InstituteName");

                StudentDetails student = new StudentDetails(name, dateOfBirth, mobile, email, instituteCode, instituteName);
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return students;
    }
}
