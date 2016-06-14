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
<!-- Bootstrap Core CSS -->
<link href="../css/kyungtae/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS <link href="../css/sb-admin.css" rel="stylesheet">-->
<!-- Custom Fonts<link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
<script type="text/javascript">
	
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
					<h1 class="page-header">공동 관리비 입력</h1>
				</div>
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-6">

					<form role="form" action="publicManagementFeeInsert">

						<div class="col-lg-6">
							<div class="form-group">
								<label>날짜 연</label> <select class="form-control" name="year">
									<option>2011</option>
									<option>2012</option>
									<option>2013</option>
									<option>2014</option>
									<option>2015</option>
									<option>2016</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label>월</label> <select class="form-control" name="month">
									<option>01</option>
									<option>02</option>
									<option>03</option>
									<option>04</option>
									<option>05</option>
									<option>06</option>
									<option>07</option>
									<option>08</option>
									<option>09</option>
									<option>10</option>
									<option>11</option>
									<option>12</option>
								</select>
							</div>
						</div>

						<div class="col-lg-12">
							<div class="form-group">
								<label>청소비</label> <input class="form-control" placeholder="원"
									name="pm_clean">
								<p class="help-block">청소비를 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<label>일반관리비</label> <input class="form-control" placeholder="원"
									name="pm_general">
								<p class="help-block">일반관리비를 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<label>수선유비지</label> <input class="form-control" placeholder="원"
									name="pm_maintain">
								<p class="help-block">수선유지비를 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<label>승강기유지비</label> <input class="form-control"
									placeholder="원" name="pm_liftMaintain">
								<p class="help-block">승강기유지비를 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<label>경비용역비</label> <input class="form-control" placeholder="원"
									name="pm_security">
								<p class="help-block">경기용역비를 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<label>음식물수거비</label> <input class="form-control"
									placeholder="원" name="pm_foodWaste">
								<p class="help-block">음식물수거비를 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<label>화재보험료</label> <input class="form-control" placeholder="원"
									name="pm_fireInsurance">
								<p class="help-block">화재보험료를 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<label>위탁수수료</label> <input class="form-control" placeholder="원"
									name="pm_commission">
								<p class="help-block">위탁수수료를 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<label>동대표회의비</label> <input class="form-control"
									placeholder="원" name="pm_meeting">
								<p class="help-block">동대표회의비를 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<label>공동전기료</label> <input class="form-control" placeholder="원"
									name="pm_publicElectric">
								<p class="help-block">공동전기료를 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<label>승강기전기료</label> <input class="form-control"
									placeholder="원" name="pm_liftElectric">
								<p class="help-block">승강기전기료를 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<label>TV수신료</label> <input class="form-control" placeholder="원"
									name="pm_TVFee">
								<p class="help-block">TV수신료를 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<label>소독비</label> <input class="form-control" placeholder="원"
									name="pm_disinfection">
								<p class="help-block">소독비를 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<label>장기수선충당금</label> <input class="form-control"
									placeholder="원" name="pm_appropriation">
								<p class="help-block">장기수선충당금을 입력해주세요.</p>
							</div>
						</div>


						<button type="submit" class="btn btn-default">입력</button>
						<button type="reset" class="btn btn-default">취소</button>

					</form>
				</div>

			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container-fluid -->

	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery Version 1.11.0 -->
	<script src="../js/kyungtae/jquery-1.11.0.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../js/kyungtae/bootstrap.min.js"></script>

</body>

</html>