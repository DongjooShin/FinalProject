package kosta.apt.controller;



import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kosta.apt.domain.calendar.Calendar;
import kosta.apt.domain.member.Member;
import kosta.apt.service.CalendarService;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {
	private CalendarService service;
	
	@Autowired
	public void setService(CalendarService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/calendar" ,method=RequestMethod.GET)
	public String calendar(HttpSession session, Model model){
		Member member = (Member) session.getAttribute("member");
		String aptName = service.getAptNameService(member.getApt_APTGNo());
		model.addAttribute("aptName", aptName);
		return "/calendar/main";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addplaneGET(Calendar calendar)throws Exception{
		System.out.println("get 컨트롤러 들어옴");
		return "/calendar/main";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String addplanePOST(Calendar calendar,HttpSession session)throws Exception{
		System.out.println("add calendar 컨트롤러 넘어옴!!!");
		Member m=(Member) session.getAttribute("member");
		int aptNum=m.getApt_APTGNo();
		calendar.setApt_APTGNo(aptNum);
		
		service.calendarInsert(calendar);
		return "/calendar/main";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deletePost(Calendar calendar,HttpSession session)throws Exception{
		System.out.println("delete calendar 컨트롤러 넘어옴!!!");
		
		Member m=(Member) session.getAttribute("member");
		int aptNum=m.getApt_APTGNo();
		calendar.setApt_APTGNo(aptNum);
		
		System.out.println("calendar controller=>"+calendar.toString());
		service.calendarDelete(calendar);
		return "/calendar/main";
	}

	@RequestMapping(value="/exam" ,method=RequestMethod.GET)
	public void calendarD_day(Calendar calendar,HttpSession session,Model model){
		System.out.println("calendar Controller 들어옴");
		Member m=(Member) session.getAttribute("member");
		int aptNum=m.getApt_APTGNo();
		
		//현재날짜
		java.util.Calendar cal=java.util.Calendar.getInstance();
		SimpleDateFormat d_format=new SimpleDateFormat("yyyy-MM-dd");
		String str=d_format.format(cal.getTime());
		
		//1일후
		cal.add(java.util.Calendar.DAY_OF_YEAR, 1);
		String strDate=d_format.format(cal.getTime());
		System.out.println("strDate=>>>>>>> "+strDate);
		
		//2일후
		cal.add(java.util.Calendar.DAY_OF_YEAR, 1);
		String strDate2=d_format.format(cal.getTime());
		System.out.println("strDate2222222=>>>>>>> "+strDate2);
		
		//3일후
		cal.add(java.util.Calendar.DAY_OF_YEAR, 1);
		String strDate3=d_format.format(cal.getTime());
		System.out.println("strDate333=>>>>>>> "+strDate3);
		
		System.out.println("현재날짜: str:=>"+str);
		calendar.setApt_APTGNo(aptNum);
		calendar.setC_Dday(str);
		model.addAttribute("nowlist", service.calendarDday(calendar));
		calendar.setC_Dday1(strDate);
		model.addAttribute("list", service.calendarDday1(calendar));
		calendar.setC_Dday2(strDate2);
		model.addAttribute("list2", service.calendarDday2(calendar));
		calendar.setC_Dday3(strDate3);
		model.addAttribute("list3", service.calendarDday3(calendar));
		
		
	}
	
}
