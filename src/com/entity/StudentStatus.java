package com.entity;

public class StudentStatus {

	private String instituteApproved;
	private String scholarshipApproved;
	private String ministryApproved;
	private String intScholarApproved;
	public StudentStatus(String instituteApproved, String scholarshipApproved, String ministryApproved,
			String intScholarApproved) {
		super();
		this.instituteApproved = instituteApproved;
		this.scholarshipApproved = scholarshipApproved;
		this.ministryApproved = ministryApproved;
		this.intScholarApproved = intScholarApproved;
	}
	public String getInstituteApproved() {
		return instituteApproved;
	}
	public void setInstituteApproved(String instituteApproved) {
		this.instituteApproved = instituteApproved;
	}
	public String getScholarshipApproved() {
		return scholarshipApproved;
	}
	public void setScholarshipApproved(String scholarshipApproved) {
		this.scholarshipApproved = scholarshipApproved;
	}
	public String getMinistryApproved() {
		return ministryApproved;
	}
	public void setMinistryApproved(String ministryApproved) {
		this.ministryApproved = ministryApproved;
	}
	public String getIntScholarApproved() {
		return intScholarApproved;
	}
	public void setIntScholarApproved(String intScholarApproved) {
		this.intScholarApproved = intScholarApproved;
	}
		
}
