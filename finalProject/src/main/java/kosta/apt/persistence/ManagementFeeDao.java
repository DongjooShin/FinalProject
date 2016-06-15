package kosta.apt.persistence;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.apt.domain.management.ManagementFee;
import kosta.apt.domain.management.ManagementFeePay;
import kosta.apt.domain.member.Member;
import kosta.apt.mapper.ManagementFeeMapper;

@Repository
public class ManagementFeeDao {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<Member> selectMember(int buildingNo, int roomNo) {
		//System.out.println(buildingNo +"/"+ roomNo);
		return sqlSession.getMapper(ManagementFeeMapper.class).selectMember(buildingNo, roomNo);
	}

	public void managementFeeInsert(HashMap<String, ManagementFee> map1, HashMap<String, String> map2) {
		sqlSession.getMapper(ManagementFeeMapper.class).managementFeeInsert(map1, map2);
	}

	public List<ManagementFee> selectManagementFee(String m_memberNo) {
		return sqlSession.getMapper(ManagementFeeMapper.class).selectManagementFee(m_memberNo);
	}

	public List<ManagementFee> select2MonthManagementFee(String mf_date, String m_memberNo) {
		int intmf_date = Integer.parseInt(mf_date);
		String lastMf_date = Integer.toString(intmf_date-1);
		System.out.println(mf_date+"//"+lastMf_date+"//"+m_memberNo);
		return sqlSession.getMapper(ManagementFeeMapper.class).select2MonthManagementFee(mf_date, lastMf_date, m_memberNo);
	}

	public List selectManagementFeeAvg(String m_memberNo) {
		return sqlSession.getMapper(ManagementFeeMapper.class).selectManagementFeeAvg(m_memberNo);
	}

	public List<ManagementFee> selectMonthManagementFee(String m_memberNo) {
		  Calendar calendar = new GregorianCalendar(Locale.KOREA);
	       String day= "";
	       day += calendar.get(Calendar.YEAR);
	       int   month = calendar.get(Calendar.MONTH);
	       month++;
	       if(month<10){
	          day +="0"+month;
	       }else{
	          day += month;
	       }
	       Map<String, String> map = new HashMap<String, String>();
	       
	       map.put("mf_date", day);
	       map.put("m_memberNo", m_memberNo);
	       return  sqlSession.getMapper(ManagementFeeMapper.class).selectMonthManagementFee(map);
	   }

	public void insertManagementFeePay(ManagementFeePay mngFeePay) {
		sqlSession.getMapper(ManagementFeeMapper.class).insertManagementFeePay(mngFeePay);
	}

	public List<ManagementFeePay> selectMangementAmountCheck(int apt_APTGNo) {
		return sqlSession.getMapper(ManagementFeeMapper.class).selectMangementAmountCheck(apt_APTGNo);
	}


	public void updateManagementFeePay(ManagementFeePay mngFeePay) {
		sqlSession.getMapper(ManagementFeeMapper.class).updateManagementFeePay(mngFeePay);
	}
	
	
}
