package kosta.apt.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kosta.apt.domain.management.ManagementFee;
import kosta.apt.domain.management.ManagementFeePay;
import kosta.apt.domain.member.Member;

public interface ManagementFeeMapper {

	public List<Member> selectMember(int buildingNo, int roomNo);
	void managementFeeInsert(HashMap<String, ManagementFee> map1, HashMap<String, String> map2);
	public List<ManagementFee> selectManagementFee(String m_memberNo, String mf_date);
	public List<ManagementFee> select2MonthManagementFee(String mf_date, String lastMf_date, String m_memberNo);
	public List selectManagementFeeAvg(String m_memberNo, String mf_date);
	public List<ManagementFee> selectMonthManagementFee(Map<String, String> map);
	public void insertManagementFeePay(ManagementFeePay mngFeePay);
	public List<ManagementFeePay> selectMangementAmountCheck(int apt_APTGNo);
	public void updateManagementFeePay(ManagementFeePay mngFeePay);
	
}
