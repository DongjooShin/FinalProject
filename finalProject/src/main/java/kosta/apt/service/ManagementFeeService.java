package kosta.apt.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.apt.domain.management.ManagementFee;
import kosta.apt.domain.management.ManagementFeePay;
import kosta.apt.domain.member.Member;
import kosta.apt.persistence.ManagementFeeDao;

@Service
public class ManagementFeeService {
	private ManagementFeeDao dao;

	@Autowired
	public void setDao(ManagementFeeDao dao) {
		this.dao = dao;
	}
	
	public List<Member>selectMember(int buildingNo, int roomNo) {
		List<Member> list = dao.selectMember(buildingNo, roomNo);;
		return list;
	}
	
	public void managementFeeInsert(HashMap<String, ManagementFee> map1, HashMap<String, String> map2) {
		dao.managementFeeInsert(map1, map2);
	}

	public List<ManagementFee> selectManagementFee(String m_memberNo, String mf_date) {
		return dao.selectManagementFee(m_memberNo, mf_date);
	}


	public List<ManagementFee> select2MonthManagementFee(String mf_date, String m_memberNo) {
		return dao.select2MonthManagementFee(mf_date, m_memberNo);
	}

	public List selectManagementFeeAvg(String m_memberNo, String mf_date) {
		return dao.selectManagementFeeAvg(m_memberNo, mf_date);
	}

	public List<ManagementFee> selectMonthManagementFee(String m_memberNo) {
		return dao.selectMonthManagementFee(m_memberNo);
	}

	public void insertManagementFeePay(ManagementFeePay mngFeePay) {
		dao.insertManagementFeePay(mngFeePay);
	}

	public List<ManagementFeePay> selectMangementAmountCheck(int apt_APTGNo) {
		return dao.selectMangementAmountCheck(apt_APTGNo);
	}

	public void updateManagementFeePay(ManagementFeePay mngFeePay) {
		dao.updateManagementFeePay(mngFeePay);
	}



	
	
	
}
