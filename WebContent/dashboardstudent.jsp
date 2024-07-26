<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- Retrieve session attribute --%>
<%
    HttpSession ses = request.getSession();
    String aadharNumber = (String) ses.getAttribute("aadharNumber");
    // Use the aadharNumber retrieved from the session as needed in this JSP
%>
<html>
<head>
   <title>NSP Dashboard | Student</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">     
<link rel="stylesheet" type=".\css\navstyle.css">
<link rel="stylesheet" type="text/css" href=".\css\dashboardstyle.css">
<style>

.float {
width:100% ;
height:30px;
margin-top:10px;
}

.quote {
color:#3486d9;
size:3;
}

.topic{
background-color:#3486d9;
color:white;
}
.head {
background-color:#3486d9;
height:17%
}

.img {
float:left;
height:100%;
width:10%;
background-color:white

}
</style>
</head>
<body>

<!-- header and navbar -->
<div class="head">
<div class="img">
<img src=".\img\logo.png" height=115 width=115>
</div>
 
<div class ="topic">
<center>
<font color=white size=7 face="Lucida Calligraphy"><b>National Scholarship Portal</b></font><br>
<font color=white size=4 face="Lucida Calligraphy"><b>Government of India</b></font>
<br>  
</center>
</div>
</div>
 
<div class="subhead">
<marquee class="float" behavior="alternate">
<font class="quote" face="Lucida Calligraphy" >Every Student matters ; Every Student counts...</font></marquee>
</div>
 


<main>
    <div class="container">
<!-- Left Section -->
        <div class="left-section">
          <div class="left-header">
        <h3 style="color:white"><i class="fa fa-user"></i> <!-- Display aadharNumber retrieved from session -->
          <div style="text-align:right;"><b>  Aadhar Number: <%= aadharNumber %></b></div></h3>
    </div>
           <div class="left-content">
            <ul>
                <li><a href="http://localhost:8080/NationalScholarshipPortal/MyProfile"><i class="fa fa-user-circle"></i>   My Profile</a></li>
                <li><a href="http://localhost:8080/NationalScholarshipPortal/CheckStatus"><i class="fa fa-tasks"></i>   Check Status</a></li>
                <li><a href="updatepassword.jsp"><i class="fa fa-edit"></i>   Update Password</a></li>
                <li><a href="logout.jsp"><i class="fa fa-sign-out"></i>  Logout</a></li>
            </ul>
            </div> 
        </div>
<!-- Center Section -->
        <div class="center-section">
          <div class="center-header">
    <h2><i class="fa fa-graduation-cap"></i> Scholarship Schemes</h2>
</div>

            <div class="scholarship-schemes">
                 <table class="scholarship-table">
<tbody>
<tr>
<td><b>Scholarship Name/Provider </b></td>
<td><b>Application Period*</b></td>
</tr>
<tr>
<td><a href="https://www.buddy4study.com/scholarship/pre-matric-scholarship-for-sc-st-general-students-uttar-pradesh"><b>Pre-matric Scholarship For ST/SC/General Category, Uttar Pradesh</b></a></p>
<p><b>By Social Welfare Department, Government of Uttar Pradesh</b></td>
<td><b>July 02, 2022 to October 07, 2022</b></td>
</tr>
<tr>
<td><a href="https://www.buddy4study.com/scholarship/post-matric-intermediate-scholarship-for-sc-st-general-category-uttar-pradesh"><b>Post matric Intermediate Scholarship For ST/SC/General Category, Uttar Pradesh</b></a></p>
<p><b>By Social Welfare Department, Government of Uttar Pradesh</b></td>
<td><b>July 08, 2022 to December 10, 2022</b></td>
</tr>
<tr>
<td><a href="https://www.buddy4study.com/scholarship/postmatric-other-than-intermediate-scholarship-for-st-sc-general-category-uttar-pradesh"><b>Post matric (Other than Intermediate) Scholarship for ST, SC, General Category, Uttar Pradesh</b></a></p>
<p><b>By Social Welfare Department, Government of Uttar Pradesh</b></td>
<td><b>August to December</b></td>
</tr>
<tr>
<td><a href="https://www.buddy4study.com/scholarship/postmatric-other-state-scholarship-for-st-sc-general-category-uttar-pradesh"><b>Post matric Other State Scholarship for ST, SC, General Category, Uttar Pradesh</b></a></p>
<p><b>By Social Welfare Department, Government of Uttar Pradesh</b></td>
<td><b>July 08, 2022 to December 26, 2022</b></td>
</tr>
<tr>
<td><a href="https://www.buddy4study.com/scholarship/pre-matric-scholarship-for-minority-students-uttar-pradesh"><b>Pre-Matric Scholarship for Minorities, Uttar Pradesh</b></a></p>
<p><b>By Minority Department, Government of Uttar Pradesh</b></td>
<td><b>July 02, 2022 to October 07, 2022</b></td>
</tr>
<tr>
<td><a href="https://www.buddy4study.com/scholarship/postmatric-other-than-intermediate-scholarship-for-minorities-uttar-pradesh"><b>Post matric (Other Than Intermediate) Scholarship for Minorities, Uttar Pradesh</b></a></p>
<p><b>By Minority Department, Government of Uttar Pradesh</b></td>
<td><b>July 08, 2022 to December 10, 2022</b></td>
</tr>
<tr>
<td><a href="https://www.buddy4study.com/scholarship/postmatric-intermediate-scholarship-for-minorities-uttar-pradesh"><b>Post matric Intermediate Scholarship for Minorities, Uttar Pradesh</b></a></p>
<p><b>By Minority Department, Government of Uttar Pradesh</b></td>
<td><b>July 08, 2022 to December 26, 2022</b></td>
</tr>
<tr>
<td><a href="https://www.buddy4study.com/scholarship/pre-matric-scholarship-for-obc-students-uttar-pradesh"><b>Pre-Matric Scholarship for OBC Students, Uttar Pradesh</b></a></p>
<p><b>By Backward Class Welfare Department, Government of Uttar Pradesh</b></td>
<td><b>July 02, 2022 to October 07, 2022</b></td>
</tr>
<tr>
<td><a href="https://www.buddy4study.com/scholarship/postmatric-intermediate-scholarship-for-obc-students-uttar-pradesh"><b>Post matric Intermediate Scholarship for OBC Students, Uttar Pradesh</b></a></p>
<p><b>By Backward Class Welfare Department, Government of Uttar Pradesh</b></td>
<td><b>July 08, 2022 to December 10, 2022</b></td>
</tr>
<tr>
<td><a href="https://www.buddy4study.com/scholarship/postmatric-other-than-intermediate-scholarship-for-obc-uttar-pradesh"><b>Post matric (Other Than Intermediate) Scholarship for OBC, Uttar Pradesh</b></a></p>
<p><b>By Backward Class Welfare Department, Government of Uttar Pradesh</b></td>
<td><b>July 08, 2022 to December 10, 2022</b></td>
</tr>
</tbody>
</table>
            </div>
        </div>


<!-- right section -->
        <div class="right-section">
    <div class="right-header">
        <h2><i class="fa fa-bullhorn"></i> Guidelines and News</h2>
    </div>
    <div class="right-content">
  
        <ul class="red-list">
            <li>Account number is not required for scholarship disbursement through NSP. Scholarship will be disbursed directly into the Aadhaar seeded bank account of the beneficiary.</li>
            <li>Those applicants who were not selected in the merit list during previous years can apply as a fresh applicant during AY 2023-24 provided it is allowed as per scheme guidelines.</li>
            <li>National Scholarship Portal is open for application submission for AY 2023-24:
    Students are advised to:
    <ul class="red-order">
                        <li>Keep Aadhaar ready</li>
                         <li>Link mobile no. with Aadhaar</li>
                      <li>Seed bank A/C with Aadhaar</li>

                       </ul></li>
        </ul>
    </div>
</div>
<div class="bottom-section">
        <h3>PRAGATI SCHOLARSHIP</h3>
        <p>'One Girl' per family and it can be extended for Two Girl Child per family where the family income is less than Rs. 8 Lakh /annum. The selection of candidate will be made on merit based on qualifying examination to peruse the respective Technical Degree/Diploma course from any of the AICTE approved institution. Amount of scholarship: Tuition Fee of Rs. 30,000/</p>
       <a href="ScholarshipStudent"><button class="apply-button">Apply Scheme</button></a>
    </div>
</main>

<!-- Footer -->


</html>