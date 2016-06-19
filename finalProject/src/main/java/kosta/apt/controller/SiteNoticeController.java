package kosta.apt.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.apt.domain.SiteNotice.JoinInquiry;
import kosta.apt.domain.SiteNotice.QnA;
import kosta.apt.domain.SiteNotice.SNPageMaker;
import kosta.apt.domain.SiteNotice.SNSearchCriteria;
import kosta.apt.domain.SiteNotice.SiteNotice;
import kosta.apt.domain.member.Member;
import kosta.apt.service.SiteNoticeService;

@Controller
@RequestMapping("/siteNotice/*")
public class SiteNoticeController {

	private SiteNoticeService snService;

	@Autowired
	public void setSnService(SiteNoticeService snService) {
		this.snService = snService;
	}

	@RequestMapping(value = "siteNoticeAllList", method = RequestMethod.GET)
	public String siteNoticeAllList(HttpSession session, @ModelAttribute("cri") SNSearchCriteria cri, Model model) {
		Member m = (Member) session.getAttribute("member");
		System.out.println("list All=>search 들어옴");

		model.addAttribute("list", snService.listSearchCriteria(cri));

		SNPageMaker pageMaker = new SNPageMaker();
		pageMaker.setCri(cri);
		// pageMaker.setTotalCount(4);//총글갯수넣음
		pageMaker.setTotalCount(snService.listSearchCount(cri));// 글의 총갯수 구하는 것

		model.addAttribute("pageMaker", pageMaker);

		return "/siteNotice/siteNoticeAllList";
	}

	@RequestMapping(value = "siteNoticeRegist", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		System.out.println("SNregister page ok");
		return "/siteNotice/siteNoticeRegist";

	}

	@RequestMapping(value = "siteNoticeRegist", method = RequestMethod.POST)
	public String registerPOST(SiteNotice sn, Model model, HttpServletRequest request) throws Exception {
		System.out.println("1212125664212sn controller 들어옴!!!!");
		System.out.println("title: " + sn.getSn_title());
		if (snService.maxSnNo() != null) {
			sn.setSn_siteNoticeNo(snService.maxSnNo() + 1);
		} else {
			sn.setSn_siteNoticeNo(1);
		}
		sn.setM_memberNo("admin");

		// 1.
		MultipartFile multiPartFile = sn.getUploadFile();// file객체얻어옴(upload됨)
		System.out.println(multiPartFile);

		// 2.
		try {
			if (!multiPartFile.isEmpty()) {
				String filename = multiPartFile.getOriginalFilename();// file의
																		// 실제이름
																		// 얻어옴
				sn.setSn_fileName(filename);// DB에 file이름 저장할수있음
				String uploadDir = request.getServletContext().getRealPath("/j_upload/");
				System.out.println(uploadDir);
				multiPartFile.transferTo(new File(uploadDir, filename));// 파일을
																		// 업로드

			} else {
				sn.setSn_fileName("NULL");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		snService.regist(sn);

		return "redirect:/siteNotice/siteNoticeAllList";

	}

	@RequestMapping(value = "snRead", method = RequestMethod.GET)
	public String read(@RequestParam("sn_siteNoticeNo") int sn_siteNoticeNo,
			@ModelAttribute("cri") SNSearchCriteria cri, Model model) throws Exception {
		snService.snHitCount(sn_siteNoticeNo);
		model.addAttribute("sn", snService.snRead(sn_siteNoticeNo));
		return "/siteNotice/siteNoticeRead";
	}

	@RequestMapping(value = "snModify", method = RequestMethod.GET)
	public String modifyGET(int sn_siteNoticeNo, Model model) throws Exception {
		System.out.println(sn_siteNoticeNo);
		model.addAttribute("sn", snService.snRead(sn_siteNoticeNo));
		return "/siteNotice/siteNoticeModify";
	}

	@RequestMapping(value = "snModify", method = RequestMethod.POST)
	public String modifyGET(SiteNotice sn, RedirectAttributes rttr) throws Exception {
		System.out.println("sn modify post controller 들어옴");
		System.out.println("객체내용" + sn.toString());
		snService.snModify(sn);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/siteNotice/siteNoticeAllList";

	}

	@RequestMapping(value = "snDelete", method = RequestMethod.GET)
	public String read(@RequestParam("sn_siteNoticeNo") int sn_siteNoticeNo) throws Exception {
		snService.snDelete(sn_siteNoticeNo);

		return "redirect:/siteNotice/siteNoticeAllList";

	}

	@RequestMapping("siteNotice_download")
	public ModelAndView fileDown(@RequestParam String filename, HttpServletRequest request) throws Exception {

		String uploadDir = request.getServletContext().getRealPath("/j_upload/");
		System.out.println(uploadDir);
		File file = new File(uploadDir, filename);// file객체구하기

		return new ModelAndView("SndownloadView", "downloadFile", file);// 뷰의이름,가져갈객체
																		// 키값,데이터값
	}

	// ------------- Site FAQ ---------------------

	@RequestMapping("faqMain")
	public String faqMain() {
		return "/FAQ/faqMain";
	}

	// ------------- Site Inquiry -------------------

	@RequestMapping(value = "inquiryMain", method = RequestMethod.GET)
	public String inquiryMain(HttpSession session, @ModelAttribute("cri") SNSearchCriteria cri, Model model) {

		Member m = (Member) session.getAttribute("member");
		List<QnA> qnaList = snService.QnAListSearchCri(cri);

		model.addAttribute("qlist", qnaList);
		model.addAttribute("m_email", m.getM_email());
		model.addAttribute("msg", "No");

		SNPageMaker pageMaker = new SNPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(snService.listSearchCount(cri));// 글의 총갯수 구하는 것

		model.addAttribute("pageMaker", pageMaker);

		return "/inquiry/inquiry";
	}

	@RequestMapping(value = "inquiryRegist", method = RequestMethod.POST)
	public String inquiryRegist(QnA qna, Model model, HttpServletRequest request) {
		if (snService.maxQnANo() != null) {
			qna.setQnaNo(snService.maxQnANo() + 1);
		} else {
			qna.setQnaNo(1);
		}

		// 1.
		MultipartFile multiPartFile = qna.getMultipart();// file객체얻어옴(upload됨)
		System.out.println(multiPartFile);

		// 2.
		try {
			if (multiPartFile == null) {
				qna.setQ_fileName("NULL");

			} else {
				String filename = multiPartFile.getOriginalFilename();// file의
																		// 실제이름
				// 얻어옴
				String uploadDir = request.getServletContext().getRealPath("/j_upload/");
				System.out.println(uploadDir);
				qna.setQ_fileName(filename);// DB에 file이름 저장할수있음
				multiPartFile.transferTo(new File(uploadDir, filename));// 파일을
																		// 업로드
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		snService.insertInquiry(qna);
		System.out.println(qna.getQ_name());
		model.addAttribute("msg", "SUCCESS");
		return "/inquiry/inquiry";
	}

	@RequestMapping(value = "inquiryRead", method = RequestMethod.GET)
	public String inquiryRead(@RequestParam("qnaNo") int qnaNo, @ModelAttribute("cri") SNSearchCriteria cri,
			Model model) throws Exception {
		QnA qna = snService.selectReply(qnaNo);

		model.addAttribute("qna", qna);
		model.addAttribute("sn", snService.inqRead(qnaNo));
		return "/inquiry/inquiryRead";
	}

	@RequestMapping(value = "inqReply", method = RequestMethod.GET)
	public String inqReplyGET(int qnaNo, String q_content, Model model) throws Exception {
		QnA qna = snService.selectInquiry(qnaNo);
		qna.setQ_ref(qna.getQnaNo());
		qna.setQnaNo(snService.maxQnANo() + 1);
		qna.setQ_content(q_content);

		qna.setQ_state(2);
		System.out.println(qna.toString());
		snService.insertAnswer(qna);
		snService.updateState(qnaNo);

		model.addAttribute("qna", qna);
		model.addAttribute("sn", snService.inqRead(qnaNo));
		return "/inquiry/inquiryRead";
	}
	/*
	 * @RequestMapping(value="inqReply",method=RequestMethod.POST) public String
	 * inqReplyPOST(QnA sn,RedirectAttributes rttr)throws Exception{
	 * System.out.println("sn modify post controller 들어옴");
	 * System.out.println("객체내용"+sn.toString());
	 * 
	 * // snService.inqReply(sn); rttr.addFlashAttribute("msg", "SUCCESS");
	 * return "redirect:/inquiry/inquiryMain";
	 * 
	 * }
	 */

	// --------------- join inquiry --------------------

	@RequestMapping("joinInquiry")
	public String joinInquiry(Model model) {
		model.addAttribute("message", "No");
		return "/FAQ/joinHere";
	}

	@RequestMapping(value = "joinRegist", method = RequestMethod.POST)
	public String joinComplete(JoinInquiry join, Model model) {
		System.out.println(join.toString());

		if (snService.maxJINo() != null) {
			join.setJno(snService.maxJINo());
		} else {
			join.setJno(1);
		}
		snService.insertJoinInquiry(join);

		model.addAttribute("message", "SUCCESS");
		return "/FAQ/joinHere";
	}
	//
	// model.addAttribute("msg", "문의가 접수되었습니다.");
	// model.addAttribute("url", "siteNoticeRegist.jsp");
	// return "/siteNotice/registComplete";
	//

	// -----------------my page : 1:1 ---------------------------

	@RequestMapping("mypage_SiteInquiry")
	public String mySiteInquiry(HttpSession session, Model model) {
		Member m = (Member) session.getAttribute("member");
		List<QnA> myqna = snService.selectMyInquiry(m.getM_memberNo());
		List<QnA> reply = snService.selectMyReply(m.getM_memberNo());

		System.out.println("hi" + reply);
		model.addAttribute("myqna", myqna);
		model.addAttribute("reply", reply);

		return "mypage_SiteInquiry";
	}

}
