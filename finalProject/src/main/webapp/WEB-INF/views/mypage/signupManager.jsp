<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="/resources/jquery/jQuery-2.1.4.min.js"></script>

<script type="text/javascript">
	$(function() {

		$('#thirdManu').css('background', '#09b9e5');
		if($('#insertCheck').val() == 200){
			alert("관리자 계정이 등록되었습니다.");
		}
		
		
		$('#managerPassword').on('change', function() {
			var reg_pwd = /^((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15})$/gm;

			if (!reg_pwd.test(document.managerInput.managerPassword.value)) {
				alert("비밀번호는 숫자와 특수문자를 조합하여 8~15글자로 입력해주세요.");
				document.managerInput.managerPassword.value = "";
				

			}
		});

	});
	
	
	function checkIt() {

		if (!document.managerInput.managerId.value) {
			alert("관리자ID를 입력하세요");
			return false;
		}

		if (!document.managerInput.managerPassword.value) {
			alert("관리자 비밀번호를 입력하세요");
			return false;
		}

		if (!document.managerInput.managerPasswordCheck.value) {
			alert("관리자 비밀번호확인에 비밀번호를 입력하세요");
			return false;
		}


		if (document.managerInput.managerPassword.value != document.managerInput.managerPasswordCheck.value) {
			alert("비밀번호가 일치하지 않습니다.")
			return false;
		}
		document.managerInput.insertCheck.value = "";

	}
</script>
<style type="text/css">
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
	<div id="page" style="background: white; display: inline-block;">
		<div class="col-md-12">
			<div id="mypageLayout" ">

				<ul id=mypageUl>
					<jsp:include page="../include/siteManagerMypageHead.jsp"></jsp:include>

				</ul>

				<div class="col-lg-10 col-lg-offset-1">
					<br> <br> <label
						style="font-size: 25px; color: black; border-bottom: 3px solid #eaeaea; padding: 0 15px 13px 15px; margin-bottom: 15px;">관리자 등록하기</label>
				 <br> <br>
					<div class="col-lg-6  col-lg-offset-3"
							style="margin-top: 50px; margin-bottom:60px; border: 4px solid #eaeaea; border-radius: 5px; padding: 40px 0 0 25px;">
							
							<form action="signupManager" method="post" onsubmit="return checkIt()" name="managerInput">
								<input type="hidden" value="${insertOK }" id="insertCheck">
								<label class="col-lg-4 ">아 이 디</label><div class="col-lg-7" ><input type="text" id="managerId" name="managerId"></div>
								<label class="col-lg-4 ">비밀번호</label><div class="col-lg-7" ><input type="password" id="managerPassword" name="managerPassword"></div>
								<label class="col-lg-4 ">비밀번호확인</label><div class="col-lg-7" ><input type="password" id="managerPasswordCheck"></div>
							
							<br> <br>
							<div class="col-lg-6 col-lg-offset-3">
								<input type="submit" class="btn btn-primary" value="확인"	style="width: 100%; height: 50px; margin-top: 20px;">
							</div>
							</form>
						
					</div>
				</div>










			</div>
		</div>
	</div>
</body>
</html>