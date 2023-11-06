package com.sidbi.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SidbiUserRegistration")
public class SidbiUserRegistration {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userId")
	private int userId;

	@Column(name = "name",columnDefinition = "VARCHAR(255)")
	private String name;

	@Column(name = "email",columnDefinition = "VARCHAR(255)")
	private String email;

	@Column(name = "dob")
	private Date dob;

	@Column(name = "contact",columnDefinition = "VARCHAR(255)")
	private String contact;

	@Column(name = "occupation",columnDefinition = "VARCHAR(255)")
	private String occupation;

	@Column(name = "companyName",columnDefinition = "VARCHAR(255)")
	private String companyName;

	@Column(name = "empId")
	private String empId;

	@Column(name = "LoanFor",columnDefinition = "VARCHAR(255)")
	private String loanApplyFor;
	
	@Column(name = "VehicleNo",columnDefinition = "VARCHAR(255)")
	private String vehicleNo;


	@Column(name = "AnnualIncome",columnDefinition = "VARCHAR(255)")
	private int annualIncome;

	@Column(name = "DesiredLoanAmount",columnDefinition = "VARCHAR(255)")
	private int desiredLoan;

	@Column(name = "DownPayment",columnDefinition = "VARCHAR(255)")
	private int downPayment;
	

	@Column(name = "PanCard",columnDefinition = "VARCHAR(255)")
	private String panCard;

	@Column(name = "AadharCard",columnDefinition = "VARCHAR(255)")
	private String aadharCard;

	@Column(name = "BankStatus")
	private int BankStatus = 0;
	
	@Column(name = "SidbiStatus")
	private int SidbiStatus = 0;
	
	@Column(name = "sentToSidbiStatus")
	private int sentToSidbiStatus = 0;
	
	@Column(name = "bankName",columnDefinition = "VARCHAR(255)")
	private String bankName;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getLoanApplyFor() {
		return loanApplyFor;
	}

	public void setLoanApplyFor(String loanApplyFor) {
		this.loanApplyFor = loanApplyFor;
	}

	public String getVehicleNo() {
		return vehicleNo;
	}

	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	public int getAnnualIncome() {
		return annualIncome;
	}

	public void setAnnualIncome(int annualIncome) {
		this.annualIncome = annualIncome;
	}

	public int getDesiredLoan() {
		return desiredLoan;
	}

	public void setDesiredLoan(int desiredLoan) {
		this.desiredLoan = desiredLoan;
	}

	public int getDownPayment() {
		return downPayment;
	}

	public void setDownPayment(int downPayment) {
		this.downPayment = downPayment;
	}

	public String getPanCard() {
		return panCard;
	}

	public void setPanCard(String panCard) {
		this.panCard = panCard;
	}

	public String getAadharCard() {
		return aadharCard;
	}

	public void setAadharCard(String aadharCard) {
		this.aadharCard = aadharCard;
	}

	public int getBankStatus() {
		return BankStatus;
	}

	public void setBankStatus(int bankStatus) {
		BankStatus = bankStatus;
	}

	public int getSidbiStatus() {
		return SidbiStatus;
	}

	public void setSidbiStatus(int sidbiStatus) {
		SidbiStatus = sidbiStatus;
	}
	
	

	public int getSentToSidbiStatus() {
		return sentToSidbiStatus;
	}

	public void setSentToSidbiStatus(int sentToSidbiStatus) {
		this.sentToSidbiStatus = sentToSidbiStatus;
	}
	
	

	

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}



	@Override
	public String toString() {
		return "SidbiUserRegistration [userId=" + userId + ", name=" + name + ", email=" + email + ", dob=" + dob
				+ ", contact=" + contact + ", occupation=" + occupation + ", companyName=" + companyName + ", empId="
				+ empId + ", loanApplyFor=" + loanApplyFor + ", vehicleNo=" + vehicleNo + ", annualIncome="
				+ annualIncome + ", desiredLoan=" + desiredLoan + ", downPayment=" + downPayment + ", panCard="
				+ panCard + ", aadharCard=" + aadharCard + ", BankStatus=" + BankStatus + ", SidbiStatus=" + SidbiStatus
				+ ", sentToSidbiStatus=" + sentToSidbiStatus + ", bankName=" + bankName + "]";
	}

	public SidbiUserRegistration() {
		super();
		// TODO Auto-generated constructor stub
	}

	

}
