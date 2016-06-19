package kosta.apt.mapper;

import java.util.HashMap;
import java.util.List;

import kosta.apt.domain.member.Member;
import kosta.apt.domain.vote.Candidate;
import kosta.apt.domain.vote.Voter;


public interface VoterMapper {

	public Member selectOneMember(String id);
	public Member selectGroupPresi(int groupNo);
	public List<Candidate> selectAllEachCandi(Candidate c);
	public void updateVflag(Member m);
	public Integer maxCandiNo();
	public Integer searchSymbol(HashMap<String, Integer> map);
	public Integer selectOneCandi(String id);
	public void insertCandidate(Candidate c);
	public void levelDownGroupPresi(String candi);
	public int deleteCandidate(int candidateNo);
	public int selectVoterGPNum(Candidate c);
	public int selectGroupGPNum(int aptno);
	public void updateAllVflag(HashMap<String, Integer> map);
	public String getMemberName(String id);
	public int updateHit(String id);
	public Integer maxVoterNo();
	public int insertVoter(Voter v);
	public Voter selectExistVoter(HashMap<String, Integer> map);
	public List<Member> selectBuildingPresi(int aptgno);
	public void levelDownBuildingPresi(int aptgno);
	public Integer searchBSymbolService(HashMap<String, Integer> map);	
	public void updateGP(int aptgno);
	
	/*
	public Member selectBuildingPresi(HashMap<String, Integer> hm);
	
	public int updateV2flag(Member m);
	public int totalGroupNum(int groupNo);
	public int totalGPVoterNum(int groupNo);
	public int totalBPVoterNum(int groupNo);
	public int updateAllResiVflag(HashMap<String, Integer> hash);
	public int updateAllResiV2flag(HashMap<String, Integer> hash);

		public String selectTopGroupCandi(int groupNo);
	public String selectBuildingGroupCandi(HashMap<String, Integer> hm);
	public int updateGPGrade(String mid);
	public int updateBPGrade(String mid);

	public List<Voter> selectAllVoter(Voter v);
	public int selectTotalBuildingNum(int groupNo);
	public List<Integer> AllBuildingNo(int groupNo);
	public int levelDownBuildingPresi(int groupNo);

*/
	

}
