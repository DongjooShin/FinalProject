<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery.js"></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
  
  
  
</head>
<body>

<script type="text/javascript">


$(document).ready(function(){
	
	alert("성공");
	
	proconsumerlist2();
	
});

	
	

function proconsumerlist2(){
	
	
	$.ajax({
		url : '/ProductSale/proconsumerlist2',
		type: 'post',
		dataType :'json',
		success : function(data){
			
			$('.checkSign').empty();
			$('.refundbtn').empty();
			i=0;
			$.each(data, function(index, productOrder ){
					
					var html3 = '';
					html3 += '<td class="checkSign'+i+'">'+productOrder.check_sign+'</td>'; 
					html3 +='<td class="refundbtn'+i+'"><a href="javascript:cancelCheck('+productOrder.check_no+')">환불하기</a></td>';
					$('.ppand').append(html3);
					$('.checkSign'+i).remove();
					
				
			});
			
		}
		
		
	});
	
	
	
}
	


function detailaddress(checkno){
	
	alert(checkno);

	
	$.ajax({
	 	url : '/ProductSale/proconsumerlist',
		type : 'post',
		data : {
			"checkno" : checkno
		},
		dataType : 'json',
		success : function(product) {
			
			//alert("AJAX성공");
		
			
	 		$('#modal-content').empty();
	 
				var html2='감자칩';
				html2+='<p>받는사람: '+product.check_addressee+'</p>';
				html2+='<p>주소: '+product.check_address+'</p>';
				html2+='<p>휴대폰번호: '+product.check_tell+'</p>';
				$('#modal-content').append(html2);
				$('#Modal').modal("show");
		
		},
		error : function() {
			alert('실패');
		}

 	})
 	
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
		<th>환불하기</th>
	</tr>
	


<c:forEach items="${list}" var="list">
		
	<tr class="ppand">
		
		<td>${list.check_no}</td>
		<td>${list.check_date}</td>
		<td>${list.check_name}</td>
		<td>${list.pro_price}</td>
		<td>${list.check_num }</td>
		<td>${list.checkPost}</td>
		<td>${list.check_price }</td>
		<td><a class="addressdetail" id="addressdetail" href="javascript:detailaddress(${list.check_no})">배송지보기</a></td>
		
		
	
	
	</tr>
	
		
</c:forEach>



			 	

</table>

				</div>
				<!-- /.box-body -->
<div class="boad-page">

				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="proconsumerlist${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="proconsumerlist${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="proconsumerlist${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
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




<!-- Modal -->
  <div class="modal fade" id="Modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">상점 세부 보기</h4>
        </div>
        <form class="form-horizontal" method="post" action="/store/delete" role="form">
	        <div class="modal-body" id="modal-content">
	        	
	        </div>
	        <div class="modal-footer">
	          <button type="submit" class="btn btn-default" >삭제</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        </div>
        </form>
      </div>
      
    </div>
  </div>
  

</body>
</html>