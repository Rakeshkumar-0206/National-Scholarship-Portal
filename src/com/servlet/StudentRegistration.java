package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnection;
import com.entity.Institute;
import com.exception.FormValidation;
import com.service.CodeDAO;

/**
 * Servlet implementation class StudentRegistration
 */
@WebServlet("/StudentRegistration")
public class StudentRegistration extends HttpServlet {
	@Override

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    List<Institute> instituteCodes = CodeDAO.getInstituteCodes();
	    System.out.println("Institute Codes: " + instituteCodes);
	    request.setAttribute("institutes", instituteCodes); // Use attribute name "institutes"
	    request.getRequestDispatcher("StudentRegistration.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String state = request.getParameter("state");
		String district = request.getParameter("district");
		String firstName = request.getParameter("firstName");
		String DOB = request.getParameter("DOB");
		String gender = request.getParameter("gender");
		String mobilenumber = request.getParameter("mobilenumber");
		String emailid = request.getParameter("emailid");
		String selectedInstituteCode = request.getParameter("selectedInstituteCode");
		String ifsccode = request.getParameter("ifsccode");
		String bankname = request.getParameter("bankname");
		String password = request.getParameter("password");
		String accountNumber = request.getParameter("accountNumber");
		String aadharnumber = request.getParameter("aadharnumber");
		try {
			Connection connection = DBConnection.getConnection();
			if (connection != null) {

				// Assuming you have a connection object named 'connection'

				// Prepare and execute the query for student table
				PreparedStatement stmt1 = connection.prepareStatement(
						"INSERT INTO student (StateOfDomicile, District, StudentName, DOB, Gender, MobileNumber, EmailID, InstituteCode, AadharNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
				stmt1.setString(1, state);
				stmt1.setString(2, district);
				stmt1.setString(3, firstName);
				stmt1.setString(4, DOB);
				stmt1.setString(5, gender);
				stmt1.setString(6, mobilenumber);
				stmt1.setString(7, emailid);
				stmt1.setString(8, selectedInstituteCode);
				stmt1.setString(9, aadharnumber);
				stmt1.executeUpdate();
				stmt1.close();

				// Prepare and execute the query for bank table
				PreparedStatement stmt2 = connection.prepareStatement(
						"INSERT INTO bank (HolderName, BankIFSCCode, BankAccountNumber, BankName, StudentAadharNumber) VALUES (?, ?, ?, ?, ?)");
				stmt2.setString(1, firstName); // Assuming HolderName is the same as StudentName
				stmt2.setString(2, ifsccode);
				stmt2.setString(3, accountNumber);
				stmt2.setString(4, bankname);
				stmt2.setString(5, aadharnumber);
				stmt2.executeUpdate();
				stmt2.close();

				// Prepare and execute the query for login table
				PreparedStatement stmt3 = connection
						.prepareStatement("INSERT INTO login (UserID, Password) VALUES (?, ?)");
				stmt3.setString(1, aadharnumber); // Assuming UserID is the same as EmailID
				stmt3.setString(2, password);
				stmt3.executeUpdate();
				stmt3.close();
				response.sendRedirect("thankyou.jsp");
			}

		} catch (Exception e) {
			out.println(e.getMessage());
		}
		try {
	        validateAadharNumber(aadharnumber);
	        validateEmail(emailid);
	        validatePassword(password);
	        validateMobileNumber(mobilenumber);

	        // If all custom validations pass, proceed with database operations
	        // ...
	    } catch (FormValidation e) {
	        out.println(e.getMessage());
	    }
		if (aadharnumber == null || aadharnumber.trim().isEmpty() || !isValidAadharNumber(aadharnumber)) {
			out.println("Username cannot be empty.");
			return;
		}

		if (emailid == null || emailid.trim().isEmpty() || !isValidEmail(emailid)) {
			System.out.println("Invalid email format.");
			return;
		}

		if (password == null || password.trim().isEmpty() || password.length() < 8) {
			System.out.println("Password should be at least 8 characters.");
			return;
		}
		if (mobilenumber == null || mobilenumber.trim().isEmpty() || !isValidMobileNumber(mobilenumber)) {
			System.out.println("Invalid mobile number format.");
			return;
		}

		// If all validations pass, proceed with further actions like database insertion
		// or processing
		// For demonstration purposes, here we'll simply display success message
		System.out.println("Registration successful!");
	}
	// Custom validation methods
	private void validateAadharNumber(String aadharNumber) throws FormValidation {
	    if (aadharNumber == null || aadharNumber.trim().isEmpty() || !isValidAadharNumber(aadharNumber)) {
	        throw new FormValidation("Invalid Aadhar number.");
	    }
	}

	private void validateEmail(String email) throws FormValidation {
	    if (email == null || email.trim().isEmpty() || !isValidEmail(email)) {
	        throw new FormValidation("Invalid email format.");
	    }
	}

	private void validatePassword(String password) throws FormValidation {
	    if (password == null || password.trim().isEmpty() || password.length() < 8) {
	        throw new FormValidation("Password should be at least 8 characters.");
	    }
	}

	private void validateMobileNumber(String phoneNumber) throws FormValidation {
	    if (phoneNumber == null || phoneNumber.trim().isEmpty() || !isValidMobileNumber(phoneNumber)) {
	        throw new FormValidation("Invalid mobile number format.");
	    }
	}

	// Method to validate email format
	private boolean isValidEmail(String email) {
		// validate email words with . or - followed by @ and words followed by . and then {com/in/edu}
		return email.matches("\\b[\\w.-]+@[-.\\w]+\\.[A-Za-z]{2,4}\\b");
	}

	public boolean isValidMobileNumber(String phoneNumber) {
		//  pattern for a 10-digit mobile number starting with 6, 7, 8, or 9
		String regexPattern = "^[6-9]\\d{9}$";

		// Compile the pattern to a regular expression
		Pattern pattern = Pattern.compile(regexPattern);

		// Match the input phone number with the pattern
		return pattern.matcher(phoneNumber).matches();
	}

	private boolean isValidAadharNumber(String aadharNumber) {
		// Validate Aadhar number - It should contain exactly 12 digits
		return aadharNumber.matches("\\d{12}");
	}
}
