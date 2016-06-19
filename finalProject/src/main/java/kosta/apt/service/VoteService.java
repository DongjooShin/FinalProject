package kosta.apt.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kosta.apt.domain.member.Member;
import kosta.apt.domain.vote.Candidate;
import kosta.apt.domain.vote.Voter;
import kosta.apt.persistence.VoteDao;

@Service
public class VoteService {
	@Inject
	public VoteDao votedao;
	//@Inject
	//public  APTGroupDao aptdao;

	public static VoteService service = new VoteService();
	
	public Member selectOneMemberService(String id) {	
		return votedao.selectOneMember(id);
	}
	public Member selectGroupPresiService(int groupNo) {
		return votedao.selectGroupPresi(groupNo);
	}
	public List<Candidate> selectAllEachCandiService(Candidate c) {
		return votedao.selectAllEachCandi(c);
	}
	public void updateVflagService(int v, String id) {
		System.out.println("v:"+v+", id:"+id);
		votedao.updateVflag(v, id);
	}
	public Integer maxCandiNoService() {
		return votedao.maxCandiNo();
	}
	public Integer searchSymbolService(int s,int aptgno) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("aptgno", aptgno);
		map.put("s", s);
		return votedao.searchSymbol(map);
	}
	public Integer selectOneCandiService(String id) {
		return votedao.selectOneCandi(id);
	}
	public void insertCandidateService(Candidate c) throws Exception {
		int size = 20 * 1024 * 1024; // 20MB

		votedao.insertCandidate(c);
	}
	public void levelDownGroupPresiService(String candi) {
		votedao.levelDownGroupPresi(candi);
	}
	public void deleteCandidateService(int candidateNo) {
		votedao.deleteCandidate(candidateNo);
	}
	public int voterGPNumService(int aptno, String group){
		Candidate c = new Candidate();
		c.setApt_APTGNo(aptno);
		c.setCd_group(group);
		return votedao.voterGPNum(c);
	}
	public int groupGPNumService(int aptno){
		return votedao.groupGPNum(aptno);
	}
	public void updateAllVflagService(int v,int aptno){
		HashMap<String, Integer> map = new HashMap<>();
		map.put("v", v);
		map.put("aptno", aptno);
		votedao.updateAllVflag(map);
	}
	public String getMemberName(String id){
		return votedao.getMemberName(id);	
	}	

	public void updateHitService(String id) {
		votedao.updateHit(id);
	}
	public int maxVoterNoService() {
		return votedao.maxVoterNo();
	}
	public void insertVoterService(Voter v) {
		votedao.insertVoter(v);
	}
	public Voter selectExistVoterService(HashMap<String, Integer> map){
		return votedao.selectExistVoter(map);
	}
	public void updateGP(int aptgno) {
		votedao.updateGP(aptgno);
	}
	
	
	
//---------------------- building president ----------------------
	
	public List<Member> selectBuildingPresi(int aptgno) {
		return votedao.selectBuildingPresi(aptgno);
	}
	public void levelDownBuildingPresi(int aptgno) {
		votedao.levelDownBuildingPresi(aptgno);
	}
	public Integer searchBSymbolService(int cd_symbol, int apt_APTGNo) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("s", cd_symbol);
		map.put("aptgno", apt_APTGNo);
		return votedao.searchBSymbolService(map);
	}

	
	
	/*
	public Member selectBuildingPresiService(int groupNo,int buildingNo) {
		return votedao.selectBuildingPresi(groupNo,buildingNo);
	}

	public void levelDownBuildingPresiService(int groupNo){
		votedao.levelDownBuildingPresi(groupNo);
	}
	public int totalBPVoterNum(int groupNo){
		return votedao.totalBPVoterNum(groupNo);
	}

	public void updateAllResiV2flagService(HashMap<String, Integer> hash) {
		votedao.updateAllResiV2flag(hash);
	}

	public String selectTopGroupCandiService(int groupNo) {
		return votedao.selectTopGroupCandi(groupNo);
	}
	
	public int selectTotalBuildingNumService(int groupNo){
		return votedao.selectTotalBuildingNum(groupNo);
	}
	public String selectTopBuildingCandiService(int groupNo){
		return votedao.selectTopBuildingCandi(groupNo);
	}
	public void updateGPGradeService(String mid) {
		votedao.updateGPGrade(mid);
	}
	public void updateBPGradeService(String mid) {
		votedao.updateGPGrade(mid);
	}

	
	public List<Voter> selectAllVoterService(Voter v){
		return votedao.selectAllVoter(v);
	}
	
	
	public APTGroup selectOneAPTService(int gno){
		return aptdao.selectOneAPT(gno);
	}
	public void updateGroupMainImageService(APTGroup apt){
		aptdao.updateGroupMainImage(apt);
	}
	*/
	
}
