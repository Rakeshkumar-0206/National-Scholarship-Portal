<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>NationalScholarshipPortal</title>
<link rel="stylesheet" href=".\css\home.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
function showDropdown() {
   var dropdown = document.getElementById("registrationDropdown");
   dropdown.style.display = 'block';
}
function hideDropdown() {
   var dropdown = document.getElementById("registrationDropdown");
   dropdown.style.display = 'none';
}


function togglePassword(inputId, eyeIconId) {
    var passwordInput = document.getElementById(inputId);
    var eyeIcon = document.getElementById(eyeIconId);

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        // Replace with the path to your open eye image
    } else {
        passwordInput.type = "password";
        // Replace with the path to your closed eye image
    }
}

</script>
</head>
<body>
<div>
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
<p class="nav-item"> <a href="aboutus.jsp" class="nav-link">About Us</a></p>
<p class="nav-item"> <a href=".\img\contact.pdf" class="nav-link">Contact Us</a></p>
<div class="nav-item" onmouseover="showDropdown()" onmouseout="hideDropdown()">
        <a href="#" class="nav-link">New Registration</a>
        <div id="registrationDropdown" class="dropdown">
            <div class="dropdown-content">
                <a href="http://localhost:8080/NationalScholarshipPortal/StudentRegistration" onclick="selectOption('Student')">Student Registration</a>
                <a href="InstituteRegistration.jsp" onclick="selectOption('Institute')">Institute Registration</a>
                
            </div>
        </div>
 </div>

</center>
</font>
</div>

<hr color=black>
<div>

	<div class="left">
		<div class="update">
                <div class="box">
                      <h3 class="updhead">Notice Board - For Students<h3>
                      <marquee  class="updbrief" direction="up" onmouseover="this.stop()" onmouseout="this.start()">
                      Those applicants who were not selected in the merit list during previous years can apply as fresh applicant during AY 2023-24 provided it is allowed as per scheme guidelines.
 National Scholarship Portal is open for application submission for AY 2023-24:<br><br><br>
                     Students are advised to:<br>
                          1.    Keep Aadhaar ready<br>
                          2.    Link mobile no. with Aadhaar<br>
                          3.    Seed bank A/C with Aadhaar<br><br><br>
                Links:<br>
                      <ul>
                         <li>  <a href="Verify linked mobile no. with Aadhaar.jsp">Verify linked mobile no. with Aadhaar</a></li>
                         <li>  <a href="Check Aadhaar seeding with bank A/C.jsp">Check Aadhaar seeding with bank A/C.jsp</a></li>
                       </ul>
                      </marquee>
                </div>
                <div class="box">
                      <h3 class="updhead">Notice Board - For Institute<h3>
                      <marquee  class="updbrief" direction="up" onmouseover="this.stop()" onmouseout="this.start()">
                       Important Note:<br>
                        <ul>
                            <li>INO and HoI both should ensure that their Aadhar should be updated in their respective NSP logins before any of them going for BioAuth. 
Any Aadhaar related changes/updation (i.e., Changes in Aadhaar no. or Name or Gender or Mobile no.) in their NSP profile (i.e., either INO or HoI) would nullify their BioAuth status from NSP and they must have to perform BioAuth again (if done earlier).</li><br>
                            <br><li><a href="bioauthentication">Important Information on Bio authentication of INO and HOI.</a><br></li>
                            <br><li>HOI/INO Loging For AY 2023-24 Will be Opening Soon</li>
                         </ul>
                      </marquee>
                </div>
                <div class="box">
                      <h3 class="updhead">Notice Board - For State Nodal<h3>
                      <marquee  class="updbrief" direction="up" onmouseover="this.stop()" onmouseout="this.start()">
                      Important Note:<br>
                       <ul>
                          <li>INO and HoI both should ensure that their Aadhar should be updated in their respective NSP logins before any of them going for BioAuth. Any Aadhaar related changes/updation 
(i.e., Changes in Aadhaar no. or Name or Gender or Mobile no.) in their NSP profile (i.e., either INO or HoI) would nullify their BioAuth status from NSP and they must have to perform BioAuth again (if done earlier).<br>
                         <br> <li><a href="clickhere">Click Here </a>for List of Top Class Schools for PM YASASVI Top Class School Scheme.<br>
                         <br> <li>SNO/DNO Loging For AY 2023-24 Will be Opening Soon
                       </ul>
                      </marquee>
                </div>
	      </div>
	      <div class="help">
                    <div>
                        <h3 class="updhead">HELPDESK<h3>
                    </div>
                    <div class="helpinfo" >
                     <ul>        
                        <li>Please check the Announcement corner regularly for latest updates and information.</li><br>
                        <li>For any technical queries, please contact Helpdesk at <br> <i class="fa fa-envelope fa-sm"></i>
 
                             helpdesk[at]nsp[dot]gov[dot]in or <br>  <i class="fa fa-phone fa-sm"></i>  0120 - 6619540</li>
                        <p class="updbrief">(from 8 AM to 8 PM on all days, excluding holidays)</p>
                     </ul>
                    </div>
	      </div>
     </div>

     <div class="middle">
           <div class="midrig">
               <div>
                  <h1 class="midhead">MISSION</h1>
                   <div class="midcontent">The Mission Mode Project (MMP) of National Scholarships Portal under the National e-Governance Plan aims at 
providing common electronic portal for implementing various Scholarships schemes launched by Union Government, State Government and 
Union Territories across the country.</div>
              </div>
                <img src=".\img\digital-india.png"  class="midimg"/><br><br><br><br>
               <div>
                   <h1 class="midhead">VISSION</h1>
                    <div class="midcontent">National Scholarships Portal is one-stop solution through which various services starting from student application, application receipt, 
processing, sanction and disbursal of various scholarships to Students are enabled.
This initiative aims at providing a Simplified, Mission-oriented, Accountable, Responsive & Transparent 
System for faster & effective disposal of Scholarships applications and delivery of funds directly into beneficiaries account without any leakages.</div>
            </div>

           </div>
      </div>

     <div class="right">
           <div class="midrig">
               <div class="loginhead">
                    <h3>Login for School / Institute / State Nodal officer / Ministry</h3>
                </div>
                    <p class="imp">Note:- For Verification of application etc, Please select user type 'Institute Nodal Officers' 
                     and old login credentials only. User Type 'Institute Head' is for monitoring purpose only.</p>
             
             <div id="wrap">
             <form action="StudentLoginServlet" method="POST">  
               <div class="logindetail">
                 <fieldset>
                    <legend> LOGIN </legend>

                    <label for="uid">UID</label>
                    <input type="text" path="uid" name="uid"/>
                     <br/>

                    <label for="password">Password</label>
                    <input type="password" path="password" name="password" id="password"/>
                    <img src=".\img\view.png" id="eyeIconNew" class="eye-icon" onclick="togglePassword('password','eyeIconNew')" alt="Toggle Password" width="15px" height="20px" style="transform: translateX(-130%);">
    
                      <br/> 

                    <a href="https://sso.masaischool.com/forgot-password/" target="_blank">
                <div>Forgot password?</div>
               </a> <br><br>
                     <input type="submit" value="login" name="submit">
                </fieldset>
                
               </div>
                
             </form>
           </div>
            <div id="wrap2">
                  <h4>Institute/State Nodal/Ministry Login</h4>
                  <a href="login.jsp"><button>Login</button></a>
            </div>

           </div>
      </div>
</div>

<div class="footer">
<p class="footcont">
This site is designed, developed and hosted by National Informatics Centre (NIC) ,<br>
content provided by National Scholarship Portal.<br>
Last Updated on 17th May 2022</p>
<br>
<div class="footcont">
<img class="footimg" src=".\img\meity.png">
<img class="footimg" src=".\img\mygov.png">
<img class="footimg" src=".\img\nic.png">
<img class="footimg" src=".\img\indiaGov.png">
</div>
</div>
</div>
</body>
</html>
