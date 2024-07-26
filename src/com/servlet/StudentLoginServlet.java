package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnection;

@WebServlet("/StudentLoginServlet")
public class StudentLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        String uid = request.getParameter("uid"); // Assuming uid is received from the request parameter

	        if (uid != null && !uid.isEmpty()) {
	            HttpSession session = request.getSession();
	            session.setAttribute("uid", uid); // Set uid (aadharNumber) in session as it is

	            session.setAttribute("aadharNumber", uid); // Set aadharNumber in session using uid value
	        } 
	        try {
	            Connection connection = DBConnection.getConnection();
	            if (connection != null) {
	                // Assuming a table named 'users' with columns 'username' and 'password'
	                String query = "SELECT * FROM login WHERE UserID = ? AND Password = ?";
	                PreparedStatement preparedStatement = connection.prepareStatement(query);
	                preparedStatement.setString(1, uid);
	                preparedStatement.setString(2, request.getParameter("password"));

	                ResultSet resultSet = preparedStatement.executeQuery();

	                if (resultSet.next()) {
	                    response.sendRedirect("dashboardstudent.jsp");
	                } else {
	                    out.println("<script type=\"text/javascript\">");
	                    out.println("alert('Login unsuccessful. Please check your credentials.');");
	                    out.println("window.location.href = 'home.jsp';"); // Redirect using JavaScript
	                    out.println("</script>");
	                    out.println("Invalid ");
	                }

	                // Close resources
	                resultSet.close();
	                preparedStatement.close();
	                connection.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            out.println("Database error: " + e.getMessage());
	        }
	    }

}
