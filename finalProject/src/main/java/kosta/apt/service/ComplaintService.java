package kosta.apt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Paging.SearchCriteria;
import kosta.apt.domain.complaint.Complaint;
import kosta.apt.domain.complaint.Reply;
import kosta.apt.persistence.ComplaintDao;

@Service
public class ComplaintService {
	
	
	@Autowired
	private	ComplaintDao dao;
	
	public void create(Complaint complaint){
		dao.create(complaint);
	}

	public List<Complaint> listSearchCriteria(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return dao.listSearchCriteria(cri);
	}

	public int listSearchCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return dao.listSearchCount(cri);
	}

	public Complaint read(int cp_complaintNo) {
		// TODO Auto-generated method stub
		return dao.readComplaint(cp_complaintNo);
	}

	public void update(Complaint complaint) {
		// TODO Auto-generated method stub
		dao.update(complaint);
	}

	public void delete(int cp_complaintNo) {
		// TODO Auto-generated method stub
		dao.delete(cp_complaintNo);
		
	}

	public List<Complaint> mypageComplaint() {
		// TODO Auto-generated method stub
		return dao.mypageComplaint();
	}

	public void addReply(Reply reply) {
		// TODO Auto-generated method stub
		dao.addReply(reply);
	}

	public List<Reply> listReply(Integer cp_complaintNo) {
		// TODO Auto-generated method stub
		return dao.listReply(cp_complaintNo);
	}

	public void modifyReply(Reply vo) {
		// TODO Auto-generated method stub
		dao.modifyReply(vo);
	}

	public void removeReply(int rno) {
		// TODO Auto-generated method stub
		dao.removeReply(rno);
	}

	public List<Reply> listReplyPage(int cp_complaintNo, Criteria cri)throws Exception {
		// TODO Auto-generated method stub
		return dao.listReplyPage(cp_complaintNo,cri);
	}

	public int count(int cp_complaintNo) {
		// TODO Auto-generated method stub
		return dao.replyCount(cp_complaintNo);
	}

	public void addRef(int ref, int cp_complaintNo) {
		// TODO Auto-generated method stub
		dao.addRef(ref,cp_complaintNo);
	}

}
