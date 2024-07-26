<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%-- Retrieve session attribute --%>
<%
    HttpSession ses = request.getSession();
    String aadharNumber = (String) ses.getAttribute("aadharNumber");
    // Use the aadharNumber retrieved from the session as needed in this JSP
%>
<html>
    <head>
        <title>SCHOLARSHIP APPLICATION FORM</title>
        

        <link rel="stylesheet" href=".\css\scholarship.css">
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
      const selectedState = document.getElementById("state").value;
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


        function validateInput(inputName, errorDivId) {
            var inputField = document.getElementsByName(inputName)[0];
            var regex = /^(?=[A-Za-z\s.]{3,})[A-Za-z\s.]*[A-Za-z][A-Za-z\s.]*$/;
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
        
        function validateAnnualIncome() {
            var incomeInput = document.getElementsByName("annualincome")[0];
            var incomeError = document.getElementById("incomeError");
            var pattern = /^[1-9]\d{2,7}$/;
            var submitButton = document.getElementById("submitButton");

            if (!pattern.test(incomeInput.value)) {
                incomeError.textContent = "Please enter a valid annual income ( first digit 1-9).";
                submitButton.disabled = true;
            } else {
                incomeError.textContent = "";
                submitButton.disabled = false;
            }
        }
        
        
        function validateClass(inputField,classError) {
            var classInput = document.getElementsByName(inputField)[0];
            var classRegex = /^(?!.*(?:[. -]){2,})[0-9a-zA-Z. -]+$/;
            var classErrorDiv = document.getElementById(classError);
            var submitButton = document.getElementById("submitButton");

            if (classInput.value.trim() === "") {
            	classErrorDiv.textContent = "";  // Clear error message if the field is empty
            } else if (!classInput.value.match(classRegex)) {
            	classErrorDiv.textContent = "Please enter a valid name (no consecutive spaces).";
            	submitButton.disabled = true;
            } else {
            	classErrorDiv.textContent = "";
            	submitButton.disabled = false;
            }
        }

        function validateBoardName() {
            var boardNameInput = document.getElementsByName("UNIVBOARD")[0];
            var boardNameRegex =/^[A-Za-z]+(?:\s[A-Za-z]+)*$/
            var boardNameErrorDiv = document.getElementById("UNIVBOARDError");
            var submitButton = document.getElementById("submitButton");
    
            if (!boardNameInput.value.match(boardNameRegex)) {
                boardNameErrorDiv.textContent = "Please enter a valid name (no consecutive spaces).";
                submitButton.disabled = true;
            } else {
                boardNameErrorDiv.textContent = "";
                submitButton.disabled = false;
            }
        }
        
        function validatePercentage(inputId, percentageErrorId) {
            var percentageError = document.getElementById(percentageErrorId);
            var submitButton = document.getElementById("submitButton");
            var percentageRegex = /^(100(\.0{1,2})?|\d{1,2}(\.\d{1,2})?)$/;

            var percentageValue = document.getElementById(inputId).value.trim();

            if (!percentageRegex.test(percentageValue)) {
                percentageError.textContent = "Please enter a valid percentage (0-100) with up to two decimal places.";
                submitButton.disabled = true;
            } else {
                percentageError.textContent = "";
                submitButton.disabled = false;
            }
        }

        
        function validateRollNumber(inputField,errorField) {
            var rollNumberInput = document.getElementById(inputField);
            var rollNumberRegex = /^[A-Za-z0-9]+$/;
            var rollNumberErrorDiv = document.getElementById(errorField);
            var submitButton = document.getElementById("submitButton");

            if (!rollNumberInput.value.match(rollNumberRegex)) {
                rollNumberErrorDiv.textContent = "Please enter a valid roll number (only alphabets and digits allowed).";
                submitButton.disabled = true;
            } else {
                rollNumberErrorDiv.textContent = "";
                submitButton.disabled = false;
            }
        }
     
        
        function validateTBoardName(inputField, bnameError) {
            var tboardNameInput = document.getElementsByName(inputField)[0];
            var tboardNameRegex =/^[A-Za-z]+(?:\s[A-Za-z]+)*$/;
            var tboardNameErrorDiv = document.getElementById(bnameError);
            var submitButton = document.getElementById("submitButton");
    
            if (!tboardNameInput.value.match(tboardNameRegex)) {
                tboardNameErrorDiv.textContent = "Please enter a valid name (no consecutive spaces).";
                submitButton.disabled = true;
            } else {
                tboardNameErrorDiv.textContent = "";
                submitButton.disabled = false;
            }
        }
        
        
        function validateFee(inputField, feeErrorId) {
            var feeInput = document.getElementsByName(inputField)[0];
            var feeError = document.getElementById(feeErrorId);
            var pattern = /^[1-9]\d*$/;
            var submitButton = document.getElementById("submitButton");

            if (!pattern.test(feeInput.value)) {
                feeError.textContent = "Please enter a valid fee (only digits , first digit 1-9).";
                submitButton.disabled = true;
            } else {
                feeError.textContent = "";
                submitButton.disabled = false;
            }
        }
        
        
        function validateParentProfession() {
            var professionInput = document.getElementsByName("parentprofession")[0];
            var professionRegex = /^[A-Za-z][A-Za-z-]*$/;
            var professionErrorDiv = document.getElementById("parentProfessionError");

            if (!professionRegex.test(professionInput.value)) {
                professionErrorDiv.textContent = "Please enter a valid profession (should start with an alphabet and can contain alphabets or hyphens).";
            } else {
                professionErrorDiv.textContent = "";
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

        function validateYearRange(inputField,errorField,min,max) {
        	   var inputElement = document.getElementById(inputField);
        	   var yearError = document.getElementById(errorField);
        	   var submitButton = document.getElementById("submitButton");
        	   var minYear = min;
        	   var maxYear = max;
        	 
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
<form action="ScholarshipStudent" method="post" >
<h1 class="formhead" >STUDENT SCHOLARSHIP FORM</h1>


<div  class="wrap1">

        <h4 style="text-align:left;margin-left:2%">BASIC DETAILS :</h4> 

<table>
<tr>
           <td class="row">AADHAR NUMBER:</td>
            <td><input type="text" maxlength="12" name="aadharNumber" value="<%= aadharNumber %>"  readonly></td>  <!-- retrieve aadhar number from session readonly -->

            <td>RELIGION:</td>
            <td><select  id="religion" name="religion" required >
                    <option value="" selected="selected" disabled="disabled">-- select one --</option>
                    <option value="African Traditional &amp; Diasporic">African Traditional &amp; Diasporic</option>
                    <option value="Agnostic">Agnostic</option>
                    <option value="Atheist">Atheist</option>
                    <option value="Baha'i">Baha'i</option>
                    <option value="Buddhism">Buddhism</option>
                    <option value="Cao Dai">Cao Dai</option>
                    <option value="Chinese traditional religion">Chinese traditional religion</option>
                    <option value="Christianity">Christianity</option>
                    <option value="Hinduism">Hinduism</option>
                    <option value="Islam">Islam</option>
                    <option value="Jainism">Jainism</option>
                    <option value="Juche">Juche</option>
                    <option value="Judaism">Judaism</option>
                    <option value="Neo-Paganism">Neo-Paganism</option>
                    <option value="Nonreligious">Nonreligious</option>
                    <option value="Rastafarianism">Rastafarianism</option>
                    <option value="Secular">Secular</option>
                    <option value="Shinto">Shinto</option>
                    <option value="Sikhism">Sikhism</option>
                    <option value="Spiritism">Spiritism</option>
                    <option value="Tenrikyo">Tenrikyo</option>
                    <option value="Unitarian-Universalism">Unitarian-Universalism</option>
                    <option value="Zoroastrianism">Zoroastrianism</option>
                    <option value="primal-indigenous">primal-indigenous</option>
                    <option value="Other">Other</option>
            </select></td>
</tr>

<tr>
            <td>COMMUNITY/CATEGORY:</td>
            <td><select required name="community">
            <option value="" selected="selected" disabled="disabled">-- select one --</option>
            <option value="SC">Scheduled Caste</option>
            <option value="ST">Scheduled Tribe</option>
            <option value="OBC">Other Backward Caste</option>
            <option value="General">General</option>
            <option value="Minority">Minority(All Categories)</option>
            <option value="Others">Others</option>  
            </td>
</tr>

<tr>
            <td>FATHERNAME:</td>
            <td><input type="text" name="fathername" onblur="validateInput('fathername', 'fathernameError')" required/>
<div id="fathernameError" style="color: red;"></div></td>
            <td> MOTHERNAME: </td>
            <td><input type="text" name="mothername" onblur="validateInput('mothername', 'mothernameError')" required/>
<div id="mothernameError" style="color: red;"></div></td>
</tr>

<tr>
            <td>FAMILY ANNUAL INCOME:</td>
            <td><input type="text" name="annualincome"  oninput="validateAnnualIncome()" maxLength=8 required>
        <div id="incomeError" style="color: red;"></div></td>
 </tr>
</table>
<br>
</div>

<br>


<div class="wrap1">

            <h4>ACADEMIC DETAILS:</h4>
<table>
 
<tr>           
            <td>INSTITUTE CODE:</td>
            <td><input type="text" name="instituteName" value="${students[0].instituteCode}"  readonly></td> <!-- retrieve institute code from session readonly -->
            <td>PRESENT CLASS/COURSE: </td>
            <td><input type="text" name="presentclass" onblur="validateClass('presentclass','presentClassError')" required>
            <div id="presentClassError" style="color: red;"></div></td>
</tr>

<tr>
            <td>PRESENT CLASS/COURSE YEAR: </td>
            <td><input type="number" name="courseyear" id="courseyear" min=2010 max=2024 onblur="validateYearRange('courseyear', 'presentClassYearError',2010,2024)" required>
            <div id="presentClassYearError" style="color: red;"></div></td>
            <td>MODE OF STUDY: </td>
            <td><select  id="ModeOfStudy" name="ModeOfStudy" required >
                <option value="" selected="selected" disabled="disabled">--- select one ---</option>
            	<option value="FullTime">Full - Time</option>
            	<option value="PartTime">Part - Time</option>
            </select></td>
</tr>

<tr>
            <td>CLASS START DATE:</td>
            <td><input type="date" name="startdate" id="startdate" required min="2001-01-01" max="2023-12-31"></td> <!-- max and min date have to be fix -->
            <td>UNIVERSITY/BOARD NAME:</td>
            <td><input type="text" name="UNIVBOARD"onblur="validateBoardName()" required/>
            <div id="UNIVBOARDError" style="color: red;"></div></td>
</tr>

<tr>
            <td>PREVIOUS CLASS/COURSE:</td>
            <td><input type="text" name="previouscourse" onblur="validateClass('previouscourse','previousClassError')" required>
            <div id="previousClassError" style="color: red;"></div></td>
            <td>PREVIOUS PASSING YEAR:</td>
            <td><input type="number" name="previousyear" id="previousyear" min=2010 max=2024 onblur="validateYearRange('previousyear','previousClassYearError',2010,2024)" required >
            <div id="previousClassYearError" style="color: red;"></div></td>
            <td>PREVIOUS CLASS %:</td>
            <td><input type="text" name="previousclass" id="previousclass"  oninput="validatePercentage('previousclass','percentageError')" required>
                <div id="percentageError" style="color: red;"></div></td>
</tr>
</table>
<br>
</div>
<br>


<div class="wrap1">
            <h4>10TH CLASS:</h4>

<table>
<tr>            
            <td>ROLL NUMBER:</td>
            <td><input type="text" name="rollnumber" id="rollnumber" oninput="validateRollNumber('rollnumber','rollNumberError')" required>
                <div id="rollNumberError" style="color: red;"></div></td>
            <td>BOARD NAME:</td>
            <td><input type="text" name="boardname" onblur="validateTBoardName('boardname','boardnameError')" required/>
            <div id="boardnameError" style="color: red;"></div></td>
</tr>


<tr>
            <td>PASSING YEAR:</td>
            <td><input type="number" name="passingyear" id="passingyear" min=2005 max=2023 onblur="validateYearRange('passingyear','tenthPassingYearError',2005,2023)" required >
            <div id="tenthPassingYearError" style="color: red;"></div></td>
             <td>% OBTAINED:</td>
            <td><input type="text" name="percentage" id="percentage" oninput="validatePercentage('percentage','tenthpercentageError')" required>
                <div id="tenthpercentageError" style="color: red;"></div></td>
</tr>
</table>
<br>
</div>

<br>

<div class="wrap1">
            <h4>12TH CLASS:</h4>
<table>
<tr>
            <td>ROLL NUMBER:</td>
            <td><input type="text" name="rolNumber" id="rolNumber" oninput="validateRollNumber('rolNumber','rolNumberError')" required>
                <div id="rolNumberError" style="color: red;"></div></td>
            <td>BOARD NAME:</td>
            <td><input type="text" name="tboardname" onblur="validateTBoardName('tboardname','tboardnameError')" required/>
            <div id="tboardnameError" style="color: red;"></div></td>
</tr>

<tr>
            <td>PASSING YEAR:</td>
            <td><input type="number" name ="TwpassingYear" id="TwpassingYear" min=2005 max=2023 onblur="validateYearRange('TwpassingYear','twelfthPassingYearError',2005,2023)" required >
            <div id="twelfthPassingYearError" style="color: red;"></div></td>
            <td>% OBTAINED:</td>
            <td><input type="text" name="Twpercentage" id="Twpercentage" oninput="validatePercentage('Twpercentage','twelfthpercentageError')" required>
                <div id="twelfthpercentageError" style="color: red;"></div></td>
</tr>
</table>
<br>
</div>

<br>

<div class="wrap1">

            <h4>FEE DETAILS:</h4>

<table>
<tr>
            <td>ADMISSION FEE:</td>
            <td><input type="text" name="admissionfee" oninput="validateFee('admissionfee','admissionFeeError')" required>
                <div id="admissionFeeError" style="color: red;"></div></td>
            <td>TUITION FEE:</td>
            <td><input type="text" name="tutionfee" oninput="validateFee('tutionfee','tutionFeeError')" required>
                <div id="tutionFeeError" style="color: red;"></div></td>
            <td>OTHER FEE:</td>
            <td><input type="text" name="otherfee" oninput="validateFee('otherfee','otherFeeError')" required>
                <div id="otherFeeError" style="color: red;"></div></td>
</tr>
</table>
<br>
</div>

<br>

<div class="wrap1">
            <h4>OTHER PERSONAL DETAILS:</h4>

<table>


<tr>
            <td>MARITAL STATUS:</td>
             <td>
            <select  id="maritalName" name="maritalStatus" required >
                <option value="select one" selected="selected" disabled="disabled">-- select one --</option>
<option value="Single">Single</option>
<option value="Married">Married</option>
<option value="Widowed">Widowed</option>
<option value="Divorced">Divorced</option>
            </select>
             </td>
            <td>PARENTS PROFESSION:</td>
            <td><input type="text" name="parentprofession" oninput="validateParentProfession()" required/>
                <div id="parentProfessionError" style="color: red;"></div></td>
</tr>

<tr>
     <td>STATE:</td>
     <td><select id="state" name="state" onchange="updateDistricts()" required >
          <option value="" selected="selected" disabled="disabled">--- Select State---</option>
                         
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
<option value="DN">Dadra and Nagar Haveli</option>
<option value="DD">DamanDiu</option>
<option value="DL">Delhi</option>
<option value="LD">Lakshadweep</option>
<option value="PY">Puducherry</option>
                      </select> </td>

<td>
<label for="districtDropdown">DISTRICT:</label>
</td>
<td><select id="districtDropdown" name="district" required>
   <option value="" disabled selected>--Select District--</option>
 </select></td>
  
       <td>
      <label for="blck/taluk">BLOCK/TALUK</label>
        </td>
<td>
       <input type="text" name="taluk" taluk required>
 </td>
</tr>
    
  <tr>     
           <td>HOUSE NUMBER:</td>
           <td><input type="text" name="housenumber" required></td>
           <td>STREET NUMBER:</td>
           <td><input type="text" name="streetnumber" required></td>
           <td>PINCODE:</td>
           <td><input type="text" name="pincode" oninput="validatePincode()" maxLength=6  required/>
<div id="pincodeError" style="color: red;"></div></td>
    </tr>

</table>
<br>
</div>

<br><br>
          
<div class="button">
   <input type="submit" id="submitButton" value="NEXT" />
   <input type="reset" value="RESET" />
</div>
  </div>          
 </div>  
</table>        
        </form>
    </body>
</html>