<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<%-- if vote start --%>
<c:if test="${member.v_flag == 2 }">
	<a href="">현재 입주자대표 선거가 등록되어 있습니다.</a>
</c:if>
<c:if test="${member.v_flag == 4 }">
	<a href="">입주자대표가 선출되었습니다!</a>
</c:if>
<c:if test="${member.v2_flag == 2 }">
	<a href="">현재 동대표 선거가 등록되어 있습니다.</a>
</c:if>
<c:if test="${member.v2_flag == 4 }">
	<a href="">동대표가 선출되었습니다!</a>
</c:if>

</body>
</html>