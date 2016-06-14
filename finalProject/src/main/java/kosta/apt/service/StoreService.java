package kosta.apt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.apt.domain.Store.Store;
import kosta.apt.persistence.StoreDao;

@Service
public class StoreService {
	private StoreDao dao;
	
	@Autowired	
	public void setDao(StoreDao dao) {
		this.dao = dao;
	}



	public void regist(Store store) {
		System.out.println("서비스안: "+store.toString());
		dao.regist(store);
		
	}



	public List<Store> listStore(int aptNum) {
		System.out.println("store service list!!!!!!");
		return dao.listStore(aptNum);
	}



	public List<Store> listStoreFood(Store store) {
		System.out.println("store service list food!!!!!!");
		return dao.listStoreFood(store);
	}



	public void deleteStore(int s_storeNo) {
		System.out.println("store service delete food!!!!!!");
		dao.deleteStore(s_storeNo);
	}



	

}
