package kosta.apt.domain.member;

import java.io.Serializable;

public class EmailCertification implements Serializable {

	private String email;
	private String  domain;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	
	
	
}
