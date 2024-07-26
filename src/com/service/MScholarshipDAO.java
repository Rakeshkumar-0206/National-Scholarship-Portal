package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.db.DBConnection;
import com.entity.Scholarship;

public class MScholarshipDAO {
	 public static List<Scholarship> getMinistryScholarship(HttpServletRequest request) {
	        List<Scholarship> students = new ArrayList<>();
	        Connection conn = null;
	        PreparedStatement ps1 = null;
	        PreparedStatement ps2 = null;
	        ResultSet rs1 = null;
	        ResultSet rs2 = null;

	        try {
	            conn = DBConnection.getConnection();
	            
	            // Query to fetch student details
	            String query1 = "SELECT StudentName, MobileNumber, AadharNumber FROM student where InstituteApproved = 'Yes' and InstiScholarApprove = 'Yes' and StateScholarshipApprove = 'Yes' and MinistryScholarApprove = 'No' ";
	            ps1 = conn.prepareStatement(query1);
	            rs1 = ps1.executeQuery();

	            // Query to fetch financial details
	            String query2 = "SELECT SelectedScheme FROM student_financial_details where SelectedScheme is NOT NULL";
	            ps2 = conn.prepareStatement(query2);
	            rs2 = ps2.executeQuery();

	            // Merge data from both result sets
	            while (rs1.next() && rs2.next()) {
	                String name = rs1.getString("StudentName");
	                String mobile = rs1.getString("MobileNumber");
	                String aadharNumber = rs1.getString("AadharNumber");
	                String selectedScheme = rs2.getString("SelectedScheme");

	                Scholarship student = new Scholarship(name, aadharNumber, mobile, selectedScheme);
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
