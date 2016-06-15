package kosta.apt.domain.SiteNotice;

import java.io.Serializable;

public class JoinInquiry implements Serializable {
	
	private int jno;
	
	private String j_name;
	
	private String j_email;
	
	private String j_phone;

	private String j_apt_name;
	
	private String j_message;
	
	
	
	public int getJno() {
		return jno;
	}
	public void setJno(int jno) {
		this.jno = jno;
	}
	public String getJ_name() {
		return j_name;
	}
	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}
	public String getJ_email() {
		return j_email;
	}
	public void setJ_email(String j_email) {
		this.j_email = j_email;
	}
	public String getJ_phone() {
		return j_phone;
	}
	public void setJ_phone(String j_phone) {
		this.j_phone = j_phone;
	}
	public String getJ_apt_name() {
		return j_apt_name;
	}
	public void setJ_apt_name(String j_apt_name) {
		this.j_apt_name = j_apt_name;
	}
	public String getJ_message() {
		return j_message;
	}
	public void setJ_message(String j_message) {
		this.j_message = j_message;
	}
	@Override
	public String toString() {
		return "JoinInquiry [jno=" + jno + ", j_name=" + j_name + ", j_email=" + j_email + ", j_phone=" + j_phone
				+ ", j_apt_name=" + j_apt_name + ", j_message=" + j_message + "]";
	}

	

}



