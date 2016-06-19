package kosta.apt.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kosta.apt.domain.calendar.Calendar;
import kosta.apt.domain.Message.Message;
import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Paging.PageMaker;
import kosta.apt.domain.Property.AptTransactionPrice;
import kosta.apt.domain.member.Member;
import kosta.apt.service.CalendarService;
import kosta.apt.service.GroupNoticeService;
import kosta.apt.service.MemberService;
import kosta.apt.service.MessageService;

@Controller
public class MypageController {
	private GroupNoticeService gnService;
	private MessageService messageService;
	private CalendarService service;
	private MemberService memberService;

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Autowired
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	
	@Autowired
	public void setService(CalendarService service) {
		this.service = service;
	}
	@Autowired
	public void setGnService(GroupNoticeService gnService) {
		this.gnService = gnService;
	}




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
	public void maessage(Model model) {


		int m_memberNo = 1;
		
		model.addAttribute("m_memberNo", m_memberNo);
		

	}

	@RequestMapping(value = "/mypage/passwordCheck", method = RequestMethod.GET)
	public void passwordCheckGet(Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("member");
		model.addAttribute("loginOn", 1);
		model.addAttribute("id", member.getM_memberNo());
		model.addAttribute("password", member.getM_pass());

	}



	
	@RequestMapping(value = "/mypage/aptMessage", method = RequestMethod.GET)
	public void Msgview(HttpSession session, Message message, Model model) {
		System.out.println("메시지창이다.");
		
		Member member = (Member) session.getAttribute("member");
		
		if(member!=null){
			System.out.println(member.getM_memberNo());
			model.addAttribute("m_memberNo", member.getM_memberNo());
			
		}else{
			int m_memberNo = 1;
			model.addAttribute("m_memberNo", m_memberNo);
		}
		


	}

	@RequestMapping(value = "/mypage/aptMessage", method = RequestMethod.POST)
	public String SandMsg(HttpSession session, Message message) throws Exception {

		// 답장하기를 눌렀으면 세션에 메시지번호를 가져와서 메시지번호가가져왔을경우 답장하기버튼인걸 인식해서 클릭후 페이지닫게만들고
		// Okdelect.jsp를 보내기 클릭시 파라미터에 세션메세지번호를(히든으로) 담게하든가해서 그값이 널이 아닌경우만
		// 새창띄우게한다.

		System.out.println("성공적이야");
		
		System.out.println("성공적이야2"+message.getMg_to()+"입니다.");
		
	    String abc= "";
	    	 abc=	messageService.selectMg_to(message.getMg_to());
		
	    if(abc !=null){
	    	
	    	System.out.println(abc+"입니다.");
	    }else{
	    	
	    	System.out.println("없다요");
	    }
	    

		message.setMg_messageNo(messageService.MsgNo());

		Member member = (Member) session.getAttribute("member");
		
		
		if(member!=null){
			message.setM_memberNo(member.getM_memberNo());
		
		}else{
			message.setM_memberNo("999");
		}
		
		
		messageService.SandMessage(message);

	//	return "redirect:/mypage/sendMessageList";
		return "redirect:/mypage/aptMessageOkdelect";
		// 리다이렉트해서 메시지창 닫기 만들어라.
	}

	
	/*
	 * //메시지수신함
	 * 
	 * @RequestMapping(value="/readMessageList", method=RequestMethod.GET)
	 * public void readMessageList(Model model,Message message)throws Exception{
	 * List<Message> list = messageService.readlistMsg(message);
	 * 
	 * System.out.println(list.size()); System.out.println("메세지함 성공이야");
	 * model.addAttribute("list", list); }
	 */

	// 수신함
	@RequestMapping(value = "/mypage/readMessageList", method = RequestMethod.GET)
	public void readMessageList(HttpSession session, Model model, Message message, @ModelAttribute("cri") Criteria cri) throws Exception {

		Member member = (Member) session.getAttribute("member");
		
		
		if(member!=null){
			message.setM_memberNo(member.getM_memberNo());
		
		}else{
			message.setM_memberNo("1");
		}
		
		
		
		List<Message> list = messageService.readlistMsg(message, cri);
		System.out.println(list.size());
		System.out.println("메세지함 성공이야");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCri(cri);
		pageMaker.setTotalCount(messageService.listCountCri(cri));

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);

	}

	// 메시지발송함
	@RequestMapping(value = "/mypage/sendMessageList", method = RequestMethod.GET)
	public void sendMessageList(HttpSession session , Model model, Message message, @ModelAttribute("cri") Criteria cri) throws Exception {

		Member member = (Member) session.getAttribute("member");
		
		
		if(member!=null){
			message.setM_memberNo(member.getM_memberNo());
		
		}else{
			message.setM_memberNo("1");
		}
		
		
		
		
		List<Message> list = messageService.sendMessageList(message, cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(messageService.sendPage(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);

	}

	// 메시지 잘보내지면 OK
	@RequestMapping(value = "/mypage/aptMessageOkdelect", method = RequestMethod.GET)
	public void sendMsgOK() throws Exception {

	}

	// 메세지 디테일부분
	@RequestMapping(value = "/mypage/aptMsgdetail", method = RequestMethod.GET)
	public void detaileMsg(@RequestParam("sep") int msgno, Model model) throws Exception {

		System.out.println(msgno + "메세지번호입니다.");
		Message message = null;
		message = messageService.detailmsg(msgno);
		
		//확인유무 읽지않음에서 =>읽음 확인했다고 적으려고
		messageService.updateState(msgno);

		model.addAttribute("detail", message);
		
	}

	// 메세지 삭제부분
	@RequestMapping(value = "/mypage/delectMsg", method = RequestMethod.POST)
	public String delectMsg(@RequestParam("delect") int msgNo[], @RequestParam("readPage") String page) throws Exception {

		if (msgNo != null) {

			Message message = messageService.detailmsg(msgNo[0]);

			if (message.getMg_from() == message.getM_memberNo()) { 

				for (int i = 0; i < msgNo.length; i++) {
				

					messageService.delectMsg(msgNo[i]);
				}

				return "redirect:/mypage/readMessageList";
			}else{
			// 수신함에서 받은메세지를 삭제할경우 삭제하고나서  수신함.jsp로가라 ==수신메세지 새로고침
			for (int i = 0; i < msgNo.length; i++) {
					// System.out.println(msgNo[i]+"의번호");

					messageService.delectMsg(msgNo[i]);
			}
				return "redirect:/mypage/sendMessageList";
			}
		}
		
		//체크박스 선택도안했는데 삭제버튼눌렀을시
		if(msgNo ==null && page.equals("1")){
			return "redirect:/mypage/readMessageList";
		}else{
			return "redirect:/mypage/sendMessageList";
		}

	}
	
	


		
		//사이트 관리자 아파트 관리자 아이디/비밀번호 생성
		@RequestMapping(value = "/mypage/signupManager", method = RequestMethod.POST)
		public String signupManagerPost( Model model, @RequestParam String managerId, @RequestParam String managerPassword,
																RedirectAttributes attr) throws Exception {
			String password = testSHA256(managerPassword);
			memberService.insertManagerService(managerId, password);
			attr.addFlashAttribute("insertOK", 200);
			return "redirect:/mypage/signupManager";
		}
		
		
		
		
		
		
		
		
		
		// 사이트관리자 아파트실거래가 등록
		@RequestMapping(value = "/mypage/FileUploadForm", method = RequestMethod.GET) 
		public void showForm(AptTransactionPrice aptTransactionPrice, ModelMap model) {
			model.addAttribute("excel", aptTransactionPrice);
			model.addAttribute("loginOn", 1);
		}
		
		
		// 사이트관리자 아파트실거래가 등록
		@SuppressWarnings("resource") 
		@RequestMapping(value = "/mypage/FileUploadForm", method = RequestMethod.POST)
		public String processForm(@ModelAttribute("excel") AptTransactionPrice aptTransactionPrice, BindingResult result, RedirectAttributes attr)
				throws IOException {
			List<AptTransactionPrice> list = new ArrayList<AptTransactionPrice>();
			AptTransactionPrice aptTransactionPrice1 = null;
			if (!result.hasErrors()) {
				FileOutputStream outputStream = null;

				// save & load location
				String filePath = System.getProperty("java.io.tmpdir") + aptTransactionPrice.getFile().getOriginalFilename();

				String[] b = filePath.split("[.]");

				// save
				outputStream = new FileOutputStream(new File(filePath));
				outputStream.write(aptTransactionPrice.getFile().getFileItem().get());

				// load
				FileInputStream file = new FileInputStream(new File(filePath));

				XSSFWorkbook workbook = new XSSFWorkbook(file);
				XSSFSheet sheet = workbook.getSheetAt(0);
				System.out.println(workbook.getSheetName(0));
				Iterator<Row> rowIterator = sheet.iterator();

				while (rowIterator.hasNext()) {
					Row row = rowIterator.next();
					if (row.getRowNum() == 0) {

					} else {
						String primaryNum = "201604" + workbook.getSheetName(0) + row.getRowNum();
						String[] aptPrice = row.getCell(5).getStringCellValue().split("[,]");
						aptTransactionPrice1 = new AptTransactionPrice(primaryNum, row.getCell(0).getStringCellValue(),
								row.getCell(1).getStringCellValue(), row.getCell(2).getStringCellValue(),
								Float.parseFloat(row.getCell(3).getStringCellValue()), row.getCell(4).getStringCellValue(),
								Integer.parseInt(aptPrice[0] + aptPrice[1]),
								Integer.parseInt(row.getCell(6).getStringCellValue()),
								Integer.parseInt(row.getCell(7).getStringCellValue()), row.getCell(8).getStringCellValue());

						memberService.updateRealTransactionPriceService(aptTransactionPrice1);
					}
				}

				file.close();

				attr.addFlashAttribute("insertOK", 200);
				return "redirect:/mypage/FileUploadForm";
			}
			attr.addFlashAttribute("insertOK", 400);
			return "/mypage/FileUploadForm";
		}
		
		
		//암호화를 위한 SHA256 메소드
		public String testSHA256(String str) {
			String SHA = "";
			try {
				MessageDigest sh = MessageDigest.getInstance("SHA-256");
				sh.update(str.getBytes());
				byte byteData[] = sh.digest();
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < byteData.length; i++) {
					sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
				}
				SHA = sb.toString();

			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
				SHA = null;
			}
			return SHA;
		}
	
}
