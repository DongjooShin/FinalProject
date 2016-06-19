package kosta.apt.controller;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kosta.apt.domain.management.Budget;
import kosta.apt.domain.management.ManagementFee;
import kosta.apt.domain.management.ManagementFeePay;
import kosta.apt.domain.member.Member;
import kosta.apt.domain.publicmanage.PublicManagementFee;
import kosta.apt.service.ManagementFeeService;
import kosta.apt.service.PublicManageService;
import kosta.apt.service.PublicManagementFeeService;

@Controller
@RequestMapping("/managementFee")
public class ManagementFeeController {
	
	private ManagementFeeService mntFeeService;
	private PublicManagementFeeService publicMntService;
	
	@Autowired
	public void setMntFeeService(ManagementFeeService mntFeeService) {
		this.mntFeeService = mntFeeService;
	}
	
	@Autowired
	public void setPublicMntService(PublicManagementFeeService publicMntService) {
		this.publicMntService = publicMntService;
	}

	@RequestMapping("/managementFeeInsertForm")
	public String managementFeeInsertForm(){
		return "/managementFee/managementFee";
	}
	
	@RequestMapping("/managementFeeInsert")
	public String managementFeeInsert(ManagementFee managementFee, 
			int buildingNo, int roomNo, String year, String month){
		System.out.println(buildingNo+"/"+roomNo);
		List<Member> list = mntFeeService.selectMember(buildingNo, roomNo);
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).toString());
		} //id넘어오는지 확인.

		
		//날짜구함
		String date = year+month;
		System.out.println(date);
		
		String [] m_memberNo = new String [list.size()];
		for(int i=0;i<list.size();i++){
			 m_memberNo[i] = list.get(i).getM_memberNo();
			 System.out.println(m_memberNo[i]);
		}
		
		HashMap<String, ManagementFee> map1 = new HashMap<String, ManagementFee>();
		HashMap<String, String>        map2 = new HashMap<String, String>();
		for(int i=0;i<m_memberNo.length;i++){
			map1.put("mf", managementFee);
			map2.put("m_memberNo", m_memberNo[i]);
			map2.put("mf_date", date);
			mntFeeService.managementFeeInsert(map1, map2);
		}
		
		String m_buildingNo = Integer.toString(buildingNo);
		String m_roomNo = Integer.toString(roomNo);
		int p_managementAmount = managementFee.sumManagementFee();
		
		List<ManagementFeePay> mntFeePayCheck = mntFeeService.selectMangementAmountCheck(list.get(0).getApt_APTGNo());
		
		//동, 호, 날짜, 공동관리비총액, 관리비총액, 공동관리비+관리비, 결제수단, 결제유무, 아파트그룹
		ManagementFeePay mngFeePay = new ManagementFeePay(m_buildingNo, m_roomNo, date, 0, p_managementAmount, 0, "", "f", list.get(0).getApt_APTGNo());
		
		if(mntFeePayCheck.get(0).getP_publicAmount()!=0){
			mntFeeService.updateManagementFeePay(mngFeePay);
		}else{
			mntFeeService.insertManagementFeePay(mngFeePay);
		}
		
		return "/main";
	}
	
	
	@RequestMapping("managementFeeList")
	public String managementFeeList(Model model){
		System.out.println("페이지 보여줌");
		/*Calendar calendar = new GregorianCalendar(Locale.KOREA);
		String thisMonth = "";
		thisMonth += calendar.get(Calendar.MONTH)+1;
		
		model.addAttribute("date", thisMonth);
		
		//로그인한 아이디를 가져옴.
		List<ManagementFee> list = mntFeeService.selectManagementFee("kkt891230");
		
		model.addAttribute("mnt_list", list);*/
		return "/managementFee/managementFeeList";
	}
	
	//마이페이지 관리비 요청
	@RequestMapping("/myPageManagementFee")
	public String myPageManagementFee(){
		return "/mypage/myPageManagementFee";
	}
	
	//
	@RequestMapping("/managementFeePay")
	public String managementFeePay(HttpSession session, Model model){
		Member member = (Member) session.getAttribute("member");
		int apt_APTGNo = member.getApt_APTGNo();
		String m_memberNo = member.getM_memberNo();
		List<ManagementFee> list = mntFeeService.selectMonthManagementFee(m_memberNo);
		List<PublicManagementFee> list2 = publicMntService.selectMonthPublicManagementFee(apt_APTGNo);
								
		model.addAttribute("monthMntFee", list.get(0));
		model.addAttribute("monthPublicFee",list2.get(0));
		model.addAttribute("list2",list2);

		return "/mypage/managementFeePay";
	}
	
	@RequestMapping("/paySequence1")
	public String paySequence1(){
		return "/pay/paySequence1";
	}
	

}
