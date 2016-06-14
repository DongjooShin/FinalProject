package kosta.apt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.apt.domain.facilityInfo.FacilityInfo;
import kosta.apt.domain.member.Member;
import kosta.apt.persistence.FacilityInfoDao;

@Service
public class FacilityInfoService {
	private FacilityInfoDao dao;
	
	@Autowired
	public void setDao(FacilityInfoDao dao) {
		this.dao = dao;
	}

	public FacilityInfo listFacilityInfo(int aptNum) {
		System.out.println("facility service 들어옴"+aptNum);
		return dao.listFacilityInfo(aptNum);
	}
	
	
	
}
