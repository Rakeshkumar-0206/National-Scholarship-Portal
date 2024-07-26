package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.InstituteScroll;
import com.service.InstituteScrolllDAO;

/**
 * Servlet implementation class DashboardState
 */
@WebServlet("/DashboardState")
public class DashboardState extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve student data from the database or any other data source
        List<InstituteScroll> pendingStudents = InstituteScrolllDAO.getInstitute(request); // Assuming you have a DAO class

        // Set the retrieved data as a request attribute
        request.setAttribute("pendingStudents", pendingStudents);

        // Forward the request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("iScrollMinistry.jsp");
        dispatcher.forward(request, response);
	}

}
