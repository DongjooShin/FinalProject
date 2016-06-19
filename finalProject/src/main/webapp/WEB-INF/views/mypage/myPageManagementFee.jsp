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
	href='/resources/dist/css/kyungtae/myPageManagementFee.css'
	type='text/css' />
<link rel='stylesheet'
	href='/resources/dist/css/kyungtae/skins/_all-skins.min.css'
	type='text/css' />
</head>
<body>
	<div class="header">
		<jsp:include page="../include/head.jsp"></jsp:include>
	</div>
	<div class="wrapper" id="page">
		<!-- Main content -->
		<section class="content">
		<div class="row">
			<div class="col-lg-12">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title2"></h3>
					</div>
					<div class="box-body">
						<div id="mntEx"></div>
						<br>
						<input type="button" id="mntPay" value="관리비 결제"/>
						 
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-aqua">
					<div class="inner">
						<div class="samllTitle">수도요금</div>
						<p>Water Price</p>
					</div>
					<div class="icon">
						<i class="ion ion-pie-graph"></i>
					</div>
					<div class="small-box-footer">
						<b id="waterFee"></b>
					</div>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<div class="samllTitle">가스요금</div>
						<p>Gas Price</p>
					</div>
					<div class="icon">
						<i class="ion ion-pie-graph"></i>
					</div>
					<div class="small-box-footer">
						<b id="gasFee"></b>
					</div>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-yellow">
					<div class="inner">
						<div class="samllTitle">전기요금</div>
						<p>Electronic Price</p>
					</div>
					<div class="icon">
						<i class="ion ion-pie-graph"></i>
					</div>
					<div class="small-box-footer">
						<b id="electricFee"></b>
					</div>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-red">
					<div class="inner">
						<div class="samllTitle">공동관리비</div>
						<p>Public Price</p>
					</div>
					<div class="icon">
						<i class="ion ion-pie-graph"></i>
					</div>
					<div class="small-box-footer">
						<b id="publicFee"></b>
					</div>
				</div>
			</div>
			<!-- ./col -->
		</div>
		<!-- /.row -->

		<div class="row">

			<div class="col-md-12">
				<!-- AREA CHART -->
				<div class="col-md-4">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">수도 요금&nbsp;&nbsp;&nbsp;[단위:원]</h3>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button class="btn btn-box-tool" data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<div class="chart">
								<canvas id="waterChart" style="height: 250px"></canvas>
							</div>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<div class="col-md-4">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">가스 요금&nbsp;&nbsp;&nbsp;[단위:원]</h3>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button class="btn btn-box-tool" data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<div class="chart">
								<canvas id="gasChart" style="height: 250px"></canvas>
							</div>
						</div>
						<!-- /.box-body -->
					</div>
				</div>
				<div class="col-md-4">
					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">전기 요금&nbsp;&nbsp;&nbsp;[단위:원]</h3>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button class="btn btn-box-tool" data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<div class="chart">
								<canvas id="electricChart" style="height: 250px"></canvas>
							</div>
						</div>
						<!-- /.box-body -->
					</div>
				</div>
			</div>
			<!-- /.box -->

		</div>
		</section>
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
	<script type="text/javascript"
		src="/resources/js/kyungtae/myPageMntChart.js"></script>
	<script type="text/javascript">
		//resizable=no location=no
		$(function(){
		$('#mntPay').on('click',function(){
			window.open('/managementFee/managementFeePay','_blank','toolbar=no,status=no, menubar=no, scrollbars=auto,directories=no,	width=680,height=690, top=0,left=40');
		})
	})
	</script>
</body>
</html>