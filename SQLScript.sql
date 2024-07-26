create database NationalScholarship;
use NationalScholarship;
show tables;
CREATE TABLE Scholarship (
	ScholarshipID INT PRIMARY KEY,
	ScholarshipName VARCHAR(255),
    ProviderName varchar(255),
	FamilyIncome DECIMAL(15, 2),
	Caste set("SC","ST","OBC","Minority","General","Others"),
	TenthMarks DECIMAL(5, 2),
    TwelfthMarks DECIMAL(5, 2),
	ScholarshipAmount DECIMAL(15, 2),
	SchemeClosingDate DATE
);
ALTER TABLE Scholarship MODIFY COLUMN ScholarshipID VARCHAR(50) NOT NULL;

DELIMITER //
CREATE PROCEDURE InsertScholarship(
    IN p_ScholarshipName VARCHAR(255),
    IN p_ProviderName VARCHAR(255),
    IN p_FamilyIncome DECIMAL(15, 2),
    IN p_Caste SET('SC', 'ST', 'OBC', 'Minority', 'General', 'Others'),
    IN p_TenthMarks DECIMAL(5, 2),
    IN p_TwelfthMarks DECIMAL(5, 2),
    IN p_ScholarshipAmount DECIMAL(15, 2),
    IN p_SchemeClosingDate DATE
)
BEGIN
    DECLARE scholarshipID VARCHAR(50);
    DECLARE autoID INT;

    -- Generate auto increment ID (autoID)
    SELECT COALESCE(MAX(SUBSTRING_INDEX(ScholarshipID, '-', -1) + 1), 1) INTO autoID FROM Scholarship;

    -- Generate the custom scholarship ID based on the specified format
    SET scholarshipID = CONCAT(
        LEFT(UPPER(REPLACE(p_ScholarshipName, ' ', '')), 2), -- First two letters of the scholarship name after removing spaces
        '-',
        DATE_FORMAT(p_SchemeClosingDate, '%Y%m%d'), -- Scheme closing date (formatted as YYYYMMDD)
        '-',
        autoID -- Auto-generated ID
    );

    -- Insert data into the Scholarship table using the generated scholarshipID
    INSERT INTO Scholarship (ScholarshipID, ScholarshipName, ProviderName, FamilyIncome, Caste, TenthMarks, TwelfthMarks, ScholarshipAmount, SchemeClosingDate)
    VALUES (scholarshipID, p_ScholarshipName, p_ProviderName, p_FamilyIncome, p_Caste, p_TenthMarks, p_TwelfthMarks, p_ScholarshipAmount, p_SchemeClosingDate);

    -- Return the generated scholarshipID
    SELECT scholarshipID AS NewScholarshipID;
END;//
DELIMITER ;

CALL InsertScholarship(
    'Scholarships for Top Class Education for students with disabilities.',
    'Department of Empowerment of Persons with Disabilities',
    800000.00,
    'Others',
    50.00,
    35.00,
    104000.00,
    '2024-08-30'
);

select * from Scholarship;

CREATE TABLE Institutes (
    InstituteCode VARCHAR(255) PRIMARY KEY,
    InstituteName VARCHAR(255),
    InstituteCategory VARCHAR(255),
    DISCCode VARCHAR(15),
    Location ENUM('Urban', 'Rural'),
    InstituteType VARCHAR(255),
    AdmissionStartYear YEAR,
    AffiliatedUniversityState VARCHAR(255),
    AffiliatedUniversityBoardName VARCHAR(255),
    UniversityAffiliatedCertificate LONGBLOB,
    InstituteRegistrationCertificate LONGBLOB
);

CREATE TABLE InstituteAddresses (
    InstituteCode VARCHAR(255) PRIMARY KEY,
    AddressLine1 VARCHAR(255),
    AddressLine2 VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    District VARCHAR(255),
    Pincode VARCHAR(20),
    FOREIGN KEY (InstituteCode) REFERENCES Institutes(InstituteCode)
);

CREATE TABLE InstituteContacts (
    InstituteCode VARCHAR(255) PRIMARY KEY,
    PrincipalName VARCHAR(255),
    PhoneNumber VARCHAR(20),
    TelephoneNumber VARCHAR(20),
    FOREIGN KEY (InstituteCode) REFERENCES Institutes(InstituteCode)
);
Alter table Institutes add MinistryApproved enum('Yes','No') default 'No';
INSERT INTO Institutes (InstituteCode, InstituteName, InstituteCategory, DISCCode, Location, InstituteType, AdmissionStartYear, AffiliatedUniversityState, AffiliatedUniversityBoardName, UniversityAffiliatedCertificate, InstituteRegistrationCertificate)
VALUES ('3471', 'New Horizon College of Engineering', 'Private Engineering Institute', 'C-91072', 'Urban', 'Autonomous', 2001, 'Karnataka', 'Visvesvaraya Technological University', LOAD_FILE('/path/to/sample_blog.pdf'), LOAD_FILE('/path/to/sample_blog.pdf'));

INSERT INTO InstituteAddresses (InstituteCode, AddressLine1, AddressLine2, City, State, District, Pincode)
VALUES ('3471', 'Outer Ring Road, Marathalli', 'Kadabeesanahalli', 'Bengaluru', 'Karnataka', 'Bengalurur Urban', '560103');

INSERT INTO InstituteContacts (InstituteCode, PrincipalName, PhoneNumber, TelephoneNumber)
VALUES ('3471', 'Dr. Manjunatha', '9880534935', '08066297777');

update Institutes set MinistryApproved = 'No', StateApproved = 'No' where InstituteCode = '3471';

CREATE TABLE Student (
    StateOfDomicile VARCHAR(255),
    District VARCHAR(255),
    StudentName VARCHAR(255),
    DOB DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    MobileNumber VARCHAR(20),
    EmailID VARCHAR(255),
    InstituteCode VARCHAR(255),
    AadharNumber VARCHAR(12) PRIMARY KEY,
    InstituteApproved ENUM('Yes', 'No') DEFAULT 'No',
    ScholarshipApproved ENUM('Yes', 'No') DEFAULT 'No',
    FOREIGN KEY (InstituteCode) REFERENCES Institutes(InstituteCode)
);

INSERT INTO Student (StateOfDomicile, District, StudentName, DOB, Gender, MobileNumber, EmailID, InstituteCode, AadharNumber, InstituteApproved, ScholarshipApproved)
VALUES ('KArnataka', 'Bengaluru', 'P Manasa', '2000-05-26', 'Female', '7028634859', 'manasap.mp.22@gmail.com', '3471', '887020409902', 'No', 'No');

INSERT INTO Student (StateOfDomicile, District, StudentName, DOB, Gender, MobileNumber, EmailID, InstituteCode, AadharNumber, InstituteApproved, ScholarshipApproved)
VALUES ('Tamil Nadu', 'Coimbatore', 'Jaisri Vellusamy', '2001-09-15', 'Female', '9563634859', 'jaisr99703@gmail.com', '3471', '970320409902', 'No', 'No');

CREATE TABLE Bank (
    HolderName VARCHAR(255),
    BankIFSCCode VARCHAR(20),
    BankAccountNumber Varchar(16) PRIMARY KEY,
    BankName VARCHAR(255),
    StudentAadharNumber VARCHAR(12), -- Secondary key linking to Student table
    FOREIGN KEY (StudentAadharNumber) REFERENCES Student(AadharNumber)
);

INSERT INTO Bank (HolderName, BankIFSCCode, BankAccountNumber, BankName, StudentAadharNumber)
VALUES ('P Manasa', 'ICIC0000169', '5894538029485029', 'ICICI', '887020409902');

INSERT INTO Bank (HolderName, BankIFSCCode, BankAccountNumber, BankName, StudentAadharNumber)
VALUES ('Jaisri Vellusamy', 'ICIC0006152', '7372049583950271', 'ICICI', '970320409902');

CREATE TABLE Login (
	UserID VARCHAR(255) PRIMARY KEY,
	Password VARCHAR(255) NOT NULL
);

INSERT INTO Login (UserID, Password)
VALUES 
    ('ministry@gov.in', 'admin@N23'), 
    ('state@gov.in', 'state@N23'), 
    ('887020409902', 'manasa@N23'),
    ('970320409902', 'jaisri@N23');

CREATE TABLE Student_Personal_Details (
	AadharNumber varchar(12) PRIMARY KEY,
	Religion VARCHAR(255),
	Community VARCHAR(255),
	FatherName VARCHAR(255),
	MotherName VARCHAR(255),
	MaritalStatus enum('Single','Married','Widowed','Divorced'),
	ParentsProfession VARCHAR(255),
	State VARCHAR(255),
	District VARCHAR(255),
	BlockTaluk VARCHAR(255),
	HouseNumber VARCHAR(50),
	StreetNumber VARCHAR(50),
	Pincode VARCHAR(6)
);
INSERT INTO Student_Personal_Details (
    AadharNumber, Religion, Community, FatherName, MotherName,
    MaritalStatus, ParentsProfession, State, District,
    BlockTaluk, HouseNumber, StreetNumber, Pincode
) VALUES (
    '887020409902', 'Hindu', 'General', 'N G Prakash', 'R Kavitha',
    'Single', 'Accountant', 'Karnataka', 'Benngaluru',
    'Bengaluru', '126, 18th main,H A L 2nd stage', 'Indiranagar', '560008'
);

CREATE TABLE Student_Education_Details (
	AadharNumber varchar(12) PRIMARY KEY,
	PresentClassCourse VARCHAR(255),
	PresentClassCourseYear Year,
	ModeOfStudy VARCHAR(255),
	ClassStartDate DATE,
	UniversityOrBoardName VARCHAR(255),
	PreviousClassCourse VARCHAR(255),
	PreviousPassingYear Year,
	PreviousClassPercentage DECIMAL(5, 2),
	TenthRollNumber VARCHAR(50),
	TenthBoardName VARCHAR(255),
	TenthPassingYear Year,
	TenthPercentageObtained DECIMAL(5, 2),
	TwelfthRollNumber VARCHAR(50),
	TwelfthBoardName VARCHAR(255),
	TwelfthPassingYear Year,
	TwelfthPercentageObtained DECIMAL(5, 2),
	FOREIGN KEY (AadharNumber) REFERENCES Student_Personal_Details(AadharNumber)
);
INSERT INTO Student_Education_Details (
    AadharNumber, PresentClassCourse, PresentClassCourseYear,
    ModeOfStudy, ClassStartDate, UniversityOrBoardName,
    PreviousClassCourse, PreviousPassingYear, PreviousClassPercentage,
    TenthRollNumber, TenthBoardName, TenthPassingYear, TenthPercentageObtained,
    TwelfthRollNumber, TwelfthBoardName, TwelfthPassingYear, TwelfthPercentageObtained
) VALUES (
    '887020409902', 'MCA', 2023,
    'Full-Time', '2022-01-21', 'Visvesvaraya Technological University',
    'BCA', 2020, 92.50,
    '117098', 'CBSE', 2015, 63.30,
    'T171050', 'SPPU', 2017, 78.00
);

CREATE TABLE Student_Financial_Details (
	AadharNumber varchar(12) PRIMARY KEY,
    SelectedScheme varchar(50),
	FamilyAnnualIncome DECIMAL(15, 2),
	AdmissionFee DECIMAL(15, 2),
	TuitionFee DECIMAL(15, 2),
	OtherFee DECIMAL(15, 2),
	FOREIGN KEY (AadharNumber) REFERENCES Student_Personal_Details(AadharNumber),
    FOREIGN KEY (SelectedScheme) REFERENCES Scholarship(ScholarshipID)
);

INSERT INTO Student_Financial_Details (
    AadharNumber, SelectedScheme, FamilyAnnualIncome,
    AdmissionFee, TuitionFee, OtherFee
) VALUES (
    '887020409902', 'PR-20240131-1', 750000.00,
    10000.00, 245000.00, 5000.00
);


CREATE TABLE Student_Disability_Details (
	AadharNumber varchar(12) PRIMARY KEY,
	Disabled ENUM('Yes', 'No'),
	TypeOfDisability VARCHAR(255),
	PercentageOfDisability DECIMAL(5, 2),
	FOREIGN KEY (AadharNumber) REFERENCES Student_Personal_Details(AadharNumber)
);

INSERT INTO Student_Disability_Details (
    AadharNumber, Disabled, TypeOfDisability, PercentageOfDisability
) VALUES (
    '887020409902', 'NO', 'NA', 00.00
);

CREATE TABLE Student_File_Details (
	FileID INT AUTO_INCREMENT PRIMARY KEY,
	AadharNumber varchar(12),
	DomicileCertificate LONGBLOB,
	StudentPhotograph longblob,
    InstituteIdCard longblob,
    CasteIncomeCertificate longblob,
    PreviousYearMarksheet longblob,
    FeeReceiptOfCurrentYear longblob,
    BankPassbook longblob,
    AadharCard longblob,
    TenthMarksheet longblob,
    TwelfthMarksheet longblob,
	FOREIGN KEY (AadharNumber) REFERENCES Student_Personal_Details(AadharNumber)
);

-- Example INSERT statement for Student_File_Details table
INSERT INTO Student_File_Details (
    AadharNumber, 
    DomicileCertificate, 
    StudentPhotograph, 
    InstituteIdCard, 
    CasteIncomeCertificate, 
    PreviousYearMarksheet, 
    FeeReceiptOfCurrentYear, 
    BankPassbook, 
    AadharCard, 
    TenthMarksheet, 
    TwelfthMarksheet
) VALUES (
    '887020409902',
    LOAD_FILE('/path/to/sample_blog.pdf'),
    LOAD_FILE('/path/to/sample_blog.pdf'),
    LOAD_FILE('/path/to/sample_blog.pdf'),
    LOAD_FILE('/path/to/sample_blog.pdf'),
    LOAD_FILE('/path/to/sample_blog.pdf'),
    LOAD_FILE('/path/to/sample_blog.pdf'),
    LOAD_FILE('/path/to/sample_blog.pdf'),
    LOAD_FILE('/path/to/sample_blog.pdf'),
    LOAD_FILE('/path/to/sample_blog.pdf'),
    LOAD_FILE('/path/to/sample_blog.pdf')
);
