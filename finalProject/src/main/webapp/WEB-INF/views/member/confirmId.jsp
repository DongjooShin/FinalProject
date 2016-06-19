
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href='/resources/bootstrap/bootstrap.min.css'
	type='text/css' rel="stylesheet" />
<link rel='stylesheet' href='/resources/dist/css/mainFont.css'
	type='text/css' rel="stylesheet" />
<link rel='stylesheet'
	href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
	type='text/css' media='all' />
<link rel='stylesheet' href='/resources/dist/css/main1.css'
	type='text/css' rel="stylesheet" />

<script type="text/javascript">
	function setid() {
		opener.document.userInput.m_memberNo.value = "${id}";
		opener.document.userInput.id.value = "${id}";
		opener.document.userInput.m_memberNo.disabled="disabled";
		opener.document.userInput.idCheckOK.value = "1";
		
		location.href = "signup.jsp";
		self.close();
		
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/basic1.css">
<style type="text/css">
input[type="text"]{
width: 30%;
margin-left: 22%;

}
input[type="button"]{
margin-left: 40%;
}
</style>
</head>
<body style="background-color: white;">
	<c:if test="${check ==1 }">
	<br><br><h3 align="center">입력하신  ${id }은  사용가능합니다.</h3>

	<input type="button" value="사용하기" onclick="setid()" >
	</c:if>
	
	<c:if test="${check ==-1 }">
	<br><br><h3 align="center">입력하신  ${id }은  이미 사용중인 id 입니다.</h3>
	<h2 align="center">다른아이디를 선택하세요</h2><br>
	
	<form action="confirmId" method="get">
		<input type="text" name="id" size="15px" />
		<input type="submit" value="ID중복확인">
	
	</form>
	
	</c:if>
	
	

</body>
</html>


















