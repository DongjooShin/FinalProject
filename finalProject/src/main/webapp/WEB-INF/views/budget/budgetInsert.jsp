<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin - Bootstrap Admin Template</title>
<script type="text/javascript" src="/resources/dist/js/kyungtae/jquery-1.11.0.js"></script>
<!-- <script type='text/javascript' src='/resources/dist/js/main1.js'></script> -->
<script type="text/javascript">
$(function() {
	$('#excelInputForm').hide();

	$('#excelInuput').on('click', function() {
		$('#directInputForm').hide();
		$('#excelInputForm').show();
	})

	$('#directInput').on('click', function() {
		$('#directInputForm').show();
		$('#excelInputForm').hide();
	})
})
</script>
</head>

<body>
	<!-- Navigation -->
	<!-- Top Menu Items -->
	<div class="header">
		<jsp:include page="../include/head.jsp"></jsp:include>
	</div>
	<div id="page-wrapper">

		<div class="container-fluid">

			<!-- Page Heading -->
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">예산 입력</h1>
				</div>
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-6">
					<div class="col-lg-6 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-tasks fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge"></div>
										<div>직접 입력하기</div>
									</div>
								</div>
							</div>
							<a href="" onclick='return false' id="directInput">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-tasks fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge"></div>
										<div>엑셀로 입력하기</div>
									</div>
								</div>
							</div>
							<a href="" onclick='return false' id="excelInuput">
								<div class="panel-footer">
									<span class="pull-left">View Details</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<!-- 예산 직접입력 -->
					<form role="form" action="budgetInsert" method="post">
						<div id="directInputForm">
							<div class="col-lg-12">
								<div class="form-group">
									<label>연도</label> <select class="form-control" name="b_date">
										<option>2011</option>
										<option>2012</option>
										<option>2013</option>
										<option>2014</option>
										<option>2015</option>
										<option>2016</option>
									</select>
								</div>
							</div>

			
							<div class="col-lg-12">
								<div class="form-group">
									<label>청소비</label> <input class="form-control" placeholder="원"
										name="b_clean">
									<p class="help-block">청소비를 입력해주세요.</p>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>일반관리비</label> <input class="form-control"
										placeholder="원" name="b_general">
									<p class="help-block">일반관리비를 입력해주세요.</p>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>수선유비지</label> <input class="form-control"
										placeholder="원" name="b_maintain">
									<p class="help-block">수선유지비를 입력해주세요.</p>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>승강기유지비</label> <input class="form-control"
										placeholder="원" name="b_liftMaintain">
									<p class="help-block">승강기유지비를 입력해주세요.</p>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>경비용역비</label> <input class="form-control"
										placeholder="원" name="b_security">
									<p class="help-block">경기용역비를 입력해주세요.</p>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>음식물수거비</label> <input class="form-control"
										placeholder="원" name="b_foodWaste">
									<p class="help-block">음식물수거비를 입력해주세요.</p>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>화재보험료</label> <input class="form-control"
										placeholder="원" name="b_fireInsurance">
									<p class="help-block">화재보험료를 입력해주세요.</p>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>위탁수수료</label> <input class="form-control"
										placeholder="원" name="b_commission">
									<p class="help-block">위탁수수료를 입력해주세요.</p>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>동대표회의비</label> <input class="form-control"
										placeholder="원" name="b_meeting">
									<p class="help-block">동대표회의비를 입력해주세요.</p>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>공동전기료</label> <input class="form-control"
										placeholder="원" name="b_publicElectric">
									<p class="help-block">공동전기료를 입력해주세요.</p>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>승강기전기료</label> <input class="form-control"
										placeholder="원" name="b_liftElectric">
									<p class="help-block">승강기전기료를 입력해주세요.</p>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>TV수신료</label> <input class="form-control"
										placeholder="원" name="b_TVFee">
									<p class="help-block">TV수신료를 입력해주세요.</p>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>소독비</label> <input class="form-control" placeholder="원"
										name="b_disinfection">
									<p class="help-block">소독비를 입력해주세요.</p>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>장기수선충당금</label> <input class="form-control"
										placeholder="원" name="b_appropriation">
									<p class="help-block">장기수선충당금을 입력해주세요.</p>
								</div>
							</div>
							<input type="hidden" name="b_fileNameNULL">
							<div class="col-lg-12">
								<button type="submit" class="btn btn-default">입력</button>
								<button type="reset" class="btn btn-default">취소</button>
							</div>
						</div>

					</form>

					<!-- 예산 엑셀 입력 -->
					<form action="budgetExcelInsert" method="post" enctype="multipart/form-data">
						<div id="excelInputForm">
							<div class="col-lg-12">
								<div class="form-group">
									<label>연도</label> <select class="form-control" name="b_date">
										<option>2011</option>
										<option>2012</option>
										<option>2013</option>
										<option>2014</option>
										<option>2015</option>
										<option>2016</option>
									</select>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<label>파일업로드</label> <input type="file" name="b_fileName">
								</div>
							</div>
							<div class="col-lg-12">
								<button type="submit" class="btn btn-default">입력</button>
								<button type="reset" class="btn btn-default">취소</button>
							</div>
						</div>
					 </form>
				</div>
			</div>
		</div>
	</div>
<!-- 	
	<script src="../js/kyungtae/jquery-1.11.0.js"></script>

	Bootstrap Core JavaScript
	<script src="../js/kyungtae/bootstrap.min.js"></script> -->

</body>

</html>