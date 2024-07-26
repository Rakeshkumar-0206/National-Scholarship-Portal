package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.db.DBConnection;
import com.entity.StudentScholarship;

public class StudentScholarshipDAO {

    public static List<StudentScholarship> getDetails(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String aadharNumber = (String) session.getAttribute("aadharNumber");
        List<StudentScholarship> statuses = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String query = "SELECT InstituteCode FROM student WHERE AadharNumber=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, aadharNumber);
            rs = ps.executeQuery();

            while (rs.next()) {
                String iApproved = rs.getString("InstituteCode");

                StudentScholarship status = new StudentScholarship(aadharNumber, iApproved);
                statuses.add(status);
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

        return statuses;
    }
}
