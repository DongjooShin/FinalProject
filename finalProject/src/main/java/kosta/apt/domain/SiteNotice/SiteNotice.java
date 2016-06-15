package kosta.apt.domain.SiteNotice;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class SiteNotice implements Serializable  {

	private int sn_siteNoticeNo;
	private String sn_title;
	private Timestamp sn_date;
	private String sn_content;
	private int sn_hit;
	private String sn_fileName;
	private String m_memberNo;

	
	private MultipartFile uploadFile;//업로드된 파일객체


	public int getSn_siteNoticeNo() {
		return sn_siteNoticeNo;
	}


	public void setSn_siteNoticeNo(int sn_siteNoticeNo) {
		this.sn_siteNoticeNo = sn_siteNoticeNo;
	}


	public String getSn_title() {
		return sn_title;
	}


	public void setSn_title(String sn_title) {
		this.sn_title = sn_title;
	}


	public Timestamp getSn_date() {
		return sn_date;
	}


	public void setSn_date(Timestamp sn_date) {
		this.sn_date = sn_date;
	}


	public String getSn_content() {
		return sn_content;
	}


	public void setSn_content(String sn_content) {
		this.sn_content = sn_content;
	}


	public int getSn_hit() {
		return sn_hit;
	}


	public void setSn_hit(int sn_hit) {
		this.sn_hit = sn_hit;
	}


	public String getSn_fileName() {
		return sn_fileName;
	}


	public void setSn_fileName(String sn_fileName) {
		this.sn_fileName = sn_fileName;
	}


	public String getM_memberNo() {
		return m_memberNo;
	}


	public void setM_memberNo(String m_memberNo) {
		this.m_memberNo = m_memberNo;
	}


	public MultipartFile getUploadFile() {
		return uploadFile;
	}


	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "SiteNotice [sn_siteNoticeNo=" + sn_siteNoticeNo + ", sn_title=" + sn_title + ", sn_date=" + sn_date
				+ ", sn_content=" + sn_content + ", sn_hit=" + sn_hit + ", sn_fileName=" + sn_fileName + ", m_memberNo="
				+ m_memberNo + ", uploadFile=" + uploadFile + "]";
	}


}
