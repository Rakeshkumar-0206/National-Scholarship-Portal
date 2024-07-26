package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.entity.ApproveScholarship;
import com.entity.InstituteDetails;

public class InstituteDetailsDAO {
	public static List<InstituteDetails> getInstituteDetails(String studentId) {
	     String instituteCode = studentId;
	     List<InstituteDetails> students = new ArrayList<>();
	     Connection conn = null;
	     PreparedStatement ps1 = null;
	     ResultSet rs1 = null;
	     PreparedStatement ps2 = null;
	     ResultSet rs2 = null;
	     PreparedStatement ps3 = null;
	     ResultSet rs3 = null;
	     PreparedStatement ps4 = null;
	     ResultSet rs4 = null;
	     PreparedStatement ps5 = null;
	     ResultSet rs5 = null;

	     try {
	         conn = DBConnection.getConnection();

	         String query1 = "SELECT InstituteName, DISCCode, AdmissionStartYear, InstituteCategory, AffiliatedUniversityBoardName from institutes WHERE InstituteCode=?";
	         ps1 = conn.prepareStatement(query1);
	         ps1.setString(1, instituteCode);
	         rs1 = ps1.executeQuery();

	         String query2 = "select PrincipalName, PhoneNumber from institutecontacts where InstituteCode = ?";
	         ps2 = conn.prepareStatement(query2);
	         ps2.setString(1, instituteCode);
	         rs2 = ps2.executeQuery();

	         while (rs1.next() && rs2.next()) {
	             String name = rs1.getString("InstituteName");
	             String disc = rs1.getString("DISCCode");
	             String startYear = rs1.getString("AdmissionStartYear");
	             String type = rs1.getString("InstituteCategory");
	             String board = rs1.getString("AffiliatedUniversityBoardName");
	             String princiName = rs2.getString("PrincipalName");
	             String phnNumber = rs2.getString("PhoneNumber");
	            

	             InstituteDetails student = new InstituteDetails(instituteCode, name, disc, type, startYear, board, princiName, phnNumber);
	             students.add(student);
	         }
	     } catch (SQLException e) {
	         e.printStackTrace();
	         // Handle the exception
	     } finally {
	         try {
	             if (rs1 != null) rs1.close();
	             if (ps1 != null) ps1.close();
	             if (rs2 != null) rs2.close();
	             if (ps2 != null) ps2.close();
	             if (rs3 != null) rs3.close();
	             if (ps3 != null) ps3.close();
	             if (rs4 != null) rs4.close();
	             if (ps4 != null) ps4.close();
	             if (rs5 != null) rs5.close();
	             if (ps5 != null) ps5.close();
	             if (conn != null) conn.close();
	         } catch (SQLException e) {
	             e.printStackTrace();
	         }
	     }
	     return students;
	 }
}
