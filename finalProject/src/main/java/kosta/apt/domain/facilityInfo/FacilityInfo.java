package kosta.apt.domain.facilityInfo;

import java.io.Serializable;

public class FacilityInfo implements Serializable {
	private int f_facilityNo;
	private char f_mainDoorLock;
	private char f_groundParking;
	private char f_basementParking;
	private char f_vehicleControl;
	private int f_totalFamilyNum;
	private int f_playground;
	private int f_totalBuildingNum;
	private String f_completionDate;
	private String f_constructFirm;
	private String f_heatingMeans;
	private String f_heatingFuel;
	private int f_totalParkingNum;
	private String f_groupName;
	private String f_addr;
	private int apt_APTGNo;
	private int f_securityNum; 
	private float f_latitude;
	private float f_longitude;
	
	public int getF_facilityNo() {
		return f_facilityNo;
	}
	public void setF_facilityNo(int f_facilityNo) {
		this.f_facilityNo = f_facilityNo;
	}
	public char getF_mainDoorLock() {
		return f_mainDoorLock;
	}
	public void setF_mainDoorLock(char f_mainDoorLock) {
		this.f_mainDoorLock = f_mainDoorLock;
	}
	public char getF_groundParking() {
		return f_groundParking;
	}
	public void setF_groundParking(char f_groundParking) {
		this.f_groundParking = f_groundParking;
	}
	public char getF_basementParking() {
		return f_basementParking;
	}
	public void setF_basementParking(char f_basementParking) {
		this.f_basementParking = f_basementParking;
	}
	public char getF_vehicleControl() {
		return f_vehicleControl;
	}
	public void setF_vehicleControl(char f_vehicleControl) {
		this.f_vehicleControl = f_vehicleControl;
	}
	public int getF_totalFamilyNum() {
		return f_totalFamilyNum;
	}
	public void setF_totalFamilyNum(int f_totalFamilyNum) {
		this.f_totalFamilyNum = f_totalFamilyNum;
	}
	public int getF_playground() {
		return f_playground;
	}
	public void setF_playground(int f_playground) {
		this.f_playground = f_playground;
	}
	public int getF_totalBuildingNum() {
		return f_totalBuildingNum;
	}
	public void setF_totalBuildingNum(int f_totalBuildingNum) {
		this.f_totalBuildingNum = f_totalBuildingNum;
	}
	
	public String getF_completionDate() {
		return f_completionDate;
	}
	public void setF_completionDate(String f_completionDate) {
		this.f_completionDate = f_completionDate;
	}
	public String getF_constructFirm() {
		return f_constructFirm;
	}
	public void setF_constructFirm(String f_constructFirm) {
		this.f_constructFirm = f_constructFirm;
	}
	public String getF_heatingMeans() {
		return f_heatingMeans;
	}
	public void setF_heatingMeans(String f_heatingMeans) {
		this.f_heatingMeans = f_heatingMeans;
	}
	public String getF_heatingFuel() {
		return f_heatingFuel;
	}
	public void setF_heatingFuel(String f_heatingFuel) {
		this.f_heatingFuel = f_heatingFuel;
	}
	public int getF_totalParkingNum() {
		return f_totalParkingNum;
	}
	public void setF_totalParkingNum(int f_totalParkingNum) {
		this.f_totalParkingNum = f_totalParkingNum;
	}
	public String getF_groupName() {
		return f_groupName;
	}
	public void setF_groupName(String f_groupName) {
		this.f_groupName = f_groupName;
	}
	public String getF_addr() {
		return f_addr;
	}
	public void setF_addr(String f_addr) {
		this.f_addr = f_addr;
	}
	public int getApt_APTGNo() {
		return apt_APTGNo;
	}
	public void setApt_APTGNo(int apt_APTGNo) {
		this.apt_APTGNo = apt_APTGNo;
	}
	public int getF_securityNum() {
		return f_securityNum;
	}
	public void setF_securityNum(int f_securityNum) {
		this.f_securityNum = f_securityNum;
	}
	
	
	public float getF_latitude() {
		return f_latitude;
	}
	public void setF_latitude(float f_latitude) {
		this.f_latitude = f_latitude;
	}
	public float getF_longitude() {
		return f_longitude;
	}
	public void setF_longitude(float f_longitude) {
		this.f_longitude = f_longitude;
	}
	@Override
	public String toString() {
		return "FacilityInfo [f_facilityNo=" + f_facilityNo + ", f_mainDoorLock=" + f_mainDoorLock
				+ ", f_groundParking=" + f_groundParking + ", f_basementParking=" + f_basementParking
				+ ", f_vehicleControl=" + f_vehicleControl + ", f_totalFamilyNum=" + f_totalFamilyNum
				+ ", f_playground=" + f_playground + ", f_totalBuildingNum=" + f_totalBuildingNum
				+ ", f_completionDate=" + f_completionDate + ", f_constructFirm=" + f_constructFirm
				+ ", f_heatingMeans=" + f_heatingMeans + ", f_heatingFuel=" + f_heatingFuel + ", f_totalParkingNum="
				+ f_totalParkingNum + ", f_groupName=" + f_groupName + ", f_addr=" + f_addr + ", apt_APTGNo="
				+ apt_APTGNo + ", f_securityNum=" + f_securityNum + ", f_latitude=" + f_latitude + ", f_longitude="
				+ f_longitude + "]";
	}
	
	
	
}
