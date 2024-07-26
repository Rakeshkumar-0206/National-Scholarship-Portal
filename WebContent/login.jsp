<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--This page includes internal styling for login page -->
<html>
<head>
	<title>NSP | Login</title>
<link rel="stylesheet" href=".\css\navstyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
	@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 450px;
  padding: 4% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  border-radius: 25px;
  background: #FFFFFF;
  max-width: 400px;
  margin: 0 auto 100px;
  padding: 30px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 17px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
form > label {
        display: flex;
        justify-content: space-between;
        margin-bottom: -10px;
        font-weight: 500;
        color: gray;
      }
     h3 {
        text-align: center;
        margin-bottom: 15px;
        font-weight: bold;
        font-size: 1.3rem;
      }
/* The container */
.container {
  display: block;
  position: relative;
  padding-left: 18px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 18px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default radio button */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 16px;
  width: 16px;
  background-color: #eee;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
 	top: 4px;
	left: 4px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
.hidden {
            display: none;
        }
</style>
</head>
<div class="head">
<div class="img">
<img src=".\img\logo.png" height=115 width=115>
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
<p class="nav-item"> <a href="registration.jsp" class="nav-link">New Registration</a></p>
 </font>
</center>
</div>
<body>
 <script>
        // JavaScript for form validation
        function validateForm() {
            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;

            if (username.trim() === '' || password.trim() === '') {
                alert('Username and password are required');
                return false;
            }

            return true;
        }
function storeSelectedValue() {
            var selectedValue = document.querySelector('input[name="userType"]:checked').value;
            // You can use 'selectedValue' as per your requirement (e.g., store in a variable, send to the server, etc.)
            //if selectedValue=="institute"
        }
function toggleInputBox() {
    var instituteRadio = document.querySelector('input[name="userType"][value="institute"]');
    var additionalInput = document.getElementById('additionalInput');

    // Check if the Institute radio button is selected
    if (instituteRadio.checked) {
        // Enable the input box
        additionalInput.classList.remove('hidden');
    } else {
        // Disable the input box
        additionalInput.classList.add('hidden');
    }
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
	<div class="login-page">
  <div class="form">
    <form class="login-form" action="OtherLoginServlet" method="post">
    <h3>Institute/State/Ministry </h3>
      <br />
      <label for="">Username</label> <br />
      <input type="text" placeholder="Enter User ID" id="username" name="username" required="true" />
      <br />
      <label for="">Password
        <div>
          <a href="https://sso.masaischool.com/forgot-password/" target="_blank">
            <div>Forgot password?</div>
          </a>
        </div> </label
      ><br />
      <input type="password" placeholder="Enter password" id="password" name="password" required="true" />
       <img src=".\img\view.png" id="eyeIconNew" class="eye-icon" onclick="togglePassword('password','eyeIconNew')" alt="Toggle Password" width="15px" height="20px" style=" margin-left:80%; margin-top:-13%;">
<label class="container">Institute
  <input type="radio"  name="userType" value="institute" onclick="toggleInputBox()">
  <span class="checkmark"></span>
</label>
<label class="container">State Nodal
  <input type="radio" name="userType" value="state" onclick="toggleInputBox()">
  <span class="checkmark"></span>
</label>
<label class="container">Ministry
  <input type="radio" name="userType" value="ministry" onclick="toggleInputBox()">
  <span class="checkmark"></span>
</label><br>
        <input type="text" placeholder="Institutional Code" id="additionalInput" name="additionalInput" class="hidden">
      <button>login</button>
      <p class="message">Not registered? <a href="InstituteRegistration.jsp">Create an account</a></p>
    </form>
  </div>
</div>
  </body>
</html>  
</html>