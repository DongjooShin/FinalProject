<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>    
 <script>
	
	$(function() {
		var formObj = $("form[role='form']");
		$("#replygn").on("click", function() {
			alert("답변버튼 클릭");
			formObj.attr("action", "/siteNotice/inqReply");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#listgn").on("click", function() {
			alert("목록버튼 클릭");
			formObj.attr("method", "get");
			formObj.attr("action", "/siteNotice/inquiryMain");
			formObj.submit();
		});

	});
</script>

 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #eaeaea;">
<%-- -----------------Header include----------------- --%>	
	<div class="header">
		 <jsp:include page="../include/head.jsp"></jsp:include> 
	</div>
	
<%-- ------------------------------Body------------------------------------------- --%>	
	<div class="main" id="page">
		<form role="form" action="inqReply" method="post">
		<div class="container">
			<div class="col-md-3">
				<jsp:include page="../siteNotice/CustomerSidebar.jsp"></jsp:include>
			</div>
			
			<!-- 리스트,입력,상세보기 -->
			<div class="col-md-8" style="margin-top: 50px; margin-left:50px;">
				
				<table border="1" class="table table-striped">
					<tr height="30">
						<td width="50">제목</td>
						<td colspan="3">${sn.q_title }</td>
					</tr>
					<tr height="30">
						<td width="50">글번호</td>
						<td width="260">${sn.qnaNo }</td>
						<td width="50">분류</td>
						<td width="50">${sn.q_state }</td>
					</tr>
					<tr height="30">
						<td width="50">작성자</td>
						<td width="160">${sn.m_memberNo }</td>
						<td width="40">작성일</td>
						<td width="160"><fmt:formatDate value="${sn.q_date }"
								pattern="yyyy-MM-dd" /></td>
					</tr>

					<tr height="30">
						<td width="30">파일</td>
						<c:if test="${sn.q_fileName != 'NULL'}">
							<td colspan="3"><a href="/siteNotice/siteNotice_download?filename=${sn.q_fileName }">${sn.q_fileName }</a></td>
						</c:if>
					</tr>
					<tr height="500">
						<td colspan="4" style="padding: 20px;">${sn.q_content }</td>
					</tr>
						<c:choose>
							<c:when test="${sn.q_state == 1 }">								
								<tr height="30">
									<td colspan = "4">
										<!-- reply place -->
										<textarea name="q_content"></textarea>
										<button type="button" id="replygn" >답변</button>
									</td>
								</tr>
								<tr>	
									<td colspan="4">
										<button type="button" id="listgn">목록</button>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4"><textarea disabled="disabled" rows="3" cols="10">${qna.q_content }</textarea> </td>
								</tr>
								<tr>	
									<td colspan="4">
											<button type="button" id="listgn">목록</button>
									</td>
								</tr>	
							</c:otherwise>	
						</c:choose>	
				</table>
				<br>
				<br>
				

			</div>
		
			
			
			
		</div>
		
				<input type='hidden' name='qnaNo' value="${sn.qnaNo}"> 
				<input type='hidden' name='page' value="${cri.page}"> 
				<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
			</form>
	</div>
	
<%-- ----------------------Footer include----------------- --%>
	<div class = "footer">
	
	</div>
	
</body>

</html>