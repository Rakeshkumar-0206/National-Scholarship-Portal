package com.entity;

public class InstituteScroll {

	private String instituteCode;
	private String instituteName;
	private String diseCode;
	private String mobileNumber;
	public InstituteScroll(String instituteCode, String instituteName, String diseCode, String mobileNumber) {
		super();
		this.instituteCode = instituteCode;
		this.instituteName = instituteName;
		this.diseCode = diseCode;
		this.mobileNumber = mobileNumber;
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
	public String getDiseCode() {
		return diseCode;
	}
	public void setDiseCode(String diseCode) {
		this.diseCode = diseCode;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	
}
