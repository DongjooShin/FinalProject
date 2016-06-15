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
		
		$('#sixthContent').load("/member/passwordCheck");
		$('#firstContent1').load("/calendar/exam");
		$('#firstContent2').load("/groupNotice/exam");
		$('#firstContent3').load("/");
		$('#firstManu').css('background', '#09b9e5');
		$('#firstContent').css('display', 'block');

		$('#firstManu').click(function() {
			$('.manu').css('background-color', 'rgba(0, 0, 0, 0.3)');
			$('#firstManu').css('background-color', '#09b9e5');
			$('.content').css('display', 'none');
			$('#firstContent').css('display', 'block');
		});

		$('#secondManu').click(function() {
			$('.manu').css('background-color', 'rgba(0, 0, 0, 0.3)');
			$('#secondManu').css('background-color', '#09b9e5');
			$('.content').css('display', 'none');
			$('#secondContent').css('display', 'block');
		});

		$('#thirdManu').click(function() {
			$('.manu').css('background-color', 'rgba(0, 0, 0, 0.3)');
			$('#thirdManu').css('background-color', '#09b9e5');
			$('.content').css('display', 'none');
			$('#thirdContent').css('display', 'block');

		});

		$('#fourthManu').click(function() {
			$('.manu').css('background-color', 'rgba(0, 0, 0, 0.3)');
			$('#fourthManu').css('background-color', '#09b9e5');
			$('.content').css('display', 'none');
			$('#fourthContent').css('display', 'block');

		});

		$('#fifthManu').click(function() {
			$('.manu').css('background-color', 'rgba(0, 0, 0, 0.3)');
			$('#fifthManu').css('background-color', '#09b9e5');
			$('.content').css('display', 'none');
			$('#fifthContent').css('display', 'block');

		});

		$('#sixthManu').click(function() {
			$('.manu').css('background-color', 'rgba(0, 0, 0, 0.3)');
			$('#sixthManu').css('background-color', '#09b9e5');
			$('.content').css('display', 'none');
			$('#sixthContent').css('display', 'block');

		});

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

#sixthContent{
	min-height: 500px; 
}
</style>
</head>
<body>
	<div class="header">

		<jsp:include page="../include/head.jsp"></jsp:include>

	</div>
	<div id="page"
		style="background: white; display: inline-block; padding-bottom: 50px; margin-left: 7.9%;">
		<div class="col-md-12">
			<div id="mypageLayout">
				<ul id=mypageUl>
					<li id="firstManu" class="manu ">커뮤니티</li>
					<li id="secondManu" class="manu">관리비</li>
					<li id="thirdManu" class="manu">문의답변</li>
					<li id="fourthManu" class="manu">1:1:문의</li>
					<li id="fifthManu" class="manu">쪽 지</li>
					<li id="sixthManu" class="manu">개인정보 수정</li>
				</ul>
				<br>


				<div class="col-md-12">
					<div id="firstContent" class="content  " style="height: 500px;">
						<div id="firstContent1">
						
						</div>
						
							<div id="firstContent2">
						
						</div>
						
						<div id="firstContent3">
						
						</div>
					</div>



					<div id="secondContent" class="content "
						style="background: orange; height: 500px;"></div>



					<div id="thirdContent" class="content "
						style="background: red; height: 500px;"></div>



					<div id="fourthContent" class="content "
						style="background: red; height: 500px;"></div>


					<div id="fifthContent" class="content "
						style="background: green; height: 600px;"></div>

					<div id="sixthContent" class="content "></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>