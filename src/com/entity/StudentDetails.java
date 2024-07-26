package com.entity;

import java.util.Date;

public class StudentDetails {
	private String studentName;
	private Date dob;
	private String mobileNumber;
	private String emailId;
	private String instituteCode;
	private String instituteName;
	public StudentDetails(String studentName, Date dob, String mobileNumber, String emailId,
			String instituteCode, String instituteName) {
		super();
		this.studentName = studentName;
		this.dob = dob;
		this.mobileNumber = mobileNumber;
		this.emailId = emailId;
		this.instituteCode = instituteCode;
		this.instituteName = instituteName;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getInstituteCode() {
		return instituteCode;
	}
	public void setInstituteCode(String instituteCode) {
		this.instituteCode = instituteCode;
	}
	public String getInstituteName() {
		return instituteName;
	}
	public void setInstituteName(String instituteName) {
		this.instituteName = instituteName;
	}
	
}
