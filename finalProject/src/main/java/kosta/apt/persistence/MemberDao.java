package kosta.apt.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.apt.domain.member.AddressCity;
import kosta.apt.domain.member.AptList;
import kosta.apt.domain.member.AptTransactionPrice;
import kosta.apt.domain.member.LoginCheck;
import kosta.apt.domain.member.Member;
import kosta.apt.mapper.MemberMapper;

@Repository
public class MemberDao {

	private SqlSession sqlSession;// 세션테플레이트 생성

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	public List<AddressCity> getCity(int state) {
		return sqlSession.getMapper(MemberMapper.class).getCity(state);
	}

	public int getStateNum(String selectState) {
		return sqlSession.getMapper(MemberMapper.class).getStateNum(selectState);
	}

	public List<AptList> getAptName(String address) {
		return sqlSession.getMapper(MemberMapper.class).getAptName(address);
	}

	public String getAddress(HashMap<String, String> map) {
		return sqlSession.getMapper(MemberMapper.class).getAddress(map);
	}

	public int checkMemberId(String id) {
		if (sqlSession.getMapper(MemberMapper.class).checkMemberId(id) == 0) {
			return 1;
		} else {
			return -1;
		}
	}

	public void insertMember(Member member) {
		sqlSession.getMapper(MemberMapper.class).insertMember(member);

	}

	public int loginCheck(LoginCheck loginCheck) {

		return sqlSession.getMapper(MemberMapper.class).checkMemberPass(loginCheck);

	}

	public Member getMember(String id) {
		return sqlSession.getMapper(MemberMapper.class).getMamber(id);
	}

	public String getAPTAddress(int apt_APTGNo) {
		return sqlSession.getMapper(MemberMapper.class).getAPTAddress(apt_APTGNo);
	}

	public void updateMember(Member member) {
		sqlSession.getMapper(MemberMapper.class).updateMember(member);

	}

	public int getAptNum(HashMap<String, String> map) {
		return sqlSession.getMapper(MemberMapper.class).getAptNum(map);
	}

	public void updateRealTransactionPrice(AptTransactionPrice aptTransactionPrice) {
			
			sqlSession.getMapper(MemberMapper.class).updateRealTransactionPrice(aptTransactionPrice);
			
		

	}

}
