<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
   
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "inquiryMain"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});
			});
</script>

<style type="text/css">
#searchkey{
	width: 300px;
}
#pageing{
	margin-left: 350px;
	margin-bottom: 10px;
}
</style>
<link href="/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
</head>
<body>


<table class="table table-striped">
		<tr height="30">
			<th width="50">번호</th>
			<th width="100">분류</th>
			<th width="250">제목</th>
			<th width="150">작성자</th>
			<th width="150">작성일</th>
			<th width="100">상태</th>
		</tr>
		<c:forEach var="gn" items="${qlist}">
			<tr>
				<td align="center">${gn.qnaNo }</td>
				<td align="center">${gn.q_name }</td>
				<td align="left"><a href="/siteNotice/inquiryRead${pageMaker.makeSearch(pageMaker.cri.page) }&qnaNo=${gn.qnaNo}">${gn.q_title}</a></td>
				<td align="center">${gn.m_memberNo}</td>
				<td align="center">
					<fmt:formatDate value="${gn.q_date}"/>
				</td>
				<c:choose>
					<c:when test="${gn.q_state == 1}">
						<td align="center">접수</td>
					</c:when>
					<c:otherwise>
						<td align="center">답변</td>
					</c:otherwise>	
				</c:choose>	
			</tr>
		</c:forEach>
	</table>
	


	<div class="text-center">
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li><a
					href="inquiryMain${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="inquiryMain${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="inquiryMain${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
			</c:if>

		</ul>
	</div>

	<select name="searchType" style="width: 13%; height: 5%; margin-left: 11%;margin-right: 25px;">
		<option value="n"
			<c:out value="${cri.searchType == null?'selected':''}"/>>
			---</option>
		<option value="g"
			<c:out value="${cri.searchType eq 'g'?'selected':''}"/>>
			분류</option>
		<option value="w"
			<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
			작성자</option>
	</select>
	<input type="text" name='keyword' id="keywordInput"
		value='${cri.keyword }' style="width: 25%; margin-right: 25px; height: 30px">
	<button id='searchBtn' style="height: 30px;">Search</button>

</body>
</html>