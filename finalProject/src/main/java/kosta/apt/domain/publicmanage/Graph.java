package kosta.apt.domain.publicmanage;

import java.io.Serializable;

public class Graph implements Serializable {
	String d;
	int manageFee;
	int manageFee2;
	
	public int getManageFee() {
		return manageFee;
	}
	public void setManageFee(int manageFee) {
		this.manageFee = manageFee;
	}
	public int getManageFee2() {
		return manageFee2;
	}
	public void setManageFee2(int manageFee2) {
		this.manageFee2 = manageFee2;
	}
	public String getD() {
		return d;
	}
	public void setD(String d) {
		this.d = d;
	}

	
	

}
