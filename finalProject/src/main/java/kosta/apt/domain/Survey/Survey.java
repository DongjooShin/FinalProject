package kosta.apt.domain.Survey;

import java.io.Serializable;
import java.sql.Timestamp;

public class Survey implements Serializable{

	private int su_surveyNo; //각각 설문지의 하위번호들

	private int su_group; //설문지
	private String su_context; //질문내용 

	private int apt_APTGNo;
	
	private int su_sum;
	private int su_count;


	
	private String st1;
	private String st2;
	private String end1;
	private String end2;
	
	
	
	
	

	public int getSu_sum() {
		return su_sum;
	}
	public void setSu_sum(int su_sum) {
		this.su_sum = su_sum;
	}
	public int getSu_count() {
		return su_count;
	}
	public void setSu_count(int su_count) {
		this.su_count = su_count;
	}
	public String getSt1() {
		return st1;
	}
	public void setSt1(String st1) {
		this.st1 = st1;
	}
	public String getSt2() {
		return st2;
	}
	public void setSt2(String st2) {
		this.st2 = st2;
	}
	public String getEnd1() {
		return end1;
	}
	public void setEnd1(String end1) {
		this.end1 = end1;
	}
	public String getEnd2() {
		return end2;
	}
	public void setEnd2(String end2) {
		this.end2 = end2;
	}
	public int getApt_APTGNo() {
		return apt_APTGNo;
	}
	public void setApt_APTGNo(int apt_APTGNo) {
		this.apt_APTGNo = apt_APTGNo;
	}
	public int getSu_surveyNo() {
		return su_surveyNo;
	}
	public void setSu_surveyNo(int su_surveyNo) {
		this.su_surveyNo = su_surveyNo;
	}

	public int getSu_group() {
		return su_group;
	}
	public void setSu_group(int su_group) {
		this.su_group = su_group;
	}
	public String getSu_context() {
		return su_context;
	}
	public void setSu_context(String su_context) {
		this.su_context = su_context;
	}
	
	
	
	
}
