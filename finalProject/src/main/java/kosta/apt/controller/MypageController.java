package kosta.apt.controller;

import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.apt.domain.calendar.Calendar;
import kosta.apt.domain.member.Member;
import kosta.apt.service.CalendarService;
import kosta.apt.service.GroupNoticeService;

@Controller
public class MypageController {
	private GroupNoticeService gnService;
	

	private CalendarService service;

	@Autowired
	public void setService(CalendarService service) {
		this.service = service;
	}
	@Autowired
	public void setGnService(GroupNoticeService gnService) {
		this.gnService = gnService;
	}
	// 관리자인지 맴버인지 확인후 페이지 경로 결정
	// 지금은 확인불가능해서 맴버로 결정
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String SelectMypage(HttpSession session, Model model, HttpServletRequest request, RedirectAttributes attr) {

		Member member = (Member) session.getAttribute("member");

		attr.addFlashAttribute("loginOn", 1);
		int memberGrade = member.getM_grade();
		if (memberGrade >= 0) {

			if (memberGrade == 1) { // 일반 사용자
				return "redirect:/mypage/userMypage";
			} else if (memberGrade == 2) { // 관리소
				return "redirect:/mypage/managerMypage";
			} else if (memberGrade == 3) { // 입주자 대표
				return "redirect:/mypage/userMypage";
			} else if (memberGrade == 4) {// 동대표
				return "redirect:/mypage/userMypage";
			} else {// 사이트 관리자
				return "redirect:/mypage/siteManagerMypage";
			}

		}
		return "redirect:/";

	}

	@RequestMapping(value = "/mypage/userMypage", method = RequestMethod.GET)
	public void userMypageGet(Calendar calendar, HttpSession session, Model model) {

		System.out.println("calendar Controller 들어옴fffff");
		Member m = (Member) session.getAttribute("member");
		int aptNum = m.getApt_APTGNo();

		// 현재날짜
		java.util.Calendar cal = java.util.Calendar.getInstance();
		SimpleDateFormat d_format = new SimpleDateFormat("yyyy-MM-dd");
		String str = d_format.format(cal.getTime());

		// 1일후
		cal.add(java.util.Calendar.DAY_OF_YEAR, 1);
		String strDate = d_format.format(cal.getTime());
		//System.out.println("strDate=>>>>>>> " + strDate);

		// 2일후
		cal.add(java.util.Calendar.DAY_OF_YEAR, 1);
		String strDate2 = d_format.format(cal.getTime());
		//System.out.println("strDate2222222=>>>>>>> " + strDate2);

		// 3일후
		cal.add(java.util.Calendar.DAY_OF_YEAR, 1);
		String strDate3 = d_format.format(cal.getTime());
		//System.out.println("strDate333=>>>>>>> " + strDate3);

		//System.out.println("현재날짜: str:=>" + str);
		calendar.setApt_APTGNo(aptNum);
		calendar.setC_Dday(str);
		model.addAttribute("nowlist", service.calendarDday(calendar));
		calendar.setC_Dday1(strDate);
		model.addAttribute("list", service.calendarDday1(calendar));
		calendar.setC_Dday2(strDate2);
		model.addAttribute("list2", service.calendarDday2(calendar));
		calendar.setC_Dday3(strDate3);
		model.addAttribute("list3", service.calendarDday3(calendar));
		
		
		model.addAttribute("newlist",gnService.newlist(aptNum));

	}

	@RequestMapping(value = "/mypage/managerMypage", method = RequestMethod.GET)
	public void managerMypageGet(HttpSession session, Model model) {

	}

	@RequestMapping(value = "/mypage/siteManagerMypage", method = RequestMethod.GET)
	public void siteManagerMypageGet(HttpSession session, Model model) {

	}

	@RequestMapping(value = "/mypage/maessage", method = RequestMethod.GET)
	public void maessageGet(HttpSession session, Model model, RedirectAttributes rttr) {

	}
	
	@RequestMapping(value = "/passwordCheck", method = RequestMethod.GET)
	public void passwordCheckGet(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("member");

		model.addAttribute("id", member.getM_memberNo());
		model.addAttribute("password", member.getM_pass());

	}

}
