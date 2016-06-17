package kosta.apt.persistence;

import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.apt.domain.Message.Message;
import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Product.Product;
import kosta.apt.domain.Product.ProductOrder;
import kosta.apt.domain.Product.ProductReply;
import kosta.apt.domain.Property.Property;
import kosta.apt.mapper.MessageMapper;
import kosta.apt.mapper.ProductMapper;
import kosta.apt.mapper.PropertyMapper;

@Repository
public class ProductDao {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void insertApplication(Product product) {
	
		sqlSession.getMapper(ProductMapper.class).insertApplication(product);
		
	}

	public int selectPro_no() {
		
		if(sqlSession.getMapper(ProductMapper.class).selectPro_no() ==null){
			return 0;
		}else{
			
			int num = sqlSession.getMapper(ProductMapper.class).selectPro_no();
			return num;
			
		}
		
		
	}

	public List<Product> selectAllApply(Criteria cri, int apt_APTGNo) {
		
		List<Product> list = null;
		
		list = sqlSession.getMapper(ProductMapper.class).selectAllApply(new RowBounds(cri.getPageStart(), cri.getPerPageNum()), apt_APTGNo);
		
		
		return list;
	}

	public int listCountCri(Criteria cri) {
	
		int crinum =0;
		
		crinum = sqlSession.getMapper(ProductMapper.class).listCountCri(cri);
		
		return crinum;
	}

	public List<Product> selectApplyList(Criteria cri, int m_memberNo) {
		
		List<Product> list = null;
		
		list = sqlSession.getMapper(ProductMapper.class).selectApplyList(new RowBounds(cri.getPageStart(), cri.getPerPageNum()), m_memberNo);
		
		
		return list;
	}

	public Product proApplyapprove(int pro_no) {
	
		Product product = null;
		
		product = sqlSession.getMapper(ProductMapper.class).proApplyapprove(pro_no);
		
		return product;
		
	}



	public void proapproveCencel(int pro_no) {
	
		sqlSession.getMapper(ProductMapper.class).proapproveCencel(pro_no);
	}

	public void proapproveOK(int pro_no) {
	
		sqlSession.getMapper(ProductMapper.class).proapproveOK(pro_no);
		
	}

	public int selectpro_no() {
		if(sqlSession.getMapper(ProductMapper.class).selectpro_no() ==null){
			return 0;
		}else{
			int num = sqlSession.getMapper(ProductMapper.class).selectpro_no();
			
			return num;
		}
	
	}

	public void insertProduct(Product product) {
		
		sqlSession.getMapper(ProductMapper.class).insertProduct(product);
		
	}

	public List<Product> prolist(Criteria cri) {
		
		Calendar oCalendar = Calendar.getInstance( );
		 // 현재 날짜/시간 등의 각종 정보 얻기
		 String currentDate = "";
		 currentDate = Integer.toString(oCalendar.get(Calendar.YEAR));
		 currentDate += (oCalendar.get(Calendar.MONTH) + 1)>9 ? ""+Integer.toString(oCalendar.get(Calendar.MONTH) + 1) : '0'+Integer.toString(oCalendar.get(Calendar.MONTH) + 1);
		 currentDate += (oCalendar.get(Calendar.DAY_OF_MONTH))>9 ? ""+Integer.toString(oCalendar.get(Calendar.DAY_OF_MONTH)) : '0'+Integer.toString(oCalendar.get(Calendar.DAY_OF_MONTH));
			
		 // currentDate += Integer.toString(oCalendar.get(Calendar.DAY_OF_MONTH));
		
		 int date22 = Integer.parseInt(currentDate);
		 
		 
		List<Product> list = null;
		
		list = sqlSession.getMapper(ProductMapper.class).prolist(new RowBounds(cri.getPageStart(),cri.getPerPageNum()), date22);
		
		return list;
	}

	public Product productdetail(int pro_no) {
		Product product = null;
		product = sqlSession.getMapper(ProductMapper.class).productdetail(pro_no);
		
		return product;
	}

	public List<ProductOrder> promanagelist(String seller, Criteria cri) {
		List<ProductOrder> list = null;
		
		list = sqlSession.getMapper(ProductMapper.class).promanagelist(new RowBounds(cri.getPageStart(),cri.getPerPageNum()),seller);
		
		return list;
	}

	public void proCheck(ProductOrder productOrder) {
		
		sqlSession.getMapper(ProductMapper.class).proCheck(productOrder);
	}

	
	
	
	public int selectChcek_no() {
		
		
		if(sqlSession.getMapper(ProductMapper.class).selectChcek_no() ==null){
			return 0;
		}else{
			
			int num = sqlSession.getMapper(ProductMapper.class).selectChcek_no();
			return num;
			
		}
	
	}

	public List<ProductOrder> proconsumerlist(String buyer, Criteria cri) {
		
		List<ProductOrder> list = null;
		
		list = sqlSession.getMapper(ProductMapper.class).proconsumerlist(new RowBounds(cri.getPageStart(),cri.getPerPageNum()),buyer);
		
		return list;

	}

	public void CheckPostUpdate(int check_no) {
		
		sqlSession.getMapper(ProductMapper.class).CheckPostUpdate(check_no);
	}




	public void proNumupdate(ProductOrder productOrder) {
		sqlSession.getMapper(ProductMapper.class).proNumupdate(productOrder);
		
	}

	public ProductOrder productOrderDetail(int checkno) {
	
		return sqlSession.getMapper(ProductMapper.class).productOrderDetail(checkno);
	}

	
	
	//리플 번호 가져오기.
	public int selectRe_no(int pro_no) {
		
		if(sqlSession.getMapper(ProductMapper.class).selectRe_no(pro_no) ==null){
			return 0;
		}else{
			
			int num = sqlSession.getMapper(ProductMapper.class).selectRe_no(pro_no);
			return num;
			
		}
		
	}

	public void replyadd(ProductReply productReply) {
	
		sqlSession.getMapper(ProductMapper.class).replyadd(productReply);
		
	}

	public List<ProductReply> Replylist(int pro_no) {
		
		return sqlSession.getMapper(ProductMapper.class).Replylist(pro_no);
	}

	public void deleteRno(ProductReply productReply) {
	
		sqlSession.getMapper(ProductMapper.class).deleteRno(productReply);	
	}

	

	public ProductOrder proRefund2(int checkno) {

			return sqlSession.getMapper(ProductMapper.class).proRefund2(checkno);
	}

	public void updateCheckno(int checkno) {
		sqlSession.getMapper(ProductMapper.class).updateCheckno(checkno);
		
	}

	public void updateProduct(ProductOrder productOrder) {
		
		sqlSession.getMapper(ProductMapper.class).updateProduct(productOrder);
	}

	public int selectProduct(int pro_no) {
	
		return sqlSession.getMapper(ProductMapper.class).selectProduct(pro_no);
	}
	
	
	
}
