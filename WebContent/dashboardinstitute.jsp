<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.entity.Student"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8" />
<title>National Scholarship Portal</title>
<link rel="stylesheet" href=".\css\dashboardinstitutestyle.css" />
<!-- Boxicons CDN Link -->
<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style>
.details {
	margin-top: 20px;
}

table {
	border-collapse: collapse;
	width: 90%;
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



</style>

</head>
<body>
	<div class="sidebar">
		<div class="logo-details">
			<span class="logo_name"><h5>National Scholarship Portal</h5></span>
		</div>
		<ul class="nav-links">
			<li><a href="http://localhost:8080/NationalScholarshipPortal/DashboardStudent" class="active"> <i class="bx bx-grid-alt"></i>
					<span class="links_name">Dashboard</span>
			</a></li>
			<li><a href="#"> <i class="bx bx-box"></i> <span
					class="links_name">My Profile</span>
			</a></li>
			<li><a href="IScholarapprove"> <i class="bx bx-coin-stack"></i> <span
					class="links_name">All Applications</span>
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
				<span class="admin_name">Institute view</span>
			</div>
		</nav>

		<div class="home-content">
			<div class="overview-boxes">
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Total Applicants</div>
						<div class="number">876</div>
					</div>
					<!--  <i class="bx bx-cart-alt cart"></i> -->
				</div>
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Eligible Applicants</div>
						<div class="number">376</div>
					</div>
					<!--   <i class="bx bxs-cart-add cart two"></i> -->
				</div>
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Subsidy Amount</div>
						<div class="number">&#8377 12,876</div>
					</div>
					<!--   <i class="bx bx-cart cart three"></i> -->
				</div>
				<div class="box">
					<div class="right-side">
						<div class="box-topic">Total Scheme</div>
						<div class="number">11</div>
					</div>
					<!--   <i class="bx bxs-cart-download cart four"></i> -->
				</div>
			</div>
			<div class="sales-boxes">
				<div class="recent-sales box" style="width:100%;" >
					<div class="title">Pending for Approval</div>
					<hr><br><br>
					<div class="sales-details" >
						<%
						List<Student> pendingStudents = (List<Student>) request.getAttribute("pendingStudents");
						if (pendingStudents != null && !pendingStudents.isEmpty()) {
						%>
						<div style="height: 300px; overflow: auto; width:100%">
						<table border="1" class="table">
							<thead>
								<tr>
									<th>Student Name</th>
									<th>Date of Birth</th>
									<th>Aadhar Number</th>
									<th>Mobile Number</th>
									<th>Actions</th>

								</tr>
							</thead>
							<tbody>
								<%
								for (Student student : pendingStudents) {
								%>
								<tr>
									<td><%=student.getStudentName()%></td>
									<td><%=student.getDob()%></td>
									<td><%=student.getAadharNumber()%></td>
									<td><%=student.getMobileNumber()%></td>
									<td class="action">
										<form action="UpdateApprove" method="get" onsubmit="return submitForm(this)" >
    <input type="hidden" name="studentId" value="<%=student.getAadharNumber()%>">
    <button style="background-color:green; color:white ; padding:10px;" type="submit">Approve</button>
    </form>
    <form action="sRUpdateApprove" method="post" onsubmit="return submitFormR(this)" >
    <input type="hidden" name="studentId" value="<%=student.getAadharNumber()%>">
    <button style="background-color:red; color:white;padding:10px;" type="reject"> Reject </button>
</form>

<script>
    function submitForm(form) {
        var aadharNumber = form.querySelector('input[name="studentId"]').value;
        form.action = "UpdateApprove?studentId=" + aadharNumber;
        return true;
    }
   function submitFormR(form) {
        var aadharNumber = form.querySelector('input[name="studentId"]').value;
        form.action = "sRUpdateApprove?studentId=" + aadharNumber;
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
		</div>
	</section>

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
