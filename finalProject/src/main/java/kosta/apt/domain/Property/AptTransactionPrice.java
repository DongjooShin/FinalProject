package kosta.apt.domain.Property;

import java.io.Serializable;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class AptTransactionPrice implements Serializable {


			private String primaryNum; 
			private String address;
			private String addressNum;
			private String aptName;
			private float area;
			private String contract ;
			private int aptPrice;
			private int floor;
			private int builtYear;
			private String addressName;
			private CommonsMultipartFile file = null;


			public AptTransactionPrice(){}
			
			public AptTransactionPrice(String primaryNum, String address, String addressNum, String aptName, float area,
					String contract, int aptPrice, int floor, int builtYear, String addressName) {
				super();
				this.primaryNum = primaryNum;
				this.address = address;
				this.addressNum = addressNum;
				this.aptName = aptName;
				this.area = area;
				this.contract = contract;
				this.aptPrice = aptPrice;
				this.floor = floor;
				this.builtYear = builtYear;
				this.addressName = addressName;
			}
			public CommonsMultipartFile getFile() {
				return file;
			}
			public void setFile(CommonsMultipartFile file) {
				this.file = file;
			}
			public String getPrimaryNum() {
			
				return primaryNum;
			}
			public void setPrimaryNum(String primaryNum) {
				this.primaryNum = primaryNum;
			}
			public String getAddress() {
				return address;
			}
			public void setAddress(String address) {
				this.address = address;
			}
			public String getAddressNum() {
				return addressNum;
			}
			public void setAddressNum(String addressNum) {
				this.addressNum = addressNum;
			}
			public String getAptName() {
				return aptName;
			}
			public void setAptName(String aptName) {
				this.aptName = aptName;
			}
			public float getArea() {
				return area;
			}
			public void setArea(float area) {
				this.area = area;
			}
			public String getContract() {
				return contract;
			}
			public void setContract(String contract) {
				this.contract = contract;
			}
			public int getAptPrice() {
				return aptPrice;
			}
			public void setAptPrice(int aptPrice) {
				this.aptPrice = aptPrice;
			}
			public int getFloor() {
				return floor;
			}
			public void setFloor(int floor) {
				this.floor = floor;
			}
			public int getBuiltYear() {
				return builtYear;
			}
			public void setBuiltYear(int builtYear) {
				this.builtYear = builtYear;
			}
			public String getAddressName() {
				return addressName;
			}
			public void setAddressName(String addressName) {
				this.addressName = addressName;
			}
			
			

	
	
}
