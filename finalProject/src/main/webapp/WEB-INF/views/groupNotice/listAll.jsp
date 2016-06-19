<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #eaeaea;">
	<div class="header">
		 <jsp:include page="../include/head.jsp"></jsp:include> 
	</div>
	<div class="main">
		<div class="container" id="page">
			<div class="col-md-3">
				<jsp:include page="../Community/CommunitySidebar.jsp"></jsp:include>
			</div>
			
			<!-- 리스트,입력,상세보기 -->
			<div class="col-md-8" style="margin-top: 50px;">
			<div style="border-bottom:  3px  solid #eaeaea; width: 90%; ">
						<h2 style="padding-bottom: 6px;">공지사항</h2>
			</div>
				<jsp:include page="groupNoticeList.jsp"></jsp:include>
			</div>
		</div>
	</div>

</body>
</html>