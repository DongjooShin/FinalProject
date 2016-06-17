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
	function closeconfirm() {
		self.close();
	}

</script>

<form action="/Message/aptMessage" method="get">
								
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
								<p class="white">보낸사람 :${detail.mg_from}</p>
							</h3>

							<div class="form-group">
								<label class="sr-only" for="contact-email">받는사람</label> ${detail.mg_to}
							</div>
							<div>
							날짜:${detail.mg_date}
							</div>
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
							<div>
							${detail.mg_content}
							</div>
								
								<input type="submit" class="btn" value="답장하기"  >
								<input type=button value="닫기" onclick="closeconfirm()">
								
								
						
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



