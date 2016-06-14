package kosta.apt.domain.member;

import java.io.Serializable;

public class Member implements Serializable {

	private String m_memberNo;
	private String m_pass;
	private String m_name;
	private String m_email;
	private String m_domain;
	private String m_addr;
	private String postadress;
	private String postdetail;
	private String s_phone1;
	private String s_phone2;
	private String s_phone3;
	private String s_mphone1;
	private String s_mphone2;
	private String s_mphone3;
	private String m_homeTel;
	private String m_tel;

	private int v_flag; 	// case: group president
	private int v2_flag;	//	case: building president
	private int m_buildingNo;
	private int m_roomNo;
	private int m_age;
	private int m_grade;
	private int apt_APTGNo;

	public void sumPhoneNum() {
		String num1 = getS_mphone1();
		String num2 = getS_mphone2();
		String num3 = getS_mphone3();
		String num = num1 + num2 + num3;
		setM_tel(num);

	}

	public void sumTellNum() {
		String num1 = getS_phone1();
		String num2 = getS_phone2();
		String num3 = getS_phone3();
		String num = num1 + num2 + num3;

		setM_homeTel(num);

	}

	public void sumEmail(String m_email1, String m_domain) {
		this.m_email = m_email1 + "@" + m_domain;

	}

	public String getM_domain() {
		return m_domain;
	}

	public void setM_domain(String m_domain) {
		this.m_domain = m_domain;
	}

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

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public String getPostadress() {
		return postadress;
	}

	public void setPostadress(String postadress) {
		this.postadress = postadress;
	}

	public String getPostdetail() {
		return postdetail;
	}

	public void setPostdetail(String postdetail) {
		this.postdetail = postdetail;
	}

	public String getS_phone1() {
		return s_phone1;
	}

	public void setS_phone1(String s_phone1) {
		this.s_phone1 = s_phone1;
	}

	public String getS_phone2() {
		return s_phone2;
	}

	public void setS_phone2(String s_phone2) {
		this.s_phone2 = s_phone2;
	}

	public String getS_phone3() {
		return s_phone3;
	}

	public void setS_phone3(String s_phone3) {
		this.s_phone3 = s_phone3;
	}

	public String getS_mphone1() {
		return s_mphone1;
	}

	public void setS_mphone1(String s_mphone1) {
		this.s_mphone1 = s_mphone1;
	}

	public String getS_mphone2() {
		return s_mphone2;
	}

	public void setS_mphone2(String s_mphone2) {
		this.s_mphone2 = s_mphone2;
	}

	public String getS_mphone3() {
		return s_mphone3;
	}

	public void setS_mphone3(String s_mphone3) {
		this.s_mphone3 = s_mphone3;
	}

	public int getM_buildingNo() {
		return m_buildingNo;
	}

	public void setM_buildingNo(int m_buildingNo) {
		this.m_buildingNo = m_buildingNo;
	}

	public int getM_roomNo() {
		return m_roomNo;
	}

	public void setM_roomNo(int m_roomNo) {
		this.m_roomNo = m_roomNo;
	}

	public int getM_age() {
		return m_age;
	}

	public void setM_age(int m_age) {
		this.m_age = m_age;
	}

	public int getM_grade() {
		return m_grade;
	}

	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}

	public String getM_homeTel() {
		return m_homeTel;
	}

	public void setM_homeTel(String m_homeTel) {
		this.m_homeTel = m_homeTel;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public int getApt_APTGNo() {
		return apt_APTGNo;
	}

	public void setApt_APTGNo(int apt_APTGNo) {
		this.apt_APTGNo = apt_APTGNo;
	}

	public int getV_flag() {
		return v_flag;
	}

	public void setV_flag(int v_flag) {
		this.v_flag = v_flag;
	}

	public int getV2_flag() {
		return v2_flag;
	}

	public void setV2_flag(int v2_flag) {
		this.v2_flag = v2_flag;
	}

	@Override
	public String toString() {
		return "Member [m_memberNo=" + m_memberNo + ", m_pass=" + m_pass + ", m_name=" + m_name + ", m_email=" + m_email
				+ ", m_domain=" + m_domain + ", m_addr=" + m_addr + ", postadress=" + postadress + ", postdetail="
				+ postdetail + ", s_phone1=" + s_phone1 + ", s_phone2=" + s_phone2 + ", s_phone3=" + s_phone3
				+ ", s_mphone1=" + s_mphone1 + ", s_mphone2=" + s_mphone2 + ", s_mphone3=" + s_mphone3 + ", m_homeTel="
				+ m_homeTel + ", m_tel=" + m_tel + ", v_flag=" + v_flag + ", v2_flag=" + v2_flag + ", m_buildingNo="
				+ m_buildingNo + ", m_roomNo=" + m_roomNo + ", m_age=" + m_age + ", m_grade=" + m_grade
				+ ", apt_APTGNo=" + apt_APTGNo + "]";
	}
	
	
}
