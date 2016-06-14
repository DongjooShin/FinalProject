package kosta.apt.persistence;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.apt.domain.GroupNotice.GNSearchCriteria;
import kosta.apt.domain.GroupNotice.GroupNotice;

import kosta.apt.mapper.CalMapper;


@Repository
public class GroupNDao {
	

	private SqlSession sqlSession;
	private static final String namespace ="kosta.apt.mapper.GNMapper"; 
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;

	}
	
	public void insertGN(GroupNotice groupNotice) {
		// TODO Auto-generated method stub
		System.out.println("GN dao 들어옴");
		System.out.println(groupNotice.toString());
		sqlSession.insert(namespace+".insertGN", groupNotice);
		
	}
	
	public List<GroupNotice> listAll() {
		System.out.println("GN dao listAll 들어옴");
		//System.out.println(groupNotice.toString());
		return sqlSession.selectList(namespace+".listAll");
	}
	public GroupNotice read(int g_groupNoticeNo) {
		System.out.println("GN dao listAll 들어옴");
		return sqlSession.selectOne(namespace+".read", g_groupNoticeNo);
	}
	public void update(GroupNotice gn) {
		System.out.println("GN dao update 들어옴");
		sqlSession.update(namespace+".update", gn);
	}
	public void delete(int g_groupNoticeNo) {
		System.out.println("GN dao update 들어옴");
		sqlSession.delete(namespace+".delete", g_groupNoticeNo);
		
	}
	public void hitCount(int g_groupNoticeNo) {
		sqlSession.update(namespace+".hitCount", g_groupNoticeNo);
		
	}
	public List<GroupNotice> listSearchCriteria(GNSearchCriteria cri) {
		System.out.println("searchCri list=> "+cri.toString());
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listSearch",cri,new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}
	public int listSearchCount(GNSearchCriteria cri) {
		System.out.println("searchCri => "+cri.toString());
		return sqlSession.selectOne(namespace+".listSearchCount",cri);
	}

	public List<GroupNotice> newlist(int aptNum) {
		// TODO Auto-generated method stub
		System.out.println("dao aptNum: "+aptNum);
		return sqlSession.selectList(namespace+".newlist",aptNum);
	}
	
	/*public List<GroupNotice> listSearchCriteria(GNSearchCriteria cri,int aptNum) {
	      // TODO Auto-generated method stub
	      //search랑 apt ->HashMap
	      HashMap<String,GNSearchCriteria> map1=new HashMap<String,GNSearchCriteria>();
	      HashMap<String, Integer> map2=new HashMap<String,Integer>();
	      map1.put("cri", cri);//부모 b_step
	      map2.put("apt", aptNum);
	      System.out.println("listSearchCri dao들어옴");
	      System.out.println("cri "+cri.toString());
	      System.out.println("apt_no"+aptNum);
	      return sqlSession.getMapper(GNMapper.class).gnList(new RowBounds(cri.getPageStart(), cri.getPerPageNum()),map1,map2);
	      
	      //return sqlSession.selectList(namespace+".listSearch",map1,new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	   }
	   public int listSearchCount(GNSearchCriteria cri,int aptNum) {
	      System.out.println("listCount dao들어옴");
	      HashMap<String,GNSearchCriteria> map1=new HashMap<String,GNSearchCriteria>();
	      HashMap<String, Integer> map2=new HashMap<String,Integer>();
	      map1.put("cri", cri);//부모 b_step
	      map2.put("apt", aptNum);
	      //return sqlSession.selectOne(namespace+".listSearchCount",cri);
	      return sqlSession.getMapper(GNMapper.class).gnlistCount(map1,map2);
	   }*/

/*	public void insertGN(GroupNotice groupNotice) {
		System.out.println("GN dao 들어옴");
		int a= sqlSession.getMapper(GNMapper.class).insertGN(groupNotice);
		if(a>0){
			System.out.println("a: gn add 성공");
		}else{
			System.out.println("a: 실패애애애애");
		}
		
		if (sqlSession != null) {
			System.out.println("gn add 성공");
		} else {
			System.out.println("실패애애애애");
		}
	}*/

	/*public List<GroupNotice> gnList(int startRow, Search search, int apt) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		// search�옉 apt ->HashMap
		HashMap<String, Search> map1 = new HashMap<String, Search>();
		HashMap<String, Integer> map2 = new HashMap<String, Integer>();

		map1.put("se", search);// 遺�紐� b_step
		map2.put("a", apt);

		System.out.println("search" + search.toString());
		System.out.println("apt_no" + apt);
		return sqlSession.getMapper(GNMapper.class).gnList(new RowBounds(startRow, 10), map1, map2);
	}

	public GroupNotice selectgnDetail(int g_groupNoticeNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		return sqlSession.getMapper(GNMapper.class).selectgnDetail(g_groupNoticeNo);
	}

	public int uphit(int g_groupNoticeNo) {
		int re = -1;

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			// 1.媛��옣癒쇱� 留ㅽ띁�뿉 �벑濡�
			re = sqlSession.getMapper(GNMapper.class).uphit(g_groupNoticeNo);

			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return re;
	}

	public int updategn(GroupNotice gn) {
		int re = -1;

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			// 1.媛��옣癒쇱� 留ㅽ띁�뿉 �벑濡�
			re = sqlSession.getMapper(GNMapper.class).updategn(gn);

			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return re;
	}

	public int selectgnDel(int gn) {
		int re = -1;

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			// 1.媛��옣癒쇱� 留ㅽ띁�뿉 �벑濡�
			re = sqlSession.getMapper(GNMapper.class).selectgnDel(gn);

			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return re;
	}

	public int countgroupNotice(Search search, int apt) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = 0;
		try {
			HashMap<String, Search> map1 = new HashMap<String, Search>();
			HashMap<String, Integer> map2 = new HashMap<String, Integer>();

			map1.put("se", search);// 遺�紐� b_step
			map2.put("a", apt);

			System.out.println("Count search : " + search.toString());
			System.out.println("Count apt_no : " + apt);

			re = sqlSession.getMapper(GNMapper.class).countgroupNotice(map1, map2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}

	public Integer selectCount(int apt_APTGNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = 0;
		try {
			re = sqlSession.getMapper(GNMapper.class).selectCount(apt_APTGNo);
			System.out.println("selectCount re 媛�: " + re);
			System.out.println("selectCount apt_ATPGNo 媛�: " + re);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}*/

}
