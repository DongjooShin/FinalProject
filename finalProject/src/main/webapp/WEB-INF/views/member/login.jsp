
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript"
	src="/resources/jquery/jQuery-2.1.4.min.js"></script>

<link rel="stylesheet" href="/resources/dist/css/dong/style.css">
<style type="text/css">
#changeLetter1 {
	color: red;
	margin-top: -15px;
	margin-bottom: 3px;
	font-weight: bold;
	font-size: 13px;
}

#changeLetter2 {
	color: red;
	margin-bottom: 15px;
	font-weight: bold;
	font-size: 13px;
}

#loginSpace {
	margin-bottom: 10px;
}

#btn {
	font-weight: bold;
}
</style>


<script type="text/javascript">
	$(function() {

	})

	function movePage() {
		location.href = "/loginCheck";
	}

	function focusIt() {
		form.formUsername.focus();
	}

	function checkIt() {
		if (!document.form.formUsername.value) {
			alert("ID를 입력하세요");
			return false;
		}

		if (!document.form.formPassword.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
	}
</script>

</head>
<body>

	<jsp:include page="../include/head.jsp"></jsp:include>
<!-- style="background: white;  -->
	<div id="page" display: inline-block; padding-bottom: 50px;">
		<div class="col-md-12">

			<div class="top-content" id="widthsize" style="margin-top: 10px">

				<div class="container">

					<h1 style="margin-top: 40px;">
						<strong style="color: white; text-align: center;">로그인</strong>
					</h1>
					<div class="description">
						<p>
							<strong id="titleStrong" style="color: white;">APT
								Management에 오신것을 환영합니다.</strong>
						</p>
					</div>



					<div class="row" style="margin-bottom: 100px;">
						<div class="col-sm-6 col-sm-offset-3 form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3>Login to our site</h3>
									<p>아이디와 비밀번호를 입력해주세요</p>

								</div>
								<div class="form-top-right">
									<i class="fa fa-key"></i>
								</div>
							</div>
							<div class="form-bottom">
								<form name="form" action="login" method="post"
									class="login-form" onsubmit="return checkIt()">
									<div class="form-group">
										<label class="sr-only" for="form-username">Username</label> <input
											type="text" name="formUsername" placeholder="아이디"
											class="form-username form-control" id="form-username">
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-password">Password</label> <input
											type="password" name="formPassword" placeholder="비밀번호"
											class="form-password form-control" id="form-password">
									</div>
									<c:if test="${check ==10 }">

										<p id="changeLetter1">아이디 또는 비밀번호를 다시 확인하세요.</p>
										<p id="changeLetter2">등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못
											입력하셨습니다.</p>

									</c:if>

									<button type="submit" class="btn" id="loginSpace">로 그
										인</button>
									<button type="button" class="btn" onclick="movePage()">회원가입</button>
								</form>
							</div>
						</div>
					</div>
				</div>


			</div>


		</div>


	</div>




</body>
</html>