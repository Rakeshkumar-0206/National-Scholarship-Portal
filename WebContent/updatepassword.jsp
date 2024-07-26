<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href=".\css\updatepassword.css">
   <script>

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

        function validatePassword() {
            var passwordInput = document.getElementById("newPassword");
            var passwordErrorDiv = document.getElementById("passwordError");
            var submitButton = document.getElementById("submitButton");

            // Updated password criteria to include at least one capital letter and one special character
            var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

            if (!passwordInput.value.match(passwordRegex)) {
                passwordErrorDiv.textContent = "Password must be at least 8 characters long and contain at least one capital letter, one letter, one number, and one special character.";
                submitButton.disabled = true;
            } else {
                passwordErrorDiv.textContent = "";
                submitButton.disabled = false;
            }
            validateConfirmPassword(); 
        }

        document.addEventListener("DOMContentLoaded", function() {
            // Your JavaScript code here
            var confirmPasswordTouched = false;

            function validateConfirmPassword() {
                var passwordInput = document.getElementById("newPassword");
                var confirmPasswordInput = document.getElementById("confirmPassword");
                var confirmPasswordErrorDiv = document.getElementById("confirmPasswordError");
                var submitButton = document.getElementById("submitButton");

                if (confirmPasswordTouched) {
                    var password = passwordInput.value;
                    var confirmPassword = confirmPasswordInput.value;
                    var mismatch = false;

                    for (var i = 0; i < confirmPassword.length; i++) {
                        if (password[i] !== confirmPassword[i]) {
                            mismatch = true;
                            break;
                        }
                    }

                    if (mismatch || confirmPassword.length < password.length) {
                        confirmPasswordErrorDiv.textContent = "Passwords do not match.";
                        submitButton.disabled = true;
                    } else {
                        confirmPasswordErrorDiv.textContent = "";
                        submitButton.disabled = false;
                    }
                }
            }

            document.getElementById("confirmPassword").addEventListener("blur", function() {
                confirmPasswordTouched = true;
                validateConfirmPassword();
            });
        });

    </script>
    
    <style>
    .topic{
background-color:#3486d9;
color:white;
width:90%;
}
   
    </style>
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

<div>

</div>

<center>
<div class="container" >
 <form action="StudentUpdatePassword" method="post">
         
        <img src=".\img\updatepassword.jpg" class="image">
<br>
<br>
  
<table>
<tr>
	<td><label for="username">User Name:</label></td>
	<td><input type="username" name="username" placeholder="Username" required><br><br></td>
</tr>

<tr>
        
        <td><label for="oldPassword">Old Password:</label></td>
        <td><input type="password" id="oldPassword" name="oldPassword" placeholder="Old Password"  required >
         <img src=".\img\view.png" id="eyeIconOld" class="eye-icon" onclick="togglePassword('oldPassword','eyeIconOld')" alt="Toggle Password" width="15px" height="20px">
         </td>
         
</tr>
     
<tr> 
       <td> <label for="newPassword">New Password:</label></td>
        <td><input type="password" id="newPassword" name="newPassword" placeholder="New Password" oninput="validatePassword()" required>
        <img src=".\img\view.png" id="eyeIconNew" class="eye-icon" onclick="togglePassword('newPassword','eyeIconNew')" alt="Toggle Password" width="15px" height="20px">
        <div id="passwordError" style="color: red;"></div></td>
</tr>
<tr>

       <td> <label for="confirmPassword">Confirm New Password:</label></td>
        <td><input type="password" id="confirmPassword"name="confirmPassword" placeholder="ConfirmPassword" onblur="validateConfirmPassword()" required>
         <img src=".\img\view.png" id="eyeIconConfirm" class="eye-icon" onclick="togglePassword('confirmPassword','eyeIconConfirm')" alt="Toggle Password" width="15px" height="20px">
          <div id="confirmPasswordError" style="color: red;"></div></td>
</tr>
</table>
<br>
<br>
        <button type="submit" id="submitButton">Update Password</button>
    </form>

</div>
</center>
</body>
</html>
