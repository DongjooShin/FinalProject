<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 

<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Site Notice Read Detail</title>

<script src="/main/css/fullcalendar/jquery-1.10.2.js"></script>
<script>
	
	$(function() {
		var formObj = $("form[role='form']");
		$("#updategn").on("click", function() {
			alert("수정버튼 클릭");
			formObj.attr("action", "/siteNotice/snModify");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#deletegn").on("click", function() {
			alert("삭제버튼 클릭");
			formObj.attr("action", "/siteNotice/snDelete");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#listgn").on("click", function() {
			alert("목록버튼 클릭");
			formObj.attr("method", "get");
			formObj.attr("action", "/siteNotice/siteNoticeAllList");
			formObj.submit();
		});

	});
</script>

</head>
<body style="background-color: #eaeaea;">
<%-- -----------------Header include----------------- --%>	
	<div class="header">
		 <jsp:include page="../include/head.jsp"></jsp:include> 
	</div>
	
<%-- ------------------------------Body------------------------------------------- --%>	
	<div class="main" id="page">
		<div class="container">
			<div class="col-md-3">
				<jsp:include page="CustomerSidebar.jsp"></jsp:include>
			</div>
			
			<!-- 리스트,입력,상세보기 -->
			<div class="col-md-8" style="margin-top: 50px; margin-left:50px;">
				
				<table border="1" class="table table-striped">
					<tr height="30">
						<td width="50">제목</td>
						<td colspan="3">${sn.sn_title }</td>
					</tr>
					<tr height="30">
						<td width="50">글번호</td>
						<td width="260">${sn.sn_siteNoticeNo }</td>
						<td width="50">조회수</td>
						<td width="50">${sn.sn_hit }</td>
					</tr>
					<tr height="30">
						<td width="50">작성자</td>
						<td width="160">${sn.m_memberNo }</td>
						<td width="40">작성일</td>
						<td width="160"><fmt:formatDate value="${sn.sn_date }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>

					<tr height="30">
						<td width="30">파일</td>
						<c:if test="${sn.sn_fileName != 'NULL'}">
							<td colspan="3"><a href="/siteNotice/siteNotice_download?filename=${sn.sn_fileName }">${sn.sn_fileName }</a></td>
						</c:if>
					</tr>
					<tr height="500">
						<td colspan="4" style="padding: 20px;">${sn.sn_content }</td>
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
			<form role="form" action="snModify" method="post">
			<input type='hidden' name='sn_siteNoticeNo' value="${sn.sn_siteNoticeNo}"> 
			<input type='hidden' name='page' value="${cri.page}"> 
			<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
		</form>
	</div>
	
<%-- ----------------------Footer include----------------- --%>
	<div class = "footer">
	
	</div>
	
</body>

</html>