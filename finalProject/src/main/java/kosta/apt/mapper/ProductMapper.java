package kosta.apt.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Product.Product;
import kosta.apt.domain.Product.ProductOrder;
import kosta.apt.domain.Product.ProductReply;

public interface ProductMapper {

	public void insertApplication(Product product);

	public Integer selectPro_no();

	public List<Product> selectAllApply(RowBounds rowBounds, int apt_APTGNo);

	public int listCountCri(Criteria cri);

	public List<Product> selectApplyList(RowBounds rowBounds, int m_memberNo);

	public Product proApplyapprove(int pro_no);

	public void proapproveCencel(int pro_no);

	public void proapproveOK(int pro_no);

	public Integer selectpro_no();

	public void insertProduct(Product product);

	public List<Product> prolist(RowBounds rowBounds, int date22);

	public Product productdetail(int pro_no);



	public void proCheck(ProductOrder productOrder);

	public Integer selectChcek_no();

	public List<ProductOrder> proconsumerlist(RowBounds rowBounds, String buyer);
	
	public List<ProductOrder> promanagelist(RowBounds rowBounds, String seller);

	public void CheckPostUpdate(int check_no);


	public void proNumupdate(ProductOrder productOrder);

	public ProductOrder productOrderDetail(int checkno);

	public Integer selectRe_no(int pro_no);

	public void replyadd(ProductReply productReply);

	public List<ProductReply> Replylist(int pro_no);

	public void deleteRno(ProductReply productReply);
	
	
}
