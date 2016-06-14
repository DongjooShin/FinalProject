<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>D-day</h3>
	<c:forEach var="cal" items="${nowlist}">
		<tr>
			<td>스케줄</td>
			<td align="center">${cal.c_schedule }</td>

		</tr>
	</c:forEach>

	<h3>1일전</h3>
	<c:forEach var="cal" items="${list}">
		<tr>
			<td>스케줄</td>
			<td align="center">${cal.c_schedule }</td>

		</tr>
	</c:forEach>
	
	<h3>2일전</h3>
	<c:forEach var="cal" items="${list2}">
		<tr>
			<td>스케줄</td>
			<td align="center">${cal.c_schedule }</td>

		</tr>
	</c:forEach>
	
	<h3>3일전</h3>
	<c:forEach var="cal" items="${list3}">
		<tr>
			<td>스케줄</td>
			<td align="center">${cal.c_schedule }</td>

		</tr>
	</c:forEach>


</body>
</html>