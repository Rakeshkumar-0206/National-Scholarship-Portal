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

import com.db.DBConnection;
import com.entity.ApproveScholarship;
import com.entity.StudentDetails;

//... (existing imports)

public class FormScholarshipDAO {

 public static List<ApproveScholarship> getScholarForm(String studentId) {
     String aadharNumber = studentId;
     List<ApproveScholarship> students = new ArrayList<>();
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

         String query1 = "SELECT s.StudentName FROM Student s WHERE AadharNumber=?";
         ps1 = conn.prepareStatement(query1);
         ps1.setString(1, aadharNumber);
         rs1 = ps1.executeQuery();

         String query2 = "select spd.FatherName, spd.MotherName, spd.HouseNumber, spd.StreetNumber, spd.Pincode "
                 + "from student_personal_details spd where AadharNumber = ?";
         ps2 = conn.prepareStatement(query2);
         ps2.setString(1, aadharNumber);
         rs2 = ps2.executeQuery();

         String query3 = "select sed.PresentClassCourse, sed.PresentClassCourseYear, sed.TenthPercentageObtained, "
                 + "sed.TwelfthPercentageObtained from student_education_details sed where AadharNumber = ?";
         ps3 = conn.prepareStatement(query3);
         ps3.setString(1, aadharNumber);
         rs3 = ps3.executeQuery();

         String query4 = "select sfd.SelectedScheme, sfd.FamilyAnnualIncome from student_financial_details sfd where AadharNumber=?";
         ps4 = conn.prepareStatement(query4);
         ps4.setString(1, aadharNumber);
         rs4 = ps4.executeQuery();

         String query5 = "select sdd.Disabled from student_disability_details sdd where AadharNumber=?";
         ps5 = conn.prepareStatement(query5);
         ps5.setString(1, aadharNumber);
         rs5 = ps5.executeQuery();

         while (rs1.next() && rs2.next() && rs3.next() && rs4.next() && rs5.next()) {
             String name = rs1.getString("StudentName");
             String fatherName = rs2.getString("FatherName");
             String motherName = rs2.getString("MotherName");
             String houseNumber = rs2.getString("HouseNumber");
             String streetNumber = rs2.getString("StreetNumber");
             String pincode = rs2.getString("Pincode");
             String presentCourse = rs3.getString("PresentClassCourse");
             String presentYear = rs3.getString("PresentClassCourseYear");
             String tenthPercentage = rs3.getString("TenthPercentageObtained");
             String twelfthPercentage = rs3.getString("TwelfthPercentageObtained");
             String selectedScheme = rs4.getString("SelectedScheme");
             String annualIncome = rs4.getString("FamilyAnnualIncome");
             String disabled = rs5.getString("Disabled");

             ApproveScholarship student = new ApproveScholarship(aadharNumber, name, fatherName, motherName,
                     selectedScheme, houseNumber, streetNumber, presentCourse, presentYear, pincode, tenthPercentage,
                     twelfthPercentage, disabled, annualIncome);
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
