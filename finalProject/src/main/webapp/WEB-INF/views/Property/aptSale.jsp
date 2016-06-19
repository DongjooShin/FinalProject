
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/Min/css/main.css">
<link rel="stylesheet" href="../css/Min/css/dong/Preperty.css">
<link rel="stylesheet" href="../css/Min/css/mainLink1.css">
<link rel="stylesheet" href="../css/Min/css/mainLink2.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../css/Min/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/Min/bootstrap/css/styles.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="../js/Min/js/bootstrap.min.js"></script>
<script src="../js/Min/js/custom.js"></script>
<link rel="stylesheet" href="../css/Min/assets/cosmo/bootstrap.css"
	media="screen">
<link rel="stylesheet" href="../assets/css/custom.min.css">
<style type="text/css">
.form-control {
	width: 100%;
}

.col-md-12 {
	margin-bottom: 15px;
}

.col-md-9 {
	margin-top: 30px;
}

#inputForm {
	border: 1px solid;
	margin-top: 30px;
}

.phoneNum {
	padding-left: 15px;
	padding-right: 0;
}

.phoneNumfirst {
	padding-left: 0px;
}

.control-label {
	padding-left: 5px;
	padding-right: 5px;
}
</style>




</head>

<body
	class="home singular page page-id-7 page-template page-template-page-templates page-template-business page-template-page-templatesbusiness-php ">



	<jsp:include page="../include/head.jsp"></jsp:include>





	<div id="page" class="hfeed site"
		style="height: 950px; border-top: 2px solid;">



		<!--@@@@@@@@@@@@@@@@@ 헤더부분 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<!-- 사이드부분 시작@@@@@@@@@@@@@ -->



		<div class="row">

			<!-- 사이드부분 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<!-- 메인부분 시작@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<div class="col-md-3">

				<jsp:include page="aptSideBar.jsp"></jsp:include>
			</div>
			<div class="col-md-9">

				<h2>아파트 매물올리기</h2>
				<p class="bs-component">
					<!-- <a href="#" class="btn btn-default">Default</a>
              <a href="#" class="btn btn-primary">Primary</a>
	          <a href="#" class="btn btn-success">Success</a>
              <a href="#" class="btn btn-info">Info</a>
              <a href="#" class="btn btn-warning">Warning</a>
              <a href="#" class="btn btn-danger">Danger</a> -->
					<a href="#" class="btn btn-primary">매매</a> <a href="#"
						class="btn btn-primary">전세</a> <a href="#" class="btn btn-primary">월세</a>

				</p>
			</div>

			<div class="col-md-9">
				<div class="row">
					<div class="col-lg-12">
						<div class="well bs-component">
							<form class="form-horizontal"
								action="/Property/aptSale?pr_propertyNo=0" method="post"
								enctype="multipart/form-data">

								<legend>Legend</legend>

								<input type="hidden" name="pr_propertyNo" value="0">


								<div class="form-group">
									<label class="col-lg-3 control-label">건물명</label>
									<div class="col-lg-7">
										<input type="text" class="form-control" name="pr_APTName"
											placeholder="건물명" value="${property.pr_APTName }">
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-3 control-label">휴대폰번호</label>
									<div class="col-lg-7">
										<div class="col-lg-4 phoneNumfirst">
											<input type="text" name="pr_tel1" class="form-control"
												placeholder="010">
										</div>

										<div class="col-lg-4 phoneNum">
											<input type="text" name="pr_tel2" class="form-control"
												placeholder="1234">
										</div>

										<div class="col-lg-4 phoneNum">
											<input type="text" name="pr_tel3" class="form-control"
												placeholder="5678">
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-3 control-label">건물주소</label>
									<div class="col-lg-7">
										<!-- <input type="text" class="form-control" name="pr_addr" placeholder="건물주소"> -->
										<input type="text" id="sample3_postcode" placeholder="우편번호">
										- <input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>

										<div id="wrap"
											style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
											<img
												src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
												id="btnFoldWrap"
												style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
												onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>
										<input type="text" name="pr_addr" id="sample3_address" class="d_form large"
											placeholder="주소">
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-3 control-label">파일올리기</label>
									<div class="col-lg-7">
										<input type="file" class="form-control1" name="pr_imageName"
											placeholder="건물주소">
									</div>
								</div>



								<div class="form-group">
									<label class="col-lg-3 control-label">희망가</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="pr_price"
											placeholder="희망가">
									</div>

									<label class="col-lg-1 control-label">보증금</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="pr_deposit"
											placeholder="보증금">
									</div>


								</div>

								<div class="form-group">
									<label class="col-lg-3 control-label">매물층</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="pr_level"
											placeholder="매물층">
									</div>

									<label class="col-lg-1 control-label">총층수</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="pr_totalLevel"
											placeholder="총층수">
									</div>


								</div>

								<div class="form-group">
									<label for="select" class="col-lg-3 control-label">현관구조</label>
									<div class="col-lg-3">
										<select class="form-control" name="pr_doorStruct" id="select">
											<option>복도식</option>
											<option>현관식</option>
											<option>기타</option>
										</select>
									</div>


									<label class="col-lg-1 control-label">실면적</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="pr_roomArea"
											placeholder="실면적">
									</div>
								</div>


								<div class="form-group">
									<label for="select" class="col-lg-3 control-label">분류</label>
									<div class="col-lg-3">
										<select class="form-control" name="pr_group" id="select">
											<option>매매</option>
											<option>전세</option>
											<option>월세</option>
										</select>
									</div>


									<label class="col-lg-1 control-label">권리금</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" placeholder="권리금">
									</div>
								</div>



								<div class="form-group">
									<label class="col-lg-3 control-label">방갯수</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="pr_roomNum"
											placeholder="방갯수">
									</div>

									<label class="col-lg-1 control-label">욕실수</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="pr_bathNum"
											placeholder="욕실수">
									</div>


								</div>

								<div class="form-group">
									<label class="col-lg-3 control-label">단지규모</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="pr_scale"
											placeholder="단지규모">
									</div>

									<label class="col-lg-1 control-label">건설회사</label>
									<div class="col-lg-3">
										<input type="text" class="form-control" name="pr_company"
											placeholder="건설회사">
									</div>
								</div>


								<div class="form-group">
									<label for="textArea" class="col-lg-3 control-label">설명</label>
									<div class="col-lg-7">
										<textarea class="form-control" rows="3" name="pr_content"
											id="textArea"></textarea>
										<span class="help-block"> 구매자에게 남기고 싶은 말을 남겨주세요!</span>
									</div>
								</div>

								<div class="form-group">
									<div class="col-lg-6 col-lg-offset-5">
										<!-- 											<input type="hidden" name="id" value="">
	 -->

										<button type="reset" class="btn btn-default">Cancel</button>
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</div>
							</form>

						</div>
					</div>

				</div>
			</div>
		</div>

	</div>





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



	<br>
	<br>
	<br>
</body>
</html>