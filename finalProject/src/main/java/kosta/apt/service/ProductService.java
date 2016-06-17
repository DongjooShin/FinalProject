package kosta.apt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Product.Product;
import kosta.apt.domain.Product.ProductOrder;
import kosta.apt.domain.Product.ProductReply;
import kosta.apt.persistence.ProductDao;

@Service
public class ProductService {

	private ProductDao productDao;

	@Autowired
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	

	public void insertApplication(Product product) {
			
		productDao.insertApplication(product);
	}



	public int selectPro_no() {
		
		return productDao.selectPro_no();
		
	}





	public List<Product> selectAllApply(Criteria cri, int apt_APTGNo) {
	
		return productDao.selectAllApply(cri, apt_APTGNo);

	}



	public int listCountCri(Criteria cri) {

		return productDao.listCountCri(cri);
	}



	public List<Product> selectApplyList(Criteria cri, int m_memberNo) {
	
		return productDao.selectApplyList(cri, m_memberNo);
	}



	public Product proApplyapprove(int pro_no) {

		return productDao.proApplyapprove(pro_no);
	}


	public void proapproveCencel(int pro_no) {
		
		productDao.proapproveCencel(pro_no);
	}



	public void proapproveOK(int pro_no) {

		productDao.proapproveOK(pro_no);
		
	}



	public int selectpro_no() {
	
		return productDao.selectpro_no();
	}



	public void insertProduct(Product product) {
		
			
		productDao.insertProduct(product);
	}



	public List<Product> prolist(Criteria cri) {
		
		return productDao.prolist(cri);
	}



	public Product productdetail(int pro_no) {
		
		return productDao.productdetail(pro_no);
	}



	public List<ProductOrder> promanagelist(String seller, Criteria cri) {
		
		return productDao.promanagelist(seller, cri);
	}



	public void proCheck(ProductOrder productOrder) {
		
		productDao.proCheck(productOrder);
		
	}



	public int selectChcek_no() {
		
		return productDao.selectChcek_no();
	}



	public List<ProductOrder> proconsumerlist(String buyer, Criteria cri) {
		
		return productDao.proconsumerlist(buyer, cri);
	}



	public void CheckPostUpdate(int check_no) {
	
		productDao.CheckPostUpdate(check_no);
	}



	public void proNumupdate(ProductOrder productOrder) {
		productDao.proNumupdate(productOrder);
		
	}



	public ProductOrder productOrderDetail(int checkno) {
	
		return productDao.productOrderDetail(checkno);
	}



	public int selectRe_no(int pro_no) {
		
		return productDao.selectRe_no(pro_no);
	}



	public void replyadd(ProductReply productReply) {
	
		productDao.replyadd(productReply);
		
	}



	public List<ProductReply> Replylist(int pro_no) {
		
		return productDao.Replylist(pro_no);

	}



	public void deleteRno(ProductReply productReply) {
		
		productDao.deleteRno(productReply);
		
	}




	public ProductOrder proRefund2(int checkno) {
		return productDao.proRefund2(checkno);
	}



	public void updateCheckno(int checkno) {
	
		productDao.updateCheckno(checkno);
	}



	public void updateProduct(ProductOrder productOrder) {
		
		productDao.updateProduct(productOrder);
	}






	
	
	
}
