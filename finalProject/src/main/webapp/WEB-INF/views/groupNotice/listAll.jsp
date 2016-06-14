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
				
				<div id="secondary">
					<aside id="archives" class="widget">
					<h3 class="widget-title">Archives</h3>
					<ul>
						<li><a href='http://demo.themegrill.com/spacious/2014/03/'>March
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/02/'>February
								2014</a></li>

						<li><a href='http://demo.themegrill.com/spacious/2014/03/'>March
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/02/'>February
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/03/'>March
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/02/'>February
								2014</a></li>
					</ul>
					</aside>
				</div>
				<div id="primary" style="height: 1000px;"></div>

			</div>
			
			<!-- 리스트,입력,상세보기 -->
			<div class="col-md-8" style="margin-top: 50px;">
				<jsp:include page="groupNoticeList.jsp"></jsp:include>
			</div>
		</div>
	</div>

</body>
</html>