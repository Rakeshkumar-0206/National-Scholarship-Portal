package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnection;
import com.entity.StudentScholarship;
import com.service.StudentScholarshipDAO;

@WebServlet("/ScholarshipStudent")
public class ScholarshipStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<StudentScholarship> profile = StudentScholarshipDAO.getDetails(request);

        request.setAttribute("students", profile);

        RequestDispatcher dispatcher = request.getRequestDispatcher("ScholarshipForm1.jsp");
        dispatcher.forward(request, response);
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
        	Connection connection = DBConnection.getConnection();
        	if(connection != null) {
        		String aadharNumber = request.getParameter("aadharNumber");
        		String religion = request.getParameter("religion");
        		String community = request.getParameter("community");
        		String fathername = request.getParameter("fathername");
        		String mothername = request.getParameter("mothername");
        		String annualincome = request.getParameter("annualincome");
        		String presentclass = request.getParameter("presentclass");
        		String courseyear = request.getParameter("courseyear");
        		String ModeOfStudy = request.getParameter("ModeOfStudy");
        		String startdate = request.getParameter("startdate");
        		String university= request.getParameter("UNIVBOARD");
        		String previouscourse = request.getParameter("previouscourse");
        		String previousyear = request.getParameter("previousyear");
        		String previousclass = request.getParameter("previousclass");
        		String rollnumber = request.getParameter("rollnumber");
        		String boardname = request.getParameter("boardname");
        		String passingyear = request.getParameter("passingyear");
        		String percentage = request.getParameter("percentage");
        		String rolNumber = request.getParameter("rolNumber");
        		String tboardname = request.getParameter("tboardname");
        		String TwpassingYear = request.getParameter("TwpassingYear");
        		String Twpercentage = request.getParameter("Twpercentage");
        		String admissionfee = request.getParameter("admissionfee");
        		String tutionfee = request.getParameter("tutionfee");
        		String otherfee = request.getParameter("otherfee");
        		String maritalStatus = request.getParameter("maritalStatus");
        		String parentprofession = request.getParameter("parentprofession");
        		String state = request.getParameter("state");
        		String district = request.getParameter("district");
        		String taluk = request.getParameter("taluk");
        		String housenumber = request.getParameter("housenumber");
        		String streetnumber = request.getParameter("streetnumber");
        		String pincode = request.getParameter("pincode");
        		HttpSession session = request.getSession();
        		session.setAttribute("aadharNumber", aadharNumber); // Store Aadhar Number in the session

        		// Prepare and execute the query for student_personal_details table
        		PreparedStatement stmt1 = connection.prepareStatement("INSERT INTO student_personal_details (AadharNumber, Religion, Community, FatherName, MotherName, MaritalStatus, ParentsProfession, State, District, BlockTaluk, HouseNumber, StreetNumber, Pincode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        		stmt1.setString(1, aadharNumber);
        		stmt1.setString(2, religion);
        		stmt1.setString(3, community);
        		stmt1.setString(4, fathername);
        		stmt1.setString(5, mothername);
        		stmt1.setString(6, maritalStatus);
        		stmt1.setString(7, parentprofession);
        		stmt1.setString(8, state);
        		stmt1.setString(9, district);
        		stmt1.setString(10, taluk);
        		stmt1.setString(11, housenumber);
        		stmt1.setString(12, streetnumber);
        		stmt1.setString(13, pincode);
        		stmt1.executeUpdate();
        		stmt1.close();

        		// Prepare and execute the query for student_education_details table
        		PreparedStatement stmt2 = connection.prepareStatement("INSERT INTO student_education_details (AadharNumber, PresentClassCourse, PresentClassCourseYear, ModeOfStudy, ClassStartDate, UniversityOrBoardName, PreviousClassCourse, PreviousPassingYear, PreviousClassPercentage, TenthRollNumber, TenthBoardName, TenthPassingYear, TenthPercentageObtained, TwelfthRollNumber, TwelfthBoardName, TwelfthPassingYear, TwelfthPercentageObtained) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        		stmt2.setString(1, aadharNumber);
        		stmt2.setString(2, presentclass);
        		stmt2.setString(3, courseyear);
        		stmt2.setString(4, ModeOfStudy);
        		stmt2.setString(5, startdate);
        		stmt2.setString(6, university);
        		stmt2.setString(7, previouscourse);
        		stmt2.setString(8, previousyear);
        		stmt2.setString(9, previousclass);
        		stmt2.setString(10, rollnumber);
        		stmt2.setString(11, boardname);
        		stmt2.setString(12, passingyear);
        		stmt2.setString(13, percentage);
        		stmt2.setString(14, rolNumber);
        		stmt2.setString(15, tboardname);
        		stmt2.setString(16, TwpassingYear);
        		stmt2.setString(17, Twpercentage);
        		stmt2.executeUpdate();
        		stmt2.close();
        		
        		// Prepare and execute the query for student_financial_details table
        		PreparedStatement stmt = connection.prepareStatement("INSERT INTO student_financial_details (AadharNumber, SelectedScheme, FamilyAnnualIncome, AdmissionFee, TuitionFee, OtherFee) VALUES (?, ?, ?, ?, ?, ?)");
        		stmt.setString(1, aadharNumber);
        		stmt.setString(2, null); // Assuming 'selectedScheme' is the value for SelectedScheme
        		stmt.setString(3, annualincome);
        		stmt.setString(4, admissionfee);
        		stmt.setString(5, tutionfee);
        		stmt.setString(6, otherfee);
        		stmt.executeUpdate();
        		stmt.close();
        		
        		response.sendRedirect("ScholarshipForm2.jsp");

        	}
        }catch(Exception e) {
        	out.println(e.getMessage());
        }
	}

}
