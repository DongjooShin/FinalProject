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
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/bootstrap/bootstrap.min.css' type='text/css' media='all' />
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/dist/css/mainFont.css' type='text/css' media='all' />
<link rel='stylesheet' id='google_fonts-css'
	href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
	type='text/css' media='all' />
<link rel='stylesheet' id='spacious_style-css' href='/resources/dist/css/main1.css'
	type='text/css' media='all' />


</head>
<body>

<script type="text/javascript">


</script>




					
					
<div class="header">
	 <jsp:include page="../include/head.jsp"></jsp:include> 
</div>


<div id="page">
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
	<%-- 
	<c:if test="${product.pro_img1 != null}">
		  <c:set var ="head"
                     value="${fn:substring(product.pro_img1,0,fn:length(product.pro_img1)-2) }"></c:set>
                  <c:set var="pattern"
                     value="${fn:substringAfter(product.pro_img1, head) }"></c:set>
                     ${head }입니다
                      ${pattern}
                   <img src="../M_upload1/${head }_small${pattern}" />  
                   
		</c:if>
--%>

	
	<tr>

		<td>${product.m_memberNo}</td>
		
		<td><img src="../M_upload1/${img1}"></td>
		
		<td>${product.pro_name}</td>
		<td>${productOrder.check_num}개</td>
		<td>${product.pro_price}원</td>
		<td>  ${product.checkPost}원</td>
		<td>${totalprice }</td>
<%-- 	 	<td><c:if test="${product.checkPost ==0 }">
              <c:set var="head" value="${product.pro_price*productOrder.check_num}">
              </c:set> ${head }원
         
             </c:if> 
             <c:if test="${product.checkPost !=0 }">
               <c:set var="head2" value="(${product.pro_price*productOrder.check_num+product.checkPost}">
                </c:set>
                	${head2 } 원
          
			 </c:if>
		  --%>	 	
		  
		
	
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
									
																<!-- <input type="text" class="form-control" name="pr_addr" placeholder="건물주소"> -->
										<input type="text" id="sample3_postcode" placeholder="우편번호">
										- <input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>

										<div id="wrap"
											style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
											<img
												src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
												id="btnFoldWrap"
												style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
												onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>
										<input type="text" name="check_address" id="sample3_address" class="d_form large"
											placeholder="주소">
								
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
							<input type="hidden" name="check_price" value="${product.pro_price*productOrder.check_num+product.checkPost}">
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
	
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	// 우편번호 찾기 찾기 화면을 넣을 element
	var element_wrap = document.getElementById('wrap');

	function foldDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_wrap.style.display = 'none';
	}

	function sample3_execDaumPostcode() {
		// 현재 scroll 위치를 저장해놓는다.
		var currentScroll = Math.max(document.body.scrollTop,
				document.documentElement.scrollTop);
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = data.address; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 기본 주소가 도로명 타입일때 조합한다.
						if (data.addressType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample3_address').value = fullAddr;

						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						element_wrap.style.display = 'none';

						// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
						document.body.scrollTop = currentScroll;
					},
					// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
					onresize : function(size) {
						element_wrap.style.height = size.height + 'px';
					},
					width : '100%',
					height : '100%'
				}).embed(element_wrap);

		// iframe을 넣은 element를 보이게 한다.
		element_wrap.style.display = 'block';
	}
</script>
	
	
	
	
	<!-- /.row -->

<!-- /.content -->

<!-- /.content-wrapper -->

</div>
</body>
</html>