package kosta.apt.domain.GroupNotice;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class GroupNotice implements Serializable {
	private int g_groupNoticeNo;
	private String g_title;
	private Timestamp g_date;
	private String g_content;
	private int g_hit;
	private String g_fileName;
	private int apt_APTGNo;
	private String m_memberNo;
	private Integer g_subNo;
	
	private MultipartFile uploadFile;//업로드된 파일객체
	
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public Integer getG_subNo() {
		return g_subNo;
	}
	public void setG_subNo(Integer g_subNo) {
		this.g_subNo = g_subNo;
	}
	public int getG_groupNoticeNo() {
		return g_groupNoticeNo;
	}
	public void setG_groupNoticeNo(int g_groupNoticeNo) {
		this.g_groupNoticeNo = g_groupNoticeNo;
	}
	public String getG_title() {
		return g_title;
	}
	public void setG_title(String g_title) {
		this.g_title = g_title;
	}
	public Timestamp getG_date() {
		return g_date;
	}
	public void setG_date(Timestamp g_date) {
		this.g_date = g_date;
	}
	public String getG_content() {
		return g_content;
	}
	public void setG_content(String g_content) {
		this.g_content = g_content;
	}
	public int getG_hit() {
		return g_hit;
	}
	public void setG_hit(int g_hit) {
		this.g_hit = g_hit;
	}
	public String getG_fileName() {
		return g_fileName;
	}
	public void setG_fileName(String g_fileName) {
		this.g_fileName = g_fileName;
	}
	public int getApt_APTGNo() {
		return apt_APTGNo;
	}
	public void setApt_APTGNo(int apt_APTGNo) {
		this.apt_APTGNo = apt_APTGNo;
	}
	public String getM_memberNo() {
		return m_memberNo;
	}
	public void setM_memberNo(String m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	@Override
	public String toString() {
		return "GroupNotice [g_groupNoticeNo=" + g_groupNoticeNo + ", g_title=" + g_title + ", g_date=" + g_date
				+ ", g_content=" + g_content + ", g_hit=" + g_hit + ", g_fileName=" + g_fileName + ", apt_APTGNo="
				+ apt_APTGNo + ", m_memberNo=" + m_memberNo + "]";
	}
	
	
	
}
