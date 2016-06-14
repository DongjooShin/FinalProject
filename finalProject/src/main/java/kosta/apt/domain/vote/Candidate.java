package kosta.apt.domain.vote;

import java.io.Serializable;

public class Candidate implements Serializable {
	private int candidateNo;
	private int cd_voteNum;
	private String cd_group;
	private int cd_symbol;
	private String cd_eduLevel;
	private String cd_job;
	private String cd_career;
	private String cd_promise;
	private String m_memberNo;
	private int apt_APTGNo;
	private String cd_imageName;
	private int cd_buildingNo;
	
	public Candidate() {
		super();
	}
	public Candidate(int candidateNo, String cd_group, int cd_symbol, String cd_eduLevel, String cd_job,
			String cd_career, String cd_promise, String m_memberNo, int apt_APTGNo, String cd_imageName) {
		super();
		this.candidateNo = candidateNo;
		this.cd_group = cd_group;
		this.cd_symbol = cd_symbol;
		this.cd_eduLevel = cd_eduLevel;
		this.cd_job = cd_job;
		this.cd_career = cd_career;
		this.cd_promise = cd_promise;
		this.m_memberNo = m_memberNo;
		this.apt_APTGNo = apt_APTGNo;
		this.cd_imageName = cd_imageName;
	}
	
	
	public int getCd_buildingNo() {
		return cd_buildingNo;
	}
	public void setCd_buildingNo(int cd_buildingNo) {
		this.cd_buildingNo = cd_buildingNo;
	}
	public String getCd_imageName() {
		return cd_imageName;
	}
	public void setCd_imageName(String cd_imageName) {
		this.cd_imageName = cd_imageName;
	}
	public int getApt_APTGNo() {
		return apt_APTGNo;
	}
	public void setApt_APTGNo(int apt_APTGNo) {
		this.apt_APTGNo = apt_APTGNo;
	}
	
	public int getCandidateNo() {
		return candidateNo;
	}
	public void setCandidateNo(int cd_candidateNo) {
		this.candidateNo = cd_candidateNo;
	}
	public int getCd_voteNum() {
		return cd_voteNum;
	}
	public void setCd_voteNum(int cd_voteNum) {
		this.cd_voteNum = cd_voteNum;
	}
	public String getCd_group() {
		return cd_group;
	}
	public void setCd_group(String cd_group) {
		this.cd_group = cd_group;
	}
	public int getCd_symbol() {
		return cd_symbol;
	}
	public void setCd_symbol(int cd_symbol) {
		this.cd_symbol = cd_symbol;
	}
	public String getCd_eduLevel() {
		return cd_eduLevel;
	}
	public void setCd_eduLevel(String cd_eduLevel) {
		this.cd_eduLevel = cd_eduLevel;
	}
	public String getCd_job() {
		return cd_job;
	}
	public void setCd_job(String cd_job) {
		this.cd_job = cd_job;
	}
	public String getCd_career() {
		return cd_career;
	}
	public void setCd_career(String cd_career) {
		this.cd_career = cd_career;
	}
	public String getCd_promise() {
		return cd_promise;
	}
	public void setCd_promise(String cd_promise) {
		this.cd_promise = cd_promise;
	}
	public String getM_memberNo() {
		return m_memberNo;
	}
	public void setM_memberNo(String m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	@Override
	public String toString() {
		return "Candidate [candidateNo=" + candidateNo + ", cd_voteNum=" + cd_voteNum + ", cd_group=" + cd_group
				+ ", cd_symbol=" + cd_symbol + ", cd_eduLevel=" + cd_eduLevel + ", cd_job=" + cd_job + ", cd_career="
				+ cd_career + ", cd_promise=" + cd_promise + ", m_memberNo=" + m_memberNo + ", apt_APTGNo=" + apt_APTGNo
				+ ", cd_imageName=" + cd_imageName + ", cd_buildingNo=" + cd_buildingNo + "]";
	}
	
}
