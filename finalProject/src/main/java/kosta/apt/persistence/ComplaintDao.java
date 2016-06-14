package kosta.apt.persistence;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Paging.SearchCriteria;
import kosta.apt.domain.complaint.Complaint;
import kosta.apt.domain.complaint.Reply;


@Repository
public class ComplaintDao {

	@Autowired
	SqlSession session;
	
	private static final String namespace = "kosta.apt.mapper.ComplaintMapper";
	
	
	public void create(Complaint complaint){
		 Calendar calendar = new GregorianCalendar(Locale.KOREA);
		 String day= "";
		 day += calendar.get(Calendar.YEAR);
		 int   month = calendar.get(Calendar.MONTH);
		 month++;
			 day +="/"+month;
			 day +="/"+calendar.get(calendar.DAY_OF_MONTH);
		
			 complaint.setCp_date(day);
		session.insert(namespace+".create", complaint);
	}
	 

	public List<Complaint> listSearchCriteria(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listSearchCriteria", cri, new RowBounds(cri.getPageStart(),cri.getPerPageNum()));
	}


	public int listSearchCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".listSearchCount", cri);
	}


	public Complaint readComplaint(int cp_complaintNo) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".readComplaint", cp_complaintNo);
	}


	public void update(Complaint complaint) {
		// TODO Auto-generated method stub
		session.update(namespace+".update", complaint);
		
	}


	public void delete(int cp_complaintNo) {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete", cp_complaintNo);
	}


	public List<Complaint> mypageComplaint() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".mypageComplaint");
	}


	public void addReply(Reply reply) {
		 Calendar calendar = new GregorianCalendar(Locale.KOREA);
		 String day= "";
		 day += calendar.get(Calendar.YEAR);
		 int   month = calendar.get(Calendar.MONTH);
		 month++;
			 day +="/"+month;
			 day +="/"+calendar.get(calendar.DAY_OF_MONTH);
		
			 reply.setRdate(day);
		session.insert(namespace+".addReply", reply);
	}


	public List<Reply> listReply(Integer cp_complaintNo) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listReply", cp_complaintNo);
	}


	public void modifyReply(Reply vo) {
		// TODO Auto-generated method stub
		session.update(namespace+".modifyReply", vo);
	}


	public void removeReply(int rno) {
		// TODO Auto-generated method stub
		session.delete(namespace+".removeReply", rno);
	}


	public List<Reply> listReplyPage(int cp_complaintNo, Criteria cri)throws Exception {
		// TODO Auto-generated method stub
	    Map<String, Object> paramMap = new HashMap<>();

	    paramMap.put("cp_complaintNo", cp_complaintNo);
	    paramMap.put("cri", cri);

	    return session.selectList(namespace + ".listReplyPage", paramMap);
	}


	public int replyCount(int cp_complaintNo) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".replyCount", cp_complaintNo);
	}


	public void addRef(int ref, int cp_complaintNo) {
		// TODO Auto-generated method stub
	    Map<String, Integer> paramMap = new HashMap<>();

	    paramMap.put("ref", ref);
	    paramMap.put("complaintno", cp_complaintNo);
		session.update(namespace+".addRef", paramMap);
	}
	
}
