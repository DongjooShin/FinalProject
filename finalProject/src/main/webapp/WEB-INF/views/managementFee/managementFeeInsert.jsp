<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title></title>

<!-- Bootstrap Core CSS -->
<link href="bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS <link href="../css/sb-admin.css" rel="stylesheet">-->
<!-- Custom Fonts<link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->

</head>

<body>
	<!-- Navigation -->
	<!-- Top Menu Items -->
	<div id="page-wrapper">

		<div class="container-fluid">

			<!-- Page Heading -->
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">관리비 입력</h1>
				</div>
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-6">
					<!-- action.jsp로 넘어갈 부분  -->
					<form role="form" action="managementFeeInsert">
						<div class="col-lg-6">
							<div class="form-group">
								<label>동</label> <select class="form-control" name="buildingNo">
									<option>101</option>
									<option>102</option>
									<option>103</option>
									<option>104</option>
									<option>106</option>
									<option>107</option>
									<option>108</option>
									<option>109</option>
									<option>110</option>
								</select>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label>호</label> <select class="form-control" name="roomNo">
									<option>101</option>
									<option>102</option>
									<option>201</option>
									<option>201</option>
									<option>301</option>
									<option>302</option>
									<option>401</option>
									<option>402</option>
									<option>501</option>
									<option>502</option>
									<option>601</option>
									<option>602</option>
									<option>701</option>
									<option>702</option>
									<option>801</option>
									<option>802</option>
									<option>901</option>
									<option>902</option>
									<option>1001</option>
									<option>1002</option>
								</select>
							</div>
						</div>
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

						<div class="col-lg-6">
							<div class="form-group">
								<label>전기요금</label> <input class="form-control" placeholder="원"
									name="mf_electricFee">
								<p class="help-block">전기요금을 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label>전기사용량</label> <input class="form-control"
									placeholder="KW" name="mf_electricAmount">
								<p class="help-block">전기사용량을 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label>수도요금</label> <input class="form-control" placeholder="원"
									name="mf_waterFee">
								<p class="help-block">수도요금을 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label>수도사용량</label> <input class="form-control" placeholder="L"
									name="mf_waterAmount">
								<p class="help-block">수도사용량을 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label>가스요금</label> <input class="form-control" placeholder="원"
									name="mf_gasFee">
								<p class="help-block">가스요금을 입력해주세요.</p>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label>가스사용량</label> <input class="form-control" placeholder="L"
									name="mf_gasAmount">
								<p class="help-block">가스사용량을 입력해주세요.</p>
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

<div class="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</div>
</body>

</html>
