<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
     <title>SCHOLARSHIP APPLICATION FORM2</title>
  <link rel="stylesheet" href=".\css\scholarship.css"> 
<script>
        function enableDisabilityFields() {
            document.getElementById("disabilitytype").disabled = false;
            document.getElementById("perDisability").disabled = false;
        }

        function disableDisabilityFields() {
            document.getElementById("disabilitytype").disabled = true;
            document.getElementById("perDisability").disabled = true;
        }
        
        function validatePercentage(input) {
            var percentageError = document.getElementById("perDisabilityError");
            var percentageRegex = /^(100(\.0{1,2})?|\d{1,2}(\.\d{1,2})?)$/;

            var percentageValue = input.value.trim(); // Use input directly

            if (!percentageRegex.test(percentageValue)) {
                percentageError.textContent = "Please enter a valid percentage (0-100) with up to two decimal places.";
            } else {
                percentageError.textContent = "";
            }
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
<p class="nav-item"> <a href="dashboardstudent.jsp" class="nav-link">Home</a></p>
<p class="nav-item"> <a href="about.jsp" class="nav-link">About Us</a></p>
<p class="nav-item"> <a href="contact.jsp" class="nav-link">Contact Us</a></p>

</center>
</font>
</div>

<br>
<br>
<br>
   <div class="wrap">
<form action="Scholarship2" method="post" enctype="multipart/form-data">
<h1 class="formhead" >STUDENT SCHOLARSHIP FORM</h1>

<div class="wrap1"> 
 <h4>PERSONAL DETAILS:</h4>
<table>
<tr>

            <td>IS DISABLED:</td>
            <td><input type="radio" id="yes" name="DISABILITY" value="YES" onclick="enableDisabilityFields()" >
            <label for="YES">YES</label>
            <input type="radio" id="NO"  value="NO" name="DISABILITY"  onclick="disableDisabilityFields()">
            <label for="NO">NO</label></td>
</tr>
<tr>
            <td>TYPE OF DISABILITY:</td>
            <td><input type="text" name="disabilitytype" id="disabilitytype" disabled></td>
</tr>
<tr>
             <td>% OF DISABILITY:</td>
             <td><input type="text" name="perDisability" id="perDisability"  oninput="validatePercentage(this)" disabled>
             <div id="perDisabilityError" style="color: red;"></div></td></td>
</tr>
<br>
</table>
</div>


<br>
<br>
    
<div class="wrap1" id="Scheme">
<br>
<br>
      <label>CHOOSE SCHEME APPLYING FOR:</label>
         <select  required name="schemeapply">
         <option value="" selected="selected" disabled="disabled">---select one---</option>
        <option value="AI-20240131-1">AICTE - SWANATH SCHOLARSHIP SCHEME </option>
        <option value="CE-20240331-1">CENTRAL SECTOR SCHEME OF SCHOLARSHIPS FOR COLLEGE AND UNIVERSITY STUDENTS </option>
        <option value="NA-20240224-1">NATIONAL SCHOLARSHIP FOR POST GRADUATE STUDIES</option>
        <option value="NA-20240731-1">National Means Cum Merit Scholarship</option>
        <option value="PR-20240131-1">PRAGATI SCHOLARSHIP SCHEME FOR GIRL STUDENTS</option>
        <option value="SC-20240830-1">Scholarships for Top Class Education for students with disabilities.</option>
    </select>
<br>    
<br>     
  </div>


<br>
<br>

<div class="wrap1">
     <h4>DOCUMENTS UPLOAD SECTION:</h4>
    <table>
     <tr>
          <td> DOMICILE CERTIFICATE:</td>
           <td><input type="file" name= "domicile" required></td>
</tr>

<tr>
     <td>STUDENT PHOTOGRAPHY:</td>
     <td><input type="file" name="photo" required></td>
</tr>
<tr>
     <td>INSTITUTE ID CARD:</td>
     <td><input type="file" name="idcard" required></td>
</tr>
<tr>
     <td>CASTE/INCOME CERTIFICATE:</td>
     <td><input type="file" name="casteOrincome" required></td>
</tr>
<tr>
     <td>PREVIOUS YEAR MARKSHEET:</td>
     <td><input type="file" name="PreviousYearMarksheet" required></td>
</tr>
<tr>
     <td>FEE RECEIPT OF CURRENT YEAR:</td>
     <td><input type="file" name="feeReceipt" required></td>
</tr>
<tr>
     <td>BANK PASSBOOK(FRONT PAGE):</td>
     <td><input type="file" name="passbook" required></td>
</tr>
<tr>
     <td>AADHAR CARD:</td>
     <td><input type="file" name="aadharcard" required></td>
</tr>
<tr>
     <td>10TH CLASS MARKSHEET:</td>
     <td><input type="file" name="marsheet1" required></td>
</tr>
<tr>
     <td>12TH CLASS MARKSHEET:</td>
     <td><input type="file"  name="marsheet2" required></td>
</tr>
</table>
     <br><br>
     <input type="checkbox" required>ALL THE DETAILS FURNISHED BY ME ARE TRUE TO THE BEST OF MY KNOWLEDGE IF ANY MISTAKES ARE FOUND THEN I MAY BE DISQUALIFIED FOR SCHOLARSHIP SCHEME ANNOUNCED BY GOVERNMENT OF INDIA OR MY STATE GOVERNMENT.<br><br>
     <center>
     <input type="submit" value="SUBMIT" required>
         <input type="reset" value="RESET"required>
         </center>
     <br><br>
     <center>
     <h5>FURTHER PROCESS IS CARRIED OUT BY INSTITUTE,STATE NODAL OFFICER AND MINISTRY.</h5>
         </center>
     
     
   </form>
     

     
     
     
</body>
</html>