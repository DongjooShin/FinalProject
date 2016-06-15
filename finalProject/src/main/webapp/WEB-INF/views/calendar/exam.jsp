<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.labelDay{
font-size: 22px;
}

</style>
</head>
<body>

	<div class="col-lg-10 col-lg-offset-1">
	<br><br>
	<label style="font-size: 25px; color : black; border-bottom: 3px solid #eaeaea; padding: 0 15px 13px 15px; margin-bottom: 15px;">스케줄</label><br><br>
		<div class="col-lg-10 " style="">
			<label class="labelDay">오늘 :</label> 
			<c:forEach var="cal" items="${nowlist}">
						<label class="labelDay">${cal.c_schedule }</label>
			</c:forEach>
			

			<br><br><label class="labelDay">1일전 :</label>
			<c:forEach var="cal" items="${list}">
						<label class="labelDay">${cal.c_schedule }</label>
						
			</c:forEach>

			<br><br><label class="labelDay">2일전 :</label>
			<c:forEach var="cal" items="${list2}">
						<label class="labelDay">${cal.c_schedule }</label>
			</c:forEach>
			<br><br><label class="labelDay">3일전 :</label>
			<c:forEach var="cal" items="${list3}">
						<label class="labelDay">${cal.c_schedule }</label>
			</c:forEach>
		
				<br><br><br><br>
		</div>
	</div>
</body>
</html>