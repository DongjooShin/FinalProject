<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='/resources/bootstrap/bootstrap.min.css'
	type='text/css' rel="stylesheet" />
<link rel='stylesheet' href='/resources/bootstrap/mypage-bootstrap.css'
	type='text/css' rel="stylesheet" />
<script type="text/javascript"
	src="/resources/jquery/jQuery-2.1.4.min.js"></script>

<script type="text/javascript">
	$(function() {

		
		$('#firstManu').css('background', '#09b9e5');
	

	});
</script>

<style type="text/css">
#mypageUl {
	margin-top: -53px;
}

#mypageUl li {
	display: inline;
	float: left;
	position: relative;
	margin-right: 5px;
	padding: 10px;
	background-color: rgba(0, 0, 0, 0.3);
	padding: 15px 35px 15px 35px;
	border-radius: 3px;
	color: #fff;
	font-size: 21px;
}

#mypageLayout {
	border: 3px solid #eaeaea;
	border-top: 4px solid #09b9e5;
	display: inline-block;
	width: 100%;
	margin-top: 70px;
}

.content {
	display: none;
	margin-top: 15px;
}

#sixthContent {
	min-height: 500px;
}
</style>
</head>
<body>
	<div class="header">

		<jsp:include page="../include/head.jsp"></jsp:include>

	</div>
	<div id="page"
		style="background: white; display: inline-block; padding-bottom: 50px; ">
		<div class="col-md-12">
			<div id="mypageLayout" style="height: 500px;">
					<ul id=mypageUl>
					<jsp:include page="../include/siteManagerMypageHead.jsp"></jsp:include>

				</ul>
				<br>


					
				</div>
			</div>
		</div>
</body>
</html>