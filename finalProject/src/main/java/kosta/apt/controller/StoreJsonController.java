package kosta.apt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.apt.domain.Store.Store;
import kosta.apt.domain.calendar.Calendar;
import kosta.apt.domain.member.Member;
import kosta.apt.service.StoreService;

@RestController
public class StoreJsonController {
	private StoreService service;
	@Autowired
	public void setSerivce(StoreService serivce) {
		this.service = serivce;
	}
	
	@RequestMapping("/listJsonStore")
	public List<Store> listStore(HttpSession session){
		//Member m=(Member) session.getAttribute("member");
		int aptNum=1;
		return service.listStore(aptNum);
	}
	
	@RequestMapping("/listStoreFood")
	public List<Store> listStoreFood(HttpSession session,Store store){
		//Member m=(Member) session.getAttribute("member");
		store.setApt_APTGNo(1);
		store.setS_group("푸드");
		System.out.println(service.listStoreFood(store).toString());
		return service.listStoreFood(store);
	}
	
	@RequestMapping("/listStoreFashion")
	public List<Store> listStoreFashion(HttpSession session,Store store){
		//Member m=(Member) session.getAttribute("member");
		store.setApt_APTGNo(1);
		store.setS_group("패션/잡화");

		return service.listStoreFood(store);
	}
	
	@RequestMapping("/listStoreAcademy")
	public List<Store> listStoreAcademy(HttpSession session,Store store){
		//Member m=(Member) session.getAttribute("member");
		store.setApt_APTGNo(1);
		store.setS_group("학원");

		return service.listStoreFood(store);
	}
	
	@RequestMapping("/listStoreLife")
	public List<Store> listStoreLife(HttpSession session,Store store){
		//Member m=(Member) session.getAttribute("member");
		store.setApt_APTGNo(1);
		store.setS_group("생활");

		return service.listStoreFood(store);
	}
	
	@RequestMapping("/listStoreEtc")
	public List<Store> listStoreEtc(HttpSession session,Store store){
		//Member m=(Member) session.getAttribute("member");
		store.setApt_APTGNo(1);
		store.setS_group("기타");

		return service.listStoreFood(store);
	}

}
