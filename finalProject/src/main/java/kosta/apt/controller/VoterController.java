package kosta.apt.controller;

import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kosta.apt.domain.member.Member;
import kosta.apt.domain.vote.Candidate;
import kosta.apt.domain.vote.ImageUtil;
import kosta.apt.domain.vote.VoteResult;
import kosta.apt.domain.vote.Voter;
import kosta.apt.service.VoteService;

@Controller
@RequestMapping("/voter/*")
public class VoterController {
/*
	@Resource(name = "uploadPath")
	private String uploadPath;*/
	@Inject
	private VoteService voteService;

	
//-------------------------case : group presi----------------------------------
	@RequestMapping(value = "groupPresiMain", method = RequestMethod.GET)
	public String managerGroupPresi(HttpSession session,Model model) {
		Member mr = (Member)session.getAttribute("member");
		Member member = voteService.selectOneMemberService(mr.getM_memberNo());
		Member gpm = voteService.selectGroupPresiService(member.getApt_APTGNo());
		Candidate c = new Candidate();
		c.setApt_APTGNo(member.getApt_APTGNo());
		c.setCd_group("입주자대표");
		
		List<Candidate> groupPresi = voteService.selectAllEachCandiService(c);
		List<VoteResult> vr = new ArrayList<>();
		
		getVoteRating(session,model);

		int groupNum = voteService.groupGPNumService(member.getApt_APTGNo());
		
		for(int i=0; i<groupPresi.size(); i++){
			VoteResult temp = new VoteResult();
			String name = voteService.getMemberName(groupPresi.get(i).getM_memberNo());
			temp.setName(name);
			temp.setPercent(groupPresi.get(i).getCd_voteNum()*100/groupNum);
			vr.add(temp);
		}
		
		model.addAttribute("vr",vr);
		
		//---------manager-------------------------	
		if(member.getM_grade()==2){
			if (member.getV_flag() == 2) {
				model.addAttribute("m", member);
				model.addAttribute("gpm", gpm);
				return managerGroupPresiRegist(session,model);
			} else {
				model.addAttribute("m", member);
				return "/votes/groupPresiMain";
			}
			//----------------------------------
		}else{
			//----------resident-------------
		
			model.addAttribute("m", member);
			model.addAttribute("gpm", gpm);
			model.addAttribute("groupPresi", groupPresi);
			return "/votes/groupPresiMain";
		}
	}	

	@RequestMapping(value = "groupPresiRegist", method = RequestMethod.GET)
	public String managerGroupPresiRegist(HttpSession session,Model model) {
		Member member = (Member)session.getAttribute("member");	//Get Session
		Member gpm = voteService.selectGroupPresiService(member.getApt_APTGNo());	//Group President now		
		
		Candidate c = new Candidate();
		c.setCd_group("입주자대표");
		c.setApt_APTGNo(member.getApt_APTGNo());

		List<Candidate> clist = voteService.selectAllEachCandiService(c);	//List of Already exist Candidate 
		
		if (clist != null) {	
			voteService.updateVflagService(2, member.getM_memberNo());	
		} else {
			voteService.updateVflagService(1, member.getM_memberNo());
		}

		model.addAttribute("m", member);
		model.addAttribute("gpm", gpm);
		model.addAttribute("clist", clist);
/*		model.addAttribute("uploadPath", uploadPath);*/
		model.addAttribute("GPmessage","No");
		return "/votes/groupPresiRegist";
	}	//Done

	@RequestMapping(value = "insertCandidate", method = RequestMethod.POST)
	public String insertGPCandidate(HttpSession session,Candidate c, MultipartFile file, Model model, HttpServletRequest request) throws Exception {
		Member member = (Member)session.getAttribute("member");		//Get Session
		Member gpm = voteService.selectGroupPresiService(member.getApt_APTGNo());	//Group President now
		List<Candidate> clist = voteService.selectAllEachCandiService(c);	
		
		
		if (clist != null) {
			voteService.updateVflagService(2, member.getM_memberNo());
		} else {
			voteService.updateVflagService(1, member.getM_memberNo());
		}
		
		//Exception Handling
		if (gpm != null) {
			model.addAttribute("GPmessage", "현 입주자대표의 권한이 하향되지 않았습니다.");
		} else {
			if (voteService.searchSymbolService(c.getCd_symbol(),c.getApt_APTGNo()) != null) {

				model.addAttribute("GPmessage", "이미 존재하는 기호입니다.");
			} else {
				if (voteService.selectOneCandiService(c.getM_memberNo()) != null) {
					model.addAttribute("GPmessage", "이미 존재하는 후보입니다.");
				} else {
					if(voteService.selectOneMemberService(c.getM_memberNo()) == null){
						model.addAttribute("GPmessage", "존재하지 않는 입주민입니다.");
					}else{
						
				
						Member temp = voteService.selectOneMemberService(c.getM_memberNo());
						c.setCd_buildingNo(temp.getM_buildingNo());
						model.addAttribute("GPmessage", "No");
						
						String b_fname = null;
						if (!file.isEmpty()) {
							b_fname = file.getOriginalFilename();
							
							String uploadDir = request.getServletContext().getRealPath("/j_upload/");
							
							file.transferTo(new File(uploadDir,b_fname));
							// aaa.gif => aaa_small.gif
							String pattern = b_fname.substring(b_fname.indexOf(".") + 1);
							String headName = b_fname.substring(0, b_fname.indexOf("."));
							String imagePath = uploadDir + "\\" + b_fname;
							File src = new File(imagePath);
							String thumImagePath = uploadDir + "\\" + headName + "_small." + pattern;
							File dest = new File(thumImagePath);
		
							if (pattern.equals("jpg") || pattern.equals("png") || pattern.equals("gif")
									|| pattern.equals("JPG") || pattern.equals("PNG") || pattern.equals("GIF")) 
							{
								ImageUtil.resize(src, dest, 210, ImageUtil.RATIO);
							}
		
							c.setCd_imageName(headName + "_small." + pattern);
							
						}else{
							b_fname = "default_non_image_small.png";
							c.setCd_imageName(b_fname);
						}
						
						
						c.setApt_APTGNo(member.getApt_APTGNo());
						
						if(voteService.maxCandiNoService() != null)
						{	
							c.setCandidateNo(voteService.maxCandiNoService() + 1);
						}else{
							c.setCandidateNo(1);
						}
						voteService.insertCandidateService(c);	//insert
					}
				}
			}
		}
		
		clist = voteService.selectAllEachCandiService(c);	
		gpm = voteService.selectGroupPresiService(member.getApt_APTGNo());
		model.addAttribute("m", member);
		model.addAttribute("gpm", gpm);
		model.addAttribute("clist", clist);
		
		return "/votes/groupPresiRegist";
	}//Done

	@RequestMapping(value = "levelDownGP")
	public String levelDownGP(HttpSession session,Model model) {
		Member member = (Member)session.getAttribute("member");
		Member gpm = voteService.selectGroupPresiService(member.getApt_APTGNo());

		voteService.levelDownGroupPresiService(gpm.getM_memberNo());
		return managerGroupPresiRegist(session,model);
	}//Done
	
	@RequestMapping(value="deleteGP",method=RequestMethod.POST)
	public String deleteGP(HttpSession session, @ModelAttribute("cno")int cno, Model model){
		voteService.deleteCandidateService(cno);
		return managerGroupPresiRegist(session,model);
	}//Done
	
	@RequestMapping(value="startVote",method=RequestMethod.GET)
	public String startVote(HttpSession session,Model model){
		Member m = (Member)session.getAttribute("member");
		voteService.updateAllVflagService(2,m.getApt_APTGNo());
	
		getVoteRating(session,model);
		
		voteService.updateVflagService(3, m.getM_memberNo());
		
		return  managerGroupPresi(session,model);
	}//Done
	
	public void getVoteRating(HttpSession session,Model model){
		Member member = (Member)session.getAttribute("member");
		int voterNum = voteService.voterGPNumService(member.getApt_APTGNo(),"입주자대표");
		int groupNum = voteService.groupGPNumService(member.getApt_APTGNo());
		int voterate = voterNum*100/groupNum;
	
		model.addAttribute("groupNum", groupNum);
		model.addAttribute("voterNum", voterNum);
		model.addAttribute("voterate", voterate);
	}//Done
	
	@RequestMapping(value="closeVote",method=RequestMethod.GET)
	public String closeVote(HttpSession session,Model model){
		Member m = (Member)session.getAttribute("member");
		voteService.updateGP(m.getApt_APTGNo());	// GP register
		voteService.updateAllVflagService(4, m.getApt_APTGNo());
		voteService.updateVflagService(4,  m.getM_memberNo());
		return managerGroupPresi(session,model);
	}//Done

	@RequestMapping(value="returnFirst",method=RequestMethod.GET)
	public String returnFirst(HttpSession session,Model model){

		Member m = (Member)session.getAttribute("member");
		voteService.updateAllVflagService(1, m.getApt_APTGNo());
		voteService.updateVflagService(1, m.getM_memberNo());
		return managerGroupPresi(session,model);
	}//Done
	
	@RequestMapping(value="voteSubmitOk",method=RequestMethod.POST)
	public String voteSubmitOk(HttpSession session,@ModelAttribute("pass")String pass,@ModelAttribute("onechoose")String[] id,Model model){
		Member m = (Member)session.getAttribute("member");
		System.out.println("dho!");
		
		if(id == null){
			String message = "후보를 선택해 주세요";
			model.addAttribute("msg", message);
		}else{
			
			if(m.getM_pass().equals(testSHA256(pass))){
				HashMap<String, Integer> map = new HashMap<>();
				map.put("buildingNo", m.getM_buildingNo());
				map.put("roomNo", m.getM_roomNo());
				Voter vcheck = voteService.selectExistVoterService(map);
				
				if(vcheck != null){
					String message = "이미 투표한 호수입니다.";
					model.addAttribute("msg", message);
					voteService.updateVflagService(3, m.getM_memberNo());
				}else{
				
					for(int i=0; i<id.length; i++){
						System.out.println(id[i]);
					}
					System.out.println("id:"+id[0]);
					voteService.updateHitService(id[0]);
					voteService.updateVflagService(3, m.getM_memberNo());
					Voter v = new Voter(voteService.maxVoterNoService()+1, m.getM_buildingNo(), m.getM_roomNo(), m.getM_memberNo(), m.getApt_APTGNo(), "입주자대표");
					
					voteService.insertVoterService(v);
					model.addAttribute("msg", "No");
				}
			}else{
				String message = "비밀번호 오류";
				model.addAttribute("msg", message);
			}
		}
		
		return managerGroupPresi(session,model);
	}//Done
	
//---------------------------------------------------------------------------------------
	
//-----------------------------case : building presi-------------------------------------
	
	@RequestMapping(value="buildingPresiMain")
	public String buildingPresiMain(HttpSession session){
		return "/votes/buildingPresiMain";
	}
	
	@RequestMapping(value="buildingPresiRegist",method=RequestMethod.POST)
	public String buildingPresiRegist(HttpSession session,Model model){
		Member m = (Member)session.getAttribute("member");
		
		List<Member> blist = voteService.selectBuildingPresi(m.getApt_APTGNo());
		
		Candidate c = new Candidate();
		c.setApt_APTGNo(m.getApt_APTGNo());
		c.setCd_group("동대표");
		List<Candidate> clist = voteService.selectAllEachCandiService(c);
		
		model.addAttribute("clist",clist);	//Candidate of building president now
		model.addAttribute("blist", blist);	//Building President now
		return "/votes/buildingPresiRegist";
	}
	
	@RequestMapping(value = "levelDownBP")
	public String levelDownBP(HttpSession session,Model model) {
		Member member = (Member)session.getAttribute("member");
		
		voteService.levelDownBuildingPresi(member.getApt_APTGNo());

		return buildingPresiRegist(session,model);
	}
	
	@RequestMapping(value="insertBCandidate",method=RequestMethod.POST)
	public String insertBCandidate(HttpSession session,Candidate c, MultipartFile file, Model model,HttpServletRequest request) throws Exception{
	
		Member member = (Member)session.getAttribute("member");
		
		List<Member> blist = voteService.selectBuildingPresi(member.getApt_APTGNo());
		c.setCd_group("동대표");
		c.setApt_APTGNo(member.getApt_APTGNo());
		
		List<Candidate> clist = voteService.selectAllEachCandiService(c);
		
		model.addAttribute("m", member);
		model.addAttribute("blist", blist);
		model.addAttribute("clist", clist);
		
		
		if (clist != null) {
			voteService.updateVflagService(2, member.getM_memberNo());
		} else {
			voteService.updateVflagService(1, member.getM_memberNo());
		}
		
		if (blist != null) {
			model.addAttribute("BPmessage", "현 동대표들의 권한이 하향되지 않았습니다.");
		} else {
			if (voteService.searchBSymbolService(c.getCd_symbol(),c.getApt_APTGNo()) != null) {
				model.addAttribute("BPmessage", "이미 존재하는 기호입니다.");
			} else {
				if (voteService.selectOneCandiService(c.getM_memberNo()) != null) {
					model.addAttribute("BPmessage", "이미 존재하는 후보입니다.");
				} else {
					String b_fname = null;
					if (!file.isEmpty()) {
						b_fname = file.getOriginalFilename();
					}else{
						b_fname = "non_image.png";
					}
					String uploadDir = request.getServletContext().getRealPath("/j_upload/");
					System.out.println(uploadDir);
				
					file.transferTo(new File(uploadDir,b_fname));
					// aaa.gif => aaa_small.gif
					String pattern = b_fname.substring(b_fname.indexOf(".") + 1);
					String headName = b_fname.substring(0, b_fname.indexOf("."));
					String imagePath = uploadDir + "/" + b_fname;
						
					File src = new File(imagePath);
					String thumImagePath = uploadDir + "/" + headName + "_small." + pattern;
					File dest = new File(thumImagePath);

					if (pattern.equals("jpg") || pattern.equals("png") || pattern.equals("png")) {
						ImageUtil.resize(src, dest, 210, ImageUtil.RATIO);
					}

					c.setCd_imageName(headName + "_small." + pattern);
					
					c.setApt_APTGNo(member.getApt_APTGNo());
					if(voteService.maxCandiNoService() != null)
					{	
						c.setCandidateNo(voteService.maxCandiNoService() + 1);
					}else{
						c.setCandidateNo(1);
					}
					voteService.insertCandidateService(c);
				}
			}
		}
		
		return buildingPresiRegist(session,model);
	}
	
	public String testSHA256(String str) {
	      String SHA = "";
	      try {
	         MessageDigest sh = MessageDigest.getInstance("SHA-256");
	         sh.update(str.getBytes());
	         byte byteData[] = sh.digest();
	         StringBuffer sb = new StringBuffer();
	         for (int i = 0; i < byteData.length; i++) {
	            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	         }
	         SHA = sb.toString();

	      } catch (NoSuchAlgorithmException e) {
	         e.printStackTrace();
	         SHA = null;
	      }
	      return SHA;
	   }
	
	
	
	
	
}


	
	
	
	
	
	
