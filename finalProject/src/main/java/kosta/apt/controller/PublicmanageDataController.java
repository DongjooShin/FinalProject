package kosta.apt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.apt.domain.management.ManagementFee;
import kosta.apt.domain.member.Member;
import kosta.apt.domain.publicmanage.Graph;
import kosta.apt.domain.publicmanage.PublicManagementFee;
import kosta.apt.service.PublicManageService;

@RestController
public class PublicmanageDataController {

	@Autowired
	private PublicManageService service;
	
	//연도별 나의 관리비 
	@RequestMapping("/publicdata")
	public List<Graph> getGraph(HttpSession session){
	Member m = (Member)session.getAttribute("member");
	List<PublicManagementFee> list =	service.selectPublicmanage(m.getApt_APTGNo());
	List list2 = new ArrayList();
	for(int i=0;i<list.size();i++){
		Graph g = new Graph();
		System.out.println(list.get(i).getPm_publicFeeNo());
		g.setD(list.get(i).getPm_publicFeeNo());
		g.setManageFee(list.get(i).getPm_clean()+list.get(i).getPm_general()+list.get(i).getPm_maintain()+
				list.get(i).getPm_liftMaintain()+list.get(i).getPm_security()+list.get(i).getPm_foodWaste()+
				list.get(i).getPm_fireInsurance()+list.get(i).getPm_commission()+list.get(i).getPm_meeting()+
				list.get(i).getPm_publicElectric()+list.get(i).getPm_liftElectric()+list.get(i).getPm_TVFee()+
				list.get(i).getPm_disinfection());
		list2.add(g);
	}
		return list2;
	}
	
	
	//도시별 관리비
	@RequestMapping("/CityGraph")
	public List<Graph> getCityGraph(HttpSession session){
		Member m = (Member)session.getAttribute("member");
		List<PublicManagementFee> list =	service.getCityGraph(m.getApt_APTGNo());
		List list3 = new ArrayList<>();
		for(int i=0;i<list.size();i++){
			Graph g = new Graph();
			g.setD(list.get(i).getPm_publicFeeNo());
			g.setManageFee(list.get(i).getPm_clean());
			g.setManageFee2(list.get(i).getPm_general());
			list3.add(g);
		}
		
			return list3;
	}
	
	//전국 평균 관리비
	@RequestMapping("/countryGraph")
	public List<Graph> getCountryGraph(HttpSession session){
		Member m = (Member)session.getAttribute("member");
		List<PublicManagementFee> list =	service.getContry(m.getApt_APTGNo());
		
		List list3 = new ArrayList();
		for(int i=0;i<list.size();i++){
			Graph g = new Graph();
			g.setD(list.get(i).getPm_publicFeeNo());
			g.setManageFee(list.get(i).getPm_clean());
			g.setManageFee2(list.get(i).getPm_general());
			list3.add(g);
			
			list3.add(g);
		}
		return list3;
	}
	
	
	
	//달별 공동관리비
	@RequestMapping("/monthManageFee")
	public List<Graph> getGraphMonth(HttpSession session){
		Member m = (Member)session.getAttribute("member");
		List<PublicManagementFee> list =	service.MonthManageFee(m.getApt_APTGNo());
		List list2 = new ArrayList();
		for(int i=0;i<list.size();i++){
			Graph g = new Graph();
			System.out.println(list.get(i).getPm_publicFeeNo());
			g.setD(list.get(i).getPm_publicFeeNo());
			g.setManageFee(list.get(i).getPm_clean()+list.get(i).getPm_general()+list.get(i).getPm_maintain()+
					list.get(i).getPm_liftMaintain()+list.get(i).getPm_security()+list.get(i).getPm_foodWaste()+
					list.get(i).getPm_fireInsurance()+list.get(i).getPm_commission()+list.get(i).getPm_meeting()+
					list.get(i).getPm_publicElectric()+list.get(i).getPm_liftElectric()+list.get(i).getPm_TVFee()+
					list.get(i).getPm_disinfection());
			list2.add(g);
		}
		return list2;
	}
	
	//결산 맵핑
	@RequestMapping("/맵핑할껏")
	public List<ManagementFee> appropriation(HttpSession session){
		Member member = (Member)session.getAttribute("member");
		List<ManagementFee> list =service.DataAppropriation(member.getApt_APTGNo());
		
		return list;
	}

}
