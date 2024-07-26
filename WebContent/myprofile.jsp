<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- Retrieve session attribute --%>
<%
    HttpSession ses = request.getSession();
    String aadharNumber = (String) ses.getAttribute("aadharNumber");
    // Use the aadharNumber retrieved from the session as needed in this JSP
%>
<html>
<head>
    <title>My Profile</title>
    <link rel="stylesheet" href=".\css\home.css" />
     <style>
    
        body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}

h2 {
    color: #333;
    text-align: center;
}

form {
    max-width: 600px;
    margin: 20px auto;
    background-color: #fff;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

label {
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
}

input[readonly] {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #f8f8f8;
    color: #555;
    margin-bottom: 10px;
}

input[readonly]:focus {
    outline: none;
    border-color: #66afe9;
    box-shadow: 0 0 8px rgba(102, 175, 233, 0.6);
}
</style>
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

    <h2>My Profile</h2>
    <form>
        <table>
            <tr>
                <td><label for="name">Name:</label></td>
                <td><input type="text" id="name" name="name" value="${students[0].getStudentName()}" readonly></td>
            </tr>
            <tr>
                <td><label for="email">Email ID:</label></td>
                <td><input type="text" id="email" name="email" value="${students[0].getEmailId()}" readonly></td>
            </tr>
            <tr>
                <td><label for="mobile">Mobile Number:</label></td>
                <td><input type="text" id="mobile" name="mobile" value="${students[0].getMobileNumber()}" readonly></td>
            </tr>
            <tr>
                <td><label for="dob">Date of Birth:</label></td>
                <td><input type="text" id="dob" name="dob" value="${students[0].getDob()}" readonly></td>
            </tr>
            <tr>
                <td><label for="aadhar">Aadhar Number:</label></td>
                <td><input type="text" id="aadhar" name="aadhar" value="<%= aadharNumber %>" readonly></td>
            </tr>
            <tr>
                <td><label for="instCode">Institute Code - Name:</label></td>
                <td><input type="text" id="instCode" name="instCode" value="${students[0].getInstituteCode()} - ${students[0].getInstituteName()}" readonly></td>
            </tr>
        </table>
    </form>
</body>
</html>
