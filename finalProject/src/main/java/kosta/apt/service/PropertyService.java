package kosta.apt.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Property.AptTransactionPrice;
import kosta.apt.domain.Property.Property;
import kosta.apt.persistence.PropertyDAO;

@Service
public class PropertyService {

	private PropertyDAO proDao;
	
	@Autowired
	public void setProDao(PropertyDAO proDao) {
		this.proDao = proDao;
	}
	
	
	public void APTSaleInsert(Property property){
		proDao.APTSaleInsert(property);
	}


	public List<Property> APTlist() {
		List<Property> list = null;
		list = proDao.APTlist();
		return list;
	}


	public int selectPr_id() {
	
		return proDao.selectPr_id();
			
	}


	public void insertAPTsale(Property property) {
		
		proDao.insertAPTsale(property);
		
	}


	public List<Property> aptlist(Property property, Criteria cri) {
		
		return proDao.aptlist(property,cri);

	}


	public int listCountCri(Criteria cri) {
	
		return proDao.listCountCri(cri);
	}


	public Property aptSaledetail(int pr_propertyNo) {
		// TODO Auto-generated method stub
		return proDao.aptSaledetail(pr_propertyNo);
	}


	public void aptUpdate(Property property) {
		
		proDao.aptUpdate(property);
		
	}


	public void aptDelete(int pr_propertyNo) {
		
		proDao.aptDelete(pr_propertyNo);
	}


	public List<AptTransactionPrice> getAptAddrService(int aptNum) {
		HashMap<String, String> map = new HashMap<String, String>();
		String addr = proDao.getAptAddr(aptNum);
		String aptName = proDao.getAptName(aptNum);
		System.out.println(aptName);
		String addrSe[] = new String[4];
		addrSe =addr.split(" ");
		addr = addrSe[0]+"도 "+addrSe[1]+" "+addrSe[2]+"%";
		/*
		map.put("f_addr", addr);
		map.put("f_groupName", aptName);*/
	map.put("f_addr", " 서울특별시 강남구 역삼동");
		map.put("f_groupName", "대우디오빌");
		List<AptTransactionPrice> list = proDao.getRealTransaction(map);
		
		return list;
	}


	public List<AptTransactionPrice> getAptTransactionService(String address) {
		
		return proDao.getAptTransaction(address);
	}


	
}

