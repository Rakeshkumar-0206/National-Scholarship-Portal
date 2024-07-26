package com.entity;

import java.util.Date;

public class Student {
	private String studentName;
	private Date dob;
	private String aadharNumber;
	private String mobileNumber;
	
	public Student(String studentName, Date dob, String aadharNumber, String mobileNumber) {
		super();
		this.studentName = studentName;
		this.dob = dob;
		this.aadharNumber = aadharNumber;
		this.mobileNumber = mobileNumber;
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
	

}
