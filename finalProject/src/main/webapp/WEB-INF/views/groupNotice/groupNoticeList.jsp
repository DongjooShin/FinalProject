
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {
							alert("search!!");
							self.location = "listAll"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});

			});
</script>
<title>Insert title here</title>
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
			<th width="250">제목</th>
			<th width="150">작성자</th>
			<th width="150">작성일</th>
			<th width="100">조회수</th>
		</tr>
		<c:forEach var="gn" items="${list}">
			<tr>
				<td align="center">${gn.g_subNo }</td>
				<td align="left"><a href="/groupNotice/read${pageMaker.makeSearch(pageMaker.cri.page) }&g_groupNoticeNo=${gn.g_groupNoticeNo}">${gn.g_title}</a></td>
				
				<td align="center">${gn.m_memberNo}</td>
				<td align="center">
					<fmt:formatDate value="${gn.g_date}" pattern="yyyy-MM-dd"/>
				</td>
				<td align="center">${gn.g_hit}</td>
			</tr>
		</c:forEach>
	</table>
	


	<div class="text-center">
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li><a
					href="listAll${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="listAll${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="listAll${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
			</c:if>

		</ul>
	</div>
	<div class="row">
		<div class="col-md-3">
			<select class="form-control" name="searchType">
				<option value="n"
					<c:out value="${cri.searchType == null?'selected':''}"/>>
					---</option>
				<option value="t"
					<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
					제목</option>
				<option value="w"
					<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
					작성자</option>
			</select>
		</div>
		<div class="col-md-5">
			<input type="text" name='keyword' id="keywordInput" style="padding-left: 0px;"
			value='${cri.keyword }'>
		</div>
		<div class="col-md-4">
			<button id='searchBtn'>Search</button>
			<c:if test="${member.m_grade eq 2 }">
				<button id='newBtn'>New Board</button>
			</c:if>
		</div>
	</div>
	
</body>
</html>