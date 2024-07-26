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

@WebServlet("/OtherLoginServlet")
public class OtherLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String userType = request.getParameter("userType");
        String addInfo = request.getParameter("additionalInput");

        try (Connection connection = DBConnection.getConnection()) {
            if (connection != null) {
                String query = "SELECT * FROM login WHERE UserID = ? AND Password = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, request.getParameter("username"));
                    preparedStatement.setString(2, request.getParameter("password"));

                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        if (resultSet.next()) {
                            String userCode = resultSet.getString("verify");

                            if (userType.equals("institute")) {
                                String query1 = "SELECT StateApproved, MinistryApproved FROM institutes WHERE InstituteCode = ?";
                                try (PreparedStatement ps1 = connection.prepareStatement(query1)) {
                                    ps1.setString(1, addInfo);

                                    try (ResultSet rs1 = ps1.executeQuery()) {
                                        if (rs1.next()) {
                                            String stateApprove = rs1.getString("StateApproved");
                                            String ministryApprove = rs1.getString("MinistryApproved");

                                            if (stateApprove.equals("Yes") && ministryApprove.equals("Yes")) {
                                            	 // Set the addInfo as a session attribute
                                                HttpSession session = request.getSession();
                                                session.setAttribute("addInfo", addInfo);
                                                response.sendRedirect("http://localhost:8080/NationalScholarshipPortal/DashboardStudent");
                                            } else {
                                                out.println("<script type=\"text/javascript\">");
                                                out.println("alert('Your account is under verification process. Login access will be granted soon.');");
                                                out.println("window.location.href = 'login.jsp';"); // Redirect using JavaScript
                                                out.println("</script>");
                                            }
                                        } else {
                                            out.println("<script type=\"text/javascript\">");
                                            out.println("alert('Your account is under verification process. Login access will be granted soon.');");
                                            out.println("window.location.href = 'login.jsp';"); // Redirect using JavaScript
                                            out.println("</script>");
                                        }
                                    }
                                }
                            } else if (userType.equals("state") && userCode.equals("S")) {
                                response.sendRedirect("dashboardstate.jsp");
                            } else if (userType.equals("ministry") && userCode.equals("M")) {
                                response.sendRedirect("dashboardministry.jsp");
                            } else {
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Login unsuccessful. Please check your credentials.');");
                                out.println("window.location.href = 'login.jsp';"); // Redirect using JavaScript
                                out.println("</script>");
                            }
                        } else {
                            // Handle the case where the login credentials are invalid
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Login unsuccessful. Please check your credentials.');");
                            out.println("window.location.href = 'login.jsp';"); // Redirect using JavaScript
                            out.println("</script>");
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Database error: " + e.getMessage());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Database connection error: " + e.getMessage());
        }
    }

}
