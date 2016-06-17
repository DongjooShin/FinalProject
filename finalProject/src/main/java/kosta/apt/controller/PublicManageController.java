package kosta.apt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.apt.domain.management.ManagementFee;
import kosta.apt.domain.member.Member;
import kosta.apt.domain.publicmanage.PublicManagementFee;
import kosta.apt.service.PublicManageService;

@Controller
@RequestMapping("/publicmana")
public class PublicManageController {

	@Autowired
	private PublicManageService service;
	
	//달별
	@RequestMapping("/PublicManageFee")
	public String publicManage(Model model,HttpSession session){
		Member m = (Member)session.getAttribute("member");
		List<PublicManagementFee> list =service.selectMonthPublicmanage(m.getApt_APTGNo());
		model.addAttribute("p", list.get(0));
		model.addAttribute("p2", list.get(1));
		
		
		return "/publicManagementFee/publicmanagementfee";
	}

	
	//엑셀
	@RequestMapping("/getExcel")
	public String getExcel(Model model,RedirectAttributes attr,HttpServletResponse response,HttpSession session){
		Member m = (Memgber)session.getAttribute("member");

		response.setHeader("Content-Disposition", "attachment; filename=getexcel.xls");
		response.setHeader("Content-Description", "JSP Generated Data");
	List<PublicManagementFee> list =	service.selectPublicmanage(m.getApt_APTGNo());
	model.addAttribute("list", list);
		
		return "/publicManagementFee/getExcel";
	}
	
	//달별엑셀
	@RequestMapping("/getMonthExcel")
	public String getMonthExcel(Model model,RedirectAttributes attr,HttpServletResponse response,HttpSession session){
		Member m = (Member)session.getAttribute("member");
		
		response.setHeader("Content-Disposition", "attachment; filename=getMonthExcel.xls");
		response.setHeader("Content-Description", "JSP Generated Data");
		List<PublicManagementFee> list =	service.selectMonthPublicmanage(m.getApt_APTGNo());
		model.addAttribute("list", list);
		
		return "/publicManagementFee/getMonthExcel";
	}
	
	
	//임시 결산 컨트롤러 url
	@RequestMapping("/appropia")
	public String appropriation(Model model,HttpSession session){
		Member member =(Member) session.getAttribute("member");
		List<PublicManagementFee> list = service.getappropriation(member.getApt_APTGNo());
		model.addAttribute("p", list.get(0));
		model.addAttribute("p2", list.get(1));
		
		return"/publicManagementFee/appropia";
	}
	//임시 결제 컨트롤러 url
	
	
	@RequestMapping("/aa")
	public String aa(Model model,HttpSession session){
/*		Member m = (Member)session.getAttribute("member");
		List<PublicManagementFee> list =service.selectMonthPublicmanage(m.getApt_APTGNo());
		List<ManagementFee> list2 = service.selectMonthmanage(m.getM_memberNo());
		model.addAttribute("p", list.get(0));
		model.addAttribute("p2", list2.get(0));*/
		return"/publicManagementFee/aa";
	}
	
	
}
