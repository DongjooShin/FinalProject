package kosta.apt.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Property.AptTransactionPrice;
import kosta.apt.domain.Property.Property;
import kosta.apt.mapper.PropertyMapper;

@Repository
public class PropertyDAO {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void APTSaleInsert(Property property){
	
		property.setM_memberNo("테스트하자");
		
		sqlSession.getMapper(PropertyMapper.class).APTSaleInsert(property);
	}

	public List<Property> APTlist() {
		List<Property> list = null;
		list= sqlSession.getMapper(PropertyMapper.class).APTlist();
		return list;
	}

	public int selectPr_id() {
		
		if(sqlSession.getMapper(PropertyMapper.class).selectPr_id() ==null){
			return 0;
		}else{
			int num = sqlSession.getMapper(PropertyMapper.class).selectPr_id();
			
			return num;
		}
	
	}

	public void insertAPTsale(Property property) {
		
		sqlSession.getMapper(PropertyMapper.class).insertAPTsale(property);
	}

	public List<Property> aptlist(Property property, Criteria cri) {
	
		List<Property> list = null;
		
		list = sqlSession.getMapper(PropertyMapper.class).aptlist(new RowBounds(cri.getPageStart(),cri.getPerPageNum()), property);
		
		return list;
	}

	public int listCountCri(Criteria cri) {
	
		int crinum =0;
		
		crinum = sqlSession.getMapper(PropertyMapper.class).listCountCri(cri);
		
		return crinum;
	}

	public Property aptSaledetail(int pr_propertyNo) {
		
		Property property = null;
		property = sqlSession.getMapper(PropertyMapper.class).aptSaledetail(pr_propertyNo);
		
		return property;
	}

	public void aptUpdate(Property property) {
		
		sqlSession.getMapper(PropertyMapper.class).aptUpdate(property);
		
	}

	public void aptDelete(int pr_propertyNo){
	
		sqlSession.getMapper(PropertyMapper.class).aptDelete(pr_propertyNo);
	}

	public String getAptAddr(int apt_aptGno) {
		
		return sqlSession.getMapper(PropertyMapper.class).getAptAddr(apt_aptGno);	
	}

	public String getAptName(int apt_aptGno) {
		
		return sqlSession.getMapper(PropertyMapper.class).getAptName(apt_aptGno);
	}

	public List<AptTransactionPrice> getRealTransaction(HashMap<String, String> map) {

		return sqlSession.getMapper(PropertyMapper.class).getRealTransaction(map);
		
	}

	public List<AptTransactionPrice> getAptTransaction(String address) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(PropertyMapper.class).getAptTransaction(address);
	}
	
}
