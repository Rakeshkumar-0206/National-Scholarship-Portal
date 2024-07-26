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
 * Servlet implementation class StudentUpdatePassword
 */
@WebServlet("/StudentUpdatePassword")
public class StudentUpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
        	Connection connection = DBConnection.getConnection();
        	if(connection!=null) {
        		String username = request.getParameter("username");
        		String oldPassword = request.getParameter("oldPassword");
        		String newPassword = request.getParameter("newPassword");
        		PreparedStatement stmt1 = connection.prepareStatement("UPDATE login SET Password=? WHERE UserID=? and Password = ?");
            	stmt1.setString(1, newPassword);
            	stmt1.setString(2, username);
            	stmt1.setString(3, oldPassword);
            	int rowsAffected = stmt1.executeUpdate();
                stmt1.close();
                if (rowsAffected > 0) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Your password has been updated successfully!');");
                    out.println("window.location.href = 'home.jsp';"); // Redirect using JavaScript
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Failed to update password. Please check your credentials.');");
                    out.println("window.location.href = 'updatepassword.jsp';"); // Redirect using JavaScript
                    out.println("</script>");
                }
        	}
        	
        }catch(Exception e) {
        	out.println(e.getMessage());
        }
	}

}
