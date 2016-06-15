package kosta.apt.persistence;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kosta.apt.domain.Message.Message;
import kosta.apt.domain.Message.MessageCriteria;
import kosta.apt.domain.Paging.Criteria;
import kosta.apt.mapper.MessageMapper;

@Repository
public class MessageBDao {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	
	//메세지 DB넣기
	public void SandMessage(Message message) {
		
			sqlsession.getMapper(MessageMapper.class).SandMessage(message);

		
	}
	
	
	//메세지번호
	public int countMsg(){
		
	int msgNo =0;
		
	if(sqlsession.getMapper(MessageMapper.class).countMsg()==null){
		
		return 1;
	}else{
		msgNo = sqlsession.getMapper(MessageMapper.class).countMsg();
		msgNo++;
		
		return msgNo;
	}
	
	}
	
	
	//리스트출력
	public List<Message> readlistMsg(Message message, Criteria cri) throws Exception{
		
		List<Message> list = null;
	
		list = sqlsession.getMapper(MessageMapper.class).readlistMsg(new RowBounds(cri.getPageStart(),cri.getPerPageNum()),message);
		
		return list;
	
	}


	public List<Message> sendMessageList(Message message, Criteria cri) {
		List<Message> list = null;
		
		list = sqlsession.getMapper(MessageMapper.class).sendMessageList(new RowBounds(cri.getPageStart(),cri.getPerPageNum()),message);
		
		return list;
	}


	public int listCountCri(Criteria cri) {
		int crinum = 0;
		
		crinum = sqlsession.getMapper(MessageMapper.class).listCountCri(cri);
		
		return crinum;
	}


	public int sendPage(Criteria cri) {
		int pagenum = 0;
		
		pagenum = sqlsession.getMapper(MessageMapper.class).sendPage(cri);
		return pagenum;
	}


	public Message detailmsg(int msgno) {
		Message message = null;
		
		message = sqlsession.getMapper(MessageMapper.class).detailmsg(msgno);
		
		return message;
		
	}


	public void delectMsg(int msgNo) {
		
		sqlsession.getMapper(MessageMapper.class).delectMsg(msgNo);
		
	}


	public void updateState(int msgno) {
		
		sqlsession.getMapper(MessageMapper.class).updateState(msgno);
		
	}
	
	
	
}
