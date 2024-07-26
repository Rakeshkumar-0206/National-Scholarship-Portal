<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.entity.Scholarship"%>
<!DOCTYPE html>
<html>
<head>
<title>National Scholarship Portal</title>
<link rel="stylesheet" href=".\css\dashboardinstitutestyle.css" />
<!-- Boxicons CDN Link -->
<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

.details {
	margin-top: 20px;
}
table {
	border-collapse: collapse;
	width: 100%;
}

td, th {
    width:20%;
    height:20%;
	border: 1px solid #dddddd;
	padding: 2% ;
}

td:first-child {
	font-weight: bold;
}

.sales-boxes{

border-style:solid 1px;
border-color:black;
margin-top:5%;
background-color:white;
box-shadow:12px 12px lightgrey;
margin-left:7%;
margin-right:10%;
border-radius:5px;
padding:3% 3%;
}

</style>

</head>
<body>
	<div class="sidebar">
		<div class="logo-details">
			<span class="logo_name"><h5>National Scholarship Portal</h5></span>
		</div>
		<ul class="nav-links">
			<li><a
				href="dashboardstate.jsp"
				class="active"> <i class="bx bx-grid-alt"></i> <span
					class="links_name">Dashboard</span>
			</a></li>
			<li><a href="DashboardInstitute"> <i class="bx bx-box"></i> <span
					class="links_name">Institute Applications</span>
			</a></li>
			<li><a href="SScholarapprove"> <i class="bx bx-coin-stack"></i>
					<span class="links_name">Scholarship Applications</span>
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
		<br><br><br><br>
		<div class="sales-boxes">
			<div class="recent-sales box">
				<div class="title">Pending for Scholarship Approval</div>
				<hr>
				<br> <br>
				<div class="sales-details">
					<%
					List<Scholarship> pendingStudents = (List<Scholarship>) request.getAttribute("pendingStudents");
					if (pendingStudents != null && !pendingStudents.isEmpty()) {
					%>
					<div style="height: 300px; overflow: auto; width: 100%">
						<table border="1" class="table">
							<thead>
								<tr>
									<th>Student Name</th>
									<th>Scholarship applied</th>
									<th>Aadhar Number</th>
									<th>Mobile Number</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (Scholarship student : pendingStudents) {
								%>
								<tr>
									<td><%=student.getStudentName()%></td>
									<td><%=student.getAppliedScheme()%></td>
									<td><%=student.getAadharNumber()%></td>
									<td><%=student.getMobileNumber()%></td>
									<td>
										<form action="ViewSScholarship" method="get"
											onsubmit="return submitForm(this)">
											<input type="hidden" name="studentId"
												value="<%=student.getAadharNumber()%>">
											<button type="submit">View form</button>
										</form> <script>
											function submitForm(form) {
												var aadharNumber = form
														.querySelector('input[name="studentId"]').value;
												form.action = "ViewSScholarship?studentId="
														+ aadharNumber;
												return true;
											}
										</script>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
					<%
					} else {
					%>
					<p>No pending students found.</p>
					<%
					}
					%>
				</div>

			</div>
			</div>
	</section>
</body>
</html>