package finalProject;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kosta.apt.domain.Product.Product;
import kosta.apt.domain.Product.ProductOrder;
import kosta.apt.service.ProductService;


public class TransActionTest {
	private ProductService productService;
	
	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}


	@Test
	public void test()throws Exception {
		
		
		
		
		ProductOrder productOrder = new ProductOrder();
		Product product;
	
		
		productOrder.setPro_no(1);
	  product = productService.productdetail(1);
		
		//product = productService.selectProduct(1); 	
		
		productOrder.setCheck_address("주소");
		productOrder.setCheck_addressee("받는사람");
		productOrder.setCheck_date("20160606");
		productOrder.setCheck_name("이천쌀");
		productOrder.setCheck_no(productService.selectChcek_no()+1);
		productOrder.setCheck_num(10);
		productOrder.setCheck_price(1000);
		productOrder.setCheck_seller("파는사람");
		productOrder.setCheck_sign("배송대기");
		productOrder.setCheckPost(1000);
		productOrder.setPro_no(1);
		productOrder.setPro_price(product.getPro_price());
		productOrder.setCheck_tell("010-4444-4444");
		productOrder.setCheck_buyer("사는사람이다."); //나중에 세션값
		productOrder.setCheck_sign("배송대기");
		productOrder.setCheck_no(productService.selectChcek_no()+1);
		
		
		if((product.getPro_num()-productOrder.getCheck_num())<0){
			throw new Exception("재고가 부족 합니다.");
			
		}else if(productOrder.getCheck_num() > product.getPro_maxnum()){
		
			throw new Exception("최대주문수량보다 낮게 주문하십시오");
		}
	
		
		productService.proNumupdate(productOrder);
		
		productService.proCheck(productOrder);
		
		
		
		fail("Not yet implemented");
	}

}
