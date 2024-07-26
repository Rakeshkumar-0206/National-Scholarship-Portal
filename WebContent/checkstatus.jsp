<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>
<%
    HttpSession ses = request.getSession();
    String aadharNumber = (String) ses.getAttribute("uid");
    // Use the aadharNumber retrieved from the session as needed in this JSP
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CHECK STATUS</title>
    <link rel="stylesheet" href=".\css\checkstatus.css"/>
    <link rel="stylesheet" href=".\css\home.css" />
    <script>
    function checkApprovalStatus() {
        // Replace the placeholders with actual variables or expressions
        var registrationApproved = document.getElementById('instituteApproved').innerText.trim();
        var ministryApproved = document.getElementById('intScholarApproved').innerText.trim();
        var stateNodalApproved = document.getElementById('scholarshipApproved').innerText.trim();
        var instituteApproved = document.getElementById('ministryApproved').innerText.trim();

        if (
            registrationApproved === 'Yes' &&
            ministryApproved === 'Yes' &&
            stateNodalApproved === 'Yes' &&
            instituteApproved === 'Yes'
        ) {
            document.getElementById('messageDiv').innerHTML = 'Your scholarship has been approved. Sudsidiary amount will be credited to your account within 5 Business Days. ';
        } else {
            document.getElementById('messageDiv').innerHTML = ''; // Clear the message if not all approvals are completed.
        }
    }
    
    window.onload = function() {
        checkApprovalStatus();
    };
    </script>
    
</head>
<body>
<div class="head">
		<div class="img">
			<img src=".\img\logo.png" height=100 width=115>
		</div>

		<div class ="topic">
			<center>
				<font color=white size=7 face="Lucida Calligraphy"><b>National Scholarship Portal</b></font><br>
                        <font color=white size=4 face="Lucida Calligraphy"><b>Government of India</b></font><br>	
			</center>
		</div>
</div>

<div class="subhead">
<marquee class="float" behavior="alternate">
<font class="quote" face="Lucida Calligraphy" >Every Student matters ; Every Student counts...</font></marquee>
</div>
<br>
 <center><h1 style="color:white;background-color:green" id="messageDiv"></h1></center>
 <br>

<div>
<div class="container">

    <table>
        <tr>
            <th>APPROVALS</th>
            <th>STATUS</th>
        </tr>
        <c:forEach items="${students}" var="status">
            <tr>
                <td>Registration verified by Institute</td>
                <td id="instituteApproved">${status.instituteApproved}</td>
            </tr>
            <tr>
                <td>Scholarship approved by Ministry</td>
                <td id="intScholarApproved">${status.intScholarApproved}</td>
            </tr>
             <tr>
                <td>Scholarship approved by State Nodal</td>
                <td id="scholarshipApproved">${status.scholarshipApproved}</td>
            </tr>
             <tr>
                <td>Scholarship approved by Institute</td>
                <td id="ministryApproved">${status.ministryApproved}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</div>


</body>
</html>