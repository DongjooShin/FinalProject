package kosta.apt.persistence;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.apt.domain.member.Member;
import kosta.apt.domain.vote.Candidate;
import kosta.apt.domain.vote.Voter;
import kosta.apt.mapper.VoterMapper;

@Repository
public class VoteDao {

	public static VoteDao dao = new VoteDao();
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		
	}
	
	public Member selectOneMember(String id){
		Member m = new Member();
		m = sqlSession.getMapper(VoterMapper.class).selectOneMember(id);
		
		return m;
	}

	public Member selectGroupPresi(int groupNo) {
		Member m = null;
		m = sqlSession.getMapper(VoterMapper.class).selectGroupPresi(groupNo);
		
		return m;
	}
	public List<Candidate> selectAllEachCandi(Candidate c){
		List<Candidate> list=null;
		list = sqlSession.getMapper(VoterMapper.class).selectAllEachCandi(c);
		
		return list;
	}
	public void updateVflag(int v,String id) {
		
		Member m = new Member();
		m.setM_memberNo(id);
		m.setV_flag(v);
		sqlSession.getMapper(VoterMapper.class).updateVflag(m);
		System.out.println("v:"+v+", id:"+id);
	}
	public Integer maxCandiNo(){
		return sqlSession.getMapper(VoterMapper.class).maxCandiNo();
	}
	public Integer searchSymbol(HashMap<String, Integer> map){
		Integer re = 0;
		re = sqlSession.getMapper(VoterMapper.class).searchSymbol(map);
	
		return re;
	}
	public Integer selectOneCandi(String id){
		return sqlSession.getMapper(VoterMapper.class).selectOneCandi(id);
	}
	public void insertCandidate(Candidate c){
		System.out.println(c.toString());
		sqlSession.getMapper(VoterMapper.class).insertCandidate(c);
	}
	public void levelDownGroupPresi(String candi){
		sqlSession.getMapper(VoterMapper.class).levelDownGroupPresi(candi); 	
	}
	public void deleteCandidate(int candidateNo) {
		sqlSession.getMapper(VoterMapper.class).deleteCandidate(candidateNo);
	}
	public int voterGPNum(Candidate c){
		return sqlSession.getMapper(VoterMapper.class).selectVoterGPNum(c);
	}
	public int groupGPNum(int aptno){
		return sqlSession.getMapper(VoterMapper.class).selectGroupGPNum(aptno);
	}
	public void updateAllVflag(HashMap<String, Integer> map){
		sqlSession.getMapper(VoterMapper.class).updateAllVflag(map);
	}
	public String getMemberName(String id){
		return sqlSession.getMapper(VoterMapper.class).getMemberName(id);
	}

	public void updateHit(int hit) {
		sqlSession.getMapper(VoterMapper.class).updateHit(hit);
	}
	
	public int maxVoterNo(){
		return sqlSession.getMapper(VoterMapper.class).maxVoterNo();
	}
	public void insertVoter(Voter v) {
		sqlSession.getMapper(VoterMapper.class).insertVoter(v);
	}
	public Voter selectExistVoter(HashMap<String, Integer> map){
		return sqlSession.getMapper(VoterMapper.class).selectExistVoter(map);
	}
	
	
	
//----------------- building president ------------------------
	
	
	public List<Member> selectBuildingPresi(int aptgno) {
		return sqlSession.getMapper(VoterMapper.class).selectBuildingPresi(aptgno);
	}

	public void levelDownBuildingPresi(int aptgno) {
		sqlSession.getMapper(VoterMapper.class).levelDownBuildingPresi(aptgno);
	}

	public Integer searchBSymbolService(HashMap<String, Integer> map) {
		return sqlSession.getMapper(VoterMapper.class).searchBSymbolService(map);
	}
	
	
	
	/*

	public void levelDownBuildingPresi(int groupNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re=0;
		try { 
			re = sqlSession.getMapper(VoterMapper.class).levelDownBuildingPresi(groupNo); 
			if(re>0){
				   sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
	}

	public int totalBPVoterNum(int groupNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int count =0;
		
		try {
			count = sqlSession.getMapper(VoterMapper.class).totalBPVoterNum(groupNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return count;
	}
	public void updateAllResiV2flag(HashMap<String, Integer> hash){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re=0;
		
		try {
			re = sqlSession.getMapper(VoterMapper.class).updateAllResiV2flag(hash);
			if(re>0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	}


	public String selectTopGroupCandi(int groupNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String re=null;
		try {
			re = sqlSession.getMapper(VoterMapper.class).selectTopGroupCandi(groupNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close(); 
		}
			
		return re;
	}
	
	public int selectTotalBuildingNum(int groupNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re=0;
		try {
			re = sqlSession.getMapper(VoterMapper.class).selectTotalBuildingNum(groupNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close(); 
		}
			
		return re;
	}
	public String selectTopBuildingCandi(int groupNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String re=null;
		
		List<String> list = new ArrayList<String>();
		List<Integer> temp = new ArrayList<Integer>();
		List<Integer> wholeBuil = new ArrayList<Integer>();
		
		temp=sqlSession.getMapper(VoterMapper.class).AllBuildingNo(groupNo);
		
		for(int i=0; i<temp.size(); i++){
			boolean flag=false;
			
			for(int j=0; j<wholeBuil.size(); j++){
				if(wholeBuil.get(j) == temp.get(i)){
					flag=true;
				}
			}
			if(flag == false){
				wholeBuil.add(temp.get(i));
			}
		}
		
		HashMap<String, Integer> hm = new HashMap<String,Integer>();
		hm.put("groupNo", groupNo);
		
		try {
			for(int i=0; i<wholeBuil.size(); i++){
				hm.put("builNo", wholeBuil.get(i));
				re = sqlSession.getMapper(VoterMapper.class).selectBuildingGroupCandi(hm);
				list.add(re);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close(); 
		}
			
		return re;
	}
	public void updateGPGrade(String mid) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re=0;
		try {
			re = sqlSession.getMapper(VoterMapper.class).updateGPGrade(mid);
			if(re>0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	}
	public void updateBPGrade(String mid) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re=0;
		try {
			re = sqlSession.getMapper(VoterMapper.class).updateBPGrade(mid);
			if(re>0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	}


	public List<Voter> selectAllVoter(Voter v) {
		List<Voter> vlist = null;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			vlist = sqlSession.getMapper(VoterMapper.class).selectAllVoter(v);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return vlist;
	}

	
*/







}
