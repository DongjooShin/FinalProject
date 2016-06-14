package kosta.apt.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kosta.apt.domain.member.AddressCity;
import kosta.apt.domain.member.AptList;
import kosta.apt.service.MemberService;

@RestController
public class RestMemberController {
private MemberService memberService;

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/test", method = RequestMethod.POST)
	public ResponseEntity<List<AddressCity>> test(Model model,@RequestParam("state") String state) {
		int stateNum =  memberService.getStateNumService(state);
		ResponseEntity<List<AddressCity>> entity  = new ResponseEntity<List<AddressCity>>(memberService.getCityService(stateNum),HttpStatus.OK);
		
		
		return entity;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/member/test1", method = RequestMethod.POST)
	public ResponseEntity<List<AptList>> test1(Model model,@RequestParam("state") String state,@RequestParam("city") String city) {
		String address = state + " " + city + "%";
		List<AptList> list = memberService.getAptNameService(address);
		ResponseEntity<List<AptList>> entity  = new ResponseEntity<List<AptList>>(list,HttpStatus.OK);

	
		return entity;
	}
	


}
