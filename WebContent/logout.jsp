<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>NATIONAL SCHOLARSHIP PORTAL</title>
    <link rel="stylesheet" href=".\css\logout.css">
	
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>

<style>
 .topic {
       background-color:#3486d9;
color:white;
width:90%;
}
</style>	
</head>	
<body onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">

<div class="container">
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

</div>
 
<div class="subhead">

<marquee class="float" behavior="alternate">

<font class="quote" face="Lucida Calligraphy" >Every Student matters ; Every Student counts...</font></marquee>

</div>
 
 <hr>
<div class="nav">
</div>
	
<br><br><br>
    <center>
<h2 style="margin-left:20px;"> YOU HAVE SUCCESSFULLY LOGGED OUT </h2>
<br><br><br>
<button onclick="location.href='home.jsp'" class="mybutton" type="button" style="width: 200px; height: 37px;">
     HOME</button>
        </center>
	 

</body>
</html>
