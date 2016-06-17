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
		$("#passwordCheck").click(
				function() {
					var pass = $("#password").val();
					$.ajax({
						url : '/member/pass',
						type : 'POST',
						data : {
							"pass" : pass
						},
						success : function(map) {
							pass = map.pass;
							if ($("#passwordCh").val() == pass) {

								$("#passwordCheckDiv").empty();
								alert("비밀번호가 일치합니다.")
								$('#passwordCheckDiv').load(
										"/member/changeMemberInfo");
							} else {
								alert("비밀번호 일치하지 않습니다.");
							}

						},
						error : function(hxr, data, error) {
							alert('이메일 전송이 실패 하였습니다.');
						}
					});

				});

		$('#sixthManu').css('background', '#09b9e5');
		$('#sixthManu').css('display', 'block');
	})
</script>
</head>
<body>
	<div class="header">
		<jsp:include page="../include/head.jsp"></jsp:include>
	</div>
	<div id="page" style="background: white; display: inline-block;">
		<div class="col-md-12">
			<div id="mypageLayout">
				<ul id=mypageUl>
					<jsp:include page="../include/aaa.jsp"></jsp:include>

				</ul>
				<div id="passwordCheckDiv" class="col-lg-12">
					<br>
					<br>
					<br>
					<div class="col-lg-3 col-lg-offset-1">
						<span style="font-size: 30px; margin-top: 40px">회원정보 수정</span>
					</div>
					<br> <br> <input type="hidden" id="passwordCh"
						value="${password }">

					<div class="col-lg-6  col-lg-offset-3"
						style="margin-top: 50px;  margin-bottom:50px;  border: 4px solid #eaeaea; border-radius: 5px; padding: 40px 0 0 25px;">
						<div class="col-lg-12">
							<div style="" class="insert-form">
								<div class="col-lg-4">
									<label style="font-size: 20px; padding-top: 10px;">아이디
										:</label>
								</div>
								<div class="col-lg-7">
									<input type="text" disabled="disabled" value="${id }"
										style="height: 40px;" id="id">
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div style="" class="insert-form">
								<div class="col-lg-4">
									<label style="font-size: 20px; padding-top: 10px;">비밀번호
										: </label>
								</div>

								<div class="col-lg-7 ">
									<input type="password" value=""
										style="padding: 0; height: 40px;" id="password"
										class="form-control">
								</div>
							</div>
							<br> <br>
							<div class="col-lg-6 col-lg-offset-3">
								<input type="button" class="btn btn-primary" value="확인"
									id="passwordCheck"
									style="width: 100%; height: 50px; margin-top: 20px;">
							</div>
						</div>
					</div>
					
				</div>
			
			</div>
		</div>
	</div>

</body>
</html>