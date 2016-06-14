package kosta.apt.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.apt.domain.Message.Message;
import kosta.apt.domain.Message.MessageCriteria;
import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Paging.PageMaker;
import kosta.apt.service.MessageService;

@Controller
@RequestMapping("/Message")
public class MessageController {

	private MessageService messageService;

	@Autowired
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	@RequestMapping(value = "/aptMessage", method = RequestMethod.GET)
	public void Msgview(Message message, @RequestParam("m_memberNo") int m_memberNo, Model model) {
		System.out.println("메시지창이다.");
		
		model.addAttribute("m_memberNo", m_memberNo);
		

	}

	@RequestMapping(value = "/aptMessage", method = RequestMethod.POST)
	public String SandMsg(Message message) throws Exception {

		// 답장하기를 눌렀으면 세션에 메시지번호를 가져와서 메시지번호가가져왔을경우 답장하기버튼인걸 인식해서 클릭후 페이지닫게만들고
		// Okdelect.jsp를 보내기 클릭시 파라미터에 세션메세지번호를(히든으로) 담게하든가해서 그값이 널이 아닌경우만
		// 새창띄우게한다.

		System.out.println("성공적이야");

		message.setMg_messageNo(messageService.MsgNo());

		message.setM_memberNo("999");
		messageService.SandMessage(message);

		return "redirect:/Message/sendMessageList";
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
	@RequestMapping(value = "/readMessageList", method = RequestMethod.GET)
	public void readMessageList(Model model, Message message, @ModelAttribute("cri") Criteria cri) throws Exception {

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
	@RequestMapping(value = "/sendMessageList", method = RequestMethod.GET)
	public void sendMessageList(Model model, Message message, @ModelAttribute("cri") Criteria cri) throws Exception {
		List<Message> list = messageService.sendMessageList(message, cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(messageService.sendPage(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);

	}

	// 메시지 잘보내지면 OK
	@RequestMapping(value = "/aptMessageOkdelect", method = RequestMethod.GET)
	public void sendMsgOK() throws Exception {

	}

	// 메세지 디테일부분
	@RequestMapping(value = "/aptMsgdetail", method = RequestMethod.GET)
	public void detaileMsg(@RequestParam("sep") int msgno, Model model) throws Exception {

		System.out.println(msgno + "메세지번호입니다.");
		Message message = null;
		message = messageService.detailmsg(msgno);
		
		//확인유무 읽지않음에서 =>읽음 확인했다고 적으려고
		messageService.updateState(msgno);

		model.addAttribute("detail", message);
		
	}

	// 메세지 삭제부분
	@RequestMapping(value = "/delectMsg", method = RequestMethod.POST)
	public String delectMsg(@RequestParam("delect") int msgNo[], @RequestParam("readPage") String page) throws Exception {

		if (msgNo != null) {

			Message message = messageService.detailmsg(msgNo[0]);

			if (message.getMg_from() == message.getM_memberNo()) { 

				for (int i = 0; i < msgNo.length; i++) {
				

					messageService.delectMsg(msgNo[i]);
				}

				return "redirect:/Message/readMessageList";
			}else{
			// 수신함에서 받은메세지를 삭제할경우 삭제하고나서  수신함.jsp로가라 ==수신메세지 새로고침
			for (int i = 0; i < msgNo.length; i++) {
					// System.out.println(msgNo[i]+"의번호");

					messageService.delectMsg(msgNo[i]);
			}
				return "redirect:/Message/sendMessageList";
			}
		}
		
		//체크박스 선택도안했는데 삭제버튼눌렀을시
		if(msgNo ==null && page.equals("1")){
			return "redirect:/Message/readMessageList";
		}else{
			return "redirect:/Message/sendMessageList";
		}

	}

	
	/*
	 * //메세지 리스트출력 ==메시지수신함 ==이건 신버전
	 * 
	 * @RequestMapping(value="readMessageList", method=RequestMethod.GET) public
	 * void MessageList(Model model, Message message)throws Exception{
	 * 
	 * 
	 * model.addAttribute("list", messageService.readlistMsg(message)); //@@@나중에
	 * where 세션ID값 = mg_to 의 값일치한것만 리스트에넣으면 ===>내가읽어야할 메세지만 출력가능 }
	 * 
	 * 
	 * //==신버전 발송함
	 * 
	 * @RequestMapping(value="sendMessageList", method=RequestMethod.GET) public
	 * void sendMessageList(Model model, Message message)throws Exception{
	 * 
	 * model.addAttribute("list", messageService.sandlistMsg(message)); }
	 */

	/*
	 * //리스트페이징처리
	 * 
	 * @RequestMapping(value="/MessageList", method = RequestMethod.GET) public
	 * void listMessage(Model model, Criteria cri)throws Exception{
	 * 
	 * model.addAttribute("listMsg", messageService.listMsg(cri)); }
	 */

}
