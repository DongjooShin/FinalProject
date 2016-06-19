
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<link rel='stylesheet' href='../css/basic1.css' type='text/css'
	media='all' />
<link rel='stylesheet' href='../css/basic2.css' type='text/css'
	media='all' />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/dong/bootstrap.min.js"></script>
<style type="text/css">
.pagebutton{
	padding-left: 40%;
}
.checkbox123{
	padding-left: 30%;
}
</style>
</head>
<script type="text/javascript">

function detailProduct(pro_no){

	alert(pro_no+"입니다.");
	url = "/ProductSale/proRegister?pro_no="+pro_no;
	
	
	open(    
			url,
			"confirm",
			"toolbar=no, status=no, menubar=no, location=no, scrollbars=yes, resizable=no, width=1000, height=900");

}



</script>
<body>


		 <jsp:include page="../include/head.jsp"></jsp:include> 

	<div class="main">

	
		<div class="col-md-12">
			<div class="row">
				<div class="col-lg-3"
					style="margin-right: 0; margin-left: 26px; margin-top: 17px;">
			 		<div class="loginSidebar">
						<jsp:include page="ProductSideBar.jsp"></jsp:include>
					</div>
 
				</div>
				<div class="col-lg-8"
					style="padding-left: 0; padding-right: -15px; margin-top: 17px;">
					<div class="well bs-component">
					
						<form class="form-horizontal" action="MemberOk.jsp" method="post"
							name="userInput" onsubmit="return checkIt()">

							<legend>공동구매 신청내역 </legend>
	

						
<h3>글목록 보기</h3>
	<a href="/ProductSale/proApplicationList">공동구매 신청등록</a>

	<table border="1" cellpadding="0" cellspacing="0">
		<tr height="30">
			<th width="100">번호</th>
			<th width="100">분류</th>
			<th width="100">판매상품명</th>
			<th width="200">제목</th>
			<th width="150">작성일</th>
			<th width="150">진행여부</th>
			
		
		</tr>
		<c:forEach var="product" items="${list }">
			<tr height="30">
				<td align="center">${product.pro_no }</td>
				<td align="center">${product.pro_group }</td>
				<td align="center">${product.pro_name }</td>
				<td align="center"><a onclick="detailProduct(${product.pro_no })">등록하기</a></td>
				<td align="center">${product.pro_date }</td> 
				<td align="center">${product.pro_flag }</td>
				</tr>
				
			
		</c:forEach>
	</table>
	<br>
	<br>

	<!-- 페이징 처리  -->
	<!-- 현재페이지, 페이지당글 갯수, 총 글갯수, 총페이지갯수, 시작페이지, 마지막페이지  -->
<div class="boad-page">

				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="proApplicationList${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="proApplicationList${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="proApplicationList${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>

</div>	

	<br>
	<br>
			
						</form>
						
<div class="checkbox123">		
	<form action="aptSaleList.jsp" method="post">
		<input type="checkbox" name="area" value="pr_APTName">제목 <input
			type="checkbox" name="area" value="m_memberNo">작성자 <input   
			type="text" name="searchKey" size="10" style="width: 30%"> <input type="hidden"
			name="temp" value="temp"> <input type="submit" value="검색">
			<!-- 이거 pr이어야 검색되겟다 -->

	</form>
	</div>
	
					</div>
				</div>

			</div>
		</div>
		<!-----start-copyright---->
		<div class="copy-right">
			<p>
				Template by <a href="http://w3layouts.com">w3layouts</a>
			</p>
		</div>



<%-- 

<h3>글목록 보기</h3>
	<a href="aptSale.jsp">글쓰기</a>

	<table border="1" cellpadding="0" cellspacing="0">
		<tr height="30">
			<th width="50">건물명</th>
			<th width="100">이미지</th>
			<th width="250">제목</th>
			<th width="150">회원아이디</th>
			<th width="150">작성일</th>
		
		</tr>
		<c:forEach var="property" items="${listModel.list }">
			<tr height="30">
				<td align="center">${property.pr_APTName }</td>
				<td align="center"><c:if test="${property.pr_imageName != null}">
				
						<c:set var="head"
							value="${fn:substring(property.pr_imageName,0,fn:length(property.pr_imageName)-4) }"></c:set>
						<c:set var="pattern"
							value="${fn:substringAfter(property.pr_imageName, head) }"></c:set>
						 <img src="../M_upload1/${head }_small${pattern}" /> 
						
					</c:if></td>

				<td align="left">
				 <a href="aptSaledetail.jsp?pr_propertyNo=${property.pr_propertyNo }">${property.pr_APTName }</a></td>
				<td align="center">${property.pr_APTName }</td>
		 	<td align="center"><fmt:formatDate value="${property.pr_date }"
						pattern="yyyy-MM-dd" /></td> 
				</tr>
				
			
		</c:forEach>
	</table>
	<br>
	<br>

	<!-- 페이징 처리  -->
	<!-- 현재페이지, 페이지당글 갯수, 총 글갯수, 총페이지갯수, 시작페이지, 마지막페이지  -->

	<c:if test="${listModel.startPage >5 }">
		<a href="aptSaleList.jsp?pageNum=${listModel.startPage-5 }">[이전]</a>
	</c:if>


	<c:forEach var="pageNum" begin="${listModel.startPage }"
		end="${listModel.endPage }">
		<c:choose>
			<c:when test="${listModel.requestPage == pageNum}">
				<a href="aptSaleList.jsp?pageNum=${pageNum}"><b>[ ${pageNum} ]</b></a>
			</c:when>
			<c:otherwise>
				<a href="aptSaleList.jsp?pageNum=${pageNum}">[ ${pageNum} ]</a>
			</c:otherwise>
		</c:choose>

	</c:forEach>


	<c:if test="${listModel.endPage < listModel.totalPageCount }">
		<a href="aptSaleList.jsp?pageNum=${listModel.startPage+5 }">[다음]</a>
	</c:if>
	<br>
	<br>

	<form action="aptSaleList.jsp" method="post">
		<input type="checkbox" name="area" value="b_title">제목 <input
			type="checkbox" name="area" value="b_name">작성자 <input   
			type="text" name="searchKey" size="10"> <input type="hidden"
			name="temp" value="temp"> <input type="submit" value="검색">
			<!-- 이거 pr이어야 검색되겟다 -->

	</form> --%>

</body>
</html>