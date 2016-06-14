package kosta.apt.domain.complaint;

public class Reply {

	private int rno;
	private String m_memberno;
	private String replytext;
	private String rdate;
    private int	cp_complaintNo;
    
    
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getM_memberno() {
		return m_memberno;
	}
	public void setM_memberno(String m_memberno) {
		this.m_memberno = m_memberno;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getCp_complaintNo() {
		return cp_complaintNo;
	}
	public void setCp_complaintNo(int cp_complaintNo) {
		this.cp_complaintNo = cp_complaintNo;
	}
	
	
	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", m_memberno=" + m_memberno + ", replytext=" + replytext + ", rdate=" + rdate
				+ ", cp_complaintNo=" + cp_complaintNo + "]";
	}


    
}
