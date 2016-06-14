package kosta.apt.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.apt.domain.Store.Store;

@Repository
public class StoreDao {

	private SqlSession sqlSession;
	private static final String namespace ="kosta.apt.mapper.StoreMapper"; 
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;

	}
	
	public void regist(Store store) {
		System.out.println("store Dao insert!!");
		System.out.println("store Dao insert!!=>"+store.toString());
		sqlSession.insert(namespace+".insertSt", store);
		
	}

	public List<Store> listStore(int aptNum) {
		System.out.println("store Dao list!!");
		return sqlSession.selectList(namespace+".listSt", aptNum);
	}

	public List<Store> listStoreFood(Store store) {
		System.out.println("store Dao list food!!");
		return sqlSession.selectList(namespace+".listStGroup", store);
	}

	public int deleteStore(int s_storeNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".deleteSt", s_storeNo);
	}

}
