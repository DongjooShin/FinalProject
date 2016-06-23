<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content= "IE=edge">      <!-- 구형 익스플로러를 위해 써주는 부분 -->
<meta name="viewport" content= "width=devsice-width, initial-scale=1" >    <!-- 이부분이 바로 반응형 웹!! 디바이스의 가로크기에 맞춰 컨텐트의 가로를 맞춘다. -->

<link rel="stylesheet" href="/resources/voteCss/vote.css"> 
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/bootstrap/bootstrap.min.css' type='text/css' media='all' />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>	
<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "siteNoticeAllList"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
				

				$('#newBtn').on("click", function(evt) {

					self.location = "siteNoticeRegist";

				});

			});
</script>

<title>Site Notice List</title>

<style type="text/css">
#searchkey{
	width: 300px;
}
#pageing{
	margin-left: 350px;
	margin-bottom: 10px;
}
</style>

</head>
<body>

<label style="font-size: 25px; color: black; border-bottom: 3px solid #eaeaea; padding: 0 15px 13px 15px; margin-bottom: 15px;">공지사항</label>
		<br><br>
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
						<td align="center">${gn.sn_siteNoticeNo }</td>
						<td align="left"><a href="/siteNotice/snRead${pageMaker.makeSearch(pageMaker.cri.page) }&sn_siteNoticeNo=${gn.sn_siteNoticeNo}">${gn.sn_title}</a></td>
						
						<td align="center">${gn.m_memberNo}</td>
						<td align="center">
							<fmt:formatDate value="${gn.sn_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td align="center">${gn.sn_hit}</td>
					</tr>
				</c:forEach>
			</table>
			
			<div class="text-center">
				<ul class="pagination">
		
					<c:if test="${pageMaker.prev}">
						<li><a
							href="siteNoticeAllList${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
					</c:if>
		
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="siteNoticeAllList${pageMaker.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>
		
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
					"src/main/webapp/WEB-INF/views/siteNotice/siteNoticeRead.jsp"		href="siteNoticeAllList${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
					</c:if>
		
				</ul>
			</div>
		
			<select name="searchType" style="width: 20%; height: 6% ;margin-right: 15px; margin-left: 30px;">
				<option value="n"
					<c:out value="${cri.searchType == null?'selected':''}"/>>
					---</option>
				<option value="t"
					<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
					제목</option>
			</select>
			<input type="text" name='keyword' id="keywordInput" 
				value='${cri.keyword }'  style="width: 30%; margin-right: 15px;">
			<button id='searchBtn'>Search</button>
			<c:if test="${member.m_grade eq 0 }">
				<button id='newBtn'>New Board</button>
			</c:if>
	
	
</body>
</html>