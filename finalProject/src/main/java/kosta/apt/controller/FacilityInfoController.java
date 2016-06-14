package kosta.apt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import kosta.apt.domain.member.Member;

@Controller
@RequestMapping("/facility/*")
public class FacilityInfoController {

	@RequestMapping(value="/facilityMap" ,method=RequestMethod.GET)
	public String facilityMap(){
		System.out.println("Map controller 들어옴");
		return "/facilityInfo/facilityInfoMap";
		
	}
}
