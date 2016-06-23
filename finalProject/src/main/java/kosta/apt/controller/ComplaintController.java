package kosta.apt.controller;

import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Paging.PageMaker;
import kosta.apt.domain.Paging.SearchCriteria;
import kosta.apt.domain.complaint.Complaint;
import kosta.apt.domain.complaint.Reply;
import kosta.apt.domain.member.Member;
import kosta.apt.service.ComplaintService;

@Controller
@RequestMapping("/publicmana")
public class ComplaintController {
	
	
	@Autowired
	private	ComplaintService service;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET )
	public String List(@ModelAttribute("cri") SearchCriteria cri,Model model,HttpSession session,HttpServletRequest request){
		model.addAttribute("member",(Member)session.getAttribute("member"));
		   model.addAttribute("list", service.listSearchCriteria(cri));
		   String keyword = request.getParameter("keyword");
		   if(keyword !=null){
			   
			   System.out.println(keyword);
		   }
		   PageMaker pagemaker = new PageMaker();
		   pagemaker.setCri(cri);
		   pagemaker.setTotalCount(service.listSearchCount(cri));
		   model.addAttribute("pageMaker", pagemaker);
		   model.addAttribute("loginOn", 1);
		return "complaint/complaintList";
	}
	@RequestMapping(value = "/register", method = RequestMethod.GET )
	public String List(Model model,HttpSession session){
		
		Member member = (Member) session.getAttribute("member");
		model.addAttribute("member", member);
		model.addAttribute("loginOn", 1);
		return "complaint/ComplaintRegister";
	}
	@RequestMapping(value = "/register", method = RequestMethod.POST )
	public String List(Complaint complaint,HttpSession session){
		System.out.println(complaint.toString());
		Member member = (Member) session.getAttribute("member");
		
		complaint.setM_memberNo(member.getM_memberNo());
		service.create(complaint);
		return "redirect:/publicmana/list";
	}
	
	   @RequestMapping(value="/readPage",method=RequestMethod.GET)
	   public String read(@RequestParam("cp_complaintNo") int cp_complaintNo,@ModelAttribute("cri") SearchCriteria cri , Model model,HttpSession session)throws Exception{
		
		   Member member = (Member)session.getAttribute("member");
		   model.addAttribute(member);
		   model.addAttribute(service.read(cp_complaintNo));
		   model.addAttribute("loginOn", 1);
		   
		   return "complaint/complaintReadPage";
	   }
	   
	   @RequestMapping(value="/modifyPage",method=RequestMethod.POST)
	   public String modifyPage(@ModelAttribute("cri") SearchCriteria cri,Complaint complaint){
		   service.update(complaint);
		   
		   return"redirect:/publicmana/list";
	   }
	   @RequestMapping("/removePage")
	   public String removePage(@RequestParam("cp_complaintNo") int cp_complaintNo){
		   service.delete(cp_complaintNo);
		   
		   return"redirect:/publicmana/list";
	   }
	   
	   @RequestMapping("/replies")
	   public ResponseEntity<String> getReply(@RequestBody Reply reply){
		   System.out.println("ddd");
		   ResponseEntity<String> entity=null;
		   int ref =1;
		   try {
			service.addReply(reply);
			service.addRef(ref,reply.getCp_complaintNo());
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		   return entity;
	   }
	   
	   
		@RequestMapping(value ="/replies/all/{cp_complaintNo}", method=RequestMethod.GET)
		public ResponseEntity<List<Reply>> list(@PathVariable("cp_complaintNo") Integer cp_complaintNo){ //객체를 JSON JSON을 객체를 반환한다. 
			ResponseEntity<List<Reply>> entity = null;
			System.out.println(service.listReply(cp_complaintNo));
			try {
				entity = new ResponseEntity<List<Reply>>(service.listReply(cp_complaintNo),HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return entity;
		}
		@RequestMapping(value ="/replies/{rno}", method= {RequestMethod.PUT,RequestMethod.PATCH})
		public ResponseEntity<String> update(@PathVariable("rno") int rno, @RequestBody Reply vo){
			ResponseEntity<String> entity = null;
			try {
				vo.setRno(rno);
				service.modifyReply(vo);
				
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				// TODO: handle exception
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			
			
			return entity;
		}
		
		@RequestMapping(value ="/replies/{rno}", method= RequestMethod.DELETE)
		public ResponseEntity<String> delete(@PathVariable("rno") int rno ,@RequestBody Reply reply){
			ResponseEntity<String> entity = null;
			int ref =-1;
			try {
				service.removeReply(rno);
				service.addRef(ref, reply.getCp_complaintNo());
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				// TODO: handle exception
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			
			
			return entity;
		}
		@RequestMapping(value="/replies/{cp_complaintNo}/{page}",method= RequestMethod.GET)
		public ResponseEntity<Map<String, Object>> listpage(@PathVariable("cp_complaintNo") int cp_complaintNo,@PathVariable("page") int page){
			
			ResponseEntity<Map<String, Object>> entity = null;
			
					
			try {
				Criteria cri = new Criteria();
				cri.setPage(page);
				
				PageMaker maker = new PageMaker();
				maker.setCri(cri);
				
				List<Reply> list = service.listReplyPage(cp_complaintNo, cri);
				Map<String, Object> map = new HashMap<>();
				
				map.put("list", list);
				
				int replyCount =service.count(cp_complaintNo);
				maker.setTotalCount(replyCount);
				
				map.put("pageMaker", maker);
				
				entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
				
			} catch (Exception e) {
				// TODO: handle exception
				entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
			}
			return entity;
			
		}
	   
}
