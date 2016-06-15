<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="/resources/jquery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#fifthManu').css('background', '#09b9e5');
		$('#fifthManu').css('display', 'block');


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

.manu {
	color: white;
}
</style>
</head>
<body>
	<div class="header">
		<jsp:include page="../include/head.jsp"></jsp:include>
	</div>
	<div id="page"
		style="background: white; display: inline-block;  margin-left: 7.9%;">
		<div class="col-md-12">
			<div id="mypageLayout">
				<ul id=mypageUl>
					<a href="/mypage/userMypage"><li id="firstManu" class="manu ">커뮤니티</li></a>
					<a href="/mypage/maessage"><li id="secondManu" class="manu">관리비</li></a>
					<a href="/mypage/maessage"><li id="thirdManu" class="manu">문의답변</li></a>
					<a href="/mypage/maessage"><li id="fourthManu" class="manu">1:1:문의</li></a>
					<a href="/mypage/userMypage"><li id="fifthManu" class="manu">쪽 지</li></a>
					<a href="/mypage/maessage"><li id="sixthManu" class="manu">개인정보 수정</li></a>
				</ul>
				
				
				
				
				
				
				
			</div>
		</div>
	</div>
</body>
</html>