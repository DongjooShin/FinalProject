package kosta.apt.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.apt.domain.management.ManagementFeePay;
import kosta.apt.domain.member.Member;
import kosta.apt.domain.publicmanage.PublicManagementFee;
import kosta.apt.mapper.PublicManagementFeeMapper;

@Repository
public class PublicManagementFeeDao {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void publicManagementFeeInsert(PublicManagementFee publicManagementFee) {
		sqlSession.getMapper(PublicManagementFeeMapper.class).publicManagementFeeInsert(publicManagementFee);
	}

	public List<PublicManagementFee> select2MonthPublicManagementFee(Map<String, String> map1, Map<String, Integer> map2) {
		System.out.println(map1.values());
		System.out.println(map2.values());
		return sqlSession.getMapper(PublicManagementFeeMapper.class).select2MonthPublicManagementFee(map1, map2);
	}

	public List selectPublicManagementFee(int apt_APTGno) {
		return sqlSession.getMapper(PublicManagementFeeMapper.class).selectPublicManagementFee(apt_APTGno);
	}

	public List<PublicManagementFee> selectMonthPublicManagementFee(int apt_APTGNo) {
		return sqlSession.getMapper(PublicManagementFeeMapper.class).selectMonthPublicManagementFee(apt_APTGNo);
	}

	public List<Member> selectMemberList(int apt_APTGNo) {
		return sqlSession.getMapper(PublicManagementFeeMapper.class).selectMemberList(apt_APTGNo);
	}

	public List<Member> selectNoAleadyMemberList(String m_buildingNo, String m_roomNo, int apt_APTGNo) {
		return sqlSession.getMapper(PublicManagementFeeMapper.class).selectNoAleadyMemberList(m_buildingNo, m_roomNo, apt_APTGNo);
	}

	public List<ManagementFeePay> selectPublicAmount(int apt_APTGNo) {
		// TODO Auto-generated method stub
		return  sqlSession.getMapper(PublicManagementFeeMapper.class).selectPublicAmount(apt_APTGNo);
	}

	public void updatePublicManagementFeePay(int p_publicAmount, int apt_APTGNo) {
		// TODO Auto-generated method stub
		sqlSession.getMapper(PublicManagementFeeMapper.class).updatePublicManagementFeePay(p_publicAmount, apt_APTGNo);
	}

	public void insertPublicManagementFeePay(ManagementFeePay managementFeePay) {
		sqlSession.getMapper(PublicManagementFeeMapper.class).insertPublicManagementFeePay(managementFeePay);
	}
	
	
}
