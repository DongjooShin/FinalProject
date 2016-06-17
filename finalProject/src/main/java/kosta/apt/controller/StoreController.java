package kosta.apt.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kosta.apt.domain.Store.Store;
import kosta.apt.domain.Store.StroeImageUtil;
import kosta.apt.domain.member.Member;
import kosta.apt.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {
	private StoreService service;
	
	/*@Resource(name="uploadPath")
	private String uploadDir;*/

	@Autowired
	public void setService(StoreService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/test",method=RequestMethod.GET)
	public String test(){
		System.out.println("registerGET store test controller 들어옴");
		return "/store/tabsTest";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String registerGet()throws Exception{
		System.out.println("registerGET store controller 들어옴");
		return "/store/register";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPOST(Store store,HttpSession session,HttpServletRequest req)throws Exception{
		System.out.println("registerPOST store controller 들어옴");
		System.out.println("store=>"+store.toString());
		Member m=(Member) session.getAttribute("member");
		int aptNum=m.getApt_APTGNo();
		store.setApt_APTGNo(aptNum);
		
		
		
		// 1.
		MultipartFile multiPartFile = store.getStoreUploadFile();// file객체얻어옴(upload됨)
		
		System.out.println("멀티파트 겟네임: "+multiPartFile);
		/*System.out.println("multiparFile:"+multiPartFile);
		System.out.println("uploadFile:"+store.getStoreUploadFile());*/
		// 2.
		if (multiPartFile.getName() != null) {
			System.out.println("mulitpart if 문 안으로 들어옴!!!!!!!!!11슈발");
			String uploadPath1= req.getServletContext().getRealPath("/upload3/");
			System.out.println("UPLOAD_PATH : "+uploadPath1);
	        
			String filename = multiPartFile.getOriginalFilename();// file의 실제이름 얻어옴
															
			store.setS_fname(filename);// DB에 file이름 저장할수있음
			System.out.println("fname: "+store.getS_fname());
			
			multiPartFile.transferTo(new File(uploadPath1, filename));// 파일을 업로드
			
			String pattern = filename.substring(filename.indexOf(".") + 1);
			String headName = filename.substring(0, filename.indexOf("."));
			String imagePath = uploadPath1 + "\\" + filename;
				
			File src = new File(imagePath);
			String thumImagePath = uploadPath1 + "\\" + headName + "_small." + pattern;
			File dest = new File(thumImagePath);
			

			if (pattern.equals("jpg") || pattern.equals("png") || pattern.equals("png")) {
				StroeImageUtil.resize(src, dest, 210, StroeImageUtil.RATIO);
			}
			
			store.setS_thumFname(headName + "_small." + pattern);
			System.out.println("섬내일ㅇ리아러일어리: "+store.getS_thumFname());
			
			System.out.println("섬내일=>"+store.getS_thumFname()+" 파일=>"+store.getS_fname());
		}
		service.regist(store);
		
		return "/store/main";
	}
	
	@RequestMapping(value="/listStore",method=RequestMethod.GET)
	public List<Store> listStore(HttpSession session)throws Exception{
		//Member m=(Member) session.getAttribute("member");
		int aptNum=1;
		return service.listStore(aptNum);
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deleteStore(@RequestParam("s_storeNo")int s_storeNo,HttpSession session)throws Exception{
		
		System.out.println("번호오아롬;ㅏㅣㄴㅇ러미나렁미ㅏ너 아이디값"+s_storeNo);
		//Member m=(Member) session.getAttribute("member");
		service.deleteStore(s_storeNo);
		return "/store/main";
	}
	
	
	
}
