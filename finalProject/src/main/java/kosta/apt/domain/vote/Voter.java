package kosta.apt.domain.vote;

import java.io.Serializable;

public class Voter implements Serializable {
	private int v_voterNo;
	private int v_buildingNo;
	private int v_roomNo;
	private String m_memberNo;
	private int apt_APTGNo;
	private String v_group;
	
	public Voter() {
		super();
	}
	public Voter(int v_voterNo, int v_buildingNo, int v_roomNo, String m_memberNo, int apt_APTGNo,String v_group) {
		super();
		this.v_voterNo = v_voterNo;
		this.v_buildingNo = v_buildingNo;
		this.v_roomNo = v_roomNo;
		this.m_memberNo = m_memberNo;
		this.apt_APTGNo = apt_APTGNo;
		this.v_group = v_group;
	}
	
	public String getV_group() {
		return v_group;
	}
	public void setV_group(String v_group) {
		this.v_group = v_group;
	}
	public int getApt_APTGNo() {
		return apt_APTGNo;
	}
	public void setApt_APTGNo(int apt_APTGNo) {
		this.apt_APTGNo = apt_APTGNo;
	}
	public int getV_voterNo() {
		return v_voterNo;
	}
	public void setV_voterNo(int v_voterNo) {
		this.v_voterNo = v_voterNo;
	}
	public int getV_buildingNo() {
		return v_buildingNo;
	}
	public void setV_buildingNo(int v_buildingNo) {
		this.v_buildingNo = v_buildingNo;
	}
	public int getV_roomNo() {
		return v_roomNo;
	}
	public void setV_roomNo(int v_roomNo) {
		this.v_roomNo = v_roomNo;
	}
	public String getM_memberNo() {
		return m_memberNo;
	}
	public void setM_memberNo(String m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	@Override
	public String toString() {
		return "Voter [v_voterNo=" + v_voterNo + ", v_buildingNo=" + v_buildingNo + ", v_roomNo=" + v_roomNo
				+ ", m_memberNo=" + m_memberNo + ", apt_APTGNo=" + apt_APTGNo + ", v_group=" + v_group + "]";
	}
	
	
}
