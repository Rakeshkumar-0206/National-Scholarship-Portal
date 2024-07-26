package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Student;
import com.service.StudentDAO;

@WebServlet("/DashboardStudent")
public class DashboardStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve HttpSession
        HttpSession session = request.getSession();

        // Retrieve student data from the database or any other data source using instituteCode from session
        List<Student> pendingStudents = StudentDAO.getPendingStudents(session);

        // Set the retrieved data as a request attribute
        request.setAttribute("pendingStudents", pendingStudents);

        // Forward the request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("dashboardinstitute.jsp");
        dispatcher.forward(request, response);
    }

}
