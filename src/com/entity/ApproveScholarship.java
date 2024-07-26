package com.entity;

public class ApproveScholarship {

	private String aadharNumber;
	private String studentName;
	private String fatherName;
	private String motherName;
	private String selectedScheme;
	private String houseNumber;
	private String streetNumber;
	private String presentClassCourse;
	private String presentClassCourseYear;
	private String pincode;
	private String tenthPercentageObtained;
	private String twelfthPercentageObtained;
	private String disabled;
	private String familyAnnualIncome;
	public ApproveScholarship(String aadharNumber, String studentName, String fatherName, String motherName,
			String selectedScheme, String houseNumber, String streetNumber, String presentClassCourse,
			String presentClassCourseYear, String pincode, String tenthPercentageObtained,
			String twelfthPercentageObtained, String disabled, String familyAnnualIncome) {
		super();
		this.aadharNumber = aadharNumber;
		this.studentName = studentName;
		this.fatherName = fatherName;
		this.motherName = motherName;
		this.selectedScheme = selectedScheme;
		this.houseNumber = houseNumber;
		this.streetNumber = streetNumber;
		this.presentClassCourse = presentClassCourse;
		this.presentClassCourseYear = presentClassCourseYear;
		this.pincode = pincode;
		this.tenthPercentageObtained = tenthPercentageObtained;
		this.twelfthPercentageObtained = twelfthPercentageObtained;
		this.disabled = disabled;
		this.familyAnnualIncome = familyAnnualIncome;
	}
	public String getAadharNumber() {
		return aadharNumber;
	}
	public void setAadharNumber(String aadharNumber) {
		this.aadharNumber = aadharNumber;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public String getSelectedScheme() {
		return selectedScheme;
	}
	public void setSelectedScheme(String selectedScheme) {
		this.selectedScheme = selectedScheme;
	}
	public String getHouseNumber() {
		return houseNumber;
	}
	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}
	public String getStreetNumber() {
		return streetNumber;
	}
	public void setStreetNumber(String streetNumber) {
		this.streetNumber = streetNumber;
	}
	public String getPresentClassCourse() {
		return presentClassCourse;
	}
	public void setPresentClassCourse(String presentClassCourse) {
		this.presentClassCourse = presentClassCourse;
	}
	public String getPresentClassCourseYear() {
		return presentClassCourseYear;
	}
	public void setPresentClassCourseYear(String presentClassCourseYear) {
		this.presentClassCourseYear = presentClassCourseYear;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getTenthPercentageObtained() {
		return tenthPercentageObtained;
	}
	public void setTenthPercentageObtained(String tenthPercentageObtained) {
		this.tenthPercentageObtained = tenthPercentageObtained;
	}
	public String getTwelfthPercentageObtained() {
		return twelfthPercentageObtained;
	}
	public void setTwelfthPercentageObtained(String twelfthPercentageObtained) {
		this.twelfthPercentageObtained = twelfthPercentageObtained;
	}
	public String getDisabled() {
		return disabled;
	}
	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}
	public String getFamilyAnnualIncome() {
		return familyAnnualIncome;
	}
	public void setFamilyAnnualIncome(String familyAnnualIncome) {
		this.familyAnnualIncome = familyAnnualIncome;
	}
	
}
