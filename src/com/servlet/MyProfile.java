package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.StudentDetails;
import com.service.StudentDetailsDAO;

@WebServlet("/MyProfile")
public class MyProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<StudentDetails> profile = StudentDetailsDAO.getAllStudents(request);

        request.setAttribute("students", profile);

        RequestDispatcher dispatcher = request.getRequestDispatcher("myprofile.jsp");
        dispatcher.forward(request, response);
    }
}
