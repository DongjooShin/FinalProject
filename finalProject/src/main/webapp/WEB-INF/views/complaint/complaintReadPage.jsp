<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
   src="/resources/jquery/jQuery-2.1.4.min.js"></script>


</head>
<body>
   <div class="header">
      <jsp:include page="../include/head.jsp"></jsp:include>
   </div>

	<div class="main">
		<div class="container" id="page">
			</div>
			
			<!-- 리스트,입력,상세보기 -->
			<div class="col-md-12" style="margin-top: 50px;">
				<jsp:include page="readPage.jsp"></jsp:include>
			</div>
		</div>

</body>
</html>