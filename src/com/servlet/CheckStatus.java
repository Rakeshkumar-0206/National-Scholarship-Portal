package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.StudentStatus;
import com.service.StudentStatusDAO;

@WebServlet("/CheckStatus")
public class CheckStatus extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<StudentStatus> profile = StudentStatusDAO.getStatus(request);

        request.setAttribute("students", profile);

        RequestDispatcher dispatcher = request.getRequestDispatcher("checkstatus.jsp");
        dispatcher.forward(request, response);
    }
}
