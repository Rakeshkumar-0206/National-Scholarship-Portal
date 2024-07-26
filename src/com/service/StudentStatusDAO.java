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
import com.entity.StudentDetails;
import com.entity.StudentStatus;

public class StudentStatusDAO {

    public static List<StudentStatus> getStatus(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String aadharNumber = (String) session.getAttribute("aadharNumber");
        List<StudentStatus> statuses = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String query = "SELECT InstituteApproved, StateScholarshipApprove, InstiScholarApprove, MinistryScholarApprove FROM Student WHERE AadharNumber=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, aadharNumber);
            rs = ps.executeQuery();

            while (rs.next()) {
                String iApproved = rs.getString("InstituteApproved");
                String sApproved = rs.getString("StateScholarshipApprove");
                String intApproved = rs.getString("InstiScholarApprove");
                String mApproved = rs.getString("MinistryScholarApprove");

                StudentStatus status = new StudentStatus(iApproved, sApproved, intApproved, mApproved);
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
