package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.ApproveScholarship;
import com.service.FormScholarshipDAO;

@WebServlet("/ViewScholarship")
public class ViewScholarship extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 // Retrieve the studentId parameter from the request
        String studentId = request.getParameter("studentId");

        // Pass the studentId to your DAO method to fetch data based on this ID
        List<ApproveScholarship> students = FormScholarshipDAO.getScholarForm(studentId);

        // Set the retrieved data as an attribute to be accessed in the JSP
        request.setAttribute("students", students);

        // Forward the request to your JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewScholarship.jsp");
        dispatcher.forward(request, response);
    }

}
