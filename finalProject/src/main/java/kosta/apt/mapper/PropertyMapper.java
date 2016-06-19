package kosta.apt.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import kosta.apt.domain.Paging.Criteria;
import kosta.apt.domain.Product.ProductOrder;
import kosta.apt.domain.Property.AptTransactionPrice;
import kosta.apt.domain.Property.Property;




public interface PropertyMapper {

	public void APTSaleInsert(Property property);
	public List<Property> APTlist();
	public Integer selectPr_id();
	public void insertAPTsale(Property property);
	public List<Property> aptlist(RowBounds rowBounds, Property property);
	public int listCountCri(Criteria cri);
	public Property aptSaledetail(int pr_propertyNo);
	public void aptUpdate(Property property);
	public void aptDelete(int pr_propertyNo);
	public String getAptAddr(int apt_aptGno);
	public String getAptName(int apt_aptGno);
	public List<AptTransactionPrice> getRealTransaction(HashMap<String, String> map);
	public List<AptTransactionPrice> getAptTransaction(String address);


	
}
