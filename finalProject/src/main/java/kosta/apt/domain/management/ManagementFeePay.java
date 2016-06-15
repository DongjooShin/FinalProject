package kosta.apt.domain.management;

import java.io.Serializable;
import java.sql.Timestamp;

public class ManagementFeePay implements Serializable {
	private String m_buildingNo;
	private String m_roomNo;
	private String p_date;
	private int p_publicAmount;
	private int p_managementAmount;
	private int p_amount;
	private String p_means;
	private String p_plag;
	private int apt_APTGNo;
	
	public ManagementFeePay(){}
	
	public ManagementFeePay(String m_buildingNo, String m_roomNo, String p_date, int p_publicAmount,
			int p_managementAmount, int p_amount, String p_means, String p_plag, int apt_APTGNo) {
		super();
		this.m_buildingNo = m_buildingNo;
		this.m_roomNo = m_roomNo;
		this.p_date = p_date;
		this.p_publicAmount = p_publicAmount;
		this.p_managementAmount = p_managementAmount;
		this.p_amount = p_amount;
		this.p_means = p_means;
		this.p_plag = p_plag;
		this.apt_APTGNo = apt_APTGNo;
	}

	

	public String getM_buildingNo() {
		return m_buildingNo;
	}

	public void setM_buildingNo(String m_buildingNo) {
		this.m_buildingNo = m_buildingNo;
	}

	public String getM_roomNo() {
		return m_roomNo;
	}

	public void setM_roomNo(String m_roomNo) {
		this.m_roomNo = m_roomNo;
	}

	public String getP_date() {
		return p_date;
	}

	public void setP_date(String p_date) {
		this.p_date = p_date;
	}

	public int getP_publicAmount() {
		return p_publicAmount;
	}

	public void setP_publicAmount(int p_publicAmount) {
		this.p_publicAmount = p_publicAmount;
	}

	public int getP_managementAmount() {
		return p_managementAmount;
	}

	public void setP_managementAmount(int p_managementAmount) {
		this.p_managementAmount = p_managementAmount;
	}

	public int getP_amount() {
		return p_amount;
	}

	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}

	public String getP_means() {
		return p_means;
	}

	public void setP_means(String p_means) {
		this.p_means = p_means;
	}

	public String getP_plag() {
		return p_plag;
	}

	public void setP_plag(String p_plag) {
		this.p_plag = p_plag;
	}

	public int getApt_APTGNo() {
		return apt_APTGNo;
	}

	public void setApt_APTGNo(int apt_APTGNo) {
		this.apt_APTGNo = apt_APTGNo;
	}

	@Override
	public String toString() {
		return "ManagementFeePay [m_buildingNo=" + m_buildingNo + ", m_roomNo=" + m_roomNo + ", p_date=" + p_date
				+ ", p_publicAmount=" + p_publicAmount + ", p_managementAmount=" + p_managementAmount + ", p_amount="
				+ p_amount + ", p_means=" + p_means + ", p_plag=" + p_plag + ", apt_APTGNo=" + apt_APTGNo + "]";
	}

	
}	
	