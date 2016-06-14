package kosta.apt.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.apt.domain.facilityInfo.FacilityInfo;
import kosta.apt.domain.member.Member;

@Repository
public class FacilityInfoDao {
	private SqlSession sqlSession;
	private static final String namespace ="kosta.apt.mapper.FacilityMapper"; 
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		
	}

	public FacilityInfo listFacilityInfo(int aptNum) {
		System.out.println("facilityInfo Dao 들어옴"+aptNum);
		return sqlSession.selectOne(namespace+".facilityInfo", aptNum);
	}

}
