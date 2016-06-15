<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/bootstrap/bootstrap.min.css' type='text/css' media='all' />
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/dist/css/mainFont.css' type='text/css' media='all' />
<link rel='stylesheet' id='google_fonts-css'
	href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
	type='text/css' media='all' />
<link rel='stylesheet' id='spacious_style-css' href='/resources/dist/css/main1.css'
	type='text/css' media='all' />
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery.js"></script>
</head>
<body>

<script type="text/javascript">

function detailMsg(id2){

	alert("url");
	
	
	
	
	url = "/Message/aptMsgdetail?sep="+id2;
	alert(url);
	
	open(    
			url,
			"confirm",
			"toolbar=no, status=no, menubar=no, location=no, scrollbars=no, resizable=no, width=410, height=280");

}

</script>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">받은 메세지함</h3>
				</div>
				<div class="box-body">
				
<table class="table table-bordered">
	<tr>
		<th style="width: 10px">BNO</th>
		<th>제목</th>
		<th>보낸사람</th>
		<th>날짜</th>
		<th style="width: 100px">확인유무</th>
		
<form action="delectMsg" method="post">
		<th><input type="submit" value="삭제하기"></th>
		<th><input type="hidden" name="readPage" value="1"></th>
	</tr>
	


<c:forEach items="${list}" var="list">
	
	<tr>
		 
		<td>${list.mg_messageNo}</td>
		
	 
		<td><a href="javascript:detailMsg(${list.mg_messageNo})">${list.mg_title}</a></td>
		<td>${list.mg_from}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
				value="${list.mg_date}" /></td>
		<td><span class="badge bg-red">${list.mg_state }</span></td>
		<td><input type="checkbox" name="delect" value="${list.mg_messageNo}"> </td>
	
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
									href="readMessageList${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								
								</li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="readMessageList${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
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