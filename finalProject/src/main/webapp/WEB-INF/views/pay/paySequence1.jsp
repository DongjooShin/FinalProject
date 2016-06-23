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
<center id="load">
	<div class="form-group">
		<div class="radio" style="display: inline;">
			<label> <input type="radio" name="optionsRadios" id="credit"
				value="option1" checked> 신용카드
			</label>
		</div>
		<div class="radio" style="display: inline;">
			<label> <input type="radio" name="optionsRadios" id="cash"
				value="option2"> 계좌 이체
			</label>
		</div>
	</div>
	<br>
	<hr>
	<br>
	<div>
		결제금액 : <label id="payFee"></label>원

	</div>
	<br>
	<hr>
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
	<button id="paymoney">결제하기</button>
	</div>
</center>
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
	$(function () {
		
		$('#cashSelect').hide();
        $('#credit').on('click', function() {
           $('#creditSelect').show();
           $('#cashSelect').hide();
        })
        $('#cash').on('click', function() {
           $('#creditSelect').hide();
           $('#cashSelect').show();
        })
		
		var waterList = [];
		var gasList = [];
		var electricList = [];
		var waterAmountList = [];
		var gasAmountList = [];
		var electricAmountList = [];
		var publicFeeList = [];
		
		var date1 = [];
		
		var thisPayAmount = [];
		var afterThisPayAmount = null;
		
		 $('#paymoney').on('click',function(){
			$('#load').empty();
		  $('#load').load("/member/certification");
		 })
		 $('#OK').on('click',function(){
			alert('결제가 완료되었습니다.') 
		 });
			$.ajax({
				url : '/ManagementFeeJSONList',
				type : 'post',
				dataType : 'json',
				success : function(json) {
					$.each(json, function(index, data) {
						waterList.push(json[index].mf_waterFee);
						gasList.push(json[index].mf_gasFee);
						electricList.push(json[index].mf_electricFee);
						
						waterAmountList.push(json[index].mf_waterAmount);
						gasAmountList.push(json[index].mf_gasAmount);
						electricAmountList.push(json[index].mf_electricAmount);
						
						date1.push(json[index].mf_date);
						if(index==6){
							return false;
						}
					})
					for(var i=0;i<7;i++){
						publicFeeList[i] = json[7+i];
						thisPayAmount[i] =  waterList[i]+gasList[i]+electricList[i]+publicFeeList[i];
					}
					var waterFeeAvg    = json[14].mf_waterFeeAvg;
					var gasFeeAvg      = json[14].mf_gasFeeAvg;
					var electricFeeAvg = json[14].mf_electricFeeAvg;
				
					afterThisPayAmount = thisPayAmount[6]*1.05;
					//alert(thisPayAmount);
					subdate = date1[6].substr(4,2);
					//alert(subdadte);
					
					
					var html = thisPayAmount[6];
					
				//	var html = '<div>월의 납부금액은'+thisPayAmount+'원 입니다.';
					//alert(thisPayAmount)
					$('#payFee').append(html);
					}
			});
	})

	</script>
</body>
</html>

</body>
</html>