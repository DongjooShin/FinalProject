package kosta.apt.domain.complaint;

import java.io.Serializable;
import java.sql.Timestamp;

public class Complaint implements Serializable {
	private int cp_complaintNo;//
	private String cp_title;//ok
	private String cp_content;//ok
	private String cp_state;//1
	private int cp_ref;//1
	private String cp_date;
	private String m_memberNo;
	private int cp_flag;
	private int apt_APTGNo;//1
	
	public int getCp_flag() {
		return cp_flag;
	}
	public void setCp_flag(int cp_flag) {
		this.cp_flag = cp_flag;
	}
	public int getApt_APTGNo() {
		return apt_APTGNo;
	}
	public void setApt_APTGNo(int apt_APTGNo) {
		this.apt_APTGNo = apt_APTGNo;
	}
	
	public int getCp_complaintNo() {
		return cp_complaintNo;
	}
	public void setCp_complaintNo(int cp_complaintNo) {
		this.cp_complaintNo = cp_complaintNo;
	}
	public String getCp_title() {
		return cp_title;
	}
	public void setCp_title(String cp_title) {
		this.cp_title = cp_title;
	}
	public String getCp_content() {
		return cp_content;
	}
	public void setCp_content(String cp_content) {
		this.cp_content = cp_content;
	}
	public String getCp_state() {
		return cp_state;
	}
	public void setCp_state(String cp_state) {
		this.cp_state = cp_state;
	}
	public int getCp_ref() {
		return cp_ref;
	}
	public void setCp_ref(int cp_ref) {
		this.cp_ref = cp_ref;
	}
	public String getM_memberNo() {
		return m_memberNo;
	}
	public void setM_memberNo(String m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	
	
	public String getCp_date() {
		return cp_date;
	}
	public void setCp_date(String cp_date) {
		this.cp_date = cp_date;
	}
	@Override
	public String toString() {
		return "Complaint [cp_complaintNo=" + cp_complaintNo + ", cp_title=" + cp_title + ", cp_content=" + cp_content
				+ ", cp_state=" + cp_state + ", cp_ref=" + cp_ref + ", m_memberNo=" + m_memberNo + ", apt_APTGNo="
				+ apt_APTGNo + ", cp_date=" + cp_date + "]";
	}
	
	
}
