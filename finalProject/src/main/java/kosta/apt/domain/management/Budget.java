package kosta.apt.domain.management;

import java.io.Serializable;

public class Budget implements Serializable {
	private int b_budgeNo;
	private String b_date;
	private int b_clean;
	private int b_general;
	private int b_maintain;
	private int b_liftMaintain;
	private int b_security;
	private int b_foodWaste;
	private int b_fireInsurance;
	private int b_commission;
	private int b_meeting;
	private int b_publicElectric;
	private int b_liftElectric;
	private int b_TVFee;
	private int b_disinfection;
	private int b_appropriation;
	private String b_fileName;
	private int apt_APTGNo;
	
	
	
	public int getB_budgeNo() {
		return b_budgeNo;
	}
	public void setB_budgeNo(int b_budgeNo) {
		this.b_budgeNo = b_budgeNo;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public int getB_clean() {
		return b_clean;
	}
	public void setB_clean(int b_clean) {
		this.b_clean = b_clean;
	}
	public int getB_general() {
		return b_general;
	}
	public void setB_general(int b_general) {
		this.b_general = b_general;
	}
	public int getB_maintain() {
		return b_maintain;
	}
	public void setB_maintain(int b_maintain) {
		this.b_maintain = b_maintain;
	}
	
	public int getB_liftMaintain() {
		return b_liftMaintain;
	}
	public void setB_liftMaintain(int b_liftMaintain) {
		this.b_liftMaintain = b_liftMaintain;
	}
	public int getB_security() {
		return b_security;
	}
	public void setB_security(int b_security) {
		this.b_security = b_security;
	}
	public int getB_foodWaste() {
		return b_foodWaste;
	}
	public void setB_foodWaste(int b_foodWaste) {
		this.b_foodWaste = b_foodWaste;
	}
	public int getB_fireInsurance() {
		return b_fireInsurance;
	}
	public void setB_fireInsurance(int b_fireInsurance) {
		this.b_fireInsurance = b_fireInsurance;
	}
	public int getB_commission() {
		return b_commission;
	}
	public void setB_commission(int b_commission) {
		this.b_commission = b_commission;
	}
	public int getB_meeting() {
		return b_meeting;
	}
	public void setB_meeting(int b_meeting) {
		this.b_meeting = b_meeting;
	}
	public int getB_publicElectric() {
		return b_publicElectric;
	}
	public void setB_publicElectric(int b_publicElectric) {
		this.b_publicElectric = b_publicElectric;
	}
	public int getB_liftElectric() {
		return b_liftElectric;
	}
	public void setB_liftElectric(int b_liftElectric) {
		this.b_liftElectric = b_liftElectric;
	}
	public int getB_TVFee() {
		return b_TVFee;
	}
	public void setB_TVFee(int b_TVFee) {
		this.b_TVFee = b_TVFee;
	}
	public int getB_disinfection() {
		return b_disinfection;
	}
	public void setB_disinfection(int b_disinfection) {
		this.b_disinfection = b_disinfection;
	}
	public int getApt_APTGNo() {
		return apt_APTGNo;
	}
	public void setApt_APTGNo(int apt_APTGNo) {
		this.apt_APTGNo = apt_APTGNo;
	}
	public int getB_appropriation() {
		return b_appropriation;
	}
	public void setB_appropriation(int b_appropriation) {
		this.b_appropriation = b_appropriation;
	}
	public String getB_fileName() {
		return b_fileName;
	}
	public void setB_fileName(String b_fileName) {
		this.b_fileName = b_fileName;
	}
	@Override
	public String toString() {
		return "Budget [b_budgeNo=" + b_budgeNo + ", b_date=" + b_date
				+ ", b_clean=" + b_clean + ", b_general=" + b_general
				+ ", b_maintain=" + b_maintain + ", b_liftMaintain="
				+ b_liftMaintain + ", b_security=" + b_security
				+ ", b_foodWaste=" + b_foodWaste + ", b_fireInsurance="
				+ b_fireInsurance + ", b_commission=" + b_commission
				+ ", b_meeting=" + b_meeting + ", b_publicElectric="
				+ b_publicElectric + ", b_liftElectric=" + b_liftElectric
				+ ", b_TVFee=" + b_TVFee + ", b_disinfection=" + b_disinfection
				+ ", b_appropriation=" + b_appropriation + ", b_fileName="
				+ b_fileName + ", apt_APTGNo=" + apt_APTGNo + "]";
	}
	
	
	
}
