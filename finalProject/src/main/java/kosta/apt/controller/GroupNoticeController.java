package kosta.apt.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.apt.domain.GroupNotice.GNPageMaker;
import kosta.apt.domain.GroupNotice.GNSearchCriteria;
import kosta.apt.domain.GroupNotice.GroupNotice;
import kosta.apt.domain.member.Member;
import kosta.apt.persistence.GroupNDao;
import kosta.apt.service.GroupNoticeService;

@Controller
@RequestMapping("/groupNotice")
public class GroupNoticeController {
	private GroupNoticeService gnService;
/*	
	@Resource(name="uploadPath")
	private String uploadDir;
	*/
	@Autowired
	public void setGnService(GroupNoticeService gnService) {
		this.gnService = gnService;
	}
	
	
	
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String registerGET(GroupNotice gn)throws Exception{
		System.out.println("register page okkkk");
		return "/groupNotice/register";
		
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPOST(GroupNotice gn,HttpSession session,HttpServletRequest req)throws Exception{
		System.out.println("gn controller 들어옴!!!!"+gn.toString());
	      Member m=(Member) session.getAttribute("member");
	      int aptNum=m.getApt_APTGNo();
	      gn.setApt_APTGNo(aptNum);
	      gn.setM_memberNo(m.getM_memberNo());
	      System.out.println("controller gn=>"+gn.toString());
	      // 1.
	      MultipartFile multiPartFile = gn.getUploadFile();// file객체얻어옴(upload됨)
	      // 2.
	      if (!multiPartFile.isEmpty()) {
	         System.out.println("파일 있을때 들어오는 if");
	         System.out.println("if안 들어옴!!!!"+gn.toString());
	         String filename = multiPartFile.getOriginalFilename();// file의 실제이름 얻어옴
	         String uploadPath= req.getServletContext().getRealPath("/uploadGroupN/");
	         System.out.println("UPLOAD_PATH : "+uploadPath);
	                                                   
	         gn.setG_fileName(filename);// DB에 file이름 저장할수있음

	         multiPartFile.transferTo(new File(uploadPath, filename));// 파일을 업로드

	      }else{
	         System.out.println("else문 파일없을때 ");
	         gn.setG_fileName("파일없음!");
	      }
	      System.out.println("마지막 gn controller 마지막!!!!"+gn.toString());
	      gnService.regist(gn);
	      return "redirect:/groupNotice/listAll";
		}

	
	
	@RequestMapping(value="/exam",method=RequestMethod.GET)
	public void listAll(Model model,HttpSession session)throws Exception{
		System.out.println("exam들어옴");
		Member m=(Member) session.getAttribute("member");
		int aptNum=m.getApt_APTGNo();
		System.out.println("aptnum: "+aptNum);
		
		model.addAttribute("newlist",gnService.newlist(aptNum));
		
	}
	
	@RequestMapping(value="/listAll",method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")GNSearchCriteria cri,Model model,HttpSession session)throws Exception{//@ModelAttribute("cri")는 세부보기후 목록으로 갓을때도 목록을 볼수있게 그 리스트 값 넣음
		Member m=(Member) session.getAttribute("member");
		int aptNum=m.getApt_APTGNo();
		System.out.println("list All=>search 들어옴");
		//model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list",gnService.listSearchCriteria(cri,aptNum));
		
		GNPageMaker pageMaker=new GNPageMaker();
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(4);//총글갯수넣음
		pageMaker.setTotalCount(gnService.listSearchCount(cri,aptNum));//글의 총갯수 구하는 것
		model.addAttribute("pageMaker",pageMaker);
	}
	
	/*@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public void readPage(@RequestParam("bno")int bno,@ModelAttribute("cri")GNSearchCriteria cri,Model model)throws Exception{//@ModelAttribute("cri")는 세부보기후 목록으로 갓을때도 목록을 볼수있게 그 리스트 값 넣음
		model.addAttribute(gnService.read(bno));
		
	}*/
	
	
	@RequestMapping(value="/read",method=RequestMethod.GET)
	public void read(@RequestParam("g_groupNoticeNo")int g_groupNoticeNo,@ModelAttribute("cri")GNSearchCriteria cri,Model model)throws Exception{
		gnService.hitCount(g_groupNoticeNo);
		model.addAttribute("gn",gnService.read(g_groupNoticeNo));	
		
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public void modifyGET(int g_groupNoticeNo,Model model)throws Exception{
		System.out.println(g_groupNoticeNo);
		model.addAttribute("gn",gnService.read(g_groupNoticeNo));
		
	}
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyGET(GroupNotice gn,RedirectAttributes rttr)throws Exception{
		System.out.println("gn modify post controller 들어옴");
		System.out.println("객체내용"+gn.toString());
		gnService.modify(gn);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/groupNotice/listAll";
		
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String read(@RequestParam("g_groupNoticeNo")int g_groupNoticeNo)throws Exception{
		gnService.remove(g_groupNoticeNo);
		
		return "redirect:/groupNotice/listAll";
		
	}
	
	@RequestMapping("/groupNotice_download")
	   public ModelAndView fileDown(@RequestParam String filename,HttpServletRequest req)throws Exception{
	      
	      String uploadPath1= req.getServletContext().getRealPath("/uploadGroupN/");
	      System.out.println("UPLOAD_PATH : "+uploadPath1);
	      
	      String uploadPath=uploadPath1+"/";
	      System.out.println("UPLOAD_PATH 11111111111 : "+uploadPath1);
	      File file=new File(uploadPath, filename);//file객체구하기
	      
	      return new ModelAndView("GndownloadView","downloadFile",file);//뷰의이름,가져갈객체 키값,데이터값
	   }
}
