<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Institute Registration form</title>
<link rel="stylesheet" href=".\css\InstituteRegistration.css"></link>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js"></script>




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
      const selectedState = document.getElementById("state1").value;
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


function validateYearRange() {
	   var inputElement = document.getElementById("admissionStart");
	   var yearError = document.getElementById("yearError");
	   var submitButton = document.getElementById("submitButton");
	   var minYear = 1940;
	   var maxYear = 2020;
	 
	   if (inputElement.valueAsNumber < minYear) {
	   	yearError.textContent = "Year must be equal to or greater than " + minYear;
	   	submitButton.disabled = true;
	   } else if (inputElement.valueAsNumber > maxYear) {
	   	yearError.textContent = "Year must be equal to or less than " + maxYear;
	   	submitButton.disabled = true;
	   } else {
	   	yearError.textContent= "";
	   	submitButton.disabled = false;
	   }
	}


function validateName() {
    var nameInput = document.getElementsByName("Name")[0];
    var nameRegex = /^(?=[A-Za-z\s.]{3,})[A-Za-z\s.]*[A-Za-z][A-Za-z\s.]+(?:[.A-Za-z\s]|)*$/;  
    var nameErrorDiv = document.getElementById("nameError");
    var submitButton = document.getElementById("submitButton");

     if (!nameInput.value.match(nameRegex)) {
        nameErrorDiv.textContent = "Please enter a valid name (minimum 3 characters with at least one alphabet).";
        submitButton.disabled = true; 
    } else{
        nameErrorDiv.textContent = "";
        submitButton.disabled = false; 
    }
}

function validateInstituteCode() {
    var codeInput = document.getElementById("codeInput");
    var codeError = document.getElementById("codeError");
    var pattern = /^\d{4}$/ ;
    var submitButton = document.getElementById("submitButton");
    
    if (!pattern.test(codeInput.value)) {
        codeError.textContent = "Please enter exactly 4 digits.";
        submitButton.disabled = true; 
    } else{
        codeError.textContent = "";
        submitButton.disabled = false;
    }
}

function validateDiseCode() {
    var codeInput = document.getElementById("diseCodeInput");
    var diseCodeError = document.getElementById("diseCodeError");
    var pattern =/^[A-Z]{2}-\d{3}-\d{3}-\d{4}$/;
    var submitButton = document.getElementById("submitButton");
    
    if (!pattern.test(codeInput.value)) {
    	diseCodeError.textContent = "Please enter valid format as XX-XXX-XXX-XXXX";
    	submitButton.disabled = true;
    } else {
    	diseCodeError.textContent = "";
    	submitButton.disabled = false;
    }
}

function validateBoardName() {
    var boardNameInput = document.getElementsByName("boardname")[0];
    var boardNameRegex =/^[A-Za-z.]+(?:\s[A-Za-z.]+)*$/;
    var boardNameErrorDiv = document.getElementById("boardNameError");
    var submitButton = document.getElementById("submitButton");
    
    if (!boardNameInput.value.match(boardNameRegex)) {
        boardNameErrorDiv.textContent = "Please enter a valid name (no consecutive spaces).";
        submitButton.disabled = true;
    } else {
        boardNameErrorDiv.textContent = "";
        submitButton.disabled = false;
    }
}

function validateEmail() {
    var emailInput = document.getElementsByName("email")[0];
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

function syncFields(sourceFieldId, targetFieldId) {
	  var sourceField = document.getElementById(sourceFieldId);
	  var targetField = document.getElementById(targetFieldId);
	  targetField.selectedIndex = sourceField.selectedIndex;
	  targetField.disabled = true;
	}


function validateInput(inputName, errorDivId) {
    var inputField = document.getElementsByName(inputName)[0];
    var regex = /^(?=[A-Za-z\s.]{3,})[A-Za-z\s.]*[A-Za-z][A-Za-z\s.]+(?:[.A-Za-z\s]|)*$/;
    var errorDiv = document.getElementById(errorDivId);
    var submitButton = document.getElementById("submitButton");

   if (!inputField.value.match(regex)) {
        errorDiv.textContent = "Please enter a valid input (minimum 3 characters with at least one alphabet).";
        submitButton.disabled = true;
    } else {
        errorDiv.textContent = "";
        submitButton.disabled = false;
    }
}

function validateMobileNumber() {
    var mobileInput = document.getElementsByName("mnumber")[0];
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


function validateTelephone() {
    var telephoneInput = document.getElementsByName("telephone")[0];
    var telephoneErrorDiv = document.getElementById("telephoneError");
    var submitButton = document.getElementById("submitButton");
    
    if (telephoneInput) {
        var telephoneRegex = /^[0-9]{6,15}$/;

        if (!telephoneInput.value.match(telephoneRegex)) {
            telephoneErrorDiv.textContent = "Please enter a valid telephone number (6 to 15 digits).";
            submitButton.disabled = true;
        } else {
            telephoneErrorDiv.textContent = "";
            submitButton.disabled = false;
        }
    }
}

function validatePincode() {
    var pincodeInput = document.getElementsByName("pincode")[0];
    var pincodeError = document.getElementById("pincodeError");
    var pattern = /^\d{6}$/;
    var submitButton = document.getElementById("submitButton");
    
   if (!pattern.test(pincodeInput.value)) {
        pincodeError.textContent = "Please enter exactly 6 digits.";
        submitButton.disabled = true;
    } else {
        pincodeError.textContent = "";
        submitButton.disabled = false;
    }
}

function syncDistrict(sourceId, targetId) {
    var sourceElement = document.getElementById(sourceId);
    var targetElement = document.getElementById(targetId);

    // Check if the selected option is the placeholder
    if (sourceElement.value !== "") {
      // Copy the selected value from the dropdown to the input field
      targetElement.value = sourceElement.value;
    } else {
      // If the placeholder is selected, clear the value in the input field
      targetElement.value = "";
    }
  }


</script>
<style>

.topic {
background-color:#3486d9;
color:white;
}

</style>

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

<hr color="white">
 
<div class="wrap">
<form action="InstituteRegister" method="post" enctype="multipart/form-data">
<h1 class="formhead" >INSTITUTE  REGISTRATION REQUEST FORM</h1>

<div class="wrap1">
   <table >
   <h4>BASIC DETAILS:</h4>
    <tr>
        <td class = "select" name="instituteCategory">INSTITUTE CATEGORY:</td>
        <td>
        <select name="instituteCategory" required>
                <option value="" selected="selected" disabled="disabled">-- select one --</option>        
                <option value="school"> School </option>
                <option value="college"> College </option>
<option value="technicalAndPrivateInstitute"> Technical and Private Institute </option>
                <option value="Universities"> Universities </option>
<option value="ResearchInstitute"> Research Institute </option>
                <option value="Polytechnics"> Polytechnics </option>
<option value="AgriculturalInstitute"> Agricultural Institute </option>
                <option value="artAndDesignInstitute"> Art and Design Institute </option>
<option value="TeacherTrainingInstitute"> Teacher Training Institute </option>
                <option value="SpecializedInstitute"> Specialized Institute</option>
<option value="DistanceEducationInstitute"> Distance Education Institute </option>
                <option value="OpenUniversitites"> Open Universities </option>
        </select>
        </td>
     </tr>
    <tr>
     <td>NAME:</td>
        <td><input type="text" name="Name" id="nameInput" oninput="validateName()" required />
        <div id="nameError" style="color: red;"></div></td>
    </tr>
    <tr>
     <td class = "select" for="inputState">STATE:</td>
        <td><select id="state1" class="form-control" name="inputState" onchange="syncFields('state1', 'state2'); updateDistricts();"
  required >
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
        <td class = "select" for="inputDistrict">DISTRICT:</td>
        <td><select id="districtDropdown" name="inputDistrict"   onchange="syncDistrict('districtDropdown', 'district2')">
   <option value="" disabled selected>Select District</option>
   <!-- District options will be populated dynamically based on the selected state -->
 </select></td>

    </tr>
     <tr>
     <td>INSTITUTE CODE:</td>
        <td><input type="text" name="code"   id="codeInput" oninput="validateInstituteCode()" maxlength = 4 required/>
        <div id="codeError" style="color: red;"></div></td>
    </tr>
    <tr>
     <td>DISE CODE:</td>
        <td><input type="text" name="disccode" id="diseCodeInput" onblur="validateDiseCode()" required/>
        <div id="diseCodeError" style="color: red;"></div></td>
    </tr>
    <tr>
   <td required>LOCATION:</td>
   <td>
     <label><input type="radio" id='regular' name="location" value="urban" >URBAN</label>
     <label><input type="radio" id='regular' name="location"value="rural">RURAL</label>
      </td>
</tr>
<tr>
     <td class = "select" >INSTITUTE TYPE:</td>
        <td>
        <select name="instituteType" required>
                <option value="" selected="selected" disabled="disabled">-- select one --</option>        
                <option value="GovernmentInstitute"> Government Institutions </option>
                <option value="PrivateInstitute"> Private Institutions </option>
<option value="CentralUniversities"> Central Universities </option>
                <option value="StateUniversities"> State Universities </option>
  <option value="DeemedUniversities"> Deemed Universities </option>
                <option value="TechnicalInstitute"> Technical Institutions </option>
<option value="MedicalInstitute"> Medical Institutions </option>
                <option value="ManagementInstitute"> Management Institutions </option>
<option value="LawInstitute"> Law Institutions </option>
                <option value="AgriculturalInstitute"> Agricultural Institute </option>
                <option value="artAndDesignInstitute"> Art and Design Institute </option>
<option value="TeacherTrainingInstitute"> Teacher Training Institute </option>
                <option value="SpecializedInstitute"> Specialized Institute</option>
<option value="DistanceEducationInstitute"> Distance Education Institute </option>
                <option value="OpenUniversitites"> Open Universities </option>
        </select>
        </td>
        <td class = "select"">AFFILIATED UNIVERSITY STATE:</td>
        <td>
       <select id="state" name="affiliatedState" required>
          <option value="" selected="selected" disabled="disabled">-- select state --</option>
                        <option value="Andra Pradesh">Andra Pradesh</option>
                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                        <option value="Assam">Assam</option>
                        <option value="Bihar">Bihar</option>
                        <option value="Chhattisgarh">Chhattisgarh</option>
                        <option value="Goa">Goa</option>
                        <option value="Gujarat">Gujarat</option>
                        <option value="Haryana">Haryana</option>
                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Karnataka">Karnataka</option>
                        <option value="Kerala">Kerala</option>
                        <option value="Madya Pradesh">Madya Pradesh</option>
                        <option value="Maharashtra">Maharashtra</option>
                        <option value="Manipur">Manipur</option>
                        <option value="Meghalaya">Meghalaya</option>
                        <option value="Mizoram">Mizoram</option>
                        <option value="Nagaland">Nagaland</option>
                        <option value="Orissa">Orissa</option>
                        <option value="Punjab">Punjab</option>
                        <option value="Rajasthan">Rajasthan</option>
                        <option value="Sikkim">Sikkim</option>
                        <option value="Tamil Nadu">Tamil Nadu</option>
                        <option value="Telangana">Telangana</option>
                        <option value="Tripura">Tripura</option>
                        <option value="Uttaranchal">Uttaranchal</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="West Bengal">West Bengal</option>
                        <option disabled style="background-color:#aaa; color:#fff">UNION Territories</option>
                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                        <option value="Chandigarh">Chandigarh</option>
                        <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
                        <option value="Daman and Diu">Daman and Diu</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Lakshadeep">Lakshadeep</option>
                        <option value="Pondicherry">Pondicherry</option>
                      </select>
        </td>
    </tr>
  <tr>
     <td>AFFILIATED UNIVERSITY / BOARD NAME:</td>
        <td><input type="text" name="boardname" onblur="validateBoardName()" required/>
            <div id="boardNameError" style="color: red;"></div></td>
      <td>Email: </td>
      	<td><input type="email" name="email" onblur="validateEmail()" required>
      	    <div id="emailError" style="color: red;"></div></td>
    </tr>
<tr>
<td class = "select">YEAR FROM WHICH ADMISSION STARTED:</td>
       <td>
       <input type="number" name="admissionStart" id="admissionStart"  min=1947 max=2020 onblur="validateYearRange()" required>
       <div id="yearError" style="color: red;"></div></td>
</tr>
  <tr>
     <td>SET PASSWORD:</td>
        <td><input type="password" name="password" id="password" onblur="validatePassword()" required/>
        <img src=".\img\view.png" id="eyeIconOld" class="eye-icon" onclick="togglePassword('password')" alt="Toggle Password" width="15px" height="20px" style= "margin-bottom: -2% ; margin-left:-10%; cursor:pointer">
        <div id="passwordError" style="color: red;"></div></td>
    </tr>
<tr>
     <td>CONFIRM PASSWORD:</td>
        <td><input type="password" name="password" id="confirmPassword" onblur="validateConfirmPassword()" required />
        <img src=".\img\view.png" id="eyeIconOld" class="eye-icon" onclick="togglePassword('confirmPassword')" alt="Toggle Password" width="15px" height="20px" style= "margin-bottom: -2% ; margin-left:-10%; cursor:pointer">
        <div id="confirmPasswordError" style="color: red;"></div></td>
    </tr>
  </table>
<br>   
</div>

<br>

<div class="wrap1">
<h4>PROOF OF EXISTANCE OF INSTITUTE:</h4> <br>
<label class="doc">INSTITUTE ESTABLISHMENT/ REGISTRATION CERTIFICATE:</label>
 <input type = "file" name = "instituteRegistrationCertificate" size = "50" required />
<br><br>
</div>

<br>

<div class="wrap1">
<h4>AFFLIATED TO:</h4> <br>
<label class="doc">UNIVERSITY/ BOARD AFFILIATION CERTIFICATE:</label>
<input type = "file" name = "universityAffiliatedCertificate" size = "50" required/>
<br><br>
</div>

<br>

<div class="wrap1">
   <table>
<h4> ADDRESS:</h4>
<tr>
<td>LINE 1:</td>
<td><input type="text" name="line1" required/></td>
<td>LINE 2:</td>
<td><input type="text" name="line2" required/></td>
</tr>
<tr>
<td>CITY:</td>
<td><input type="text" name="city" oninput="validateInput('city', 'cityError')" required/>
<div id="cityError" style="color: red;"></div></td>
 <td class = "select"">STATE:</td>
        <td>
        <select id="state2" required readonly disabled>
        <option value="" selected disabled></option>
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
        </select>
        </td>
</tr>
<tr>

<td class="select" for="inputDistrict">DISTRICT:</td>
      <td>
        <input name="inputDistrict" id="district2" readonly disabled>
  </td>
<td>PINCODE:</td>
<td><input type="text" name="pincode" oninput="validatePincode()" maxLength=6  required/>
<div id="pincodeError" style="color: red;"></div></td>
</tr>
</table>
<br>
</div>

<br>

<div class="wrap1">
<h4>CONTACT DETAILS :</h4>
<div>
<table>
<tr>
<td>PRINICIPAL NAME:</td>
<td><input type="text" name="pname" oninput="validateInput('pname', 'pNameError')" required/>
<div id="pNameError" style="color: red;"></div></td>
<td>MOBILE NUMBER:</td>
<td><input type="text" name="mnumber" oninput="validateMobileNumber()" maxLength=10 required/>
        <div id="mobileError" style="color: red;"></div></td>
</tr>
<tr>
<td>TELEPHONE:</td>
<td><input type="text" name="telephone" oninput="validateTelephone()" />
        <div id="telephoneError" style="color: red;"></div></td>
</tr>
</table>
<br>
</div>
</div>



<div class="cond">
   <input  id="checkbox" type="checkbox">
   <label for="checkbox">ALL THE DETAILS AND DOCUMENTS SUBMITTED BY US ARE VALID AND TRUE <br>
   <br>IF FOUND GUILTY OF SUBMITTING INVALID DOCUMENTS, WE MAY BE HELP RESPONSIBLE FOR TAHT ACT BY US
  </label>
  </div>

<div class="button">
   <input type="submit" id="submitButton" value="REGISTER" />
   <input type="reset" value="RESET" />
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
</body>
</html>