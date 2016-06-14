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
			<div class="col-md-12" style="margin-top: 50px;">
				<jsp:include page="../mypage/MypageHead.jsp"></jsp:include>
			
			</div>
			
			<!-- 리스트,입력,상세보기 -->
			<div class="body col-md-12" id="page">
			<jsp:include page="../../../resources/editor/ComplaintSmartEditor2.jsp"></jsp:include>

				</div>
		</div>
	</div>

</body>
</html>