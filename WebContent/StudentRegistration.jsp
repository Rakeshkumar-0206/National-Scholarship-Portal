
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Registration form</title>
<link rel="stylesheet" href=".\css\navstyle.css"></link>
<link rel="stylesheet" href=".\css\StudentRegistration.css"></link>
<style>
.topic {
background-color:#3486d9;
color:white;
}
        .footer {
width:100%;
height:30%;
background-color:slategrey;
margin-top:0%;
}

.footcont {
color:white;
font-size:18px;
text-align:center;
}

.footimg {
padding :15px;
}
</style>

<script>

const stateDistricts = {
	 	AP : ["Anantapur","Chittoor","East Godavari","Guntur","Kadapa","Krishna","Kurnool","Prakasam","Nellore","Srikakulam","Visakhapatnam","Vizianagaram","West Godavari"],
	 AR : ["Anjaw","Changlang","Dibang Valley","East Kameng","East Siang","Kra Daadi","Kurung Kumey","Lohit","Longding","Lower Dibang Valley","Lower Subansiri","Namsai","Papum Pare","Siang","Tawang","Tirap","Upper Siang","Upper Subansiri","West Kameng","West Siang","Itanagar"],
	 AS : ["Baksa","Barpeta","Biswanath","Bongaigaon","Cachar","Charaideo","Chirang","Darrang","Dhemaji","Dhubri","Dibrugarh","Goalpara","Golaghat","Hailakandi","Hojai","Jorhat","Kamrup Metropolitan","Kamrup (Rural)","Karbi Anglong","Karimganj","Kokrajhar","Lakhimpur","Majuli","Morigaon","Nagaon","Nalbari","Dima Hasao","Sivasagar","Sonitpur","South Salmara Mankachar","Tinsukia","Udalguri","West Karbi Anglong"],
	 BR : ["Araria","Arwal","Aurangabad","Banka","Begusarai","Bhagalpur","Bhojpur","Buxar","Darbhanga","East Champaran","Gaya","Gopalganj","Jamui","Jehanabad","Kaimur","Katihar","Khagaria","Kishanganj","Lakhisarai","Madhepura","Madhubani","Munger","Muzaffarpur","Nalanda","Nawada","Patna","Purnia","Rohtas","Saharsa","Samastipur","Saran","Sheikhpura","Sheohar","Sitamarhi","Siwan","Supaul","Vaishali","West Champaran"],
	 CT : ["Balod","Baloda Bazar","Balrampur","Bastar","Bemetara","Bijapur","Bilaspur","Dantewada","Dhamtari","Durg","Gariaband","Janjgir Champa","Jashpur","Kabirdham","Kanker","Kondagaon","Korba","Koriya","Mahasamund","Mungeli","Narayanpur","Raigarh","Raipur","Rajnandgaon","Sukma","Surajpur","Surguja"],
	 GA : ["North Goa","South Goa"],
	 GJ : ["Ahmedabad","Amreli","Anand","Aravalli","Banaskantha","Bharuch","Bhavnagar","Botad","Chhota Udaipur","Dahod","Dang","Devbhoomi Dwarka","Gandhinagar","Gir Somnath","Jamnagar","Junagadh","Kheda","Kutch","Mahisagar","Mehsana","Morbi","Narmada","Navsari","Panchmahal","Patan","Porbandar","Rajkot","Sabarkantha","Surat","Surendranagar","Tapi","Vadodara","Valsad"],
	 HR : ["Ambala","Bhiwani","Charkhi Dadri","Faridabad","Fatehabad","Gurugram","Hisar","Jhajjar","Jind","Kaithal","Karnal","Kurukshetra","Mahendragarh","Mewat","Palwal","Panchkula","Panipat","Rewari","Rohtak","Sirsa","Sonipat","Yamunanagar"],
	 HP : ["Bilaspur","Chamba","Hamirpur","Kangra","Kinnaur","Kullu","Lahaul Spiti","Mandi","Shimla","Sirmaur","Solan","Una"],
	 JM : ["Anantnag","Bandipora","Baramulla","Budgam","Doda","Ganderbal","Jammu","Kargil","Kathua","Kishtwar","Kulgam","Kupwara","Leh","Poonch","Pulwama","Rajouri","Ramban","Reasi","Samba","Shopian","Srinagar","Udhampur"],
	 JH : ["Bokaro","Chatra","Deoghar","Dhanbad","Dumka","East Singhbhum","Garhwa","Giridih","Godda","Gumla","Hazaribagh","Jamtara","Khunti","Koderma","Latehar","Lohardaga","Pakur","Palamu","Ramgarh","Ranchi","Sahebganj","Seraikela Kharsawan","Simdega","West Singhbhum"],
	 KA : ["Bagalkot","Bangalore Rural","Bangalore Urban","Belgaum","Bellary","Bidar","Vijayapura","Chamarajanagar","Chikkaballapur","Chikkamagaluru","Chitradurga","Dakshina Kannada","Davanagere","Dharwad","Gadag","Gulbarga","Hassan","Haveri","Kodagu","Kolar","Koppal","Mandya","Mysore","Raichur","Ramanagara","Shimoga","Tumkur","Udupi","Uttara Kannada","Yadgir"],
	 KL : ["Alappuzha","Ernakulam","Idukki","Kannur","Kasaragod","Kollam","Kottayam","Kozhikode","Malappuram","Palakkad","Pathanamthitta","Thiruvananthapuram","Thrissur","Wayanad"],
	 MP : ["Agar Malwa","Alirajpur","Anuppur","Ashoknagar","Balaghat","Barwani","Betul","Bhind","Bhopal","Burhanpur","Chhatarpur","Chhindwara","Damoh","Datia","Dewas","Dhar","Dindori","Guna","Gwalior","Harda","Hoshangabad","Indore","Jabalpur","Jhabua","Katni","Khandwa","Khargone","Mandla","Mandsaur","Morena","Narsinghpur","Neemuch","Panna","Raisen","Rajgarh","Ratlam","Rewa","Sagar","Satna",
	"Sehore","Seoni","Shahdol","Shajapur","Sheopur","Shivpuri","Sidhi","Singrauli","Tikamgarh","Ujjain","Umaria","Vidisha"],
	 MH : ["Ahmednagar","Akola","Amravati","Aurangabad","Beed","Bhandara","Buldhana","Chandrapur","Dhule","Gadchiroli","Gondia","Hingoli","Jalgaon","Jalna","Kolhapur","Latur","Mumbai City","Mumbai Suburban","Nagpur","Nanded","Nandurbar","Nashik","Osmanabad","Palghar","Parbhani","Pune","Raigad","Ratnagiri","Sangli","Satara","Sindhudurg","Solapur","Thane","Wardha","Washim","Yavatmal"],
	 MN : ["Bishnupur","Chandel","Churachandpur","Imphal East","Imphal West","Jiribam","Kakching","Kamjong","Kangpokpi","Noney","Pherzawl","Senapati","Tamenglong","Tengnoupal","Thoubal","Ukhrul"],
	 ML : ["East Garo Hills","East Jaintia Hills","East Khasi Hills","North Garo Hills","Ri Bhoi","South Garo Hills","South West Garo Hills","South West Khasi Hills","West Garo Hills","West Jaintia Hills","West Khasi Hills"],
	 MZ : ["Aizawl","Champhai","Kolasib","Lawngtlai","Lunglei","Mamit","Saiha","Serchhip","Aizawl","Champhai","Kolasib","Lawngtlai","Lunglei","Mamit","Saiha","Serchhip"],
	 NL : ["Dimapur","Kiphire","Kohima","Longleng","Mokokchung","Mon","Peren","Phek","Tuensang","Wokha","Zunheboto"],
	 OR : ["Angul","Balangir","Balasore","Bargarh","Bhadrak","Boudh","Cuttack","Debagarh","Dhenkanal","Gajapati","Ganjam","Jagatsinghpur","Jajpur","Jharsuguda","Kalahandi","Kandhamal","Kendrapara","Kendujhar","Khordha","Koraput","Malkangiri","Mayurbhanj","Nabarangpur","Nayagarh","Nuapada","Puri","Rayagada","Sambalpur","Subarnapur","Sundergarh"],
	 PB : ["Amritsar","Barnala","Bathinda","Faridkot","Fatehgarh Sahib","Fazilka","Firozpur","Gurdaspur","Hoshiarpur","Jalandhar","Kapurthala","Ludhiana","Mansa","Moga","Mohali","Muktsar","Pathankot","Patiala","Rupnagar","Sangrur","Shaheed Bhagat Singh Nagar","Tarn Taran"],
	 RJ : ["Ajmer","Alwar","Banswara","Baran","Barmer","Bharatpur","Bhilwara","Bikaner","Bundi","Chittorgarh","Churu","Dausa","Dholpur","Dungarpur","Ganganagar","Hanumangarh","Jaipur","Jaisalmer","Jalore","Jhalawar","Jhunjhunu","Jodhpur","Karauli","Kota","Nagaur","Pali","Pratapgarh","Rajsamand","Sawai Madhopur","Sikar","Sirohi","Tonk","Udaipur"],
	 SK : ["East Sikkim","North Sikkim","South Sikkim","West Sikkim"],
	 TN: ["Ariyalur","Chennai","Coimbatore","Cuddalore","Dharmapuri","Dindigul","Erode","Kanchipuram","Kanyakumari","Karur","Krishnagiri","Madurai","Nagapattinam","Namakkal","Nilgiris","Perambalur","Pudukkottai","Ramanathapuram","Salem","Sivaganga","Thanjavur","Theni","Thoothukudi","Tiruchirappalli","Tirunelveli","Tiruppur","Tiruvallur","Tiruvannamalai","Tiruvarur","Vellore","Viluppuram","Virudhunagar"],
	 TG : ["Adilabad","Bhadradri Kothagudem","Hyderabad","Jagtial","Jangaon","Jayashankar","Jogulamba","Kamareddy","Karimnagar","Khammam","Komaram Bheem","Mahabubabad","Mahbubnagar","Mancherial","Medak","Medchal","Nagarkurnool","Nalgonda","Nirmal","Nizamabad","Peddapalli","Rajanna Sircilla","Ranga Reddy","Sangareddy","Siddipet","Suryapet","Vikarabad","Wanaparthy","Warangal Rural","Warangal Urban","Yadadri Bhuvanagiri"],
	 TR : ["Dhalai","Gomati","Khowai","North Tripura","Sepahijala","South Tripura","Unakoti","West Tripura"],
	 UP : ["Agra","Aligarh","Allahabad","Ambedkar Nagar","Amethi","Amroha","Auraiya","Azamgarh","Baghpat","Bahraich","Ballia","Balrampur","Banda","Barabanki","Bareilly","Basti","Bhadohi","Bijnor","Budaun","Bulandshahr","Chandauli","Chitrakoot","Deoria","Etah","Etawah","Faizabad","Farrukhabad","Fatehpur","Firozabad","Gautam Buddha Nagar","Ghaziabad","Ghazipur","Gonda","Gorakhpur","Hamirpur","Hapur","Hardoi","Hathras","Jalaun","Jaunpur","Jhansi","Kannauj","Kanpur Dehat","Kanpur Nagar","Kasganj","Kaushambi","Kheri","Kushinagar","Lalitpur","Lucknow","Maharajganj","Mahoba","Mainpuri","Mathura","Mau","Meerut","Mirzapur","Moradabad","Muzaffarnagar","Pilibhit","Pratapgarh","Raebareli","Rampur","Saharanpur","Sambhal","Sant Kabir Nagar","Shahjahanpur","Shamli","Shravasti","Siddharthnagar","Sitapur","Sonbhadra","Sultanpur","Unnao","Varanasi"],
	 UK : ["Almora","Bageshwar","Chamoli","Champawat","Dehradun","Haridwar","Nainital","Pauri","Pithoragarh","Rudraprayag","Tehri","Udham Singh Nagar","Uttarkashi"],
	 WB : ["Alipurduar","Bankura","Birbhum","Cooch Behar","Dakshin Dinajpur","Darjeeling","Hooghly","Howrah","Jalpaiguri","Jhargram","Kalimpong","Kolkata","Malda","Murshidabad","Nadia","North 24 Parganas","Paschim Bardhaman","Paschim Medinipur","Purba Bardhaman","Purba Medinipur","Purulia","South 24 Parganas","Uttar Dinajpur"],
	 AN : ["Nicobar","North Middle Andaman","South Andaman"],
	 CH : ["Chandigarh"],
	 DN : ["Dadra Nagar Haveli"],
	 DD : ["Daman","Diu"],
	 DL : ["Central Delhi","East Delhi","New Delhi","North Delhi","North East Delhi","North West Delhi","Shahdara","South Delhi","South East Delhi","South West Delhi","West Delhi"],
	 LD : ["Lakshadweep"],
	 PY : ["Karaikal","Mahe","Puducherry","Yanam"],
    };
    function updateDistricts() {
      // Get selected state
      const selectedState = document.getElementById("stateDropdown").value;
      // Get the district dropdown element
      const districtDropdown = document.getElementById("districtDropdown");
      // Clear existing options
      districtDropdown.innerHTML = '<option value="" disabled selected>Select District</option>';
      // Populate district dropdown based on the selected state
      if (selectedState && stateDistricts[selectedState]) {
        stateDistricts[selectedState].forEach((district) => {
          const option = document.createElement("option");
          option.value = district;
          option.text = district;
          districtDropdown.appendChild(option);
        });
      }
    }


function validateName() {
    var inputField = document.getElementsByName("firstName")[0];
    var regex = /^(?=[A-Za-z\s.]{3,})[A-Za-z\s.]*[A-Za-z][A-Za-z\s.]*$/;
    var errorDiv = document.getElementById("NameError");
    var submitButton = document.getElementById("submitButton");

    if (!inputField.value.match(regex)) {
        errorDiv.textContent = "Please enter a valid input (minimum 3 characters with at least one alphabet).";
        submitButton.disabled = true;
    
   } else {
        errorDiv.textContent = "";
        submitButton.disabled = false;
    }
}

function validatePhoneNumber() {
    var mobileInput = document.getElementsByName("mobilenumber")[0];
    var mobileRegex = /^[6-9]\d{9}$/;
    var mobileErrorDiv = document.getElementById("mobileError");
    var submitButton = document.getElementById("submitButton");

    if (!mobileInput.value.match(mobileRegex)) {
        mobileErrorDiv.textContent = "Please enter a valid mobile number (starting with 6 to 9 and total 10 digits).";
        submitButton.disabled = true;
    } else {
        mobileErrorDiv.textContent = "";
        submitButton.disabled = false;
    }
}

function validateEmail() {
    var emailInput = document.getElementsByName("emailid")[0];
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    var emailErrorDiv = document.getElementById("emailError");
    var submitButton = document.getElementById("submitButton");

    if (!emailInput.value.match(emailRegex)) {
        emailErrorDiv.textContent = "Please enter a valid email address.";
        submitButton.disabled = true;
    } else {
        emailErrorDiv.textContent = "";
        submitButton.disabled = false;
    }
}


function validateAadharNumber() {
    var aadharInput = document.getElementsByName("aadharnumber")[0];
    var aadharErrorDiv = document.getElementById("aadharNumberError");
    var submitButton = document.getElementById("submitButton");
    var aadharRegex = /^\d{12}$/;

    if (!aadharInput.value.match(aadharRegex)) {
        aadharErrorDiv.textContent = "Please enter a valid 12-digit Aadhar number.";
        submitButton.disabled = true;
    } else {
        aadharErrorDiv.textContent = "";
        submitButton.disabled = false;
    }
}

function validateIFSCCode() {
    var ifscCodeInput = document.getElementsByName("ifsccode")[0];
    var ifscCodeErrorDiv = document.getElementById("ifscCodeError");
    var submitButton = document.getElementById("submitButton");
    var ifscCodeRegex = /^[A-Z]{4}\d{7}$/;

    if (!ifscCodeInput.value.match(ifscCodeRegex)) {
        ifscCodeErrorDiv.textContent = "Please enter a valid BANK IFSC CODE with 4 alphabets followed by 7 digits.";
        submitButton.disabled = true;
    } else {
        ifscCodeErrorDiv.textContent = "";
        submitButton.disabled = false;
    }
}

function validateAccountNumber() {
    var accountNumberInput = document.getElementsByName("accountNumber")[0];
    var accountNumberErrorDiv = document.getElementById("accountNumberError");
    var submitButton = document.getElementById("submitButton");
    var accountNumberRegex = /^\d{16}$/;

    if (!accountNumberInput.value.match(accountNumberRegex)) {
        accountNumberErrorDiv.textContent = "Please enter a valid 16-digit account number.";
        submitButton.disabled = true;
    } else {
        accountNumberErrorDiv.textContent = "";
        submitButton.disabled = false;
    }
}


function validateBankName() {
    var bankNameInput = document.getElementsByName("bankname")[0];
    var bankNameErrorDiv = document.getElementById("bankNameError");
    var submitButton = document.getElementById("submitButton");
    var bankNameRegex = /^[A-Za-z][A-Za-z\s]*$/;

    if (!bankNameInput.value.match(bankNameRegex)) {
        bankNameErrorDiv.textContent = "Please enter a valid BANK NAME (starts with a letter, and contains only letters and spaces).";
        submitButton.disabled = true;
    } else {
        bankNameErrorDiv.textContent = "";
        submitButton.disabled = false;
    }
}

function validatePassword() {
    var passwordInput = document.getElementById("password");
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

function validateConfirmPassword() {
    var passwordInput = document.getElementById("password");
    var confirmPasswordInput = document.getElementById("confirmPassword");
    var confirmPasswordErrorDiv = document.getElementById("confirmPasswordError");

    var password = passwordInput.value;
    var confirmPassword = confirmPasswordInput.value;
    var mismatch = false;

    
    for (var i = 0; i < confirmPassword.length; i++) {
        if (password[i] !== confirmPassword[i]) {
            mismatch = true;
            break;
        }else {
        	confirmPasswordErrorDiv.textContent = "";
        }
    }

    if (mismatch || confirmPassword.length < password.length) {
        confirmPasswordErrorDiv.textContent = "Passwords do not match.";
    } else {
        confirmPasswordErrorDiv.textContent = "";
    }
}

function togglePassword(inputId) {
    var passwordInput = document.getElementById(inputId);


    if (passwordInput.type === "password") {
        passwordInput.type = "text";
    } else {
        passwordInput.type = "password";
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
		<h1>NATIONAL SCHOLARSHIP PORTAL</h1><br>
		<p>Government of India</p>
		</center>
			
		</div>
</div>

<div class="subhead">
<marquee class="float" behavior="alternate">
<font class="quote" face="Lucida Calligraphy" >Every Student matters ; Every Student counts...</font></marquee>
</div>

<hr color="white">
 <div class="wrap">
  <h1 class="formhead">Student Register Form</h1>
  <form action="StudentRegistration" method="post">
   <table >
    <tr>
<td>
        <label for="stateDropdown">STATE OF DOMICILE:</label>
</td>
<td>
<select id="stateDropdown" name="state"  onchange="updateDistricts()" required>

  <option value=""  selected="selected" disabled="disabled">---Select State---</option>
  <option value="AP">Andhra Pradesh</option>
<option value="AR">Arunachal Pradesh</option>
<option value="AS">Assam</option>
<option value="BR">Bihar</option>
<option value="CT">Chhattisgarh</option>
<option value="GA">Goa</option>
<option value="GJ">Gujarat</option>
<option value="HR">Haryana</option>
<option value="HP">Himachal Pradesh</option>
<option value="JM">JammuKashmir</option>
<option value="JH">Jharkhand</option>
<option value="KA">Karnataka</option>
<option value="KL">Kerala</option>
<option value="MP">Madhya Pradesh</option>
<option value="MH">Maharashtra</option>
<option value="MN">Manipur</option>
<option value="ML">Meghalaya</option>
<option value="MZ">Mizoram</option>
<option value="NL">Nagaland</option>
<option value="OR">Odisha</option>
<option value="PB">Punjab</option>
<option value="RJ">Rajasthan</option>
<option value="SK">Sikkim</option>
<option value="TN">Tamil Nadu</option>
<option value="TG">Telangana</option>
<option value="TR">Tripura</option>
<option value="UP">Uttar Pradesh</option>
<option value="UK">Uttarakhand</option>
<option value="WB">West Bengal</option>
<option value="AN">Andaman and Nicobar Islands</option>
<option value="CH">Chandigarh</option>
<option value="DN">Dadra and Nagar Haveli and Daman and Diu</option>
<option value="DD">DamanDiu</option>
<option value="DL">Delhi</option>
<option value="LD">Lakshadweep</option>
<option value="PY">Puducherry</option>

  
</select>
</td>
<td>
<label for="districtDropdown">DISTRICT:</label>
</td>
<td><select id="districtDropdown" name="district" required>
   <option value="" disabled selected>--Select District--</option>
 </select></td>
    </tr>
    <tr>
     <td>NAME:<br> (AS IN MARKS SHEETS)</td>
     <td><input type="text" name="firstName" oninput="validateName()" required/>
<div id="NameError" style="color: red;"></div></td>
     <td>DATE OF BIRTH:</td>
    <td><input type="date" name="DOB" required min="1990-01-01" max="2015-12-31" /></td>
    </tr>
    <tr>
        <td class = "select">GENDER:</td>
        <td>
        <select class="option">
                <option value="select">SELECT</option>        
                <option value="male">MALE</option>
                <option value="female">FEMALE</option>
                <option value="others">Others</option>
        </select>
        </td>
</tr>
    <tr>
     <td>PHONE NUMNBER:</td>
     <td><input type="text" name="mobilenumber" oninput="validatePhoneNumber()" maxLength=10 required/>
        <div id="mobileError" style="color: red;"></div></td>
    </tr>
    <tr  >
     <td>EMAIL ID:</td>
     <td><input type="email" name="emailid" onblur="validateEmail()" required>
      	    <div id="emailError" style="color: red;"></div></td>
    </tr>
    <tr >
     <td>INSTITUTE CODE:</td>
<td>
    <select name="selectedInstituteCode" required>
    <option value="" selected=selected disabled= disabled>--Select One--</option>
        <c:forEach var="institute" items="${institutes}">
            <option value="${institute.code}">${institute.code} - ${institute.name}</option>
        </c:forEach>
    </select>
</td>

         <td>AADHAR NUMBER:</td>
     <td><input type="text" name="aadharnumber" maxlength="12" oninput="validateAadharNumber()" required />
     <div id="aadharNumberError" style="color: red;"></div></td>
    </tr>
    <tr >
     <td>BANK IFSC CODE:</td>
     <td><input type="text" name="ifsccode"  id="ifsccode" maxlength="11" onblur="validateIFSCCode()" required/>
          <div id="ifscCodeError" style="color: red;"></div></td>
     <td> BANK ACCOUNT NUMBER</td>
     <td><input type="text" name="accountNumber" maxlength="16" onblur=" validateAccountNumber()" required>
          <div id="accountNumberError" style="color: red;"></div></td>
    </tr>
    <tr>
     <td>BANK NAME:</td>
     <td><input type="text" name="bankname" required onblur="validateBankName()"/>
         <div id="bankNameError" style="color: red;"></div></td>
    </tr>
     <tr >
     <td>SET YOUR PASSWORD:</td>
     <td><input type="password" name="password" id="password" onblur="validatePassword()" required/>
        <img src=".\img\view.png" id="eyeIconOld" class="eye-icon" onclick="togglePassword('password')" alt="Toggle Password" width="15px" height="20px" style= "margin-bottom:-2%; margin-left:-10%; cursor:pointer">
        <div id="passwordError" style="color: red;"></div></td>
    </tr>
     <tr>
     <td>CONFIRM PASSWORD:</td>
     <td><input type="password" name="confirmPassword" id="confirmPassword" onblur="validateConfirmPassword()" required />
        <img src=".\img\view.png" id="eyeIconOld" class="eye-icon" onclick="togglePassword('confirmPassword')" alt="Toggle Password" width="15px" height="20px" style= "margin-bottom:-2%; margin-left:-10%; cursor:pointer">
        <div id="confirmPasswordError" style="color: red;"></div></td>
    </tr>
   </table>
 
   <div class="cond">
   <input  id="checkbox" type="checkbox" required>
   <label for="checkbox"> ALL THE ABOVE INFORMATION FURNISHED BY ME IS TRUE TO THE BEST OF MY KNOWLEDGE</label>
   </div>
   
   <div class="button">
   <input type="submit" id="submitButton" value="REGISTER" />
   <input type="reset" value="RESET" />
   </div>

  </form>
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
</body>
</html>