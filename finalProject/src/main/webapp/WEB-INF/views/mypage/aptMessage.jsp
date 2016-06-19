<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Contact Form Template</title>

<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="../css/Min/assets1/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../css/Min/assets1/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/Min/assets1/css/form-elements.css">
<link rel="stylesheet" href="../css/Min/assets1/css/style.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="../css/Min/assets1/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../css/Min/assets1/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../css/Min/assets1/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../css/Min/assets1/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../css/Min/assets1/ico/apple-touch-icon-57-precomposed.png">

</head>

<title>Insert title here</title>



</head>
<body>


<script type="text/javascript">

function abc223(id2){
	alert("함수를 실행 했다.2");
	

	$.ajax({
		
		url: '/mypage/aptMessage2',
		type : 'post',
		data :{abc : "abc이다."
				},	
		dataType : 'text',
		success : function(data){
			
			alert("데이터삭제 성공");
			
			reloadpage();
			
		}
	
	});
}

/* 	
	
	url = "/mypage/aptMessageOkdelect";
	alert(url);
	location.href("/mypage/aptMessageOkdelect");
	
 	
	open(
			url,
			"confirm",
			"toolbar=no, status=no, menubar=no, location=no, scrollbars=no, resizable=no, width=410, height=280");
 */


</script>

<form action="" method="post" onsubmit="sandMsg(this.form)">
								
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">

				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h3>Contact us</h3>
								<p>Fill in the form below to send us a message:</p>
							</div>
							<div class="form-top-right">
								<i class="fa fa-envelope"></i>
							</div>
						</div>
						<div class="form-bottom contact-form">




							<h3>
								<p class="white">보내는사람 : ${m_memberNo}<input type="hidden" name="mg_from" value="${m_memberNo}"></p>
								<input type="hidden" class="aaa2" name="aaa2"  value="123">
							</h3>

						<!-- 	<div class="form-group">
								<label class="sr-only" for="contact-email">받는사람</label> <input
									type="text" name="m_memberNo" class="contact-email form-control"
									id="contact-email" value="">
							</div> -->
							<div>
							받는사람:<input type="text" name="mg_to">
							</div>
							<div>
							제목:<input type="text" name="mg_title">
							</div>
							
							<!--
				                        <div class="form-group">
				                        	<label class="sr-only" for="contact-subject">Subject</label>
				                        	<input type="text" name="subject" placeholder="Subject..." class="contact-subject form-control" id="contact-subject">
				                        </div> -->
							<div class="form-group">
								<label class="sr-only" for="contact-message">Message</label>
								</div>
								
								<textarea name="mg_content" placeholder="Message..." class="contact-message form-control" id="contact-message"></textarea>
								<input type="hidden" name="mg_state" value="f">
							
								
								<input type="submit" class="btn" value="보내기"  >
								
								
						
							<!--     <form action="aptMessageOk.jsp" method="post">
			                    <label class="sr-only" for="contact-message">Message</label>
			                      
			                    <input type="submit" class="btn" value="보내기">
			                 
			                 
			                    <form action="aptMessageOk.jsp" method="post">
								
								<input type="text" name="message" >
								<input type="submit" value="보내기">
									</form>
									
									
			                    </form> -->
<!-- 
<textarea name="message" placeholder="Message..."
									class="contact-message form-control" id="contact-message"></textarea> -->
					
					
					

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	// 우편번호 찾기 찾기 화면을 넣을 element
	var element_wrap = document.getElementById('wrap');

	function foldDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_wrap.style.display = 'none';
	}

	function sample3_execDaumPostcode() {
		// 현재 scroll 위치를 저장해놓는다.
		var currentScroll = Math.max(document.body.scrollTop,
				document.documentElement.scrollTop);
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = data.address; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 기본 주소가 도로명 타입일때 조합한다.
						if (data.addressType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample3_address').value = fullAddr;

						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						element_wrap.style.display = 'none';

						// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
						document.body.scrollTop = currentScroll;
					},
					// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
					onresize : function(size) {
						element_wrap.style.height = size.height + 'px';
					},
					width : '100%',
					height : '100%'
				}).embed(element_wrap);

		// iframe을 넣은 element를 보이게 한다.
		element_wrap.style.display = 'block';
	}
</script>

						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</form>	
	<!-- Javascript -->
	<script src="aptMessagecss@@@/css/Min/assets1/js/jquery-1.11.1.min.js"></script>
	<script src="aptMessagecss@@@/css/Min/assets1/bootstrap/js/bootstrap.min.js"></script>
	<script src="aptMessagecss@@@@/css/Min/assets1/js/jquery.backstretch.min.js"></script>
	<script src="aptMessagecss@@@@/css/Min/assets1/js/retina-1.1.0.min.js"></script>
	<script src="aptMessagecss@@@@/css/Min/assets1/js/scripts.js"></script>

	<!--[if lt IE 10]>
            <script src="assets1/js/placeholder.js"></script>
        <![endif]-->


</body>
</html>



