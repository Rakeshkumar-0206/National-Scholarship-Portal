package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.db.DBConnection;


@WebServlet("/InstituteRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class InstituteRegister extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        try{
	        	Connection connection = DBConnection.getConnection();
	            if (connection != null) {
	                String instituteCategory = request.getParameter("instituteCategory");
	                String name = request.getParameter("Name");
	                String inputState = request.getParameter("inputState");
	                String inputDistrict = request.getParameter("inputDistrict");
	                String code = request.getParameter("code");
	                String disccode = request.getParameter("disccode");
	                String location = request.getParameter("location");
	                String instituteType = request.getParameter("instituteType");
	                String affiliatedState = request.getParameter("affiliatedState");
	                String boardname = request.getParameter("boardname");
	                String admissionStart = request.getParameter("admissionStart");
	                String email = request.getParameter("email");
	                String password = request.getParameter("password");
	                Part instituteRegistrationCertificate = request.getPart("instituteRegistrationCertificate");
	                Part universityAffiliatedCertificate = request.getPart("universityAffiliatedCertificate");
	                String line1 = request.getParameter("line1");
	                String line2 = request.getParameter("line2");
	                String city = request.getParameter("city");
	                String pincode = request.getParameter("pincode");
	                String pname = request.getParameter("pname");
	                String mnumber = request.getParameter("mnumber");
	                String telephone = request.getParameter("telephone");

	                // Insert into institutes table
	                String insertInstitutesQuery = "INSERT INTO institutes (InstituteCode, InstituteName, InstituteCategory, DISCCode, Location, InstituteType, AdmissionStartYear, AffiliatedUniversityState, AffiliatedUniversityBoardName, UniversityAffiliatedCertificate, InstituteRegistrationCertificate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	                PreparedStatement preparedStatementInstitutes = connection.prepareStatement(insertInstitutesQuery);
	                preparedStatementInstitutes.setString(1, code);
	                preparedStatementInstitutes.setString(2, name);
	                preparedStatementInstitutes.setString(3, instituteCategory);
	                preparedStatementInstitutes.setString(4, disccode);
	                preparedStatementInstitutes.setString(5, location);
	                preparedStatementInstitutes.setString(6, instituteType);
	                preparedStatementInstitutes.setString(7,admissionStart);
	                preparedStatementInstitutes.setString(8, affiliatedState);
	                preparedStatementInstitutes.setString(9, boardname);
	                preparedStatementInstitutes.setString(10, universityAffiliatedCertificate.getSubmittedFileName()); // Assuming file name as string
	                preparedStatementInstitutes.setString(11, instituteRegistrationCertificate.getSubmittedFileName()); // Assuming file name as string
	                preparedStatementInstitutes.executeUpdate();
	                preparedStatementInstitutes.close();

	                // Insert into institutecontacts table
	                String insertContactsQuery = "INSERT INTO institutecontacts (InstituteCode, PrincipalName, PhoneNumber, TelephoneNumber, email) VALUES (?, ?, ?, ?, ?)";
	                PreparedStatement preparedStatementContacts = connection.prepareStatement(insertContactsQuery);
	                preparedStatementContacts.setString(1, code);
	                preparedStatementContacts.setString(2, pname);
	                preparedStatementContacts.setString(3, mnumber);
	                preparedStatementContacts.setString(4, telephone);
	                preparedStatementContacts.setString(5, email);
	                preparedStatementContacts.executeUpdate();
	                preparedStatementContacts.close();

	                // Insert into instituteaddresses table
	                String insertAddressesQuery = "INSERT INTO instituteaddresses (InstituteCode, AddressLine1, AddressLine2, City, State, District, Pincode) VALUES (?, ?, ?, ?, ?, ?, ?)";
	                PreparedStatement preparedStatementAddresses = connection.prepareStatement(insertAddressesQuery);
	                preparedStatementAddresses.setString(1, code);
	                preparedStatementAddresses.setString(2, line1);
	                preparedStatementAddresses.setString(3, line2);
	                preparedStatementAddresses.setString(4, city);
	                preparedStatementAddresses.setString(5, inputState);
	                preparedStatementAddresses.setString(6, inputDistrict);
	                preparedStatementAddresses.setString(7, pincode);
	                preparedStatementAddresses.executeUpdate();
	                preparedStatementAddresses.close();

	                // Insert into login table
	                String insertLoginQuery = "INSERT INTO login (UserID, Password, verify) VALUES (?, ?, ?)";
	                PreparedStatement preparedStatementLogin = connection.prepareStatement(insertLoginQuery);
	                preparedStatementLogin.setString(1, email);
	                preparedStatementLogin.setString(2, password);
	                preparedStatementLogin.setString(3, code);
	                preparedStatementLogin.executeUpdate();
	                preparedStatementLogin.close();

	                // Redirect to home.jsp after successful insertion
	                out.println("<script type=\"text/javascript\">");
                    out.println("alert('Institute registered. Please login.!');");
                    out.println("window.location.href = 'http://localhost:8080/NationalScholarshipPortal/home.jsp';"); // Redirect using JavaScript
                    out.println("</script>");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            out.println("Database error: " + e.getMessage());
	        }
	    }
}