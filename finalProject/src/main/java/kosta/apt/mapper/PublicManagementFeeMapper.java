package kosta.apt.mapper;

import java.util.List;
import java.util.Map;

import kosta.apt.domain.management.ManagementFeePay;
import kosta.apt.domain.member.Member;
import kosta.apt.domain.publicmanage.PublicManagementFee;

public interface PublicManagementFeeMapper {

	void publicManagementFeeInsert(PublicManagementFee publicManagementFee);
	List<PublicManagementFee> select2MonthPublicManagementFee(Map<String, String> map1, Map<String, Integer> map2);
	//List selectPublicManagementFee(int apt_APTGno);
	List selectPublicManagementFee(Map<String, Integer> map1, Map<String, String> map2);
	List<PublicManagementFee> selectMonthPublicManagementFee(int apt_APTGNo);
	List<Member> selectMemberList(int apt_APTGNo);
	List<Member> selectNoAleadyMemberList(String m_buildingNo, String m_roomNo, int apt_APTGNo);
	List<ManagementFeePay> selectPublicAmount(int apt_APTGNo);
	void updatePublicManagementFeePay(int p_publicAmount, int apt_APTGNo);
	void insertPublicManagementFeePay(ManagementFeePay managementFeePay);
	

}
