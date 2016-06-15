package kosta.apt.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import kosta.apt.domain.Message.Message;
import kosta.apt.domain.Message.MessageCriteria;
import kosta.apt.domain.Paging.Criteria;


public interface MessageMapper {

	int SandMessage(Message message);

	public Integer countMsg();

	//읽어야될 메세지 ==수신메시지
    public List<Message> readlistMsg(RowBounds rowBounds, Message message);

	List<Message> sendMessageList(RowBounds rowBounds, Message message);

	int listCountCri(Criteria cri);

	int sendPage(Criteria cri);

	Message detailmsg(int msgno);

	void delectMsg(int msgNo);

	void updateState(int msgno);

	
	

}
