package kosta.apt.persistence;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.swing.GroupLayout.SequentialGroup;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.SystemPropertyUtils;

import kosta.apt.domain.Survey.Survey;
import kosta.apt.domain.Survey.SurveyDB;
import kosta.apt.mapper.SurveyMapper;

@Repository
public class SurveyDAO {

	private SqlSession sqlSession;


	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	public Integer updategroup() {
	
		if(sqlSession.getMapper(SurveyMapper.class).updategroup() ==null){
			
			return 1;
		}else{
			Integer num = sqlSession.getMapper(SurveyMapper.class).updategroup();
			
			return num;
		}
		
	}


	public int updateSurveyGru() {
		
		if(sqlSession.getMapper(SurveyMapper.class).updateSurveyGru()==null){
			
			return 0;
		}else{
			int num = sqlSession.getMapper(SurveyMapper.class).updateSurveyGru();
			
			return num;
		}
	
	}


	public int insertSurveyDB(SurveyDB surveyDB) {
		int re = -1;
		re = sqlSession.getMapper(SurveyMapper.class).insertSurveyDB(surveyDB);
		
		return re;
	}


	public int insertSurvey(Survey survey) {
		int re = -1;
		re= sqlSession.getMapper(SurveyMapper.class).insertSurvey(survey);
		
		return re;
		
	}


	public List<SurveyDB> surveystart(int sessionNum) {
		
		Calendar oCalendar = Calendar.getInstance( );
		 // 현재 날짜/시간 등의 각종 정보 얻기
		 String currentDate = "";
		 currentDate = Integer.toString(oCalendar.get(Calendar.YEAR));
		 currentDate += (oCalendar.get(Calendar.MONTH) + 1)>9 ? ""+Integer.toString(oCalendar.get(Calendar.MONTH) + 1) : '0'+Integer.toString(oCalendar.get(Calendar.MONTH) + 1);
		 currentDate += (oCalendar.get(Calendar.DAY_OF_MONTH))>9 ? ""+Integer.toString(oCalendar.get(Calendar.DAY_OF_MONTH)) : '0'+Integer.toString(oCalendar.get(Calendar.DAY_OF_MONTH));
			
		 // currentDate += Integer.toString(oCalendar.get(Calendar.DAY_OF_MONTH));
		
		 int date22 = Integer.parseInt(currentDate);
		 
		 System.out.println(date22+"현재날짜는?");
		 
		 HashMap<String, Integer> map = new HashMap<String, Integer>();
		 map.put("date22", date22);
			map.put("sessionNum", sessionNum);
				
		return sqlSession.getMapper(SurveyMapper.class).surveystart(map);
	}


	public List<Survey> surveyList(int groupNum) {
		
		return sqlSession.getMapper(SurveyMapper.class).surveyList(groupNum);
	}


	public void inputsurveyDB(Survey survey) {
		
		sqlSession.getMapper(SurveyMapper.class).inputSurCount(survey);
	
		
		
	}


	public List<SurveyDB> surveyResultTitle(SurveyDB surveyDB)throws Exception {
		List<SurveyDB> list = null;
		
		list = sqlSession.getMapper(SurveyMapper.class).surveyResultTitle(surveyDB);
		
		return list;
	}


	public int surveyScoreSum(Integer sugroup) {
	
		return sqlSession.getMapper(SurveyMapper.class).surveyScoreSum(sugroup);
	}


	public int surveyCountSum(Integer sugroup) {
	
		return sqlSession.getMapper(SurveyMapper.class).surveyCountSum(sugroup);
	}


	public List<SurveyDB> surveySelectDay(SurveyDB surveyDB) {
	
		return sqlSession.getMapper(SurveyMapper.class).surveySelectDay(surveyDB);
	}


	public List<Survey> surveyDetail(Integer sugroup) {
	
		return sqlSession.getMapper(SurveyMapper.class).surveyDetail(sugroup);
	}
	
	
	
}
