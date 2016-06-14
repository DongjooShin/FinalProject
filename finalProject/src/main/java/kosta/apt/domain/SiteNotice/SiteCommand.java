package kosta.apt.domain.SiteNotice;

import org.springframework.web.multipart.MultipartFile;

public class SiteCommand {
	private String sn_title;
	private String sn_content;
	private MultipartFile uploadFile;//업로드된 파일객체
	
	public String getSn_title() {
		return sn_title;
	}
	public void setSn_title(String sn_title) {
		this.sn_title = sn_title;
	}
	public String getSn_content() {
		return sn_content;
	}
	public void setSn_content(String sn_content) {
		this.sn_content = sn_content;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	
}
