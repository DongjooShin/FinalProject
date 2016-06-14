package kosta.apt.mapper;

import java.util.List;
import java.util.Map;

import kosta.apt.domain.member.AddressCity;
import kosta.apt.domain.member.AptList;
import kosta.apt.domain.member.AptTransactionPrice;
import kosta.apt.domain.member.LoginCheck;
import kosta.apt.domain.member.Member;

public interface MemberMapper {

	public int insertMember(Member member);
	public Integer checkMemberId(String id);
	public Integer checkMemberPass(LoginCheck loginCheck);
	public void updateMember(Member member);
	public int getStateNum(String state);
	public List<AddressCity> getCity(int state);
	public List<AptList> getAptName(String address);
	public String getAddress(Map<String, String> map);
	public Member getMamber(String id);
	public String getAPTAddress(int apt_APTGNo);
	public int getAptNum(Map<String, String> map);
	public void updateRealTransactionPrice(AptTransactionPrice aptTransactionPrice);


}
