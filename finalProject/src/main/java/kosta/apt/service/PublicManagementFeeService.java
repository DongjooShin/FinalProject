package kosta.apt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.apt.domain.management.ManagementFeePay;
import kosta.apt.domain.member.Member;
import kosta.apt.domain.publicmanage.PublicManagementFee;
import kosta.apt.persistence.PublicManagementFeeDao;

@Service
public class PublicManagementFeeService {
	
	private PublicManagementFeeDao dao;

	@Autowired
	public void setDao(PublicManagementFeeDao dao) {
		this.dao = dao;
	}

	public void publicManagementFeeInsert(PublicManagementFee publicManagementFee) {
		dao.publicManagementFeeInsert(publicManagementFee);
	}

	public List<PublicManagementFee> select2MonthPublicManagementFee(String mf_date, int apt_APTGNo) {
		System.out.println(mf_date+"/"+apt_APTGNo);
		Map<String, String> map1 = new HashMap<String, String>();
		Map<String, Integer> map2 = new HashMap<String, Integer>();
		map1.put("mf_date", mf_date);
		map2.put("apt_APTGno", apt_APTGNo);
		return dao.select2MonthPublicManagementFee(map1, map2);
	}
	public List<PublicManagementFee> selectMonthPublicManagementFee(int apt_APTGNo) {
		return dao.selectMonthPublicManagementFee(apt_APTGNo);
	}
	
	public List selectPublicManagementFee(int apt_APTGno) {
		return dao.selectPublicManagementFee(apt_APTGno);
	}

	public List<Member> selectMemberList(int apt_APTGNo) {
		return dao.selectMemberList(apt_APTGNo);
	}

	public List<Member> selectNoAleadyMemberList(String m_buildingNo, String m_roomNo, int apt_APTGNo) {
		return dao.selectNoAleadyMemberList(m_buildingNo, m_roomNo, apt_APTGNo);
	}

	public List<ManagementFeePay> selectPublicAmount(int apt_APTGNo) {
		// TODO Auto-generated method stub
		return dao.selectPublicAmount(apt_APTGNo);
	}

	public void updatePublicManagementFeePay(int p_publicAmount, int apt_APTGNo) {
		// TODO Auto-generated method stub
		dao.updatePublicManagementFeePay(p_publicAmount, apt_APTGNo);
	}

	public void insertPublicManagementFeePay(ManagementFeePay managementFeePay) {
		dao.insertPublicManagementFeePay(managementFeePay);
	}
	
	
	
}
