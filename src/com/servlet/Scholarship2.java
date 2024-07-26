package com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

import com.db.DBConnection;

@WebServlet("/Scholarship2")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class Scholarship2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			Connection connection = DBConnection.getConnection();
			if (connection != null) {
				String AadharNumber = (String) request.getSession().getAttribute("aadharNumber");
				String DISABILITY = request.getParameter("DISABILITY");
				String disabilitytype = request.getParameter("disabilitytype");
				String perDisability = request.getParameter("perDisability");
				String schemeapply = request.getParameter("schemeapply");
				Part domicile = request.getPart("domicile");
				Part photo = request.getPart("photo");
				Part idcard = request.getPart("idcard");
				Part casteOrincome = request.getPart("casteOrincome");
				Part PreviousYearMarksheet = request.getPart("PreviousYearMarksheet");
				Part feeReceipt = request.getPart("feeReceipt");
				Part passbook = request.getPart("passbook");
				Part aadharcard = request.getPart("aadharcard");
				Part marsheet1 = request.getPart("marsheet1");
				Part marsheet2 = request.getPart("marsheet2");

				// Assuming you have a connection object named 'connection'

				// Insert into student_disability_details table
				PreparedStatement stmtDisability = connection.prepareStatement(
						"INSERT INTO student_disability_details (AadharNumber, Disabled, TypeOfDisability, PercentageOfDisability) VALUES (?, ?, ?, ?)");
				stmtDisability.setString(1, AadharNumber);
				stmtDisability.setString(2, DISABILITY);
				stmtDisability.setString(3, disabilitytype);
				stmtDisability.setString(4, perDisability);
				stmtDisability.executeUpdate();
				stmtDisability.close();

				// Insert into student_file_details table
				PreparedStatement stmtFiles = connection.prepareStatement(
						"INSERT INTO student_file_details (AadharNumber, DomicileCertificate, StudentPhotograph, InstituteIdCard, CasteIncomeCertificate, PreviousYearMarksheet, FeeReceiptOfCurrentYear, BankPassbook, AadharCard, TenthMarksheet, TwelfthMarksheet) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
				stmtFiles.setString(1, AadharNumber);
				stmtFiles.setBytes(2, getByteArrayFromPart(domicile));
                stmtFiles.setBytes(3, getByteArrayFromPart(photo));
                stmtFiles.setBytes(4, getByteArrayFromPart(idcard));
                stmtFiles.setBytes(5, getByteArrayFromPart(casteOrincome));
                stmtFiles.setBytes(6, getByteArrayFromPart(PreviousYearMarksheet));
                stmtFiles.setBytes(7, getByteArrayFromPart(feeReceipt));
                stmtFiles.setBytes(8, getByteArrayFromPart(passbook));
                stmtFiles.setBytes(9, getByteArrayFromPart(aadharcard));
                stmtFiles.setBytes(10, getByteArrayFromPart(marsheet1));
                stmtFiles.setBytes(11, getByteArrayFromPart(marsheet2));
				stmtFiles.executeUpdate();
				stmtFiles.close();

				 PreparedStatement stmt = connection.prepareStatement("UPDATE student_financial_details SET SelectedScheme = ? WHERE AadharNumber = ?");
			        stmt.setString(1, schemeapply);
			        stmt.setString(2, AadharNumber);
			        stmt.executeUpdate();
			        stmt.close();
			        out.println("<script type=\"text/javascript\">");
                    out.println("alert('Your application has been submitted successfully. Keep an eye on check status tab!');");
                    out.println("window.location.href = 'http://localhost:8080/NationalScholarshipPortal/dashboardstudent.jsp';"); // Redirect using JavaScript
                    out.println("</script>");
			}

		} catch (Exception e) {
			out.println(e.getMessage());
		}
	}

	private byte[] getByteArrayFromPart(Part part) throws IOException {
		InputStream is = part.getInputStream();
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		int nRead;
		byte[] data = new byte[1024];
		while ((nRead = is.read(data, 0, data.length)) != -1) {
			buffer.write(data, 0, nRead);
		}
		buffer.flush();
		return buffer.toByteArray();
	}

}
