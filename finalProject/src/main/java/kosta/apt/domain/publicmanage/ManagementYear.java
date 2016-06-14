package kosta.apt.domain.publicmanage;

import java.io.Serializable;

public class ManagementYear implements Serializable{

	private String date;
	private int clean;
	private int maintain;
	private int liftMaintain;
	private int security;
	private int foodWaste;
	private int fireInsurance;
	private int commission;
	private int meeting;
	private int publicElectric;
	private int liftElectric;
	private int TVFee;
	private int disinfection;
	private int a_usedamount;
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getClean() {
		return clean;
	}
	public void setClean(int clean) {
		this.clean = clean;
	}
	public int getMaintain() {
		return maintain;
	}
	public void setMaintain(int maintain) {
		this.maintain = maintain;
	}
	public int getLiftMaintain() {
		return liftMaintain;
	}
	public void setLiftMaintain(int liftMaintain) {
		this.liftMaintain = liftMaintain;
	}
	public int getSecurity() {
		return security;
	}
	public void setSecurity(int security) {
		this.security = security;
	}
	public int getFoodWaste() {
		return foodWaste;
	}
	public void setFoodWaste(int foodWaste) {
		this.foodWaste = foodWaste;
	}
	public int getFireInsurance() {
		return fireInsurance;
	}
	public void setFireInsurance(int fireInsurance) {
		this.fireInsurance = fireInsurance;
	}
	public int getCommission() {
		return commission;
	}
	public void setCommission(int commission) {
		this.commission = commission;
	}
	public int getMeeting() {
		return meeting;
	}
	public void setMeeting(int meeting) {
		this.meeting = meeting;
	}
	public int getPublicElectric() {
		return publicElectric;
	}
	public void setPublicElectric(int publicElectric) {
		this.publicElectric = publicElectric;
	}
	public int getLiftElectric() {
		return liftElectric;
	}
	public void setLiftElectric(int liftElectric) {
		this.liftElectric = liftElectric;
	}
	public int getTVFee() {
		return TVFee;
	}
	public void setTVFee(int tVFee) {
		TVFee = tVFee;
	}
	public int getDisinfection() {
		return disinfection;
	}
	public void setDisinfection(int disinfection) {
		this.disinfection = disinfection;
	}
	public int getA_usedamount() {
		return a_usedamount;
	}
	public void setA_usedamount(int a_usedamount) {
		this.a_usedamount = a_usedamount;
	}
	
	@Override
	public String toString() {
		return "ManagementYear [date=" + date + ", clean=" + clean + ", maintain=" + maintain + ", liftMaintain="
				+ liftMaintain + ", security=" + security + ", foodWaste=" + foodWaste + ", fireInsurance="
				+ fireInsurance + ", commission=" + commission + ", meeting=" + meeting + ", publicElectric="
				+ publicElectric + ", liftElectric=" + liftElectric + ", TVFee=" + TVFee + ", disinfection="
				+ disinfection + ", a_usedamount=" + a_usedamount + "]";
	}
	
	
	
	
}
