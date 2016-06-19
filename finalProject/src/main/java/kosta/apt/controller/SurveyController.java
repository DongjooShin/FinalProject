package kosta.apt.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kosta.apt.domain.Survey.Survey;
import kosta.apt.domain.Survey.SurveyDB;
import kosta.apt.domain.Survey.SurveyScore;
import kosta.apt.domain.member.Member;
import kosta.apt.service.SurveyService;

@Controller
@RequestMapping("/Survey")
public class SurveyController {

	SurveyService surveyService;

	@Autowired
	public void setSurveyService(SurveyService surveyService) {
		this.surveyService = surveyService;
		
	}

	@RequestMapping(value="/surveyRegist", method = RequestMethod.GET )
	public void surveyRegist()throws Exception{
		
		System.out.println("surveyRegist.jsp이다.");
	}
	
	
	@RequestMapping(value="/surveyRegist", method = RequestMethod.POST )
	public void surveyRegistForm(HttpSession session, Survey survey, @RequestParam("su_context") String str[], @RequestParam("su_title") String su_title)throws Exception{
	
		
		
		System.out.println("음씨발!");

		int maxcount =0; //설문지 개수 뀨뀨
		
		maxcount = (int)surveyService.updateSurveyGru();
		
		System.out.println(maxcount+"설문지 전체끝번호");
	
		SurveyDB surveyDB = new SurveyDB();
 	
 		String maxcount1 = "";
 		
 		System.out.println(str.length+"컨텍스트의 사이즈입니다.");
 		
 	
 		survey.setSu_group(maxcount+1);
 	
 		 	
 	      Calendar calendar = new GregorianCalendar(Locale.KOREA);
 	      int year= calendar.get(Calendar.YEAR);
 	      int month = calendar.get(calendar.MONTH)+1;
 	      int day3  = calendar.get(calendar.DAY_OF_MONTH);
 	   
 	      System.out.println(year);
 	      System.out.println(month+"월");
 	      System.out.println(day3+"일");
 	      
 	      if(day3<10 && month<10){
 	    	  String day =""+year+"0"+month+"0"+day3;
 	    	  day3 = Integer.parseInt(day);
 	  
 	    	  surveyDB.setSu_date(day3);
 	      }else if(day3<10 && month>10){
 	    	  String day =  ""+year+month+"0"+day3;
 	    	  day3 = Integer.parseInt(day);
 	    	
 	    	 surveyDB.setSu_date(day3);
 	      }else if(day3>10 && month<10){
 	    	  String day = ""+year+"0"+month+day3;
 	    	  day3 = Integer.parseInt(day);
 	
 	    	 surveyDB.setSu_date(day3);
 	      }
 	      
 	      
 	      
 	      //날짜형식 20160131 총 8숫자로 만들기위해서하는 부분 시작날짜
 	     String st_date=""; //st_date = 월+일 ;
 	     int st_date1=0;
  		
 	      String bb= survey.getSt1(); 
 	      String bb2 = survey.getSt2();
 	      if(bb !=null || bb2 !=null){
 	    	 int b =0; 
 	    	 int b2 =0;
 	    	b = Integer.parseInt(bb);
 	    	b2 = Integer.parseInt(bb2);
 	    	if(b<10&&b2<10){
 	    		st_date = ""+year+0+b+0+b2;
 	    		st_date1=Integer.parseInt(st_date);
 	    	
 	    	
 	    	}
 	    	else if(b>=10 && b2>=10){
 	    		st_date = ""+year+b+b2;
 	    		st_date1=Integer.parseInt(st_date);
 
 	    		
 	    	}
 	    	else if(b<10&&b2>10){
 	    		st_date = ""+year+0+b+b2;
 	    		st_date1=Integer.parseInt(st_date);
 	
 	    		
 	    	}
 	    	else if(b>10&&b2<10){
 	    		st_date = ""+year+b+0+b2;
 	    		st_date1=Integer.parseInt(st_date);

 	    
 	    	}
 	    	
 	    	
 	      }
 	      
 	     //날짜형식 20160131 총 8숫자로 만들기위해서하는 부분 끝날짜
  	     String ed_date=""; //st_date = 월+일 ;
  	     int ed_date1=0;
   		
  	      String ed_bb= survey.getEnd1();
  	      String ed_bb2 = survey.getEnd2();
  	      if(bb !=null || bb2 !=null){
  	    	 int b =0; 
  	    	 int b2 =0;
  	    	b = Integer.parseInt(ed_bb);
  	    	b2 = Integer.parseInt(ed_bb2);
  	    	if(b<10 && b2<10){
  	    		ed_date = ""+year+0+b+0+b2;
  	    		ed_date1 =Integer.parseInt(ed_date);

  	    	
  	    	}
  	    	else if(b>=10 && b2>=10){
  	    		ed_date = ""+year+b+b2;
  	    		ed_date1=Integer.parseInt(ed_date);
	    		
	    		
	    	}
  	    	else if(b<10&&b2>10){
  	    		ed_date = ""+year+0+b+b2;
  	    		ed_date1=Integer.parseInt(ed_date);
  	    
  	    	
  	    	}
  	    	else if(b>10 && b2<10){
  	    		ed_date = ""+year+b+0+b2;
  	    		ed_date1=Integer.parseInt(ed_date);
  	    	
  	    		
  	    	}
  	    	
  	    	
  	      }

 		
  	      
 		//i = 1; // 설문지 문항수 만큼 DB를 넣으꺼 임의의 변수값
 		//int j=0;
 		int surveygroup =0; 																		//설문지 고유번호 0부터시작
 		if(str[0] != null){																			 //surveyDB에 저장할데이터들 
 			
 			surveygroup = (int) surveyService.updateSurveyGru(); 										//그룹번호 자동증가
 	 		
 			String s_date = "";
 			String e_date = "";
 			s_date = survey.getSt1()+"월"+survey.getSt2()+"일";
 			e_date = survey.getEnd1()+"월"+survey.getEnd2()+"일";
 			
 			 int b =0; 
 	    	 int b2 =0;
 	    	b = Integer.parseInt(bb);
 	    	b2 = Integer.parseInt(bb2);
 	    
 			surveyDB.setSu_startdate(st_date1);
 			System.out.print(surveyDB.getSu_startdate()+"시작날짜인가");
 			surveyDB.setSu_enddate(ed_date1);
 			
 			
 			Member member = (Member) session.getAttribute("member");
 			
 			if(member!=null){
 				surveyDB.setApt_APTGNo(member.getApt_APTGNo());
 				survey.setApt_APTGNo(member.getApt_APTGNo());
 			}else{
 				surveyDB.setApt_APTGNo(5); //세션으로 가져와야할 아파트 그룹번호
 				survey.setApt_APTGNo(5); 
 			}
 			
 			surveyDB.setSu_title(su_title);
 			surveyDB.setSu_group(surveygroup+1);
 			surveygroup++;
 			
 			surveyService.insertSurveyDB(surveyDB);
 			
 		}
 		
 		String str_i="";
 		
 		String str_i2="";
	
 		
 		for(int k=0; k <str.length; k++){
 		
 	 		String context = str[k];																	 //context값을 넣으려고
 	 		if(context !=null){
 	 																									System.out.println(context+"내용입니다.");
 	 		survey.setSu_context(context);
 	 		
 	 		}
 	 		
 	 		survey.setSu_surveyNo(survey.getSu_surveyNo()+1);
 	 		
 	 		surveyService.insertSurvey(survey);
 	 		
 		}
 
 		
	}
	
	
	
	//설문지 답변부분
	
	@RequestMapping(value="/surveyRegistdeliver", method = RequestMethod.GET)
	public void surveydelivery(HttpSession session, Model model)throws Exception{
		List<Survey> survey = null;
		
		List<SurveyDB> surveyDB = null;
		
		Member member = (Member) session.getAttribute("member");
		int sessionNum = 0;
			if(member!=null){
																										System.out.println("세션값으로왓다.");
				sessionNum = member.getApt_APTGNo();
		
			}else{
																									System.out.println("세션값으로 안왔다");
				sessionNum = 5;
			}
			
			
		
		surveyDB = surveyService.surveystart(sessionNum);
		System.out.println(surveyDB.size()+"서베이 크기");
		
		
		if(surveyDB !=null){
			
			
		for(int i = 0; i< surveyDB.size(); i++){
		System.out.println(surveyDB.get(i).getSu_group()+"이게 해당하느일이다."+"시작일:"+surveyDB.get(i).getSu_startdate()+"끝날짜:"+surveyDB.get(i).getSu_enddate());
			
			int groupNum = surveyDB.get(i).getSu_group();
			
			System.out.println(groupNum);
			
				survey = surveyService.surveyList(groupNum);
				
				System.out.println(survey.size()+"설문지문항의 개수");
				System.out.println(survey.get(i).getSu_surveyNo());
				
				
				model.addAttribute("survey", survey);
			
				
			}
			model.addAttribute("su_group", survey.get(0).getSu_group());
		
		}
		
	}
	
	
	
	//설문지 배달 AJax버전 
	@RequestMapping(value="/surveyRegistdeliver2", method = RequestMethod.POST)
	public String surveyRegistdeliver2(HttpSession session, Model model)throws Exception{
		
		System.out.println("ajax컨트롤러에 들어왔다.");
		
		List<Survey> survey = null;
		
		List<SurveyDB> surveyDB = null;
		
		Member member = (Member) session.getAttribute("member");
		int sessionNum = 0;
			if(member!=null){
				System.out.println("세션값으로왓다.");
				sessionNum = member.getApt_APTGNo();
		
			}else{
				System.out.println("세션값으로 안왔다");
				sessionNum = 5;
			}
			
		
		surveyDB = surveyService.surveystart(sessionNum);
		System.out.println(surveyDB.size()+"서베이 크기");
		
		
		if(surveyDB !=null){
			
			
		for(int i = 0; i< surveyDB.size(); i++){
		System.out.println(surveyDB.get(i).getSu_group()+"이게 해당하느일이다."+"시작일:"+surveyDB.get(i).getSu_startdate()+"끝날짜:"+surveyDB.get(i).getSu_enddate());
			
			int groupNum = surveyDB.get(i).getSu_group();
			
			System.out.println(groupNum);
			
				survey = surveyService.surveyList(groupNum);
				
				System.out.println(survey.size()+"설문지문항의 개수");
				System.out.println(survey.get(i).getSu_surveyNo());
				
				
				model.addAttribute("survey", survey);
			
				
			}
			model.addAttribute("su_group", survey.get(0).getSu_group());
		
		}
		
		
		return "";
		
	}
	
	
	
	@RequestMapping(value="/surveyRegistdeliver", method = RequestMethod.POST)
	public String surveydelivery(HttpSession session, HttpServletRequest request,@RequestParam("size") int size,
								@RequestParam("su_group") int su_group){
		
		Member member = (Member) session.getAttribute("member");
		
		int value[] = new int[size];
		int valuecheck  =0;  //질문에 답했는지
		int surNo =0; //설문지 문항번호
		int surSum =0; //설문지들의 답안점수
		
		
		Survey survey = new Survey();
	
		
		survey.setSu_group(su_group);//설문지 문제집 번호
		
		for(int i=0; i<size; i++){
			
			valuecheck =Integer.parseInt( request.getParameter("check"+(i+1)));
			
			if(valuecheck != 0){//문항을 체크했다면
				value[i] = valuecheck;
			
					survey.setSu_surveyNo((i+1));
					survey.setSu_sum(value[i]);
					survey.setApt_APTGNo(member.getApt_APTGNo());
					survey.setSu_count(1);
					
		surveyService.inputsurveyDB(survey);
				
			}
			
			
		 System.out.println(value[i]);
		 
		}
			
		return "redirect:/Survey/surveyResult";
	
		}

	//설문조사 제목 출력하기
	@RequestMapping(value="/surveyResult", method = RequestMethod.GET)
	public void surveyResultTitle(HttpSession session, Model model)throws Exception{
		
		Member member = (Member) session.getAttribute("member");
	/*	
	SurveyDB surveyDB = new SurveyDB();
		
		List<SurveyDB> list = null;
		
		list = surveyService.surveyResultTitle(surveyDB);
		
		System.out.println(list.size()+"설문제집의 개수");
		
	
	
		
		List<SurveyScore> list2  = new ArrayList<SurveyScore>();
		if(list !=null){
			
		for(int i=0; i<list.size(); i++){
		
			
			Integer sugroup = list.get(i).getSu_group();
			SurveyScore surveyScore = new SurveyScore();
		
				int TotalScore = surveyService.surveyScoreSum(sugroup);
				int TotalCount = surveyService.surveyCountSum(sugroup);
		
				surveyScore.setTotalScore(TotalScore);
				surveyScore.setTotalCount(TotalCount);
				surveyScore.setAvgSum(TotalScore/TotalCount);
				surveyScore.setSu_enddate(list.get(i).getSu_enddate());
				surveyScore.setSu_startdate(list.get(i).getSu_startdate());
				surveyScore.setSu_title(list.get(i).getSu_title());
				
				list2.add(surveyScore);
				
			}
			model.addAttribute("list", list2);
		}

		
	
	model.addAttribute("list2", list);
		*/
		
	}
	
	
	//설문지 메인결과 보기
	
	@RequestMapping(value="/surveyResult", method = RequestMethod.POST)
	public ResponseEntity<List<SurveyScore>> surveyResult(Model model, HttpSession session, @RequestParam("dateNum") int dateNum)throws Exception{
			//json형태로 jsp에보내려고   ==Jackson라이브러리필요     //해당하는 시작월만뽑으려고 ==RequestParam
		
		System.out.println(dateNum+"번호가져왓다시발");
		
		
		Member member = (Member) session.getAttribute("member");

		
		SurveyDB surveyDB = new SurveyDB();
		
	
	
		List<SurveyDB> list = new ArrayList<>();
		
		String selectday = ""+20160+dateNum+"01";
		String selectend = ""+20160+dateNum+"31";
		
		int selectday2 = Integer.parseInt(selectday);
		int selectend2 = Integer.parseInt(selectend);

		surveyDB.setSu_startdate(selectday2); //리스트에 ex)1월1일부터~
		surveyDB.setSu_enddate(selectend2);  //1월 31일까지만 찾게 select구문만드려고
		
		
		if(member !=null){
		surveyDB.setApt_APTGNo(member.getApt_APTGNo());
		}else{
			surveyDB.setApt_APTGNo(1);
		}
		list = surveyService.surveySelectDay(surveyDB); //리스트에 ex)1월달만  2월달만 출력하려고
		
		
		System.out.println("리스트의 사이즈:" +list.size()+list.get(0).getSu_startdate());
		if(member !=null){
			surveyDB.setApt_APTGNo(member.getApt_APTGNo());
			
		}
		
		
		List<SurveyScore> list2  = new ArrayList<SurveyScore>();
		//SurveyScore클래스를 만들어줫다 ==>내가원하는데이터는 Survey +SurveyDB의변수들인데 필요한 변수들만 모은 클래스생성
	
		if(list !=null){ //해당월에 설문지가있는경우
			System.out.println("해당월에 설문지가있다.");
			SurveyScore surveyScore = new SurveyScore();
			
			System.out.println(list.size()+"사이즈이다.");
		for(int i=0; i<list.size(); i++){
		
			
			Integer sugroup = list.get(i).getSu_group(); //설문지번호를 알아와서 Suvey의 데이터를 가져오려고 ==평점/설문자수/설문지문항등...
			System.out.println(list.get(i).getSu_group()+"su그룹번호입니다. sugroup 이상해시발");
		
				int TotalScore = surveyService.surveyScoreSum(sugroup);
				System.out.println(TotalScore+"총점수");
				int TotalCount = surveyService.surveyCountSum(sugroup);
				System.out.println(TotalCount+"총인원");
				surveyScore.setTotalScore(TotalScore);
				surveyScore.setTotalCount(TotalCount);
				surveyScore.setAvgSum((TotalScore/TotalCount*2));
				surveyScore.setSu_enddate(list.get(i).getSu_enddate());
				surveyScore.setSu_startdate(list.get(i).getSu_startdate());
				surveyScore.setSu_title(list.get(i).getSu_title());
				surveyScore.setSu_group(list.get(i).getSu_group());
				
				System.out.println(list.get(i).getSu_title()+"제목이다.");
				
				
				
			}
		list2.add(surveyScore);
		}
		
		
		return new ResponseEntity<>(list2, HttpStatus.OK); //surveyScore클래스형태를 jsp에서 쓰겠다. ajax의 파라미터값==data가 surveyScore의 List형태로 들어가며 data.(surveyScore의변수)를 입력하면 호출가능
		
		
		
	}
	
	
	@RequestMapping(value="/surveyDetail", method = RequestMethod.POST)
	public ResponseEntity<List<Survey>> surveyDetail(@RequestParam("sugroup") int sugroup)throws Exception{
		
		System.out.println("시발머여!");
		System.out.println(sugroup+"숫자이다");
		
		List<Survey> list = new ArrayList<>();
		
		list = surveyService.surveyDetail(sugroup);
		
		
		System.out.println(list.size()+"서베이디테일의 크기이다.");
		
		return new ResponseEntity<>(list, HttpStatus.OK);
		
		
	}
	
	
	
	
}
