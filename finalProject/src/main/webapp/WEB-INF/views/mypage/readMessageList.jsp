<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="/resources/jquery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#fifthManu').css('background', '#09b9e5');

	});
</script>

<style type="text/css">
#mypageUl {
	margin-top: -53px;
}

#mypageUl li {
	display: inline;
	float: left;
	position: relative;
	margin-right: 5px;
	padding: 10px;
	background-color: rgba(0, 0, 0, 0.3);
	padding: 15px 35px 15px 35px;
	border-radius: 3px;
	color: #fff;
	font-size: 21px;
}

#mypageLayout {
	border: 3px solid #eaeaea;
	border-top: 4px solid #09b9e5;
	display: inline-block;
	width: 100%;
	margin-top: 70px;
}

.content {
	display: none;
	margin-top: 15px;
}

#sixthContent {
	min-height: 500px;
}

.manu {
	color: white;
}

.table-bordered th {
	text-align: center;
}

.table-bordered td {
	text-align: center;
}

.box-header {
	margin: 10px;
	margin-top: 30px;
}
</style>
</head>
<body>




	<script type="text/javascript">
		function detailMsg(id2) {


			url = "/mypage/aptMsgdetail?sep=" + id2;

			open(
					url,
					"confirm",
					"toolbar=no, status=no, menubar=no, location=no, scrollbars=no, resizable=no, width=380, height=550");

		}

		function msgform() {

			url = "/mypage/aptMessage";

			open(
					url,
					"confirm",
					"toolbar=no, status=no, menubar=no, location=no, scrollbars=no, resizable=no, width=450, height=450");

		}
	</script>


	<div class="header">
		<jsp:include page="../include/head.jsp"></jsp:include>
	</div>
	<div id="page" style="background: white; display: inline-block;">
		<div class="col-md-12">
			<jsp:include page="../include/mypagehead.jsp"></jsp:include>

			<br> <br>

			<div class="col-md-12 col-md-offset-1">
				<div class="box">
					<div class="box-header with-border">
						<br> <br> <label
						style="font-size: 25px; color: black; border-bottom: 3px solid #eaeaea; padding: 0 15px 13px 15px; margin-bottom: 15px;">받은메세지함</label>


						<a href="/mypage/readMessageList" class="box-title">받은 메세지함</a>> <a
							href="/mypage/sendMessageList">보낸 메세지함 </a>> <a href="/mypage/">
							보관함</a> <br> <br> <label class=""><button
								onclick="msgform()">메세지쓰기</button></label>

					</div>
					<div class="col-md-11">
					
						<table class="table table-bordered">
							<tr>
								<th style="width: 10px">BNO</th>
								<th>제목</th>
								<th>보낸사람</th>
								<th>날짜</th>
								<th style="width: 100px">확인유무</th>

								<form action="/mypage/delectMsg" method="post">
									<th><input type="submit" value="삭제하기"></th> <input
										type="hidden" name="readPage" value="1">
							</tr>



							<c:forEach items="${list}" var="list">

								<tr>

									<td>${list.mg_messageNo}</td>


									<td><a href="javascript:detailMsg(${list.mg_messageNo})">${list.mg_title}</a></td>
									<td>${list.mg_from}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
											value="${list.mg_date}" /></td>
									<td><span class="badge bg-red">${list.mg_state }</span></td>
									<td><input type="checkbox" name="delect"
										value="${list.mg_messageNo}"></td>

								</tr>

							</c:forEach>
							</form>



						</table>
					</div>
					
				</div>
				<!-- /.box-body -->
<br><br><br><br><br><br><br><br><br>
<div class="text-center" style="margin-right: 25%; margin-bottom: 50px">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="/mypage/readMessageList${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="/mypage/readMessageList${pageMaker.makeSearch(idx)}"
										id="massage"+${idx }">${idx}</a>


									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="/mypage/readMessageList${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>

							</ul>
						</div>
						

					</div>
					
				</div>




			</div>

	
				<div class="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</div>
</body>
</html>