<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<script type="text/javascript"
	src="/resources/jquery/jQuery-2.1.4.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript">
	function certificationCheck() {

		url = "/member/certification";
		open(
				url,
				"certification",
				"toolbar=no, status=no, menubar=no, location=no, scrollbars=no, resizable=no, width=640, height=350");

	}

	function checkIt() {

		if (!document.userInput.m_pass.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}

		if (!document.userInput.m_pass2.value) {
			alert("비밀번호확인에 비밀번호를 입력하세요");
			return false;
		}

		if (!document.userInput.m_email.value) {
			alert("이메일을 입력하세요");
			return false;
		}
		if (!document.userInput.m_domain.value) {
			alert("이메일 도메인을 입력하세요");
			return false;
		}
		if (!document.userInput.s_mphone1.value) {
			alert("핸드폰 번호를 입력하세요");
			return false;
		}
		if (!document.userInput.s_mphone2.value) {
			alert("핸드폰 번호를 입력하세요");
			return false;
		}
		if (!document.userInput.s_mphone3.value) {
			alert("핸드폰 번호를 입력하세요");
			return false;
		}
		if (!document.userInput.m_name.value) {
			alert("이름을 입력하세요");
			return false;
		}

		if (!document.userInput.m_buildingNo.value) {
			alert("동을 입력하세요");
			return false;
		}

		if (!document.userInput.m_roomNo.value) {
			alert("호를 입력하세요");
			return false;
		}

		if (document.userInput.m_pass.value != document.userInput.m_pass2.value) {
			alert("비밀번호가 일치하지 않습니다.")
			return false;
		}
		if (document.userInput.idCheckOK.value != 1) {
			alert("ID 중복체크를 해야합니다.")
			return false;
		}

	}

	$(function() {
		$(".onlyNum").keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/gi, ""));
		});

		$("#m_memberNo").on("change", function() {
			var reg_id = /^[0-9a-z]{8,16}$/;
			if (!reg_id.test($("#m_memberNo").val())) {
				alert("아이디 형식이 잘못되었습니다.");
				document.userInput.m_memberNo.value = "";
			}
		});

		$("#m_pass").on("change", function() {
			var reg_pwd = /^((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15})$/gm;

			if (!reg_pwd.test(document.userInput.m_pass.value)) {
				alert("비밀번호 입력이 옳다르지 않습니다.");
				document.userInput.m_pass.value = "";

			}
		});

		$("#m_pass2").on("change", function() {

			if ($("#m_pass").val() == $("#m_pass2").val()) {
				$("#passwordCheck1").css('display', 'none');
				$("#passwordCheck2").css('display', 'block');
			} else {
				$("#passwordCheck2").css('display', 'none');
				$("#passwordCheck1").css('display', 'block');
			}
		});

	});

	function cancle() {
		alert("취소되었습니다.");
		location.href = "/main";

	}
</script>


<style type="text/css">
#emailCheck {
	width: 5%;
	padding: 5px 5px 5px 0;
	margin: 0 4px 20px 19px;
	font-weight: bold;
	font-size: 20px;
}

#certification {
	margin-bottom: 20px;
}

#certificationLabel1 {
	display: block;
}

#certificationLabel2 {
	display: none;
	color: red;
}

#passwordCheck1 {
	color: red;
	display: none;
}

#passwordCheck2 {
	color: blue;
	display: none;
}
</style>
<link rel='stylesheet' href='/resources/bootstrap/bootstrap.min.css'
	type='text/css' rel="stylesheet" />
<link rel='stylesheet' href='/resources/dist/css/mainFont.css'
	type='text/css' rel="stylesheet" />
<link rel='stylesheet'
	href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
	type='text/css' media='all' />
<link rel='stylesheet' href='/resources/dist/css/main1.css'
	type='text/css' rel="stylesheet" />
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/dist/css/headerCss.css' type='text/css' media='all' />
<title>Insert title here</title>
</head>
<body>


		<div class="col-lg-12"
			style="margin: 0 0 40px 0; padding-right: 5%; padding-bottom: 5%; ">

			<form class="form-horizontal" action="/member/changeMemberInfo" method="post"
				name="userInput" onsubmit="return checkIt()" >
				<br> <span style="font-size: 40px; margin-top: 40px">회원정보 수정</span>

				<div class="insert-form">

					<div class="col-lg-12">
						<input type="hidden" name="v_flag" value="${member.getV_flag() }">
						<input type="hidden" name="apt_APTGNo" value="${apt_aptgno }">
						<input type="hidden" name="m_grade"
							value="${member.getM_grade() }"> <input type="hidden"
							name="email" id="email" value="${member.getM_email() }">
						<input type="hidden" name="domain" id="domain"
							value="${member.getM_domain() }"> <input type="hidden"
							name="certificationOK" id="certificationOK" value="1"> <br>
						<br> <br> <label class="col-lg-3 control-label">아
							이 디</label>
						<div class="col-lg-5">
							<input type="text" class="form-control" name="m_memberNo"
								id="m_memberNo" value="${member.getM_memberNo() }"
								disabled="disabled">
						</div>
						<div class="col-lg-4">

							<label>*아이디는 변경이 부가능합니다.</label>

						</div>
					</div>
				</div>
				<div class="insert-form">
					<div class="col-lg-12">
						<label class="col-lg-3 control-label">비밀번호</label>
						<div class="col-lg-5">
							<input type="password" class="form-control" name="m_pass"
								id="m_pass">
						</div>
						<div class="col-lg-4">
							<p>8 ~ 16자리 영문 대 소문자, 숫자, 특수문자를 혼합하여 사용하세요.</p>
						</div>
					</div>
				</div>

				<div class="insert-form">
					<div class="col-lg-12">
						<label class="col-lg-3 control-label">비밀번호확인</label>
						<div class="col-lg-5">
							<input type="password" class="form-control" name="m_pass2"
								id="m_pass2">
						</div>
						<div class="col-lg-4">
							<label id="passwordCheck1">*비밀번호가 일치 하지 않습니다.</label> <label
								id="passwordCheck2">*비밀번호가 일치 합니다.</label>
						</div>
					</div>
				</div>

				<div class="insert-form">
					<div class="col-lg-12">
						<label class="col-lg-3 control-label"> 이메일변경</label>
						<div class="col-lg-4">
							<button type="button" class="btn btn-primary"
								name="certification" style="width: 100%" id="certification"
								onclick="certificationCheck()">변경인증</button>
						</div>
						<div class="col-lg-5">
							<p id="certificationLabel1">* 변경인증시 이메일이 자동 입력됩니다.</p>
						</div>
					</div>
				</div>

				<div class="insert-form">
					<div class="col-lg-12">
						<label class="col-lg-3 control-label">이 메 일</label>
						<div class="col-lg-4">

							<input type="text" class="form-control" name="m_email"
								id="m_email" disabled="disabled" value="${member.getM_email() }">
						</div>
						<div class="col-lg-1" id="emailCheck">@</div>
						<div class="col-lg-4">
							<input type="text" class="form-control" id="m_domain"
								name="m_domain" disabled="disabled"
								value="${member.getM_domain() }">
						</div>

					</div>
				</div>


				<div class="insert-form">
					<div class="col-lg-12">
						<label class="col-lg-3 control-label">휴대폰번호</label>

						<div class="col-lg-3 " id="phoneNumfirst">
							<select name="s_mphone1" id="s_mphone1"
								style="width: 98%; background-color: #f8f8f8; height: 30px; margin: 4px 0 20px 0">
								<option value="${member.getS_mphone1() }">${member.getS_mphone1() }</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
						</div>

						<div class="col-lg-3 ">
							<input type="text" class="form-control onlyNum" name="s_mphone2"
								style='IME-MODE: disabled' id="s_mphone2" maxlength="4"
								value="${member.getS_mphone2() }">
						</div>

						<div class="col-lg-3 ">
							<input type="text" class="form-control onlyNum" name="s_mphone3"
								style='IME-MODE: disabled' id="s_mphone3" maxlength="4"
								value="${member.getS_mphone3() }">
						</div>

					</div>
				</div>

				<div class="insert-form">
					<div class="col-lg-12">
						<label class="col-lg-3 control-label">전화번호</label>

						<div class="col-lg-3 phoneNumfirst" id="phoneNum1first">
							<select name="s_phone1" id="s_phone1"
								style="width: 98%; background-color: #f8f8f8; height: 30px; margin: 4px 0 20px 0">
								<option value="${member.getS_phone2() }">${member.getS_phone1() }</option>
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="070">070</option>
							</select>

						</div>

						<div class="col-lg-3 phoneNum">
							<input type="text" class="form-control onlyNum" name="s_phone2"
								style='IME-MODE: disabled' id="s_phone2" maxlength="4"
								value="${member.getS_phone2() }">
						</div>

						<div class="col-lg-3 phoneNum">
							<input type="text" class="form-control onlyNum" name="s_phone3"
								style='IME-MODE: disabled' id="s_phone3" maxlength="4"
								value="${member.getS_phone3() }">
						</div>

					</div>
				</div>

				<div class="insert-form">
					<div class="col-lg-12">
						<label class="col-lg-3 control-label">이름</label>
						<div class="col-lg-4">
							<input type="text" class="form-control" name="m_name"
								value="${member.getM_name() }">
						</div>

						<label class="col-lg-1 control-label">나이</label>
						<div class="col-lg-4">
							<input type="text" class="form-control onlyNum" name="m_age"
								id="m_age" style='IME-MODE: disabled' maxlength="2"
								value="${member.getM_age() }">
						</div>
					</div>
				</div>
				<div class="insert-form">
					<div class="col-lg-12">
						<label class="col-lg-3 control-label">주소</label>
						<div class="col-lg-9">
							<input type="text" class="form-control" disabled="disabled"
								value="${address }">
						</div>
					</div>
				</div>

				<div class="insert-form">
					<div class="col-lg-12">
						<label class="col-lg-3 control-label">동 </label>
						<div class="col-lg-4">
							<input type="text" class="form-control onlyNum"
								name="m_buildingNo" style='IME-MODE: disabled'
								disabled="disabled" id="m_buildingNo" maxlength="4"
								value="${member.getM_buildingNo() }">
						</div>

						<label class="col-lg-1 control-label">호 </label>
						<div class="col-lg-4">
							<input type="text" class="form-control onlyNum" name="m_roomNo"
								disabled="disabled" style='IME-MODE: disabled' id="m_roomNo"
								maxlength="4" value="${member.getM_roomNo() }">
						</div>
					</div>
				</div>

				<div class="insert-form">
					<div class="col-lg-6 col-lg-offset-6">
						<button type="reset" class="btn btn-default" onclick="cancle()">최소</button>
						<button type="submit" class="btn btn-primary">확인</button>
					</div>
				</div>
			</form>


		</div>
	

</body>
</html>