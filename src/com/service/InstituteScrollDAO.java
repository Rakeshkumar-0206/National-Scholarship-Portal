package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.db.DBConnection;
import com.entity.InstituteScroll;
import com.entity.Scholarship;

public class InstituteScrollDAO {
	 public static List<InstituteScroll> getInstitute(HttpServletRequest request) {
	        List<InstituteScroll> students = new ArrayList<>();
	        Connection conn = null;
	        PreparedStatement ps1 = null;
	        PreparedStatement ps2 = null;
	        ResultSet rs1 = null;
	        ResultSet rs2 = null;

	        try {
	            conn = DBConnection.getConnection();
	            
	            // Query to fetch student details
	            String query1 = "SELECT InstituteCode, InstituteName, DISCCode from institutes where StateApproved = 'No' and MinistryApproved = 'No' ";
	            ps1 = conn.prepareStatement(query1);
	            rs1 = ps1.executeQuery();

	            // Query to fetch financial details
	            String query2 = "SELECT PhoneNumber from institutecontacts where PhoneNumber is NOT NULL";
	            ps2 = conn.prepareStatement(query2);
	            rs2 = ps2.executeQuery();

	            // Merge data from both result sets
	            while (rs1.next() && rs2.next()) {
	                String code = rs1.getString("InstituteCode");
	                String name = rs1.getString("InstituteName");
	                String dise = rs1.getString("DISCCode");
	                String mobile = rs2.getString("PhoneNumber");

	                InstituteScroll student = new InstituteScroll(code, name, dise, mobile);
	                students.add(student);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle the exception
	        } finally {
	            // Close resources in finally block
	        }

	        return students;
	    }
}
