package kosta.apt.mapper;

import java.util.List;

import kosta.apt.domain.calendar.Calendar;



public interface CalMapper {

	int insertCal(Calendar calendar);

	public List<Calendar> listCalendar(int aptGroupNum);

	int calendarDel(Calendar calendar);
	
	public List<Calendar> calendarDday(Calendar calendar);

	public List<Calendar> calendarDday1(Calendar calendar);

	public List<Calendar> calendarDday2(Calendar calendar);

	public List<Calendar> calendarDday3(Calendar calendar);

	

}
