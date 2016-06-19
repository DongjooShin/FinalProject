package kosta.apt.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kosta.apt.domain.Message.Message;
import kosta.apt.domain.Message.MessageCriteria;
import kosta.apt.domain.Paging.Criteria;
import kosta.apt.persistence.MessageDao;

@Service
public class MessageService {
	
	@Inject
	private MessageDao msgDao;
	
	
	@Autowired
	public void setMsgDao(MessageDao msgDao) {
		this.msgDao = msgDao;
	}

	//메세지 DB에저장하기
	public void SandMessage(Message message)throws Exception{
		
		msgDao.SandMessage(message);
		
	}

	//메세지번호가져오기
	public int MsgNo() {
	 int re =0;
	
	 re = msgDao.countMsg();
	 return re;
	}
	
	//메세지 리스트가져오기
	public List<Message> readlistMsg(Message message, Criteria cri) throws Exception{
	
		return msgDao.readlistMsg(message,cri);
	}

	public List<Message> sendMessageList(Message message, Criteria cri) {
		
		return msgDao.sendMessageList(message,cri);
	}

	public int listCountCri(Criteria cri) {
		
		return msgDao.listCountCri(cri);
	}

	public int sendPage(Criteria cri) {
		
		return msgDao.sendPage(cri);
	}

	public Message detailmsg(int msgno) {
		Message message = null;
		message =msgDao.detailmsg(msgno);;
		
		return message;
	}

	public void delectMsg(int msgNo) {
		
		msgDao.delectMsg(msgNo);
	}

	public void updateState(int msgno) {
		
		msgDao.updateState(msgno);
		
	}

	public String selectMg_to(String mg_to) {
		
		String abc = "";
		abc = msgDao.selectMg_toO(mg_to);
		if(abc ==null){
			abc  = "";
		}
		
		return abc;
		
	}
	

	
}
