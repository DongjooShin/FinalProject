package kosta.apt.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kosta.apt.domain.Message.Message;
import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Paging.PageMaker;
import kosta.apt.domain.Property.Property;
import kosta.apt.domain.Property.PropertyImageUtil;
import kosta.apt.domain.member.RssReader;
import kosta.apt.service.PropertyService;

@Controller
@RequestMapping("/Property")
public class PropertyController {


	private PropertyService propertyService;

	
	@Autowired
	public void setPropertyService(PropertyService propertyService) {
		this.propertyService = propertyService;
	}
	
	@RequestMapping(value="/aptSale", method = RequestMethod.GET)
	public void aptSaleView(Model model){
	
		System.out.println("뷰로 이동하겠습니다.1");
		
	}
	
	
	@RequestMapping(value="/aptSale", method = RequestMethod.POST)
	public String aptInsert(HttpServletRequest request, Model model, @RequestParam("pr_propertyNo") int pr_propertyNo)throws Exception{
		System.out.println("여기로 왔다.");
	
		
	
		String uplodaPath = request.getRealPath("M_upload1");

		System.out.println(uplodaPath);
		int size = 20 * 1024 * 1024;
		
		Property property = new Property();
	
	
	
		MultipartRequest multi =
				new MultipartRequest(request, uplodaPath, size, "utf-8", new DefaultFileRenamePolicy());
		
		
		property.setPr_APTName(multi.getParameter("pr_APTName"));
		property.setPr_addr(multi.getParameter("pr_addr"));
		property.setPr_tel(multi.getParameter("pr_tel1")+"-"+multi.getParameter("pr_tel2")+"-"+multi.getParameter("pr_tel3"));
		property.setPr_doorStruct(multi.getParameter("pr_doorStruct"));
		property.setPr_company(multi.getParameter("pr_company"));
		property.setPr_imageName(multi.getParameter("pr_imageName"));
		property.setPr_content(multi.getParameter("pr_content"));
		property.setPr_group(multi.getParameter("1"));
		property.setM_memberNo(multi.getParameter("1"));
	
		property.setPr_group("1");
		property.setM_memberNo("1");
		
		
		System.out.println(property.getM_memberNo()+"서비스의 넘번호입니다.");
		// 세션값 넣어야되property.setPr_propertyNo(Integer.parseInt(multi.getParameter("pr_propertyNo")));
		
	
		property.setPr_price(Integer.parseInt(multi.getParameter("pr_price")));
		property.setPr_deposit(Integer.parseInt(multi.getParameter("pr_deposit")));
		property.setPr_level(Integer.parseInt(multi.getParameter("pr_level")));
		property.setPr_totalLevel(Integer.parseInt(multi.getParameter("pr_totalLevel")));
		property.setPr_roomNum(Integer.parseInt(multi.getParameter("pr_roomNum")));
		property.setPr_bathNum(Integer.parseInt(multi.getParameter("pr_bathNum")));
		property.setPr_roomArea(Integer.parseInt(multi.getParameter("pr_roomArea")));
		property.setPr_scale(Integer.parseInt(multi.getParameter("pr_scale")));

		
		if(multi.getFilesystemName("pr_imageName")!=null){
			
			String pr_imageName = multi.getFilesystemName("pr_imageName");
			
			property.setPr_imageName(pr_imageName);
			
			System.out.println(pr_imageName);
			
			
			String pattern = pr_imageName.substring(pr_imageName.lastIndexOf(".")+1);
			String headName = pr_imageName.substring(0, pr_imageName.lastIndexOf("."));
			
			System.out.println(pattern);
			System.out.println(headName);
			
			
			String imgPath = uplodaPath+"\\"+pr_imageName;
			File src = new File(imgPath);
			
			String thumImagePath = uplodaPath+"\\"+headName+"_small."+pattern;
			File dest = new File(thumImagePath);
			
			if(pattern.equals("jpg")|| pattern.equals("gif")){
			
				PropertyImageUtil.resize(src, dest, 100, PropertyImageUtil.RATIO);
			}
			
		}else{
			property.setPr_imageName("");
		}
		

		

		
		if(pr_propertyNo!=0){
			
			property.setPr_propertyNo(pr_propertyNo);
			
			propertyService.aptUpdate(property);
			
			return "redirect:/Property/aptSaleList";
			
		}else{
			
			
			property.setPr_propertyNo(propertyService.selectPr_id() + 1);
			
			
			propertyService.insertAPTsale(property);
			
			return "redirect:/Property/aptSaleList";
			
		}
		
		
		

	}
	
	
	//부동산 매물목록
	
	@RequestMapping(value = "/aptSaleList", method = RequestMethod.GET)
	public void aptSaleList(Model model, Property property, @ModelAttribute("cir") Criteria cri)throws Exception{
		
		List<Property> list = propertyService.aptlist(property, cri);
		
		System.out.println(list.size()+"부동산 매물정보 리스트크기이다.");
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(propertyService.listCountCri(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		
	}
	
	
	
	//부동산 매물 디테일
	
	@RequestMapping(value = "/aptSaledetail", method = RequestMethod.GET)
	public void aptSaledetail(@RequestParam("pr_propertyNo") int pr_propertyNo, Model model) throws Exception{
		
		System.out.println(pr_propertyNo+"부동산 매물번호");
		
		Property property = null;
		
		property = propertyService.aptSaledetail(pr_propertyNo);
		
		model.addAttribute("property", property);
		
	}
	
	
	@RequestMapping(value = "/aptUpdate", method = RequestMethod.GET)
	public String aptUpdate(@RequestParam("pr_propertyNo") int pr_propertyNo, RedirectAttributes rttr)throws Exception{
		
		
		//PropertyService.aptUpdate("pr_propertyNo");
		//POST로 가서 pr_propertyNo이있다면 if문써서  업데이트시키게만든다.
		
		rttr.addFlashAttribute("pr_propertyNo", pr_propertyNo);
	
		
		return "redirect:/Property/aptSale2?pr_propertyNo="+pr_propertyNo;
	}
	
	@RequestMapping(value="/aptSale2", method = RequestMethod.GET)
	public void aptSaleView2(@RequestParam("pr_propertyNo") int pr_propertyNo, Model model){
	
		System.out.println("뷰로 이동하겠습니다.1");
		
		if(pr_propertyNo!=0){
			
			Property property= propertyService.aptSaledetail(pr_propertyNo);
			
		//	String b = property.getPr_tel().substring(0,property.getPr_tel().lastIndexOf("-")-1);
		//	String c = property.getPr_tel().substring(property.getPr_tel().lastIndexOf("-")+1,property.getPr_tel().lastIndexOf("-")+1);
			model.addAttribute("property", property);
			
		}
		
		
		
	}
	
	
	
	
	
	@RequestMapping(value = "/aptDelete", method = RequestMethod.GET)
	public String aptDelete(@RequestParam("pr_propertyNo") int pr_propertyNo)throws Exception{
		
		
		propertyService.aptDelete(pr_propertyNo);
		
		return "redirect:/Property/aptSaleList";
		
	}
	
	
	/*
	//아파트 매물등록
	@RequestMapping(value="/aptSale", method = RequestMethod.POST)
	public void aptSale(@ModelAttribute("aptInsert") Property property, HttpServletRequest request, Model model	)throws Exception{

		String uplodaPath = request.getRealPath("M_upload1");
		
		System.out.println(uplodaPath);
		int size = 20 * 1024 * 1024;
		MultipartRequest multi =
				new MultipartRequest(request, uplodaPath, size, "utf-8", new DefaultFileRenamePolicy());
		
		property.setPr_APTName(multi.getParameter("pr_APTName"));
		property.setPr_addr(multi.getParameter("pr_addr"));
		property.setPr_tel(multi.getParameter("pr_tel1")+multi.getParameter("pr_tel2")+multi.getParameter("pr_tel3"));
		property.setPr_doorStruct(multi.getParameter("pr_doorStruct"));
		property.setPr_company(multi.getParameter("pr_company"));
		property.setPr_imageName(multi.getParameter("pr_imageName"));
		property.setPr_content(multi.getParameter("pr_content"));
		property.setPr_group(multi.getParameter("pr_group"));
		property.setM_memberNo(multi.getParameter("id"));
		
	//	System.out.println(property.getM_memberNo()+"서비스의 넘번호입니다.");
		property.setPr_propertyNo(Integer.parseInt(multi.getParameter("pr_propertyNo")));
	//	property.setPr_group(Integer.parseInt(multi.getParameter("pr_group")));
		
		property.setPr_price(Integer.parseInt(multi.getParameter("pr_price")));
		property.setPr_deposit(Integer.parseInt(multi.getParameter("pr_deposit")));
		property.setPr_level(Integer.parseInt(multi.getParameter("pr_level")));
		property.setPr_totalLevel(Integer.parseInt(multi.getParameter("pr_totalLevel")));
		property.setPr_roomNum(Integer.parseInt(multi.getParameter("pr_roomNum")));
		property.setPr_bathNum(Integer.parseInt(multi.getParameter("pr_bathNum")));
		property.setPr_roomArea(Integer.parseInt(multi.getParameter("pr_roomArea")));
		property.setPr_scale(Integer.parseInt(multi.getParameter("pr_scale")));

		
		if(multi.getFilesystemName("pr_imageName")!=null){
			
			String pr_imageName = multi.getFilesystemName("pr_imageName");
			
			property.setPr_imageName(pr_imageName);
			
			System.out.println(pr_imageName);
			
			
			String pattern = pr_imageName.substring(pr_imageName.lastIndexOf(".")+1);
			String headName = pr_imageName.substring(0, pr_imageName.lastIndexOf("."));
			
			System.out.println(pattern);
			System.out.println(headName);
			
			
			String imgPath = uplodaPath+"\\"+pr_imageName;
			File src = new File(imgPath);
			
			String thumImagePath = uplodaPath+"\\"+headName+"_small."+pattern;
			File dest = new File(thumImagePath);
			
			if(pattern.equals("jpg")|| pattern.equals("gif")){
			
				PropertyImageUtil.resize(src, dest, 100, PropertyImageUtil.RATIO);
			}
			
		}else{
			property.setPr_imageName("");
		}
		
		property.setPr_propertyNo(propertyService.selectPr_id() + 1);
		
		
		propertyService.insertAPTsale(property);
		
		
	}*/
	
	@RequestMapping(value = "/aptNews", method = RequestMethod.GET)
	public void aptNewsGet(HttpSession session, Model model, @RequestParam("newsNum") int newsNum,
			@RequestParam("page") int page) throws Exception {
		List<Map<String, String>> newsList = null;
		RssReader rssReader = new RssReader();
		newsList = rssReader.getSynFeed(newsNum);
		int startPage = page;
		int endPage = startPage + 4;

		model.addAttribute("listSize", newsList.size() - 5);
		model.addAttribute("newsNum", newsNum);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("newsList", newsList);

	}
	
	
}
