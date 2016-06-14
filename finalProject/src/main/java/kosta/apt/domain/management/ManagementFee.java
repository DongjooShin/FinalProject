package kosta.apt.domain.management;

import java.io.Serializable;

public class ManagementFee implements Serializable {
	private int mf_managementFeeNo;
	private int mf_electricFee;
	private int mf_gasFee;
	private int mf_waterFee;
	private int mf_electricAmount;
	private int mf_gasAmount;
	private int mf_waterAmount;
	private String mf_date;
	private String m_memberNo;
	
	
	public int getMf_managementFeeNo() {
		return mf_managementFeeNo;
	}
	public void setMf_managementFeeNo(int mf_managementFeeNo) {
		this.mf_managementFeeNo = mf_managementFeeNo;
	}
	public int getMf_electricFee() {
		return mf_electricFee;
	}
	public void setMf_electricFee(int mf_electricFee) {
		this.mf_electricFee = mf_electricFee;
	}
	public int getMf_gasFee() {
		return mf_gasFee;
	}
	public void setMf_gasFee(int mf_gasFee) {
		this.mf_gasFee = mf_gasFee;
	}
	public int getMf_waterFee() {
		return mf_waterFee;
	}
	public void setMf_waterFee(int mf_waterFee) {
		this.mf_waterFee = mf_waterFee;
	}
	public int getMf_electricAmount() {
		return mf_electricAmount;
	}
	public void setMf_electricAmount(int mf_electricAmount) {
		this.mf_electricAmount = mf_electricAmount;
	}
	public int getMf_gasAmount() {
		return mf_gasAmount;
	}
	public void setMf_gasAmount(int mf_gasAmount) {
		this.mf_gasAmount = mf_gasAmount;
	}
	public int getMf_waterAmount() {
		return mf_waterAmount;
	}
	public void setMf_waterAmount(int mf_waterAmount) {
		this.mf_waterAmount = mf_waterAmount;
	}
	public String getM_memberNo() {
		return m_memberNo;
	}
	public void setM_memberNo(String m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	public String getMf_date() {
		return mf_date;
	}
	public void setMf_date(String mf_date) {
		this.mf_date = mf_date;
	}
	@Override
	public String toString() {
		return "ManagementFee [mf_managementFeeNo=" + mf_managementFeeNo + ", mf_electricFee=" + mf_electricFee
				+ ", mf_gasFee=" + mf_gasFee + ", mf_waterFee=" + mf_waterFee + ", mf_electricAmount="
				+ mf_electricAmount + ", mf_gasAmount=" + mf_gasAmount + ", mf_waterAmount=" + mf_waterAmount
				+ ", mf_date=" + mf_date + ", m_memberNo=" + m_memberNo + "]";
	}
	
	public int sumManagementFee(){
		int sum = getMf_gasFee()+getMf_electricFee()+getMf_waterFee();
		return sum;
	}
	

	
}
