package kosta.apt.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Paging.PageMaker;
import kosta.apt.domain.Product.Product;
import kosta.apt.domain.Product.ProductOrder;
import kosta.apt.domain.Product.ProductReply;
import kosta.apt.domain.Property.Property;
import kosta.apt.domain.Property.PropertyImageUtil;
import kosta.apt.domain.member.Member;
import kosta.apt.service.ProductService;

@Controller
@RequestMapping("/ProductSale")
public class ProductController {

	private ProductService productService;

	//순서 proApplication->proApplicationList->proRegister
	
	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	
	@RequestMapping(value="/proApplication", method = RequestMethod.GET)
	public void proApplication(Model model, HttpSession session )throws Exception{
		Member member = (Member) session.getAttribute("member");
		model.addAttribute("member", member);
		model.addAttribute("loginOn", 1);
		System.out.println("판매신청으로 이동하겠다.");
	}
	
	
	@RequestMapping(value="/proApplication", method = RequestMethod.POST)
	public void proApplication(HttpSession session, Product product)throws Exception{
		
		Member member = (Member) session.getAttribute("member");
		
		System.out.println("판매신청 POST");
		
		if(member != null){
			
			product.setM_memberNo(member.getM_memberNo());
			product.setApt_APTGNo(member.getApt_APTGNo());
		}else{
			product.setM_memberNo("1");
			product.setApt_APTGNo(1);
			//세션으로 로그인한 아이디와 아파트명을 가져온것이다.
			
		}
		

		
		product.setPro_tel(product.getPro_tel1()+"-"+product.getPro_tel2()+"-"+product.getPro_tel3());
		
		product.setPro_no(productService.selectPro_no() + 1); 
		product.setPro_flag("승인처리중");
		
		productService.insertApplication(product);
		

	}
	
	
	//입주자일경우 신청리스트
	@RequestMapping(value="/proApplicationList", method = RequestMethod.GET)
	public String proApplicationList(HttpSession session, Model model, Product product, @ModelAttribute("cri") Criteria cri)throws Exception{
		
		//관리자는 해당아파트꺼 다볼수있어야하니까 일반인과 관리자 if써서 m_grade값 ==1 or ==2일때다르게 if문 구성해서 뿌려주자.;
		//세션으로  아파트명과 개인등급을 가져온다.
		int mgrade = 2;//현재는 관리자로 하겠다.
		int apt_APTGNo =1; //세션에서 아파트명가져온다.
		String m_memberNo ="1";

		Member member = (Member) session.getAttribute("member");
		model.addAttribute("loginOn", 1);
		if(member !=null){
			System.out.println("세션이있네요 리스트");
			mgrade = member.getM_grade();
			apt_APTGNo = member.getApt_APTGNo();
			m_memberNo = member.getM_memberNo();
			
		}else{
			System.out.println("세션이없네요 리스트");
			mgrade = 2;
			apt_APTGNo =1;
			m_memberNo ="1";
		}

	
		List<Product> list = null;
	
		if(mgrade == 2){
			System.out.println("관리자로 들어왔다.");
			
			
		 list = productService.selectAllApply(cri, apt_APTGNo);
		 
	
		}else{
			System.out.println("입주자로 로그인했다.");
			list = productService.selectApplyList(cri, m_memberNo);
			
			
		}
		
		 PageMaker pageMaker = new PageMaker();
		 
		 pageMaker.setCri(cri);
		 pageMaker.setTotalCount(productService.listCountCri(cri));
		 model.addAttribute("pageMaker", pageMaker);
		 model.addAttribute("list", list);
			model.addAttribute("member", member);
			model.addAttribute("loginOn", 1);
		 if(mgrade == 2){
			 return  "/ProductSale/proApplyManageList";
		
			
		 }
		 else{
			 return  "/ProductSale/proApplicationList";
		 }
		
	}
	
	
	
	
	//평가 및 내용 출력
	@RequestMapping(value="/proApplyapprove", method = RequestMethod.GET)
	public void proApplyapprove(@RequestParam("pro_no") int pro_no, Model model)throws Exception{
		
		System.out.println("평가하기로 왔다.");
		
		Product product = null;
		
		product = productService.proApplyapprove(pro_no);
		
		model.addAttribute("product", product);
		model.addAttribute("loginOn", 1);
		
	}
	
	
	@RequestMapping(value="/proApplyapprove", method = RequestMethod.POST)
	public void proApplyapprove(@RequestParam("b_OK") String b_OK, @RequestParam("pro_no") int pro_no)throws Exception{
		System.out.println(b_OK+"입니다.");
		
		if(b_OK.equals("승인완료")){
			System.out.println("승인완료(클릭)되었다.");
			productService.proapproveOK(pro_no);
		}else{
			System.out.println("승인취소(노클릭)되었다.");
			productService.proapproveCencel(pro_no);
		}
		
		
		
	}
	
	
	@RequestMapping(value="/proRegister", method = RequestMethod.GET)
	public void proRegister(@RequestParam("pro_no") int pro_no, Model model)throws Exception{
		
		System.out.println("판매등록창"+pro_no);
		
		Product product = null;
		
		product = productService.proApplyapprove(pro_no);
		
		System.out.println(product.getPro_name()+"입니다.");
		model.addAttribute("loginOn", 1);
		model.addAttribute("product", product);
		
	}
	
	
	
	
	//공동구매 등록
	@RequestMapping(value="/proRegister", method = RequestMethod.POST)
	public String proRegister2(HttpSession session, HttpServletRequest request, Model model)throws Exception{
		
		System.out.println("판매등록창");
		
		
		String uplodaPath = request.getRealPath("M_upload1");

		System.out.println(uplodaPath);
		int size = 20 * 1024 * 1024;
		
		Product product = new Product();
	
		
		MultipartRequest multi = new MultipartRequest(request, uplodaPath, size, "utf-8", new DefaultFileRenamePolicy());
		
		
		Member member = (Member) session.getAttribute("member");
		if(member != null){
			
			product.setM_memberNo(member.getM_memberNo());
			product.setApt_APTGNo(member.getApt_APTGNo());
		}else{
			product.setM_memberNo(multi.getParameter("m_memberNo"));
			System.out.println(product.getM_memberNo());
			product.setApt_APTGNo(1);
			
			///////////////////////나중에 세션값넣어라.
		}

		
		
		product.setPro_tel(multi.getParameter("pro_tel1")+multi.getParameter("pro_tel2")+multi.getParameter("pro_tel3"));
		product.setPro_group(multi.getParameter("pro_group"));
		product.setPro_name(multi.getParameter("pro_name"));
		

		product.setPro_context(multi.getParameter("pro_context"));
		System.out.println(product.getPro_context()+"1번쨰");
		product.setPro_price(Integer.parseInt(multi.getParameter("pro_price")));
		System.out.println(product.getPro_price()+"2번쨰");
		product.setPro_num(Integer.parseInt(multi.getParameter("pro_num")));
		System.out.println(product.getPro_num()+"삼번쨰");
		
		product.setCheckPost(Integer.parseInt(multi.getParameter("checkPost")));
		System.out.println(product.getCheckPost()+"4번쨰");
		
		product.setPro_enddate(Integer.parseInt(multi.getParameter("pro_edate1")+multi.getParameter("pro_edate2")+multi.getParameter("pro_edate3")));
		System.out.println(product.getPro_enddate()+"5번쨰");
		product.setPro_startdate(Integer.parseInt(multi.getParameter("pro_sdate1")+multi.getParameter("pro_sdate2")+multi.getParameter("pro_sdate3")));
		System.out.println(product.getPro_startdate()+"6번쨰");
		product.setPro_maxnum(Integer.parseInt(multi.getParameter("pro_maxnum")));
		System.out.println(product.getPro_maxnum()+"7번쨰");
		
		if(multi.getFilesystemName("pro_img1")!=null){
			
			String pr_imageName = multi.getFilesystemName("pro_img1");
		
			product.setPro_img1(pr_imageName);
			

			String pattern = pr_imageName.substring(pr_imageName.lastIndexOf(".")+1);
			String headName = pr_imageName.substring(0, pr_imageName.lastIndexOf("."));
			
			String imgPath = uplodaPath+"\\"+pr_imageName;
			File src = new File(imgPath);
			
			String thumImagePath = uplodaPath+"\\"+headName+"_small."+pattern;
			File dest = new File(thumImagePath);
			
			if(pattern.equals("jpg")|| pattern.equals("gif") || pattern.equals("PNG")){
			
				PropertyImageUtil.resize(src, dest, 100, PropertyImageUtil.RATIO);
			}
			
		}else{
			product.setPro_img1("");
		}
		
	if(multi.getFilesystemName("pro_img2")!=null){
			
			String pr_imageName = multi.getFilesystemName("pro_img2");
			
			product.setPro_img2(pr_imageName);
			

			String pattern = pr_imageName.substring(pr_imageName.lastIndexOf(".")+1);
			String headName = pr_imageName.substring(0, pr_imageName.lastIndexOf("."));
			
			String imgPath = uplodaPath+"\\"+pr_imageName;
			File src = new File(imgPath);
			
			String thumImagePath = uplodaPath+"\\"+headName+"_small."+pattern;
			File dest = new File(thumImagePath);
			
			if(pattern.equals("jpg")|| pattern.equals("gif")){
			
				PropertyImageUtil.resize(src, dest, 100, PropertyImageUtil.RATIO);
			}
			
		}else{
			product.setPro_img2("");
		}

	
	if(multi.getFilesystemName("pro_img3")!=null){
		
		String pr_imageName = multi.getFilesystemName("pro_img3");
		
		product.setPro_img3(pr_imageName);
		

		String pattern = pr_imageName.substring(pr_imageName.lastIndexOf(".")+1);
		String headName = pr_imageName.substring(0, pr_imageName.lastIndexOf("."));
		
		String imgPath = uplodaPath+"\\"+pr_imageName;
		File src = new File(imgPath);
		
		String thumImagePath = uplodaPath+"\\"+headName+"_small."+pattern;
		File dest = new File(thumImagePath);
		
		if(pattern.equals("jpg")|| pattern.equals("gif")){
		
			PropertyImageUtil.resize(src, dest, 100, PropertyImageUtil.RATIO);
		}
		
	}else{
		product.setPro_img3("");
	}
	
		product.setPro_no(productService.selectpro_no()+1);
	
		productService.insertProduct(product);
		
		
		return "redirect:/ProductSale/productList";
	
	}



	//공동구매 목록
	@RequestMapping(value="/productList", method = RequestMethod.GET)
	public void productList(Model model, Product product, @ModelAttribute("cir") Criteria cri)throws Exception{
		
		List<Product> list = productService.prolist(cri);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(productService.listCountCri(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		model.addAttribute("loginOn", 1);
		
	}
	
	
	
	
	//댓글 달기
	@RequestMapping(value="/replyadd", method = RequestMethod.POST)
	public ResponseEntity<String> replyadd(HttpSession session, @RequestParam("replytext") String replytext, @RequestParam("pro_no") int pro_no)throws Exception{
		System.out.println(replytext+"replytext입니다.");
		System.out.println(pro_no+"pro_no입니다.");
		
		ProductReply productReply = new ProductReply();
	
		Member member = (Member) session.getAttribute("member");
		if(member!= null){
			productReply.setM_memberno(member.getM_memberNo());
		}else{
			productReply.setM_memberno("나중에세션값넣어라 컨트롤러에서 set함");
		}
		
		
		productReply.setPro_no(pro_no);
		productReply.setRe_text(replytext);
		productReply.setRe_no(productService.selectRe_no(pro_no)+1);
		
		productService.replyadd(productReply);
		
		ResponseEntity<String> entity = null;
		
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
	}
	
	
	//댓글 목록
	
	@RequestMapping(value="/Replylist", method = RequestMethod.POST)
	public ResponseEntity<List<ProductReply>> Replylist(@RequestParam("pro_no") int pro_no)throws Exception{
		
																										System.out.println("댓글목록입니다."+pro_no+"pro_no번호입니다.");
		
		List<ProductReply> list = new ArrayList<>();
		
		list = productService.Replylist(pro_no);
		
																										System.out.println(list.size()+"입니다.");
		
		if(list != null){
			System.out.println(list.get(0).getRe_text()+"입니다."); 
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
		
		
		
		
		
		
	}
	
	
	//댓글삭제 
	
	@RequestMapping(value="/deleteRno", method = RequestMethod.POST)
	public ResponseEntity<String> deleteRno(@RequestParam("rno") int rno, @RequestParam("pno") int pno){
		
																								//	System.out.println(rno+"rno값"+pno+"pno값"+"컨트롤러의값입니다.");
		
		ProductReply productReply = new ProductReply();
		
		productReply.setPro_no(pno);
		productReply.setRe_no(rno);
		
		productService.deleteRno(productReply);
		
		
		
		ResponseEntity<String> entity = null;
		
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
		
		
	}
	

	
	
	//디테일부분
	
	@RequestMapping(value="/productdetail", method = RequestMethod.GET)
	public void productdetail(@RequestParam("pro_no") int pro_no, Model model)throws Exception{
		
		
		Product product = null;
		
		
		product = productService.productdetail(pro_no);
		
		
		model.addAttribute("product", product);
		model.addAttribute("loginOn", 1);
		
		
	}
	
	
	
	//결제하기
	
	@RequestMapping(value="/proCheck", method = RequestMethod.GET)
	public void proCheck(Model model, ProductOrder productOrder)throws Exception{
		
		Product product = null;
		
		product = productService.productdetail(productOrder.getPro_no());
		System.out.println(product.getPro_img1());
	
		model.addAttribute("product", product);
		
		
		model.addAttribute("productOrder", productOrder);
		
		System.out.println(product.getM_memberNo()+"번호");

		System.out.println(product.toString());
		System.out.println(productOrder.toString());
		
		String b = product.getPro_img1();
		String pattern = b.substring(b.lastIndexOf(".")+1);
		String headName = b.substring(0, b.lastIndexOf("."));
		String c22 = headName+"_small."+pattern;
	
	 int num1 = 0;
	 int num2 = 0;
	 int num3 = 0;
	 
	 num1 = productOrder.getCheck_num();
	 num2 = product.getPro_price();
	 num3 = product.getCheckPost();
	 
	 num3 = (num1*num2)+num3;

		model.addAttribute("img1", c22);
		model.addAttribute("totalprice",num3);
		model.addAttribute("loginOn", 1);
		

	}
	

	
	//결제하기 DB등록
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@RequestMapping(value="/proCheck", method = RequestMethod.POST)
	public String proCheck(HttpSession session, ProductOrder productOrder)throws Exception{
		
		Member member = (Member) session.getAttribute("member");
		
		productOrder.setCheck_tell(productOrder.getCheck_tell1()+productOrder.getCheck_tell2()+productOrder.getCheck_tell3());
		
		if(member!=null){
			productOrder.setCheck_buyer(member.getM_memberNo());
		}else{
			productOrder.setCheck_buyer("감자"); //나중에 세션값
		}
		

		productOrder.setCheck_sign("배송대기");
		
		productOrder.setCheck_no(productService.selectChcek_no()+1);

		Product product = productService.selectProduct(productOrder.getPro_no()); 						//트랜잭션 수량좀 확인해보고싶어
	
		if((product.getPro_num()-productOrder.getCheck_num())<0){
			throw new Exception("재고가 부족 합니다.");
			
		}else if(productOrder.getCheck_num() > product.getPro_maxnum()){
		
			throw new Exception("최대주문수량보다 낮게 주문하십시오");
		}
	
		
		productService.proNumupdate(productOrder);
		
		productService.proCheck(productOrder);
		
		return "redirect:/ProductSale/proconsumerlist";
		
	}
	
	
	
	
	//구매자 주문내역
	
	@RequestMapping(value="/proconsumerlist", method = RequestMethod.GET)
	public void proconsumerlist(HttpSession session, Model model, @ModelAttribute("cri") Criteria cri)throws Exception{
		
		
		Member member = (Member) session.getAttribute("member");
		String buyer = "감자";
		if(member!=null){
			buyer = member.getM_memberNo();
		}else{
			buyer = "감자";
		}
		
		 //세션의 ID값을 가져오면되 세션id = DB의 구매자 id가 일치한경우만 빼오면되니까.
		
		List<ProductOrder> list = productService.proconsumerlist(buyer,cri);
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(productService.listCountCri(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		model.addAttribute("loginOn", 1);
		
	}
	
	
	
	
	//배송지 디테일부분
	@RequestMapping(value="/proconsumerlist", method = RequestMethod.POST)
	public ResponseEntity<ProductOrder> addressDetail2(@RequestParam("checkno") int checkno)throws Exception{
		System.out.println(checkno+"컨트롤러의 checkno 부분이다.");
	
		ProductOrder productOrder = null;
		
		productOrder = productService.productOrderDetail(checkno);
		
		
		
		
		return new ResponseEntity<>(productOrder, HttpStatus.OK);
		
	}
	
	
	
	@RequestMapping(value="/proconsumerlist2", method = RequestMethod.POST)
	public ResponseEntity<List<ProductOrder>> proconsumerlist2(HttpSession session, Model model, @ModelAttribute("cri") Criteria cri)throws Exception{
		
		
		Member member = (Member) session.getAttribute("member");
		
	
		String buyer = "감자";
		if(member!=null){
			buyer = member.getM_memberNo();
		}else{
			buyer = "감자";//세션의 ID값을 가져오면되 세션id = DB의 구매자 id가 일치한경우만 빼오면되니까.
			
		}
		
		List<ProductOrder> list = productService.proconsumerlist(buyer,cri);
		
		System.out.println(list.size()+"뭐지");
		
		ResponseEntity<List<ProductOrder>> responseEntity = new ResponseEntity<>(list, HttpStatus.OK);
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(productService.listCountCri(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		
		
		
		return responseEntity;
		
	}
	
	//환불하기
	
	@RequestMapping(value="/proRefund", method = RequestMethod.POST)
	public String proRefund(@RequestParam("checkno") int checkno)throws Exception{
		
		ProductOrder productOrder = null;
		System.out.println("환불할 목록번호입니다."+checkno);
		
		productOrder = productService.proRefund2(checkno);

	//System.out.println(productOrder.getCheck_buyer()+"구매한사람입니다.");
	//	System.out.println(productOrder.getCheck_num()+"구매한개수이다.");
		
		productService.updateCheckno(checkno);
		
		productService.updateProduct(productOrder);
		
		System.out.println("환불취소완료되어쩌여");
		
		return "redirect:/ProductSale/proconsumerlist";
	}
	
	
	
	//판매자 판매내역
	@RequestMapping(value="/promanagelist", method = RequestMethod.GET)
	public void promanagelist(HttpSession session, Model model, @ModelAttribute("cri") Criteria cri)throws Exception{
		
		System.out.println("판매자리스트로왔다.");
		
	
		Member member = (Member) session.getAttribute("member");
		String seller =  "123"; //나중에 세션값넣어라 
		if(member !=null){
			seller =  member.getM_memberNo();
		}else{
			seller =  "123"; //나중에 세션값넣어라 
		}
		
		
		
		List<ProductOrder> list = productService.promanagelist(seller, cri);
		
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(productService.listCountCri(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		model.addAttribute("loginOn", 1);
		
	}
	
	
	
	
	@RequestMapping(value="/promanagelist2", method = RequestMethod.POST)
	public ResponseEntity<List<ProductOrder>> promanagelist2(HttpSession session, Model model, @ModelAttribute("cri") Criteria cri)throws Exception{
		
		
		Member member = (Member) session.getAttribute("member");
		String seller =  "123"; //나중에 세션값넣어라 
		if(member !=null){
			seller =  member.getM_memberNo();
		}else{
			seller =  "123"; //나중에 세션값넣어라 
		}
		
		List<ProductOrder> list = productService.promanagelist(seller, cri);
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(productService.listCountCri(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		
		return new ResponseEntity<>(list, HttpStatus.OK);
		
	}
	
	

	
	
	@RequestMapping(value="/CheckPostUpdate", method = RequestMethod.POST)
	public String CheckPostUpdate(@RequestParam("cpupdate") int cpupdate[])throws Exception{
		
		System.out.println("배송업데이트 컨트롤러이다.");
		
	
		
		if(cpupdate !=null){
			
			for(int i =0; i<cpupdate.length; i++){
				
				productService.CheckPostUpdate(cpupdate[i]);
			}
		}
		
		
		return "redirect:/ProductSale/promanagelist2";
		
	}
	
	
	
	//배송지 디테일부분
	@RequestMapping(value="/addressDetail", method = RequestMethod.GET)
	public void addressDetail(@RequestParam("checkno") int checkno)throws Exception{
		
		
		System.out.println(checkno+"컨트롤러의 checkno 부분이다.");
		
		
		
	}
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/ajaxForm", method = RequestMethod.GET)
	public void ajaxForm(Product product)throws Exception{
		System.out.println("여기로왔다.");
		
		
	}

	
	
	
	@RequestMapping(value="/proRegister2", method = RequestMethod.GET)
	public void ajaxForm123()throws Exception{
		System.out.println("여기로왔다.");
		
		
	}
	
	
	
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void ajaxForm12342()throws Exception{
		System.out.println("여기로왔다.");
		
		
	}
	
	
	
	@RequestMapping(value="/proRegister2", method = RequestMethod.POST)
	public void ajaxForm1234452()throws Exception{
		System.out.println("POST여기로왔다.");
		
		
	}

	
	@RequestMapping(value="/proApplyManageList2", method = RequestMethod.GET)
	public void ajaxF()throws Exception{
		System.out.println("여기로왔다.");
		
		
	}
	
	


	
}
