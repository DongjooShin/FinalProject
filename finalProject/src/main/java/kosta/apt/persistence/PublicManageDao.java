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
import kosta.apt.domain.publicmanage.PublicManagementFee;



@Repository
public class PublicManageDao {

	
	@Autowired
	private SqlSession sqlSession;//세션테플레이트 생성
	
	private final static String namespace ="apt.mapper.Management";
	
	public List<PublicManagementFee> selectMonthPublicmanage(Integer aptgno){
		
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
		 Map<String, Object> map = new HashMap<>();
		 
		 map.put("day", day);
		 map.put("aptgno", aptgno);
		 return 
				 sqlSession.selectList(namespace+".selectMonthPublicmanage", map);
	}
	public List<PublicManagementFee> selectPublicmanage(int aptgno){
		 Calendar calendar = new GregorianCalendar(Locale.KOREA);
		
		String day = Integer.toString(calendar.get(Calendar.YEAR));
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("apt_aptgno", aptgno);
		map.put("day", day);
		
		return sqlSession.selectList(namespace+".selectPublicmanage",map);
	}
	public List<PublicManagementFee> MonthManageFee(int aptgno) {
		// TODO Auto-generated method stub
		
		
		return sqlSession.selectList(namespace+".MonthManageFee",aptgno);
	}
	public List<PublicManagementFee> appropriation(int aptgno) {
		// TODO Auto-generated method stub
		 Calendar calendar = new GregorianCalendar(Locale.KOREA);
		 String day= "";
		 day += calendar.get(Calendar.YEAR);
		 Map<String, Object> map = new HashMap<>();
		 
		 map.put("day", day);
		 map.put("aptgno", aptgno);
		
		 return  sqlSession.selectList(namespace+".appropriation",map);
	}
	public List<ManagementFee> DataAppropriation(int aptgno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".DataAppropriation", aptgno);
	}
	public List<PublicManagementFee> getCityGraph(int apt_APTGNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getCityGraph", apt_APTGNo);
	}
	public List<PublicManagementFee> getContry(int apt_APTGNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getContry",apt_APTGNo);
	}
	public List<PublicManagementFee> myManageFee(int apt_APTGNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".myManageFee", apt_APTGNo);
		
	}
	public List<ManagementFee> selectMonthmanage(String m_memberNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		
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
		 map.put("param1", day);
		 map.put("param2", m_memberNo);
		
		
		return  sqlSession.selectList(namespace+".selectMonthmanage", map);
	}
}
