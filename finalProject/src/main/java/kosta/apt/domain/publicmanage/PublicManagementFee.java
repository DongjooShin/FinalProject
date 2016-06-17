package kosta.apt.domain.publicmanage;

import java.io.Serializable;

public class PublicManagementFee implements Serializable {
	private String pm_publicFeeNo;
	private int pm_clean;
	private int pm_general;
	private int pm_maintain;
	private int pm_liftMaintain;
	private int pm_security;
	private int pm_foodWaste;
	private int pm_fireInsurance;
	private int pm_commission;
	private int pm_meeting;
	private int pm_publicElectric;
	private int pm_liftElectric;
	private int pm_TVFee;
	private int pm_disinfection;
	private int apt_APTGNo;
	
	public int getApt_APTGNo() {
		return apt_APTGNo;
	}
	public void setApt_APTGNo(int apt_APTGNo) {
		this.apt_APTGNo = apt_APTGNo;
	}
	public int getPm_clean() {
		return pm_clean;
	}
	public void setPm_clean(int pm_clean) {
		this.pm_clean = pm_clean;
	}
	public int getPm_general() {
		return pm_general;
	}
	public void setPm_general(int pm_general) {
		this.pm_general = pm_general;
	}
	public int getPm_maintain() {
		return pm_maintain;
	}
	public void setPm_maintain(int pm_maintain) {
		this.pm_maintain = pm_maintain;
	}
	public int getPm_liftMaintain() {
		return pm_liftMaintain;
	}
	public void setPm_liftMaintain(int pm_liftMaintain) {
		this.pm_liftMaintain = pm_liftMaintain;
	}
	public int getPm_security() {
		return pm_security;
	}
	public void setPm_security(int pm_security) {
		this.pm_security = pm_security;
	}
	public int getPm_foodWaste() {
		return pm_foodWaste;
	}
	public void setPm_foodWaste(int pm_foodWaste) {
		this.pm_foodWaste = pm_foodWaste;
	}
	public int getPm_fireInsurance() {
		return pm_fireInsurance;
	}
	public void setPm_fireInsurance(int pm_fireInsurance) {
		this.pm_fireInsurance = pm_fireInsurance;
	}
	public int getPm_commission() {
		return pm_commission;
	}
	public void setPm_commission(int pm_commission) {
		this.pm_commission = pm_commission;
	}
	public int getPm_meeting() {
		return pm_meeting;
	}
	public void setPm_meeting(int pm_meeting) {
		this.pm_meeting = pm_meeting;
	}
	public int getPm_publicElectric() {
		return pm_publicElectric;
	}
	public void setPm_publicElectric(int pm_publicElectric) {
		this.pm_publicElectric = pm_publicElectric;
	}

	public int getPm_liftElectric() {
		return pm_liftElectric;
	}
	public void setPm_liftElectric(int pm_liftElectric) {
		this.pm_liftElectric = pm_liftElectric;
	}
	public int getPm_TVFee() {
		return pm_TVFee;
	}
	public void setPm_TVFee(int pm_TVFee) {
		this.pm_TVFee = pm_TVFee;
	}
	public int getPm_disinfection() {
		return pm_disinfection;
	}
	public void setPm_disinfection(int pm_disinfection) {
		this.pm_disinfection = pm_disinfection;
	}
	public String getPm_publicFeeNo() {
		return pm_publicFeeNo;
	}
	public void setPm_publicFeeNo(String pm_publicFeeNo) {
		this.pm_publicFeeNo = pm_publicFeeNo;
	}
	
	@Override
	public String toString() {
		return "PublicManagementFee [pm_publicFeeNo=" + pm_publicFeeNo + ", pm_clean=" + pm_clean + ", pm_general="
				+ pm_general + ", pm_maintain=" + pm_maintain + ", pm_liftMaintain=" + pm_liftMaintain
				+ ", pm_security=" + pm_security + ", pm_foodWaste=" + pm_foodWaste + ", pm_fireInsurance="
				+ pm_fireInsurance + ", pm_commission=" + pm_commission + ", pm_meeting=" + pm_meeting
				+ ", pm_publicElectric=" + pm_publicElectric + ", pm_liftElectric=" + pm_liftElectric + ", pm_TVFee="
				+ pm_TVFee + ", pm_disinfection=" + pm_disinfection + ", apt_APTGNo=" + apt_APTGNo + "]";
	}
	public int sumPublicFee(){
		int sum = getPm_clean()+getPm_commission()+getPm_liftMaintain()+getPm_disinfection()+getPm_fireInsurance()+getPm_foodWaste()+
		getPm_general()+getPm_liftElectric()+getPm_maintain()+getPm_meeting()+getPm_publicElectric()+getPm_TVFee()+getPm_publicElectric();
		return sum;
	}
	
	
}
