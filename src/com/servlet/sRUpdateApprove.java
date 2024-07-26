package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnection;

/**
 * Servlet implementation class sRUpdateApprove
 */
@WebServlet("/sRUpdateApprove")
public class sRUpdateApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String aadharNumber = request.getParameter("studentId");
        out.println(aadharNumber);
        try {
        	Connection connection = DBConnection.getConnection();
        	if(connection!=null) {
        		PreparedStatement stmt = connection.prepareStatement("update institutes set StateApproved = 'Rejected' where InstituteCode=?");
        		stmt.setString(1, aadharNumber);
        		int rowsAffected = stmt.executeUpdate();
                stmt.close();
                if (rowsAffected > 0) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Application rejected.');");
                    out.println("window.location.href = 'http://localhost:8080/NationalScholarshipPortal/DashboardInstitute';"); // Redirect using JavaScript
                    out.println("</script>");
                }
        	}
        }catch(Exception e) {
        	out.println(e.getMessage());
        }
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String aadharNumber = request.getParameter("studentId");
        out.println(aadharNumber);
        try {
        	Connection connection = DBConnection.getConnection();
        	if(connection!=null) {
        		PreparedStatement stmt = connection.prepareStatement("update student set StateScholarshipApprove = 'Rejected' where AadharNumber=?");
        		stmt.setString(1, aadharNumber);
        		int rowsAffected = stmt.executeUpdate();
                stmt.close();
                if (rowsAffected > 0) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Application rejected.');");
                    out.println("window.location.href = 'http://localhost:8080/NationalScholarshipPortal/DashboardStudent';"); // Redirect using JavaScript
                    out.println("</script>");
                }
        	}
        }catch(Exception e) {
        	out.println(e.getMessage());
        }
	}

}
