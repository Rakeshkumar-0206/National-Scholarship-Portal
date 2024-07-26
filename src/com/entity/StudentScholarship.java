package com.entity;

public class StudentScholarship {

	private String aadharNumber;
	private String instituteCode;
	public StudentScholarship(String aadharNumber, String instituteCode) {
		super();
		this.aadharNumber = aadharNumber;
		this.instituteCode = instituteCode;
	}
	public String getAadharNumber() {
		return aadharNumber;
	}
	public void setAadharNumber(String aadharNumber) {
		this.aadharNumber = aadharNumber;
	}
	public String getInstituteCode() {
		return instituteCode;
	}
	public void setInstituteCode(String instituteCode) {
		this.instituteCode = instituteCode;
	}
}
