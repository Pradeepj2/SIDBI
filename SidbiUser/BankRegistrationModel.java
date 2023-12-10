package com.jci.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BankRegistration", schema = "dbo")
public class BankRegistrationModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "refId")
	private int refId;

	@Column(name = "pfiName", columnDefinition = "VARCHAR(255)")
	private String pfiName;

	@Column(name = "RbiLicence", columnDefinition = "VARCHAR(255)")
	private String RbiLicence;

	@Column(name = "minTwoYearBusiness")
	private String minTwoYearBusiness;

	@Column(name = "NPA", columnDefinition = "VARCHAR(255)")
	private String NPA;

	@Column(name = "WillingShare", columnDefinition = "VARCHAR(255)")
	private String WillingShare;

	@Column(name = "applyFor", columnDefinition = "VARCHAR(255)")
	private String applyFor;

	@Column(name = "Docs", columnDefinition = "VARCHAR(255)")
	private String docs;

	@Column(name = "approved")
	private int approved = 0;

	public int getRefId() {
		return refId;
	}

	public void setRefId(int refId) {
		this.refId = refId;
	}

	public String getPfiName() {
		return pfiName;
	}

	public void setPfiName(String pfiName) {
		this.pfiName = pfiName;
	}

	public String getRbiLicence() {
		return RbiLicence;
	}

	public void setRbiLicence(String rbiLicence) {
		RbiLicence = rbiLicence;
	}

	public String getMinTwoYearBusiness() {
		return minTwoYearBusiness;
	}

	public void setMinTwoYearBusiness(String minTwoYearBusiness) {
		this.minTwoYearBusiness = minTwoYearBusiness;
	}

	public String getNPA() {
		return NPA;
	}

	public void setNPA(String nPA) {
		NPA = nPA;
	}

	public String getWillingShare() {
		return WillingShare;
	}

	public void setWillingShare(String willingShare) {
		WillingShare = willingShare;
	}

	public String getDocs() {
		return docs;
	}

	public void setDocs(String docs) {
		this.docs = docs;
	}

	public int getApproved() {
		return approved;
	}

	public void setApproved(int approved) {
		this.approved = approved;
	}

	public String getApplyFor() {
		return applyFor;
	}

	public void setApplyFor(String applyFor) {
		this.applyFor = applyFor;
	}

	@Override
	public String toString() {
		return "BankRegistrationModel [refId=" + refId + ", pfiName=" + pfiName + ", RbiLicence=" + RbiLicence
				+ ", minTwoYearBusiness=" + minTwoYearBusiness + ", NPA=" + NPA + ", WillingShare=" + WillingShare
				+ ", applyFor=" + applyFor + ", docs=" + docs + ", approved=" + approved + "]";
	}

	public BankRegistrationModel(String pfiName, String rbiLicence, String minTwoYearBusiness, String NPA,
			String WillingShare, String applyFor, String docs) {
		this.pfiName = pfiName;
		this.RbiLicence = rbiLicence;
		this.minTwoYearBusiness = minTwoYearBusiness;
		this.NPA = NPA;
		this.WillingShare = WillingShare;
		this.applyFor = applyFor;
		this.docs = docs;
	}

	public BankRegistrationModel() {
		super();
		// TODO Auto-generated constructor stub
	}

}
