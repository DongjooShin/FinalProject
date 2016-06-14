package kosta.apt.domain.calendar;

import java.io.Serializable;
import java.sql.Timestamp;

public class Calendar implements Serializable {
	private int c_calendarno;
	private String c_schedule;
	private String c_startdate;
	private String c_enddate;
	private int apt_APTGNo;
	private String c_Dday;
	private String c_Dday1;
	private String c_Dday2;
	private String c_Dday3;
	
	
	
	
	public String getC_Dday1() {
		return c_Dday1;
	}
	public void setC_Dday1(String c_Dday1) {
		this.c_Dday1 = c_Dday1;
	}
	public String getC_Dday2() {
		return c_Dday2;
	}
	public void setC_Dday2(String c_Dday2) {
		this.c_Dday2 = c_Dday2;
	}
	public String getC_Dday3() {
		return c_Dday3;
	}
	public void setC_Dday3(String c_Dday3) {
		this.c_Dday3 = c_Dday3;
	}
	public String getC_Dday() {
		return c_Dday;
	}
	public void setC_Dday(String c_Dday) {
		this.c_Dday = c_Dday;
	}
	public int getC_calendarno() {
		return c_calendarno;
	}
	public void setC_calendarno(int c_calendarno) {
		this.c_calendarno = c_calendarno;
	}
	public String getC_schedule() {
		return c_schedule;
	}
	public void setC_schedule(String c_schedule) {
		this.c_schedule = c_schedule;
	}
	public String getC_startdate() {
		return c_startdate;
	}
	public void setC_startdate(String c_startdate) {
		this.c_startdate = c_startdate;
	}
	public String getC_enddate() {
		return c_enddate;
	}
	public void setC_enddate(String c_enddate) {
		this.c_enddate = c_enddate;
	}
	public int getApt_APTGNo() {
		return apt_APTGNo;
	}
	public void setApt_APTGNo(int apt_APTGNo) {
		this.apt_APTGNo = apt_APTGNo;
	}
	@Override
	public String toString() {
		return "Calendar [c_calendarno=" + c_calendarno + ", c_schedule=" + c_schedule + ", c_startdate=" + c_startdate
				+ ", c_enddate=" + c_enddate + ", apt_APTGNo=" + apt_APTGNo + ", c_Dday=" + c_Dday + ", c_Dday1="
				+ c_Dday1 + ", c_Dday2=" + c_Dday2 + ", c_Dday3=" + c_Dday3 + "]";
	}
	
	
	
}
