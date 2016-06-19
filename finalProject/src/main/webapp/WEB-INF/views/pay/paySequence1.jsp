<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<script type='text/javascript' src='/resources/dist/js/main3.js'></script>
<link rel='stylesheet'
	href='/resources/dist/css/kyungtae/AdminLTE.min.css' type='text/css' />
<link rel='stylesheet'
	href='/resources/dist/css/kyungtae/skins/_all-skins.min.css'
	type='text/css' />

</head>
<body>
	<div class="form-group">
		<div class="radio">
			<label> <input type="radio" name="optionsRadios" id="credit"
				value="option1" checked> 신용카드
			</label>
		</div>
		<div class="radio">
			<label> <input type="radio" name="optionsRadios" id="cash"
				value="option2"> 계좌 이체
			</label>
		</div>
	</div>
	<br>
	<hr>
	<br>
	<div>
		결제금액 : <label id="payFee">0</label>원

	</div>
	<br>
	<hr>
	총 결제금액 : 0 원
	<br>
	<br>
	<div class="checkbox">
		<label> <input type="checkbox" /> 개인 정보 제공 동의 <br>
		</label> <label> <input type="checkbox" /> 결제 내역 확인 동의 <br>
		</label>
	</div>

	<div class="form-group">
		<select class="form-control" id="creditSelect">
			<option>국민카드</option>
			<option>신한카드</option>
			<option>삼성카드</option>
			<option>우리카드</option>
			<option>현대카드</option>
			<option>우체국카드</option>
			<option>BC카드</option>
		</select>
	</div>

	<div class="form-group">
		<select class="form-control" id="cashSelect" disabled>
			<option>국민카드</option>
			<option>신한카드</option>
			<option>삼성카드</option>
			<option>우리카드</option>
			<option>현대카드</option>
			<option>우체국카드</option>
			<option>BC카드</option>
		</select>
	</div>
	</div>
	<script type="text/javascript"
		src="/resources/js/kyungtae/jQuery-2.1.4.min.js"></script>
	<script type="text/javascript"
		src="/resources/js/kyungtae/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="/resources/plugins/kyungtae/chartjs/Chart.min.js"></script>
	<script type="text/javascript"
		src="/resources/plugins/kyungtae/fastclick/fastclick.min.js"></script>
	<script type="text/javascript"
		src="/resources/dist/js/kyungtae/app.min.js"></script>
	<script type="text/javascript"
		src="/resources/dist/js/kyungtae/demo.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#cashSelect').hide();
			$('#credit').on('click', function() {
				$('#creditSelect').show();
				$('#cashSelect').hide();
			})
			$('#cash').on('click', function() {
				$('#creditSelect').hide();
				$('#cashSelect').show();
			})
		})
	</script>
</body>
</html>

</body>
</html>