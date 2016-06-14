package kosta.apt.domain.Product;

import java.io.Serializable;


public class Product implements Serializable {

	private int pro_no;
	private String pro_group;
	private String pro_name;
	private String m_memberNo;
	
	private String pro_tel;
	private String pro_tel1;
	private String pro_tel2;
	private String pro_tel3;
	private String pro_context;
	
	private int pro_startdate;
	private int pro_enddate;
	private String pro_flag;
	private int apt_APTGNo;
	private int m_grade; //관리자는 해당아파트그룹꺼 다볼수있어야하니까 해쉬맵대신 클래스만든거
	
	
	private int pro_price;
	private int pro_num;
	private String pro_img1;
	private String pro_img2;
	private String pro_img3;
	private int checkPost;
	
	private int pro_maxnum;
	
	
	
	
	
	
	
	
	
	


	
	
	
	public int getPro_maxnum() {
		return pro_maxnum;
	}
	public void setPro_maxnum(int pro_maxnum) {
		this.pro_maxnum = pro_maxnum;
	}
	public int getPro_startdate() {
		return pro_startdate;
	}
	public void setPro_startdate(int pro_startdate) {
		this.pro_startdate = pro_startdate;
	}
	public int getPro_enddate() {
		return pro_enddate;
	}
	public void setPro_enddate(int pro_enddate) {
		this.pro_enddate = pro_enddate;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public String getPro_img1() {
		return pro_img1;
	}
	public void setPro_img1(String pro_img1) {
		this.pro_img1 = pro_img1;
	}
	public String getPro_img2() {
		return pro_img2;
	}
	public void setPro_img2(String pro_img2) {
		this.pro_img2 = pro_img2;
	}
	public String getPro_img3() {
		return pro_img3;
	}
	public void setPro_img3(String pro_img3) {
		this.pro_img3 = pro_img3;
	}
	public int getCheckPost() {
		return checkPost;
	}
	public void setCheckPost(int checkPost) {
		this.checkPost = checkPost;
	}

	public String getPro_flag() {
		return pro_flag;
	}
	public void setPro_flag(String pro_flag) {
		this.pro_flag = pro_flag;
	}
	public int getM_grade() {
		return m_grade;
	}
	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}
	
	
	
	public int getApt_APTGNo() {
		return apt_APTGNo;
	}
	public void setApt_APTGNo(int apt_APTGNo) {
		this.apt_APTGNo = apt_APTGNo;
	}
	public String getPro_context() {
		return pro_context;
	}
	public void setPro_context(String pro_context) {
		this.pro_context = pro_context;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public String getPro_group() {
		return pro_group;
	}
	public void setPro_group(String pro_group) {
		this.pro_group = pro_group;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getM_memberNo() {
		return m_memberNo;
	}
	public void setM_memberNo(String m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	public String getPro_tel() {
		return pro_tel;
	}
	public void setPro_tel(String pro_tel) {
		this.pro_tel = pro_tel;
	}
	public String getPro_tel1() {
		return pro_tel1;
	}
	public void setPro_tel1(String pro_tel1) {
		this.pro_tel1 = pro_tel1;
	}
	public String getPro_tel2() {
		return pro_tel2;
	}
	public void setPro_tel2(String pro_tel2) {
		this.pro_tel2 = pro_tel2;
	}
	public String getPro_tel3() {
		return pro_tel3;
	}
	public void setPro_tel3(String pro_tel3) {
		this.pro_tel3 = pro_tel3;
	}
	
	
	
	
	
	
}
