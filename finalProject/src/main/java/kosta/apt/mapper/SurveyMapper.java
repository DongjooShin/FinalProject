package kosta.apt.mapper;

import java.util.List;

import kosta.apt.domain.Survey.Survey;
import kosta.apt.domain.Survey.SurveyDB;

public interface SurveyMapper {

	
	public Integer updategroup();

	public Integer updateSurveyGru();

	public int insertSurveyDB(SurveyDB surveyDB);

	public int insertSurvey(Survey survey);

	public List<SurveyDB> surveystart(int date22);

	public List<Survey> surveyList(int groupNum);

	public void inputSurCount(Survey survey);

	public List<SurveyDB> surveyResultTitle(SurveyDB surveyDB);

	public int surveyScoreSum(Integer sugroup);

	public int surveyCountSum(Integer sugroup);

	public List<SurveyDB> surveySelectDay(SurveyDB surveyDB);

	public List<Survey> surveyDetail(Integer sugroup);

	

}
