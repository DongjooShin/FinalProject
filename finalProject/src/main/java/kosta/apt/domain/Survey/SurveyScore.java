package kosta.apt.domain.Survey;

import java.io.Serializable;

public class SurveyScore implements Serializable {


	private int totalCount;
	private int totalScore;
	private int avgSum;
	
	private int su_group;
	
	private int su_startdate; //시작날짜
	private int su_enddate; //마지막날짜
	private String su_title;
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
	public int getAvgSum() {
		return avgSum;
	}
	public void setAvgSum(int avgSum) {
		this.avgSum = avgSum;
	}
	
	public int getSu_startdate() {
		return su_startdate;
	}
	public void setSu_startdate(int su_startdate) {
		this.su_startdate = su_startdate;
	}
	public int getSu_enddate() {
		return su_enddate;
	}
	public void setSu_enddate(int su_enddate) {
		this.su_enddate = su_enddate;
	}
	public String getSu_title() {
		return su_title;
	}
	public void setSu_title(String su_title) {
		this.su_title = su_title;
	}
	public int getSu_group() {
		return su_group;
	}
	public void setSu_group(int su_group) {
		this.su_group = su_group;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
