package kosta.apt.domain.Product;

import java.io.Serializable;

public class ProductReply implements Serializable {
	
	private int pro_no;
	private int re_no;
	private String re_text;
	private String m_memberno;
	private String re_date;
	
	
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public String getRe_text() {
		return re_text;
	}
	public void setRe_text(String re_text) {
		this.re_text = re_text;
	}
	public String getM_memberno() {
		return m_memberno;
	}
	public void setM_memberno(String m_memberno) {
		this.m_memberno = m_memberno;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}
	
	
	
}
