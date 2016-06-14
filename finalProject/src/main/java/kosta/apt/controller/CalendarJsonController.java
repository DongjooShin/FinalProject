package kosta.apt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.apt.domain.calendar.Calendar;
import kosta.apt.domain.member.Member;
import kosta.apt.service.CalendarService;

@RestController
public class CalendarJsonController {

	
	@Autowired
	private CalendarService service;
	
	@RequestMapping("/list")
	public List<Calendar> listCalendar(HttpSession session){
		Member m=(Member) session.getAttribute("member");
		
		return service.listCalendar(m);
	}
}
