/*package kosta.apt.controller;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kosta.apt.domain.Paging.SearchCriteria;
import kosta.apt.domain.Store.Store;
import kosta.apt.persistence.PublicManageDao;
import kosta.apt.persistence.StoreDao;
import kosta.apt.persistence.VoteDao;

public class aptTestClass {

	@Inject
	   private StoreDao storedao;
	   @Inject
	   private VoteDao votedao;
	   @Autowired
	    private PublicManageDao pulicManagedao;
	  
	//  private ComplaintDao dao;
	   
	   @Test
	   public void Soretest() {
	      //상가 정보 list로 가져오는지 테스트
	      System.out.println("dao:"+storedao.listStore(1).size());//아파트그룹 1
	   }
	   
	   @Test
	   public void Storeinserttest(){
	      //상가 등록 되는지 확인
	      System.out.println("=========Store insert Test ==================");
	      Store store=new Store();
	      store.setApt_APTGNo(3);
	      store.setS_closeTime("10");
	      store.setS_content("시험삼아");
	      store.setS_fname("시험.jsp");
	      store.setS_group("시험이다이놈");
	      store.setS_name("test");
	      store.setS_openTime("11");
	      store.setS_storeNo(100000);
	      store.setS_tel("12122");
	      store.setS_thumFname("thum시험.jsp");
	      System.out.println("stor값=>"+store.toString());
	      //storedao.regist(store);
	      
	   }
	   
	  
	    // 건의불만 데이터가 넘어오는지 확인
	      @Test 
	      public void Complainttest() {
	         
	         SearchCriteria cri = new SearchCriteria();
	         List<Complaint> list =pulicManagedao.listSearchCriteria(cri);
	         
	         System.out.println(list.size());
	      }
	      
	         
	    // 결산데이터 확인.
	     @Test
	      public void test(){
	         List<ManagementFee> list=pulicManagedao.DataAppropriation(1);
	         System.out.println(list.toString());
	      }
	    
	    //시/도 별 데이터 확인 
	     @Test
	      public void test(){
	         List<PublicManagementFee> list=pulicManagedao.getCityGraph(1);
	         System.out.println(list.toString());
	      }
	   
	     

	      
	      @Test
	      public void InsertTest() throws Exception {
	       //후보자 등록 확인하는 테스트
	         Candidate c = new Candidate(9,"입주자대표", 5, "대졸", "주부", "전입주자대표", "잘할게요", "resident05", 1, "NULL");
	         votedao.insertCandidate(c);
	      }   
	         
	      @Test
	      public void DeleteTest() throws Exception {
	       //후보자삭제되는지 확인하는 테스트
	         votedao.deleteCandidate(4);
	      }   
	      
}
*/