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
	<div class="page">
		 <jsp:include page="../include/middle.jsp"></jsp:include> 
	</div>
	
	<div class="main">
		<div class="container" id="page">
			<div class="col-md-3">
				<jsp:include page="../Community/CommunitySidebar.jsp"></jsp:include>
			</div>
			
			<!-- 리스트,입력,상세보기 -->
			<div class="col-md-8" style="margin-top: 50px;">
			<br>
			

<label
						style="font-size: 25px; color: black; border-bottom: 3px solid #eaeaea; padding: 0 15px 13px 15px; margin-bottom: 15px; font-weight: normal;">공지사항</label>
	
				<jsp:include page="groupNoticeList.jsp"></jsp:include>
			</div>
		</div>
	</div>
<div class="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</div>

</body>
</html>