package kosta.apt.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.apt.domain.GroupNotice.GNSearchCriteria;
import kosta.apt.domain.GroupNotice.GroupNotice;
import kosta.apt.persistence.GroupNDao;

@Service
public class GroupNoticeService {
	private GroupNDao gnDao;
	
	@Autowired
	public void setGnDao(GroupNDao gnDao) {
		this.gnDao = gnDao;
	}

	public void regist(GroupNotice gn) {
		System.out.println("GN service 들어옴");
		gnDao.insertGN(gn);
		
	}

	public List<GroupNotice> listAll() {
		System.out.println("GN service list들어옴");
		return gnDao.listAll();
	}

	public GroupNotice read(int g_groupNoticeNo) {
		System.out.println("GN service read들어옴");
		//gnDao.hitCount(g_groupNoticeNo);
		return gnDao.read(g_groupNoticeNo);
	}

	public void modify(GroupNotice gn) {
		System.out.println("GN service modify들어옴");
		gnDao.update(gn);
	}

	public void remove(int g_groupNoticeNo) {
		System.out.println("GN service delete들어옴");
		gnDao.delete(g_groupNoticeNo);
		
	}

	public void hitCount(int g_groupNoticeNo) {
		gnDao.hitCount(g_groupNoticeNo);
		
	}

	public List<GroupNotice> listSearchCriteria(GNSearchCriteria cri,int aptNum) {
		System.out.println("GN service list cri들어옴");
		cri.setAptNum(aptNum);
		return gnDao.listSearchCriteria(cri);
		//return gnDao.listSearchCriteria(cri);
	}

	public int listSearchCount(GNSearchCriteria cri,int aptNum) {
		System.out.println("GN service list count들어옴");
		cri.setAptNum(aptNum);
		return gnDao.listSearchCount(cri);
		//return gnDao.listSearchCount(cri);
	}

	public List<GroupNotice> newlist(int aptNum) {
		
		return gnDao.newlist(aptNum);
	}

	
	
	
	
}
