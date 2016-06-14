
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/main/css/fullcalendar/jquery-1.10.2.js"></script>
<script>
	
	$(function() {
		var formObj = $("form[role='form']");
		$("#updategn").on("click", function() {
			alert("수정버튼 클릭");
			formObj.attr("action", "/groupNotice/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#deletegn").on("click", function() {
			alert("삭제버튼 클릭");
			formObj.attr("action", "/groupNotice/delete");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#listgn").on("click", function() {
			alert("목록버튼 클릭");
			formObj.attr("method", "get");
			formObj.attr("action", "/groupNotice/listAll");
			formObj.submit();
		});

	});
</script>

<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<jsp:include page="../include/head.jsp"></jsp:include>
	</div>

	<div class="main">
		<div class="container" id="page">
			<div class="col-md-3">
				
				<div id="secondary">
					<aside id="archives" class="widget">
					<h3 class="widget-title">Archives</h3>
					<ul>
						<li><a href='http://demo.themegrill.com/spacious/2014/03/'>March
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/02/'>February
								2014</a></li>

						<li><a href='http://demo.themegrill.com/spacious/2014/03/'>March
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/02/'>February
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/03/'>March
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/02/'>February
								2014</a></li>
					</ul>
					</aside>
				</div>
				<div id="primary" style="height: 1000px;"></div>

			</div>
			
			<!-- 리스트,입력,상세보기 -->
			<div class="col-md-8" style="margin-top: 50px;">
				<table border="1" class="table table-striped">
					<tr height="30">
						<td width="50">제목</td>
						<td colspan="3">${gn.g_title }</td>
					</tr>
					<tr height="30">
						<td width="50">글번호</td>
						<td width="260">${gn.g_subNo }</td>
						<td width="50">조회수</td>
						<td width="50">${gn.g_hit }</td>
					</tr>
					<tr height="30">
						<td width="50">작성자</td>
						<td width="160">${gn.m_memberNo }</td>
						<td width="40">작성일</td>
						<td width="160"><fmt:formatDate value="${gn.g_date }"
								pattern="yyyy-MM-dd" /></td>
					</tr>

					<tr height="30">
						<td width="30">파일</td>
						<td colspan="3"><a href="/groupNotice/groupNotice_download?filename=${gn.g_fileName }">${gn.g_fileName }</a></td>
					</tr>
					<tr height="500">
						<td colspan="4" style="padding: 20px;">${gn.g_content }</td>
					</tr>
					<tr height="30">
						<td colspan="4">
							<button type="button" id="updategn" >수정</button>
							<button type="button" id="deletegn">삭제</button>
							<button type="button" id="listgn">목록</button>
						</td>

					</tr>
				</table>
				<br>
				<br>
			</div>
		</div>
		<form role="form" action="modify" method="post">

			<input type='hidden' name='g_groupNoticeNo' value="${gn.g_groupNoticeNo}"> 
			<input type='hidden' name='page' value="${cri.page}"> 
			<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
		</form>
	</div>

</body>
</html>