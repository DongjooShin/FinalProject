package kosta.apt.domain.Store;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Store implements Serializable{
	private int s_storeNo;
	private String s_name;
	private String s_tel;
	private String s_content;
	private String s_group;
	private String s_openTime;
	private String s_closeTime;
	private int apt_APTGNo;
	
	
	private String s_fname;
	private MultipartFile storeUploadFile;//업로드된 파일객체
	private String s_thumFname;
	
	
	
	public String getS_thumFname() {
		return s_thumFname;
	}
	public void setS_thumFname(String s_thumFname) {
		this.s_thumFname = s_thumFname;
	}
	public String getS_fname() {
		return s_fname;
	}
	public void setS_fname(String s_fname) {
		this.s_fname = s_fname;
	}
	
	public MultipartFile getStoreUploadFile() {
		return storeUploadFile;
	}
	public void setStoreUploadFile(MultipartFile storeUploadFile) {
		this.storeUploadFile = storeUploadFile;
	}
	public int getS_storeNo() {
		return s_storeNo;
	}
	public void setS_storeNo(int s_storeNo) {
		this.s_storeNo = s_storeNo;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_tel() {
		return s_tel;
	}
	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public String getS_group() {
		return s_group;
	}
	public void setS_group(String s_group) {
		this.s_group = s_group;
	}
	public String getS_openTime() {
		return s_openTime;
	}
	public void setS_openTime(String s_openTime) {
		this.s_openTime = s_openTime;
	}
	public String getS_closeTime() {
		return s_closeTime;
	}
	public void setS_closeTime(String s_closeTime) {
		this.s_closeTime = s_closeTime;
	}
	public int getApt_APTGNo() {
		return apt_APTGNo;
	}
	public void setApt_APTGNo(int apt_APTGNo) {
		this.apt_APTGNo = apt_APTGNo;
	}
	@Override
	public String toString() {
		return "Store [s_storeNo=" + s_storeNo + ", s_name=" + s_name + ", s_tel=" + s_tel + ", s_content=" + s_content
				+ ", s_group=" + s_group + ", s_openTime=" + s_openTime + ", s_closeTime=" + s_closeTime
				+ ", apt_APTGNo=" + apt_APTGNo + ", s_fname=" + s_fname + ", storeUploadFile=" + storeUploadFile
				+ ", s_thumFname=" + s_thumFname + "]";
	}
	
	
	
	

}
