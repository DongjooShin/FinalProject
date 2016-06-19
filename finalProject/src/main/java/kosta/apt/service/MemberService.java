package kosta.apt.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.apt.domain.Property.AptTransactionPrice;
import kosta.apt.domain.member.AddressCity;
import kosta.apt.domain.member.AptList;
import kosta.apt.domain.member.LoginCheck;
import kosta.apt.domain.member.Member;
import kosta.apt.persistence.MemberDao;

@Service
public class MemberService {

	private MemberDao memberDao;

	@Autowired
	public void setDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public List<AddressCity> getCityService(int state) {
		return memberDao.getCity(state);
	}

	public int getStateNumService(String selectState) {
		return memberDao.getStateNum(selectState);
	}

	public List<AptList> getAptNameService(String address) {
		return memberDao.getAptName(address);
	}

	public String getAddressService(String address, String aptname) {
		HashMap<String, String> map = new HashMap<String, String>();
		address = address + "%";
		map.put("address", address);
		map.put("aptname", aptname);

		return memberDao.getAddress(map);

	}

	public int checkMemberIdService(String id) {
		return memberDao.checkMemberId(id);
	}

	public void inserMemberService(Member member) {
		member.sumEmail(member.getM_email(), member.getM_domain());
		member.sumPhoneNum();
		member.sumTellNum();
		memberDao.insertMember(member);

	}

	public int loginCheckService(LoginCheck loginCheck) {
		return memberDao.loginCheck(loginCheck);

	}

	public Member getMemberService(String id) {
		return memberDao.getMember(id);

	}

	public String getAPTAddressService(int apt_APTGNo) {

		return memberDao.getAPTAddress(apt_APTGNo);

	}

	public void updateMemberService(Member member) {
		memberDao.updateMember(member);

	}

	public int getAptNumService(String address, String aptname) {
		HashMap<String, String> map = new HashMap<String, String>();
		address = address + "%";
		map.put("address", address);
		map.put("aptname", aptname);

		return memberDao.getAptNum(map);
	}

	public void updateRealTransactionPriceService(AptTransactionPrice aptTransactionPrice) {

		memberDao.updateRealTransactionPrice(aptTransactionPrice);
	}

	public void insertManagerService(String managerId, String password) {
		Member member = new Member();
		member.setM_memberNo(managerId);
		member.setM_pass(password);
		member.setM_grade(0);
		member.setV2_flag(1);
		member.setV_flag(1);
		member.setM_name(" ");
		member.setM_email(" ");
		member.setM_homeTel(" ");
		member.setM_tel(" ");

	}
}
