package kosta.apt.mapper;

import java.util.List;
   
import org.apache.ibatis.session.RowBounds;

import kosta.apt.domain.SiteNotice.JoinInquiry;
import kosta.apt.domain.SiteNotice.QnA;
import kosta.apt.domain.SiteNotice.SNSearchCriteria;
import kosta.apt.domain.SiteNotice.SiteNotice;


public interface SiteNoticeMapper {

	public Integer maxSnNo();
	public void insertSN(SiteNotice siteNotice);
	public List<SiteNotice> selectList(SNSearchCriteria cri, RowBounds rowBounds);
	public int selectOne(SNSearchCriteria cri);
	public SiteNotice snRead(int sn_siteNoticeNo);
	public void snHitCount(int sn_SiteNoticeNo);
	public void snModify(SiteNotice sn);
	public void snDelete(int sn_siteNoticeNo);
	public void inquiryInsert(QnA qna);
	public Integer maxQnANo();
	public List<QnA> QnAListSearchCri(SNSearchCriteria cri);
	public void insertJoinInquiry(JoinInquiry join);
	public Integer maxJINo();
	public QnA inqRead(int qnaNo);
	public void inqReply(QnA sn);
	public QnA selectInquiry(int qnaNo);
	public void updateState(int qnaNo);
	public void insertAnswer(QnA qna);
	public QnA selectReply(int qnaNo);
	public List<QnA> selectMyInquiry(String m_memberNo);
	public List<QnA> selectMyReply(String m_memberNo);
}
