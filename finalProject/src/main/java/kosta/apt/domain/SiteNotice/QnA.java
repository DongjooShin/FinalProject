package kosta.apt.domain.SiteNotice;


import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;


public class QnA implements Serializable {
	private int qnaNo;
	private String q_name;
	private String q_email;
	private String q_title;
	private String q_content;
	private Timestamp q_date;
	private String q_fileName;
	private int q_ref;
	private int q_state;	//1:접수	2:답변완료
	private String m_memberNo;
	
	private MultipartFile multipart;//업로드된 파일객체
	
	public MultipartFile getMultipart() {
		return multipart;
	}
	public void setMultipart(MultipartFile multipart) {
		this.multipart = multipart;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQ_name() {
		return q_name;
	}
	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}
	public String getQ_email() {
		return q_email;
	}
	public void setQ_email(String q_email) {
		this.q_email = q_email;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Timestamp getQ_date() {
		return q_date;
	}
	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}
	public String getQ_fileName() {
		return q_fileName;
	}
	public void setQ_fileName(String q_fileName) {
		this.q_fileName = q_fileName;
	}
	public int getQ_ref() {
		return q_ref;
	}
	public void setQ_ref(int q_ref) {
		this.q_ref = q_ref;
	}
	public int getQ_state() {
		return q_state;
	}
	public void setQ_state(int q_state) {
		this.q_state = q_state;
	}
	public String getM_memberNo() {
		return m_memberNo;
	}
	public void setM_memberNo(String m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", q_name=" + q_name + ", q_email=" + q_email + ", q_title=" + q_title
				+ ", q_content=" + q_content + ", q_date=" + q_date + ", q_fileName=" + q_fileName + ", q_ref=" + q_ref
				+ ", q_state=" + q_state + ", m_memberNo=" + m_memberNo + "]";
	}
	
}
