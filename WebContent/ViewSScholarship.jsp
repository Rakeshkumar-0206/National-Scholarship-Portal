<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- Retrieve session attribute --%>
<%
    HttpSession ses = request.getSession();
    String aadharNumber = (String) ses.getAttribute("aadharNumber");
    // Use the aadharNumber retrieved from the session as needed in this JSP
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approve | Scholarship</title>
<link rel="stylesheet" href=".\css\home.css" />
<link rel="stylesheet" href=".\css\dashboardinstitutestyle.css" />
<!-- Boxicons CDN Link -->
<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style>
.home-section{
min-height:auto;
}
.container {
width:80%;
margin-left:18%;
}
table {
	border-collapse: collapse;
	width: 60%;
	margin-left:20%;
	border-style:solid 1px;
	
}

td, th {
    width:10%;
    height:10%;
	border: 1px solid #dddddd;
	padding: 2% ;
}

td:first-child {
	font-weight: bold;
	width:10%;
}

</style>
</head>
<body>
<div class="sidebar">
		<div class="logo-details">
			<span class="logo_name"><h5>National Scholarship Portal</h5></span>
		</div>
		<ul class="nav-links">
			<li><a href="dashboardstate.jsp" class="active"> <i class="bx bx-grid-alt"></i>
					<span class="links_name">Dashboard</span>
			</a></li>
			<li><a href="DashboardInstitute"> <i class="bx bx-box"></i> <span
					class="links_name">Intitution Application</span>
			</a></li>
			<li><a href="SScholarapprove"> <i class="bx bx-coin-stack"></i> <span
					class="links_name">Scholarship Applications</span>
			</a></li>
			<li><a href="#"> <i class="bx bx-book-alt"></i> <span
					class="links_name">Print Application</span>
			</a></li>
			<li><a href="#"> <i class="bx bx-message"></i> <span
					class="links_name">Notifications</span>
			</a></li>
			<li><a href="#"> <i class="bx bx-heart"></i> <span
					class="links_name">Favrorites</span>
			</a></li>
			<li><a href="#"> <i class="bx bx-cog"></i> <span
					class="links_name">Setting</span>
			</a></li>
			<li class="log_out"><a href="logout.jsp"> <i class="bx bx-log-out"></i>
					<span class="links_name">Log out</span>
			</a></li>
		</ul>
	</div>
	<section class="home-section">
		<nav>
			<div class="sidebar-button">
				<i class="bx bx-menu sidebarBtn"></i> <span class="dashboard">Dashboard</span>
			</div>
			<div class="search-box">
				<input type="text" placeholder="Search..." /> <i
					class="bx bx-search"></i>
			</div>
			<div class="profile-details">
				<span class="admin_name">State view</span>
			</div>
		</nav>
</section>
<br><br><br><br><br>
<div class="container">
 <h1><center>SCHOLARSHIP DETAILS</center></h1> <br><br>
        <table>
             <c:forEach var="student" items="${students}">
                    <tr>
                        <td><label for="name">Name:</label></td>
                        <td><input type="text" id="name" name="name" value="${student.studentName}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="fatherName">Father's Name:</label></td>
                        <td><input type="text" id="fatherName" name="fatherName" value="${student.fatherName}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="motherName">Mother's Name:</label></td>
                        <td><input type="text" id="motherName" name="motherName" value="${student.motherName}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="selectedScheme">Selected Scheme:</label></td>
                        <td><input type="text" id="selectedScheme" name="selectedScheme" value="${student.selectedScheme}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="aadharNumber">Aadhar Number:</label></td>
                        <td><input type="text" id="aadharNumber" name="aadharNumber" value="${student.aadharNumber}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="houseNumber">House Number:</label></td>
                        <td><input type="text" id="houseNumber" name="houseNumber" value="${student.houseNumber}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="streetNumber">Street Number:</label></td>
                        <td><input type="text" id="streetNumber" name="streetNumber" value="${student.streetNumber}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="presentClassCourse">Present Course:</label></td>
                        <td><input type="text" id="presentClassCourse" name="presentClassCourse" value="${student.presentClassCourse}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="presentClassCourseYear">Present Course Year:</label></td>
                        <td><input type="text" id="presentClassCourseYear" name="presentClassCourseYear" value="${student.presentClassCourseYear}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="pincode">Pincode:</label></td>
                        <td><input type="text" id="pincode" name="pincode" value="${student.pincode}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="tenthPercentageObtained">Tenth Percentage:</label></td>
                        <td><input type="text" id="tenthPercentageObtained" name="tenthPercentageObtained" value="${student.tenthPercentageObtained}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="disabled">Disabled:</label></td>
                        <td><input type="text" id="disabled" name="disabled" value="${student.disabled}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="twelfthPercentageObtained">Twelfth Percentage:</label></td>
                        <td><input type="text" id="twelfthPercentageObtained" name="twelfthPercentageObtained" value="${student.twelfthPercentageObtained}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="familyAnnualIncome">Family Annual Income:</label></td>
                        <td><input type="text" id="familyAnnualIncome" name="familyAnnualIncome" value="${student.familyAnnualIncome}" readonly></td>
                    </tr>
                
        </table>
        <br>
        <form id="approvalForm" method="post" onsubmit="return submitForm(this)">
    <input type="hidden" name="studentId" value="${student.aadharNumber}">
    <button type="submit" style="margin-left:35%; width:10%; background-color:green; color:white; padding:1%">
        <h2>Approve</h2>
    </button>
    </form>
     <form id="approvalForm" method="post" onsubmit="return submitFormR(this)">
    <input type="hidden" name="studentId" value="${student.aadharNumber}">
     <button type="submit" style="width: 10%; background-color: red; color: white; padding: 1%;position: relative; left: 50%; transform: translateX(-30%); transform: translateY(-70%); margin-top: -30%;">
        <h2>Reject</h2>
    </button>
    <br><br>
</form>
</c:forEach>
<script>
    function submitForm(form) {
        var aadharNumber = form.querySelector('input[name="studentId"]').value;
        form.action = "sUpdateApprove?studentId=" + aadharNumber;
        return true;
    }
    function submitFormR(form) {
        var aadharNumber = form.querySelector('input[name="studentId"]').value;
        form.action = "sRUpdateApprove?studentId=" + aadharNumber;
        return true;
    }
</script>

</div>
    	<script>
		let sidebar = document.querySelector(".sidebar");
		let sidebarBtn = document.querySelector(".sidebarBtn");
		sidebarBtn.onclick = function() {
			sidebar.classList.toggle("active");
			if (sidebar.classList.contains("active")) {
				sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
			} else
				sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
		};
	</script>
</body>
</html>