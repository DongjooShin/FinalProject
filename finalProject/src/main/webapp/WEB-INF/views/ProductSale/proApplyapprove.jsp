
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
	<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/bootstrap/bootstrap.min.css' type='text/css' media='all' />
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/dist/css/mainFont.css' type='text/css' media='all' />
<link rel='stylesheet' id='google_fonts-css'
	href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
	type='text/css' media='all' />
<link rel='stylesheet' id='spacious_style-css' href='/resources/dist/css/main1.css'
	type='text/css' media='all' />
	
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
<script src="https://code.jquery.com/jquery.js"></script>
</head>
<body>

<script type="text/javascript">
/* 
function receiver(b_OK, prono){
	
	alert("뭐지");
	alert(b_OK);
	alert(prono);
	var b = 'flag'+prono;

	alert(b);
	location.href = "/ProductSale/proApplyapprove?b_OK="+b_OK+"&pro_no"+prono;
	
 //부모 페이지의 해당 ID들을 일단 해당 부분을 값을 바꿔준다.


opener.document.getElementById(b).value = b_OK;


//그후  자식창은 알아서 닫혀라




self.close(); 

} */


/*  function aaa(value){
	alert(value+"가 완료되었습니다.");
	self.close(); 
	
}
 */

</script>


	<div class="main">

	
		<div class="col-md-12">
			<div class="row">
				<div class="col-lg-3"
					style="margin-right: 0; margin-left: 26px; margin-top: 17px;">
			 	<%-- 	<div class="loginSidebar">
					<jsp:include page="ProductSideBar.jsp"></jsp:include>
					</div> --%>
 
				</div>
				<div class="col-lg-8"
					style="padding-left: 0; padding-right: -15px; margin-top: 17px;">
					<div class="well bs-component">
	
	<form action="/ProductSale/proApplyapprove" method="post">

							<legend>공동구매 신청내역 </legend>
	
	
						
<h3>글목록 보기</h3>
	<a href="/ProductSale/proApplicationList">공동구매 신청등록</a>

	<table border="1" cellpadding="0" cellspacing="0">
		<tr height="30">
			<th width="100">번호</th>
			<th width="100">분류</th>
			<th width="100">판매자</th>
			<th width="100">연락처</th>
			<th width="100">판매상품명</th>
			<th width="200">내용</th>
			<th width="150">작성일</th>
			
		</tr>
	
			<tr height="30">
				<td align="center">${product.pro_no }</td>
				<td align="center">${product.pro_group }</td>
				<td align="center">${product.m_memberNo }</td>
				<td align="center">${product.pro_tel  }</td>
				<td align="center">${product.pro_name }</td>
				<td align="center">${product.pro_context  }</td>
				<td align="center">${product.pro_date }</td> 
			</tr>
				
	</table>
	

	
	
	<div class="buttonInfo" style="margin-left: 40%;">
		
	<input type="hidden" name="pro_no" value="${product.pro_no }">
	
	<input type="submit" value="승인완료" name="b_OK" onclick="self.close()" >
	
	<input type="submit" value="승인거부" name="b_OK" onclick="self.close()" > 
	

	</div>
	</form>
	
	</div>
	
	<br>
	<br>
	


</body>
</html>