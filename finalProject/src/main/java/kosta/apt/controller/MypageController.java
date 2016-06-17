package kosta.apt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.apt.domain.Message.Message;
import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Paging.PageMaker;
import kosta.apt.domain.member.Member;
import kosta.apt.service.MessageService;


@Controller
public class MypageController {
	

	private MessageService messageService;

	@Autowired
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	


	// 관리자인지 맴버인지 확인후 페이지 경로 결정
	// 지금은 확인불가능해서 맴버로 결정
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String SelectMypage(HttpSession session, Model model,HttpServletRequest request,RedirectAttributes attr) {
		
		Member member = (Member) session.getAttribute("member");
		  

		//model.addAttribute("loginOn", 1);    
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
	public void userMypageGet(HttpSession session, Model model) {
		
		
		
		
		

	}
	
	@RequestMapping(value = "/mypage/managerMypage", method = RequestMethod.GET)
	public void managerMypageGet(HttpSession session, Model model) {

	}	
	
	@RequestMapping(value = "/mypage/siteManagerMypage", method = RequestMethod.GET)
	public void siteManagerMypageGet(HttpSession session, Model model) {

	}
	
	
	
	
	
}
