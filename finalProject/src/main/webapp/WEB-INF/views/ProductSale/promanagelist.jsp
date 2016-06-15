<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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



$(document).ready(function(){
	
	
	promanagelist2();
	
	
	
	
});


function promanagelist2(){
	
	$.ajax({
		url : '/ProductSale/promanagelist2',
		type: 'post',
		dataType :'json',
		success : function(data){
		
			$('.checkSign').empty();
			
			$.each(data, function(index, productOrder ){
				var html2 = '';
					html2 += productOrder.check_sign; 
				
				$('.checkSign').append(html2);
			});
			
		}
		
	});
	
}


function CheckPostUpdate(){
	alert("버튼클릭됬다.");
	
	$(this).html('');
	
	$.ajax({
		url : '/ProductSale/CheckPostUpdate',
		type: 'post',
		dataType :'text',
		success : function(data){
			
 			alert("버튼성공");
 			
 			promanagelist2();
			
		}
		
	});
	
	
	
}
 


	



</script>


<div class="header">
	 <jsp:include page="../include/head.jsp"></jsp:include> 
</div>

<!-- Main content -->
<section class="content">
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
		<th style="width: 10px">주문번호</th>
		<th>주문일자</th>
		<th>상품명</th>
		<th>주문단가</th>
		<th>주문수량</th>
		<th>배송비</th>
		<th>합계</th>
		<th>배송지</th>
		<th>처리상태</th>
		<form action="/ProductSale/CheckPostUpdate" method="post">
		<th><button onclick="CheckPostUpdate()">배송완료</button> </th>
		<th><input type="hidden" name="readPage" value="1"></th>
	</tr>
	</tr>
	


<c:forEach items="${list}" var="list">
		
	<tr>
		
		<td>${list.check_no}</td>
		<td>${list.check_date}</td>
		<td>${list.check_name}</td>
		<td>${list.pro_price}</td>
		<td>${list.check_num }</td>
		<td>${list.checkPost}</td>
		<td>${list.check_price }</td>
		<td><a href="javascript:detailaddress(${list.check_no})">배송지보기</a></td>
		<td>${list.check_sign  }</td>
		<td><input type="checkbox" name="cpupdate" value="${list.check_no}"></td>
	
	</tr>
	
		
</c:forEach>


</form>
				

</table>

				</div>
				<!-- /.box-body -->
<div class="boad-page">

				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="promanagelist${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="promanagelist${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="promanagelist${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>

</div>	
				
				<div class="box-footer">Footer</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->


</body>
</html>