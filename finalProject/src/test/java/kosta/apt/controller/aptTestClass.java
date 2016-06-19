package kosta.apt.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kosta.apt.domain.Paging.SearchCriteria;
import kosta.apt.domain.Store.Store;
import kosta.apt.domain.complaint.Complaint;
import kosta.apt.domain.management.ManagementFee;
import kosta.apt.domain.publicmanage.PublicManagementFee;
import kosta.apt.domain.vote.Candidate;
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
	    // 결산데이터 확인.
	     @Test
	      public void test2(){
	         
	         System.out.println(pulicManagedao.DataAppropriation(3));
	      }
	    
	    //시/도 별 데이터 확인 
/*	     @Test
	      public void test3(){
	         List<PublicManagementFee> list=pulicManagedao.getCityGraph(1);
	         System.out.println(list.toString());
	      }*/
	   
	     

}
