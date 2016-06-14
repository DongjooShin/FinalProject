package kosta.apt.domain.member;

import java.io.Serializable;

public class LoginCheck implements Serializable {
	private String m_memberNo;
	private String m_pass;
	
	
	public String getM_memberNo() {
		return m_memberNo;
	}
	public void setM_memberNo(String m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	
	
	
}
