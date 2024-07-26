package com.entity;

public class Scholarship {
	private String studentName;
	private String aadharNumber;
	private String mobileNumber;
	private String appliedScheme;
	public Scholarship(String studentName, String aadharNumber, String mobileNumber, String appliedScheme) {
		super();
		this.studentName = studentName;
		this.aadharNumber = aadharNumber;
		this.mobileNumber = mobileNumber;
		this.appliedScheme = appliedScheme;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getAadharNumber() {
		return aadharNumber;
	}
	public void setAadharNumber(String aadharNumber) {
		this.aadharNumber = aadharNumber;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getAppliedScheme() {
		return appliedScheme;
	}
	public void setAppliedScheme(String appliedScheme) {
		this.appliedScheme = appliedScheme;
	}

}
