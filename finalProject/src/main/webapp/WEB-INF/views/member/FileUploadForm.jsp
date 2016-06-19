
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<head>
<title>File Upload with Spring 3 MVC</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<br>
	<br>
	<div id="passwordCheckDiv" class="col-lg-12">

		<div class="col-lg-4 col-lg-offset-1">
			<span style="font-size: 30px;">아파트실거래가 등록</span>
		</div>
		<br>
		<br>
		
		<div class="col-lg-6  col-lg-offset-3" style="margin-top: 50px; border: 4px solid #eaeaea; border-radius: 5px; padding: 40px 0 0 25px;">
		<form:form commandName="excel" enctype="multipart/form-data"
			method="POST">
			<div class="col-lg-8 col-lg-offset-3">
		Name : <form:input type="file" path="file" />
			</div>
			<div class="col-lg-6 col-lg-offset-4">
			<input type="submit" value="Upload File" />
			</div>
		</form:form>

	</div></div>
</body>
</html>