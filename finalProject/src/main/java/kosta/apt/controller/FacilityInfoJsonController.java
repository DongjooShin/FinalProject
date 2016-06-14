package kosta.apt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kosta.apt.domain.facilityInfo.FacilityInfo;
import kosta.apt.domain.member.Member;
import kosta.apt.service.FacilityInfoService;

@RestController
public class FacilityInfoJsonController {
	private FacilityInfoService service;
	
	@Autowired
	public void setService(FacilityInfoService service) {
		this.service = service;
	}

	@RequestMapping(value="/facilityInfo" ,method=RequestMethod.POST)
	public FacilityInfo listFacilityInfo(HttpSession session){
		System.out.println("Map Json controller 들어옴");
		Member m=(Member) session.getAttribute("member");
		int aptNum=m.getApt_APTGNo();
		System.out.println("aptNum: "+aptNum);
		return service.listFacilityInfo(aptNum);
		
	}
	
}
