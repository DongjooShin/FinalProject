<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery.js"></script>
</head>
<body>

<script type="text/javascript">


</script>




					
					
<div class="header">
	 <jsp:include page="../include/head.jsp"></jsp:include> 
</div>



<!-- Main content -->

	<div class="row">
		
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				
				
	
				<div class="box-body">
				
<table class="table table-bordered">
	<tr>
	
		<th>판매자</th>
		<th>상품이미지</th>
		<th>상품명</th>
		<th>주문수량</th>
		<th>단가</th>
		<th>배송비</th>
		<th>주문합계</th>
		

	

	</tr>
	


	
	<tr>
		
		<td>${product.m_memberNo}</td>
		<td><c:if test="${product.pro_img1 != null}">
				
						<c:set var="head"
							value="${fn:substring(product.pro_img1,0,fn:length(product.pro_img1)-4) }"></c:set>
						<c:set var="pattern"
							value="${fn:substringAfter(product.pro_img1, head) }"></c:set>
						 <img src="../M_upload1/${head }_small${pattern}" /> 
						
		</c:if></td>
		<td>${product.pro_name}</td>
		<td>${productOrder.check_num}개</td>
		<td>${product.pro_price}원</td>
		<td>${product.checkPost}원</td>
	 	<td><c:if test="${product.checkPost ==0 }">
              <c:set var="head" value="${product.pro_price*productOrder.check_num}">
              </c:set> ${head }원
         
             </c:if>
             <c:if test="${product.checkPost !=0 }">
               <c:set var="head2" value="(${product.pro_price*productOrder.check_num+product.checkPost}">
                </c:set>
                	${head2 } 원
            
			 </c:if>
			 	
		</td>
	 
	</tr>
	
	
</table>


<div class="col-md-12">
			<div class="col-lg-3"
				style="margin-right: 0; margin-left: 26px; margin-top: 17px; ">
				<div class="loginSidebar">
					<%-- <jsp:include page="memberSidebar.jsp"></jsp:include> --%>
				</div>

			</div>


			<div class="col-xs-8" style="border: 4px solid #eaeaea;" >
					<div class="col-lg-12">
					
						<form  action="/ProductSale/proCheck" method="post">
						<div class="수령인">
									<label class="col-lg-3 control-label">받는사람</label>
									<div class="col-lg-7">
										<input type="text" class="form-control" name="check_addressee"
											placeholder="받는사람">
								
									</div>
						</div>
							
							
					
								
						<div class="form-group">
									<label class="col-lg-3 control-label">휴대폰번호</label>
									<div class="col-lg-7">
										<div class="col-lg-4 phoneNumfirst">
											<input type="text" name="check_tell1" class="form-control"
												placeholder="010">
										</div>

										<div class="col-lg-4 phoneNum">
											<input type="text" name="check_tell2" class="form-control"
												placeholder="1234">
										</div>

										<div class="col-lg-4 phoneNum">
											<input type="text" name="check_tell3" class="form-control"
												placeholder="5678">
										</div>
									</div>
						</div>
						
						
						
					
							<div class="form-group">
									<label class="col-lg-3 control-label">배송지주소</label>
										<div class="col-lg-7">
										<input type="text" class="form-control" name="check_address"
											placeholder="받는사람">
								
									</div>
							</div>
							
						
							<div class="form-group">
									<label class="col-lg-3 control-label">결제수단</label>
										<div class="col-lg-7">
										<input type="radio"  name="check_sign">카드결제 &nbsp;&nbsp;&nbsp;
											
										<input type="radio"  name="check_sign">현금결제
									</div>
							</div>
								
								
					
						
								
							
							<div class="form-group">
									<label class="col-lg-3 control-label">&nbsp;&nbsp;&nbsp;</label>
													
										<div class="col-lg-7">
							<input type="hidden" name="pro_no" value="${product.pro_no}">
							<input type="hidden" name="checkPost" value="${product.checkPost}">
							<input type="hidden" name="pro_price" value="${product.pro_price}">
							<input type="hidden" name="check_price" value="${head+head2 }">
							<input type="hidden" name="check_name" value="${product.pro_name}">
							<input type="hidden" name="check_num" value="${productOrder.check_num}">
							<input type="hidden" name="check_seller" value="${product.m_memberNo}">
										<input type="submit" value="결제하기">
										
									</div>
									
							</div>
							</form>	
							
							

        
				
	
						
						
					
				</div>
			</div>
			
		</div>

				</div>
				
			
				<!-- /.box-body -->

		
				<div class="box-footer">Footer</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->
		
	</div>
	
	
	<!-- /.row -->

<!-- /.content -->

<!-- /.content-wrapper -->


</body>
</html>