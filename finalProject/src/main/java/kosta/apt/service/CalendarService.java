package kosta.apt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.apt.domain.calendar.Calendar;
import kosta.apt.domain.member.Member;
import kosta.apt.persistence.CalendarDao;

@Service
public class CalendarService {
	private CalendarDao calendarDao;
	
	@Autowired
	public void setCalendarDao(CalendarDao calendarDao) {
		this.calendarDao = calendarDao;
	}
	
	public void calendarInsert(Calendar calendar){
		calendarDao.insertCal(calendar);
	}

	public void calendarDelete(Calendar calendar) {
		System.out.println("calendar service=>"+calendar.toString());
		calendarDao.deleteCal(calendar);
		
	}
	

	public List<Calendar> listCalendar(Member m) {
		// TODO Auto-generated method stub
		return calendarDao.listCalendar(m);
	}
	
	public List<Calendar> calendarDday(Calendar calendar) {
		// TODO Auto-generated method stub
		return calendarDao.calendarDday(calendar);
	}

	public List<Calendar> calendarDday1(Calendar calendar) {
		return calendarDao.calendarDday1(calendar);
		
	}

	public List<Calendar> calendarDday2(Calendar calendar) {
		// TODO Auto-generated method stub
		return calendarDao.calendarDday2(calendar);
	}

	public List<Calendar> calendarDday3(Calendar calendar) {
		// TODO Auto-generated method stub
		return calendarDao.calendarDday3(calendar);
	}

	
}