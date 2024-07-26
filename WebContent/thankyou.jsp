<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
     <title>THANK YOU PAGE</title>
  <link rel="stylesheet" href=".\css\Thankyou.css">

<script>

         function showDropdown() {
            var dropdown = document.getElementById("registrationDropdown");
            dropdown.style.display = 'block';
        }       
       function hideDropdown() {
            var dropdown = document.getElementById("registrationDropdown");
            dropdown.style.display = 'none';
        }

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

<div class="nav">
<center><font size=4 >
<p class="nav-item"> <a href="home.jsp" class="nav-link">Home</a></p>
<p class="nav-item"> <a href="about.jsp" class="nav-link">About Us</a></p>
<p class="nav-item"> <a href="contact.jsp" class="nav-link">Contact Us</a></p>
<div class="nav-item" onmouseover="showDropdown()" onmouseout="hideDropdown()">
        <a href="#"class="nav-link">New Registration</a>
        <div id="registrationDropdown" class="dropdown">
            <div class="dropdown-content">
                <a href="StudentRegistration.html" onclick="selectOption('Student')">Student Registration</a>
                <a href="InstituteRegistration.html" onclick="selectOption('Institute')">Institute Registration</a>  
            </div>
        </div>
 </div>

</center>
</font>
</div>


<center>  
<div>
<h3 style="font-family:Lucida Calligraphy">Thank you for Registering in NSP Portal</h3>

<p>[YOUR USERID IS YOUR AADHAR NUMBER]</p>
</div>
</center>
</body>
</html>