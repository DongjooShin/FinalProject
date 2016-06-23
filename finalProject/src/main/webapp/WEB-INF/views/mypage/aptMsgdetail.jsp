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


<link rel='stylesheet' href='/resources/bootstrap/bootstrap.min.css' type='text/css' rel="stylesheet" />
<link rel='stylesheet' href='/resources/dist/css/mainFont.css'
	type='text/css' rel="stylesheet" />
<link rel='stylesheet'
	href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
	type='text/css' media='all' />
<link rel='stylesheet' href='/resources/dist/css/main1.css'
	type='text/css' rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->


</head>

<title>Insert title here</title>



</head>
<body style=" background-color: white;">

<script type="text/javascript">
	function closeconfirm() {
		self.close();
	}

</script>

<form action="/mypage/aptMessage" method="get">
								
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">

				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h3>받은 메시지</h3>
								
							</div>
							<div class="form-top-right">
								<i class="fa fa-envelope"></i>
							</div>
						</div>
						<div class="form-bottom contact-form">




							<h3>
								<p class="white">보낸사람 :${detail.mg_from}</p>
							</h3>

							<div class="form-group">
								<label class="sr-only" for="contact-email">받는사람</label> ${detail.mg_to}
							</div>
							<div>
							날짜:${detail.mg_date}
							</div><br>
							<div>
							제목:${detail.mg_title}
							</div>
							
							<!--
				                        <div class="form-group">
				                        	<label class="sr-only" for="contact-subject">Subject</label>
				                        	<input type="text" name="subject" placeholder="Subject..." class="contact-subject form-control" id="contact-subject">
				                        </div> -->
							<div class="form-group">
								<label class="sr-only" for="contact-message">내용</label>
							</div>
							<div style="border: 2px solid #eaeaea; height: 200px; width: 100%;">
							${detail.mg_content}
							</div>
								<div style="margin-top: 15px; text-align: center; padding: 40px; " class="col-md-4 row" >
								<input type="submit"  value="답장하기"  style="margin-right: 20px;">
								
								<input type=button value="닫기" onclick="closeconfirm()">
								</div>
								
						
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</form>	
	
	<!--[if lt IE 10]>
            <script src="assets1/js/placeholder.js"></script>
        <![endif]-->

</body>
</html>



