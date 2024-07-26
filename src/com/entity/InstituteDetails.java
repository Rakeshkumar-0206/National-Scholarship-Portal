package com.entity;

public class InstituteDetails {
	private String instituteCode;
	private String instituteName;
	private String diseCode;
	private String instituteType;
	private String admissionStart;
	private String boardName;
	private String principalName;
	private String mobileNumber;
	public InstituteDetails(String instituteCode, String instituteName, String diseCode, String instituteType,
			String admissionStart, String boardName, String principalName, String mobileNumber) {
		super();
		this.instituteCode = instituteCode;
		this.instituteName = instituteName;
		this.diseCode = diseCode;
		this.instituteType = instituteType;
		this.admissionStart = admissionStart;
		this.boardName = boardName;
		this.principalName = principalName;
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
	public String getInstituteType() {
		return instituteType;
	}
	public void setInstituteType(String instituteType) {
		this.instituteType = instituteType;
	}
	public String getAdmissionStart() {
		return admissionStart;
	}
	public void setAdmissionStart(String admissionStart) {
		this.admissionStart = admissionStart;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getPrincipalName() {
		return principalName;
	}
	public void setPrincipalName(String principalName) {
		this.principalName = principalName;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
}
