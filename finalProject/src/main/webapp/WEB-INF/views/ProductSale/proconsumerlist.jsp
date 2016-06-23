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

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">



</head>
<body>

	<script type="text/javascript">
		$(document).ready(function() {

			proconsumerlist2();

		});

		function proconsumerlist2() {

			$
					.ajax({
						url : '/ProductSale/proconsumerlist2',
						type : 'post',
						dataType : 'json',
						data : {
							"page" : 1
						},
						success : function(data) {

							//$('.bbc').empty();

							$
									.each(
											data,
											function(index, productOrder) {

												var html3 = '';
												html3 += '<tr class="bbc"><td>'
														+ productOrder.check_no
														+ '</td>';
												html3 += '<td>'
														+ productOrder.check_date
														+ '</td>';
												html3 += '<td>'
														+ productOrder.check_name
														+ '</td>';
												html3 += '<td>'
														+ productOrder.pro_price
														+ '</td>';
												html3 += '<td>'
														+ productOrder.check_num
														+ '</td>';
												html3 += '<td>'
														+ productOrder.checkPost
														+ '</td>';
												html3 += '<td>'
														+ productOrder.check_price
														+ '</td>';
												html3 += '<td>'
														+ productOrder.check_sign
														+ '</td>';
												html3 += '<td><a class="addressdetail" id="addressdetail" href="javascript:detailaddress('
														+ productOrder.check_no
														+ ')">배송지보기</a></td>';
												html3 += '<td id="td'+productOrder.check_no+'"><button id="'
														+ productOrder.check_no
														+ '" onclick="cancelCheck('
														+ productOrder.check_no
														+ ')">환불하기</button></td></tr>';
												$('#tablelist').append(html3);

											});

						}

					});

		}

		function cancelCheck(checkno) {

			$.ajax({
				url : '/ProductSale/proRefund',
				type : 'post',
				dataType : 'text',
				data : {
					"checkno" : checkno
				},
				success : function(data) {
					$('#' + checkno).remove();
					$('#td' + checkno).html('환불완료되었습니다.');

				}

			});
		}

		function detailaddress(checkno) {

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

					var html2 = '감자칩';
					html2 += '<p>받는사람: ' + product.check_addressee + '</p>';
					html2 += '<p>주소: ' + product.check_address + '</p>';
					html2 += '<p>휴대폰번호: ' + product.check_tell + '</p>';
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
	<div id="page" class="hfeed site"
		style="display: inline-block;; border-top: 2px solid;">

		<div class="col-md-12">
			<div class="row">
				<div class="col-lg-3" style="margin-right: 0; margin-top: 17px;">
					<div class="loginSidebar">
						<jsp:include page="ProductSideBar.jsp"></jsp:include>
					</div>

				</div>
				<div class = "col-md-9">
				
				<div class="col-md-11">
				<br><br>
<label style="font-size: 25px; color: black; border-bottom: 3px solid #eaeaea; padding: 0 15px 13px 15px; margin-bottom: 15px;">구매자공동구매목록</label>
		<br><br>
					<!-- general form elements -->

					<div class="box">
						<div class="box-header with-border">
						
						</div>
						<div class="box-body">

							<table class="table table-bordered" id="tablelist">
								<tr>
									<th style="width: 30px">번호</th>
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


					</div>
				</div>


			</div>
			</section>






			<!-- Modal -->
			<div class="modal fade" id="Modal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">상점 세부 보기</h4>
						</div>
						<form class="form-horizontal" method="post" action="/store/delete"
							role="form">
							<div class="modal-body" id="modal-content"></div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-default">삭제</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</div>

</body>
</html>