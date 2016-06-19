<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>website</title>
<script type="text/javascript"
	src="/resources/jquery/jQuery-2.1.4.min.js"></script>
<style type="text/css">
div {
	margin: 20px;
	margin-left: 0px;
}

.newslayout {
	list-style-type: none;
	width: 100%;
	padding: 10px;
	overflow:hidden;
	max-height:125px;
}

h2 {
	font: bold 20px/1.5 Helvetica, Verdana, sans-serif;
	margin-bottom: 20px;
	margin-left: 20px;
}

li p {
	font: 200 12px/1.5 Georgia, Times New Roman, serif;
}

.newslayout :hover {
	cursor: pointer;
}

table {
	display: none;
}

#link {
	text-decoration: none;
	color: black;
}

#news {
	border: 1px solid #eaeaea;
	padding: 3%;
}

#news a{
	font-size: 13px;
}

.newtitle {
	font-size: 20px;
	line-height: 21px;
	color: black;
	font-weight: bold;
}

.newsSummary {
	font-size: 13px;
}
#pageId{
	margin-top: 30px;
}
#preBtn{
margin-left: 39%;
float: left;
}
#nextBtn{
margin-right: 39%;
float: right;
}

#ChooseNews{
margin-top: 50px;
margin-left: 10%;
margin-bottom: 40px;
}

#ChooseNews input{
margin-right: 3%;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#mknews').click(function() {
			self.location = "/Property/aptNews?newsNum=0&page=0";
		});
		$('#fnnews').click(function() {
			self.location = "/Property/aptNews?newsNum=1&page=0";
		});
		$('#edailynews').click(function() {
			self.location = "/Property/aptNews?newsNum=2&page=0";
		});
		$('#heraldnews').click(function() {
			self.location = "/Property/aptNews?newsNum=3&page=0";
		});
		$('#nextBtn').click(function(){
			var pageNum = ${startPage } +5;
			self.location = "/Property/aptNews?newsNum=${newsNum}&page="+pageNum;
		})
		$('#preBtn').click(function(){
			var pageNum = ${startPage } -5;
			self.location = "/Property/aptNews?newsNum=${newsNum}&page="+pageNum;
		})
		
	});
</script>
</head>
<body>
	<div class="header">

		<jsp:include page="../include/head.jsp"></jsp:include>

	</div>

	<div id="page" class="hfeed site"
		style="height: 950px; border-top: 2px solid;">
		<div class="col-md-12">
			<div class="col-md-3">
			
			
			</div>
			<div class="col-md-9">
				<div id="ChooseNews">
					<input type="button" value="매일경제 부동산" id="mknews"> <input
						type="button" value="조선비즈 부동산" id="fnnews"> <input
						type="button" value="이델일리 부동산" id="edailynews"> <input
						type="button" value="헤 럴 드 부동산" id="heraldnews">
				</div>
				<ul id="news">
					<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1" >
						<li class="newslayout"><a href="${ newsList.get(i).get('url')}">
								<p class="newtitle">${ newsList.get(i).get("title")}</p>
								<p class="newsSummary">${ newsList.get(i).get("description")}</p>

						</a></li>
						
					</c:forEach>
				</ul>
				<div id="pageId">
					<c:if test="${startPage>4}">
						<input type="button" value="< 이전"  id="preBtn">
					</c:if>
					<c:if test="${startPage<listSize}">
						<input type="button"value="다음 >" id="nextBtn">
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<
</body>
</html>