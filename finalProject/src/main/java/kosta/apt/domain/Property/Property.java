package kosta.apt.domain.Property;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class Property implements Serializable{
	
	public Timestamp getPr_date() {
		return pr_date;
	}
	public void setPr_date(Timestamp pr_date) {
		this.pr_date = pr_date;
	}
	

	public Property() {}
	private Timestamp pr_date;
	private int pr_propertyNo;
	private String pr_group;

	
	private String pr_APTName;
	private String pr_addr;
	private String pr_tel;
	private String pr_tel1;
	private String pr_tel12;
	private String pr_tel13;
	
	private int pr_price;
	private int pr_deposit;
	private int pr_level;
	private int pr_totalLevel;
	private String pr_doorStruct;
	private int pr_roomNum;
	private int pr_bathNum;
	private int pr_roomArea;
	private int pr_scale;
	private String pr_company;
	private String pr_imageName;
	private String pr_content;
	private String m_memberNo;
	
	private MultipartFile uploadFile;
	

	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getPr_propertyNo() {
		return pr_propertyNo;
	}
	public void setPr_propertyNo(int pr_propertyNo) {
		this.pr_propertyNo = pr_propertyNo;
	}
	public String getPr_group() {
		return pr_group;
	}
	public void setPr_group(String pr_group) {
		this.pr_group = pr_group;
	}
	public String getPr_APTName() {
		return pr_APTName;
	}
	public void setPr_APTName(String pr_APTName) {
		this.pr_APTName = pr_APTName;
	}
	public String getPr_addr() {
		return pr_addr;
	}
	public void setPr_addr(String pr_addr) {
		this.pr_addr = pr_addr;
	}
	public String getPr_tel() {
		return pr_tel;
	}
	public void setPr_tel(String pr_tel) {
		this.pr_tel = pr_tel;
	}
	public String getPr_tel1() {
		return pr_tel1;
	}
	public void setPr_tel1(String pr_tel1) {
		this.pr_tel1 = pr_tel1;
	}
	public String getPr_tel12() {
		return pr_tel12;
	}
	public void setPr_tel12(String pr_tel12) {
		this.pr_tel12 = pr_tel12;
	}
	public String getPr_tel13() {
		return pr_tel13;
	}
	public void setPr_tel13(String pr_tel13) {
		this.pr_tel13 = pr_tel13;
	}
	public int getPr_price() {
		return pr_price;
	}
	public void setPr_price(int pr_price) {
		this.pr_price = pr_price;
	}
	public int getPr_deposit() {
		return pr_deposit;
	}
	public void setPr_deposit(int pr_deposit) {
		this.pr_deposit = pr_deposit;
	}
	public int getPr_level() {
		return pr_level;
	}
	public void setPr_level(int pr_level) {
		this.pr_level = pr_level;
	}
	public int getPr_totalLevel() {
		return pr_totalLevel;
	}
	public void setPr_totalLevel(int pr_totalLevel) {
		this.pr_totalLevel = pr_totalLevel;
	}
	public String getPr_doorStruct() {
		return pr_doorStruct;
	}
	public void setPr_doorStruct(String pr_doorStruct) {
		this.pr_doorStruct = pr_doorStruct;
	}
	public int getPr_roomNum() {
		return pr_roomNum;
	}
	public void setPr_roomNum(int pr_roomNum) {
		this.pr_roomNum = pr_roomNum;
	}
	public int getPr_bathNum() {
		return pr_bathNum;
	}
	public void setPr_bathNum(int pr_bathNum) {
		this.pr_bathNum = pr_bathNum;
	}
	public int getPr_roomArea() {
		return pr_roomArea;
	}
	public void setPr_roomArea(int pr_roomArea) {
		this.pr_roomArea = pr_roomArea;
	}
	public int getPr_scale() {
		return pr_scale;
	}
	public void setPr_scale(int pr_scale) {
		this.pr_scale = pr_scale;
	}
	public String getPr_company() {
		return pr_company;
	}
	public void setPr_company(String pr_company) {
		this.pr_company = pr_company;
	}
	public String getPr_imageName() {
		return pr_imageName;
	}
	public void setPr_imageName(String pr_imageName) {
		this.pr_imageName = pr_imageName;
	}
	public String getPr_content() {
		return pr_content;
	}
	public void setPr_content(String pr_content) {
		this.pr_content = pr_content;
	}
	public String getM_memberNo() {
		return m_memberNo;
	}
	public void setM_memberNo(String m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	@Override
	public String toString() {
		return "Property [pr_date=" + pr_date + ", pr_propertyNo=" + pr_propertyNo + ", pr_group=" + pr_group
				+ ", pr_APTName=" + pr_APTName + ", pr_addr=" + pr_addr + ", pr_tel=" + pr_tel + ", pr_tel1=" + pr_tel1
				+ ", pr_tel12=" + pr_tel12 + ", pr_tel13=" + pr_tel13 + ", pr_price=" + pr_price + ", pr_deposit="
				+ pr_deposit + ", pr_level=" + pr_level + ", pr_totalLevel=" + pr_totalLevel + ", pr_doorStruct="
				+ pr_doorStruct + ", pr_roomNum=" + pr_roomNum + ", pr_bathNum=" + pr_bathNum + ", pr_roomArea="
				+ pr_roomArea + ", pr_scale=" + pr_scale + ", pr_company=" + pr_company + ", pr_imageName="
				+ pr_imageName + ", pr_content=" + pr_content + ", m_memberNo=" + m_memberNo + ", uploadFile="
				+ uploadFile + "]";
	}
	

	

	
}
