package kosta.apt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.apt.domain.management.ManagementFeePay;
import kosta.apt.domain.member.Member;
import kosta.apt.domain.publicmanage.PublicManagementFee;
import kosta.apt.service.PublicManagementFeeService;

@Controller
@RequestMapping("publicManagementFee")
public class PublicManagementFeeController {
	
	private PublicManagementFeeService publicMntService;

	@Autowired
	public void setPublicMntService(PublicManagementFeeService publicMntService) {
		this.publicMntService = publicMntService;
	}
	
	@RequestMapping("/publicManagementFeeInsertForm")
	public String publicManagementFeeInsertForm(){
		return "managementFee/publicManagementFeeInsert";
	}
	
	@RequestMapping("/publicManagementFeeInsert")
	public String publicManagementFeeInsert(String year, String month, PublicManagementFee publicManagementFee, HttpSession session){
		Member member = (Member) session.getAttribute("member");
		int apt_APTGNo = member.getApt_APTGNo();
		
		String date  = year+month;
		publicManagementFee.setPm_publicFeeNo(date);
		publicManagementFee.setApt_APTGNo(apt_APTGNo);
		publicMntService.publicManagementFeeInsert(publicManagementFee);
		
		
		//int = selectManagementFeePay(date, apt_APTGNo);
		List<ManagementFeePay> managementfeepay = null;
		managementfeepay = publicMntService.selectPublicAmount(member.getApt_APTGNo());
		List<Member> memberList = publicMntService.selectMemberList(apt_APTGNo);
		System.out.println(memberList.toString());
		List<Member> aleadyMemberList = null;
		List<Member> noAleadyMemberList = null;
		
		/*for(int i=0;i<memberList.size();i++){
			noAleadyMemberList = publicMntService.selectNoAleadyMemberList(Integer.toString(memberList.get(i).getM_buildingNo()), 
					Integer.toString(memberList.get(i).getM_roomNo()),apt_APTGNo);
			aleadyMemberList   = publicMntService.selectAleadyMemberList(apt_APTGNo); 
		}*/
		if(managementfeepay.size()>0){
			System.out.println("업데이트");
			publicMntService.updatePublicManagementFeePay(publicManagementFee.sumPublicFee(),apt_APTGNo);
		}else{
			
			 System.out.println("인설트");
			List<ManagementFeePay> mngFeePay = new ArrayList();
			for(int i=0;i<memberList.size();i++){
//				String a=Integer.toString(memberList.get(i).getM_buildingNo());
//				String b=Integer.toString(memberList.get(i).getM_roomNo());
//				int c = publicManagementFee.sumPublicFee();
				 
				//리스트만큼 객체생성
				//생성자 순서 : 동, 호, 날짜, 공동관리비총액, 관리비총액, 공동관리비+관리비, 결제수단, 결제유무, 아파트그룹
				mngFeePay.add(new ManagementFeePay(Integer.toString(memberList.get(i).getM_buildingNo()), 
						Integer.toString(memberList.get(i).getM_roomNo()), date, 
						publicManagementFee.sumPublicFee(), 0, 0, "", "f", apt_APTGNo));
				System.out.println(mngFeePay.get(i).toString());
				publicMntService.insertPublicManagementFeePay(mngFeePay.get(i));
			}
		}
		
		//publicMntService.insertPublicManagementFeePay(mngFeePay);
		return "/main";
	}
	
	
}
