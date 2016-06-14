package kosta.apt.domain.member;

import java.io.Serializable;

public class AddressCity implements Serializable {

	private String addr_city;
	private int a_citynum;
	
	public String getAddr_city() {
		return addr_city;
	}
	public void setAddr_city(String addr_city) {
		this.addr_city = addr_city;
	}
	public int getA_citynum() {
		return a_citynum;
	}
	public void setA_citynum(int a_citynum) {
		this.a_citynum = a_citynum;
	}
	
	
}
