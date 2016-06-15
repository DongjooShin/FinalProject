package kosta.apt.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.apt.domain.Survey.Survey;
import kosta.apt.domain.Survey.SurveyDB;
import kosta.apt.persistence.SurveyDAO;

@Service
public class SurveyService {


	private SurveyDAO surDao;

	@Autowired
	public void setSurDao(SurveyDAO surDao) {
		this.surDao = surDao;
	}

	public Integer updategroup() {
		
		
		return surDao.updategroup();
	}

	public int updateSurveyGru() {
		
		
		return surDao.updateSurveyGru();
	}

	public void insertSurveyDB(SurveyDB surveyDB) {
		
		surDao.insertSurveyDB(surveyDB);
		
	}

	
	public void insertSurvey(Survey survey) {
		
		surDao.insertSurvey(survey);
		
	}

	public List<SurveyDB> surveystart() {
		
		return surDao.surveystart();
	}

	public List<Survey> surveyList(int groupNum) {
	
		return surDao.surveyList(groupNum);
		
	}

	public void inputsurveyDB(Survey survey) {
		
		surDao.inputsurveyDB(survey);
		
	}

	public List<SurveyDB> surveyResultTitle(SurveyDB surveyDB)throws Exception {
		
		return surDao.surveyResultTitle(surveyDB);
	}

	public int surveyScoreSum(Integer sugroup) {
	
		return surDao.surveyScoreSum(sugroup);
	}

	public int surveyCountSum(Integer sugroup) {
	
		return surDao.surveyCountSum(sugroup);
	}

	public List<SurveyDB> surveySelectDay(SurveyDB surveyDB) {
		
		return surDao.surveySelectDay(surveyDB);
	}

	public List<Survey> surveyDetail(Integer sugroup) {
	
		return surDao.surveyDetail(sugroup);
	}

	
	
	
}
