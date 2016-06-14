package kosta.apt.domain.GroupNotice;

public class GNSearchCriteria extends GNCriteria{

	private String searchType;
	private String keyword;
	private int aptNum;
	
	public int getAptNum() {
		return aptNum;
	}
	public void setAptNum(int aptNum) {
		this.aptNum = aptNum;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return super.toString() + " SearchCriteria "
				+ "[searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}
}


