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

	$(function(){
		
		$("#certificationCheck").on("click", function(){
			if (!document.certificationForm.emailAddress.value) {
				alert("이메일이 입력되지 않았습니다");
				return false;
			}
			

			if (!document.certificationForm.m_domain.value) {
				alert("이메일주소가 입력되지 않았습니다");
				return false;
			}
			
			var email= $("#emailAddress").val();
			var domain = $("#m_domain").val();
			
		
		
			$.ajax({
				url : '/member/certification',
				type : 'POST',
				data : {
					"email" : email,
					"domain":domain
				},
				success : function(map) {
					alert('이메일 전송 되었습니다.');
					
					$(".emailInput").attr("disabled","disabled");
					$("#key").attr("value",map.key);
					$("#certificationInputCheck").removeAttr("disabled");
					$("#labelView label").css('display','block');
					
					
				},
				error : function(hxr, data, error) {
					alert('이메일 전송이 실패 하였습니다.');
				}
			});

		});
		
		$("#OK").on("click", function(){
			if($("#key").val()==$("#certificationInputCheck").val()){
					alert("본인 인증이 되었습니다. 감사합니다.");
					opener.document.userInput.m_email.value = $("#emailAddress").val();
					opener.document.userInput.m_domain.value = $("#m_domain").val();
					opener.document.userInput.email.value = $("#emailAddress").val();
					opener.document.userInput.domain.value = $("#m_domain").val();
					opener.document.userInput.certificationOK.value="1";
				
					self.close();
			}else{
					alert("본인 인증이 되지않았습니다. key갑을 입력해 주세요.");
			}
				
		});
		
	});
	


	function selectCheck(inputid) {

		if (inputid.select.value != '직접입력') {
			certificationForm.m_domain.value = inputid.select.value;
		} else {
			certificationForm.m_domain.value = "";
			certificationForm.m_domain.focus();
		}
	}
</script>

<style type="text/css">
#certification {
	margin: 30px;
	margin-top: 50px;
}

.emailInput {
	height: 33px;
	width: 170px;
}

#insertEmail {
	margin-top: 25px;
}

#select {
	width: 150px;
	float: right;
	margin-top: 4px;
}

#atSign {
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 5px;
	font-size: 20px;
}

#certificationInputCheck {
	height: 33px;
	width: 230px;
	margin-top: 3px;
	margin-right: 10px;
	float: left;
	
}

#certificationCheck {
	width: 300px;
	margin-top: 1px;
	float: right;
}

#labelView label {
	display: none;
	color: red;
}
#OK{
	width: 250px;
	margin-top: 10px;
	text-align: center;
}
</style>
</head>
<body>

	<div id="certification" class="col-lg-12">
		<h3>본인 인증 이메일</h3>
		<div id="insertEmail">
			<form action="/certification" name="certificationForm" method="post" >
				 <input type="hidden" name="key" id="key" value="" >
				<input type="text" class="emailInput" name="emailAddress" id="emailAddress" > 
				<label id="atSign"> @ </label> 
				<input type="text" class="emailInput" name="m_domain" id="m_domain">

				<select class="form-control" id="select" onchange="selectCheck(this.form)">
					<option>kosta.com</option>
					<option>naver.com</option>
					<option>hanmail.net</option>
					<option>직접입력</option>
				</select> 
				<br>
				<br> 
				<input type="text" id="certificationInputCheck" disabled="disabled" placeholder="Key">
				<input type="button" class="btn btn-primary" value="이메일전송" id="certificationCheck" >
				<br> 
				<br>
				<br>
				<div id="labelView">
					<label> ** 이메일이 전송되었습니다. **</label>
					<label>입력하신 이메일에 전송된 key 값을 복사하여 넣어 주세요.</label>
				</div>
				<input type="button" class="btn btn-primary"value="확인" id="OK">	
			
			</form>
		</div>
	</div>

</body>
</html>