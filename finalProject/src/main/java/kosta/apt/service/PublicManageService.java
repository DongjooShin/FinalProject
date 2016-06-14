package kosta.apt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.apt.domain.management.ManagementFee;
import kosta.apt.domain.publicmanage.PublicManagementFee;
import kosta.apt.persistence.PublicManageDao;

@Service
public class PublicManageService {

	
	
	@Autowired
	private PublicManageDao dao;
	
	
	public List<PublicManagementFee> selectMonthPublicmanage(int aptgno){
		
		
		return dao.selectMonthPublicmanage(aptgno);
	}
	public List<PublicManagementFee> selectPublicmanage(int aptgno){
		return dao.selectPublicmanage(aptgno);
	}
	public List<PublicManagementFee> MonthManageFee(int aptgno){
		return dao.MonthManageFee(aptgno);
	}
	public List<PublicManagementFee> getappropriation(int aptgno) {
		// TODO Auto-generated method stub
		return dao.appropriation(aptgno);
	}
	public List<ManagementFee> DataAppropriation(int aptgno) {
		// TODO Auto-generated method stub
		return dao.DataAppropriation(aptgno);
	}
	public List<PublicManagementFee> getCityGraph(int apt_APTGNo) {
		// TODO Auto-generated method stub
		return dao.getCityGraph(apt_APTGNo);
	}
	public List<PublicManagementFee> getContry(int apt_APTGNo) {
		// TODO Auto-generated method stub
		return dao.getContry(apt_APTGNo);
	}
	public List<PublicManagementFee> myManageFee(int apt_APTGNo) {
		// TODO Auto-generated method stub
		return dao.myManageFee(apt_APTGNo);
	}
	public List<ManagementFee> selectMonthmanage(String m_memberNo) {
		// TODO Auto-generated method stub
		return dao.selectMonthmanage(m_memberNo);
	}
}
