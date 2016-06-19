
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

	
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
<link rel="stylesheet" href="../css/Min/assets/cosmo/bootstrap.css" media="screen">
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

	
	
	
	<div id="page" class="hfeed site">
		
	

		<!--@@@@@@@@@@@@@@@@@ 헤더부분 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<!-- 사이드부분 시작@@@@@@@@@@@@@ -->



		<div class="row">
			
			<!-- 사이드부분 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<!-- 메인부분 시작@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="col-md-3">
		
			 <jsp:include page="../Property/aptSideBar.jsp"></jsp:include> 
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
							<form class="form-horizontal" action="/Property/aptSale?pr_propertyNo=0" method="post" enctype="multipart/form-data">
								
									<legend>Legend</legend>
 
									<input type="hidden" name="pr_propertyNo" value="0">
								
							
									<div class="form-group">
										<label class="col-lg-3 control-label">건물명</label>
										<div class="col-lg-7">
											<input type="text" class="form-control" name="pr_APTName"  placeholder="건물명" value="${property.pr_APTName }">
										</div>
									</div>

									<div class="form-group">
										<label class="col-lg-3 control-label">휴대폰번호</label>
										<div class="col-lg-7">
											<div class="col-lg-4 phoneNumfirst">
												<input type="text" name="pr_tel1" class="form-control" placeholder="010">
											</div>

											<div class="col-lg-4 phoneNum">
												<input type="text" name="pr_tel2" class="form-control" placeholder="1234">
											</div>

											<div class="col-lg-4 phoneNum">
												<input type="text" name="pr_tel3" class="form-control" placeholder="5678">
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="col-lg-3 control-label">건물주소</label>
										<div class="col-lg-7">
											<input type="text" class="form-control" name="pr_addr" placeholder="건물주소">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-lg-3 control-label">파일올리기</label>
										<div class="col-lg-7">
											<input type="file" class="form-control1" name="pr_imageName" placeholder="건물주소">
										</div>
									</div>
									
									

									<div class="form-group">
										<label class="col-lg-3 control-label">희망가</label>
										<div class="col-lg-3">
											<input type="text" class="form-control" name="pr_price" placeholder="희망가">
										</div>

										<label class="col-lg-1 control-label">보증금</label>
										<div class="col-lg-3">
											<input type="text" class="form-control" name="pr_deposit" placeholder="보증금">
										</div>


									</div>

									<div class="form-group">
										<label class="col-lg-3 control-label">매물층</label>
										<div class="col-lg-3">
											<input type="text" class="form-control" name="pr_level" placeholder="매물층">
										</div>

										<label class="col-lg-1 control-label">총층수</label>
										<div class="col-lg-3">
											<input type="text" class="form-control" name="pr_totalLevel" placeholder="총층수">
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
											<input type="text" class="form-control" name="pr_roomArea" placeholder="실면적">
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
											<input type="text" class="form-control" name="pr_roomNum" placeholder="방갯수">
										</div>

										<label class="col-lg-1 control-label">욕실수</label>
										<div class="col-lg-3">
											<input type="text" class="form-control" name="pr_bathNum" placeholder="욕실수">
										</div>


									</div>
									
									<div class="form-group">
										<label class="col-lg-3 control-label">단지규모</label>
										<div class="col-lg-3">
											<input type="text" class="form-control" name="pr_scale" placeholder="단지규모">
										</div>

										<label class="col-lg-1 control-label">건설회사</label>
										<div class="col-lg-3">
											<input type="text" class="form-control" name="pr_company" placeholder="건설회사">
										</div>
									</div>
									
									
									<div class="form-group">
										<label for="textArea" class="col-lg-3 control-label">설명</label>
										<div class="col-lg-7">
											<textarea class="form-control" rows="3" name="pr_content" id="textArea"></textarea>
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

	<br>
	<br>
	<br>
</body>
</html>