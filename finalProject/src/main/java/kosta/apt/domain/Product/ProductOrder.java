package kosta.apt.domain.Product;

import java.io.Serializable;

public class ProductOrder implements Serializable {

	private int pro_no;
	private int checkPost; //택배비
	private int pro_price; //단가
	
	private int check_no; //고유번호
	private int check_num; //주문수량
	private int check_price;	//총합계
	
	
	
	private String check_seller; //판매자
	private String check_buyer; //구매자
	private String check_name;	//상품명
	private String check_date;	//날짜

	
	//주소관련
	private String check_tell;
	private String check_tell1;
	private String check_tell2;
	private String check_tell3;
	private String check_addressee;
	private String check_address;
	private String check_sign;
	
	
	
	
	
	
	
	
	public int getCheckPost() {
		return checkPost;
	}
	public void setCheckPost(int checkPost) {
		this.checkPost = checkPost;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getCheck_sign() {
		return check_sign;
	}
	public void setCheck_sign(String check_sign) {
		this.check_sign = check_sign;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public int getCheck_no() {
		return check_no;
	}
	public void setCheck_no(int check_no) {
		this.check_no = check_no;
	}
	public int getCheck_num() {
		return check_num;
	}
	public void setCheck_num(int check_num) {
		this.check_num = check_num;
	}
	public int getCheck_price() {
		return check_price;
	}
	public void setCheck_price(int check_price) {
		this.check_price = check_price;
	}
	public String getCheck_seller() {
		return check_seller;
	}
	public void setCheck_seller(String check_seller) {
		this.check_seller = check_seller;
	}
	public String getCheck_buyer() {
		return check_buyer;
	}
	public void setCheck_buyer(String check_buyer) {
		this.check_buyer = check_buyer;
	}
	public String getCheck_name() {
		return check_name;
	}
	public void setCheck_name(String check_name) {
		this.check_name = check_name;
	}
	public String getCheck_date() {
		return check_date;
	}
	public void setCheck_date(String check_date) {
		this.check_date = check_date;
	}
	public String getCheck_tell() {
		return check_tell;
	}
	public void setCheck_tell(String check_tell) {
		this.check_tell = check_tell;
	}
	public String getCheck_tell1() {
		return check_tell1;
	}
	public void setCheck_tell1(String check_tell1) {
		this.check_tell1 = check_tell1;
	}
	public String getCheck_tell2() {
		return check_tell2;
	}
	public void setCheck_tell2(String check_tell2) {
		this.check_tell2 = check_tell2;
	}
	public String getCheck_tell3() {
		return check_tell3;
	}
	public void setCheck_tell3(String check_tell3) {
		this.check_tell3 = check_tell3;
	}
	public String getCheck_addressee() {
		return check_addressee;
	}
	public void setCheck_addressee(String check_addressee) {
		this.check_addressee = check_addressee;
	}
	public String getCheck_address() {
		return check_address;
	}
	public void setCheck_address(String check_address) {
		this.check_address = check_address;
	}
	
	
	
	
	
	
	
	
	
	
	
}

