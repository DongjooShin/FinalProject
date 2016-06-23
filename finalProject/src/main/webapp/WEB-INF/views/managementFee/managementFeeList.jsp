<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style type="text/css">
.content {
	padding-top: 50px;
	padding-right: 50px;
	padding-left: 50px;
}
.box-header{background: #f8f8f8;}
.box-body{background: #f8f8f8;}
.box-footer{background: #f8f8f8;}
</style>
</head>

<body>
	<div class="header">
		<jsp:include page="../include/head.jsp"></jsp:include>
	</div>
	<div class="header">
		<jsp:include page="../include/middle.jsp"></jsp:include>
	</div>
	<div class="wrapper">
		<!-- Main content -->					
		<div class="content" id="page">
		
		<div class="col-lg-3">
		<div id="secondary" >
			<aside id="archives" class="widget"> 
					<h3 class="widget-title ">&nbsp;관리비</h3>
					<ul>
						<li><a href='/managementFee/managementFeeList'>&nbsp;전체관리비
								</a></li>
						<li><a href='/publicmana/appropia'>&nbsp;예산</a></li>
						<li><a href='/publicmana/PublicManageFee'>&nbsp;공동관리비</a></li>
					</ul>
			</aside>
			</div>
		</div>
		
		<div class="col-lg-9">
			<div class="col-lg-9"></div>
			<div class="col-lg-3">
				<select class="form-control" id="graphChange" name="feeGroup">
					<option value="201602">2016년 2월</option>
					<option value="201603">2016년 3월</option>
					<option value="201604">2016년 4월</option>
					<option value="201605">2016년 5월</option>
					<option value="201606" selected>2016년 6월</option>
				</select>
			</div>
			</form>
		
		<div class="row">
			<div class="col-lg-12">&nbsp;</div>
		</div>
		<div class="row">
			<div class="col-md-9">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">관리비 종합</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<div class="btn-group">
								<button class="btn btn-box-tool dropdown-toggle"
									data-toggle="dropdown">
									<i class="fa fa-wrench"></i>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul>
							</div>
							<button class="btn btn-box-tool" data-widget="remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-8">
								<p class="text-center">
									<strong id="thisPayAmount"></strong>
								</p>
								<div class="chart">
									<!-- Sales Chart Canvas -->
									<canvas id="allChart" style="height: 180px;"></canvas>
								</div>
								<!-- /.chart-responsive -->
							</div>
							<!-- /.col -->
							<div class="col-md-4">
								<p class="text-center">
									<strong>세부 사용량</strong>
								</p>
								<div class="progress-group">
									<span class="progress-text">수도 사용량</span> <span
										class="progress-number"><b class="detailWaterAmount"></b></span>
									<div class="progress sm">
										<div class="progress-bar progress-bar-aqua" style="width: 80%"></div>
									</div>
								</div>
								<!-- /.progress-group -->
								<div class="progress-group">
									<span class="progress-text">가스 사용량</span> <span
										class="progress-number"><b class="detailGasAmount"></b></span>
									<div class="progress sm">
										<div class="progress-bar progress-bar-red" style="width: 80%"></div>
									</div>
								</div>
								<!-- /.progress-group -->
								<div class="progress-group">
									<span class="progress-text">전기 사용량</span> <span
										class="progress-number"><b class="detailElectricAmount"></b></span>
									<div class="progress sm">
										<div class="progress-bar progress-bar-green"
											style="width: 80%"></div>
									</div>
								</div>
								<!-- /.progress-group -->
								<div class="progress-group">
									<span class="progress-text"></span> <span
										class="progress-number"><b class=""></b></span>
									<div><font color="#428bca"> ■</font> 나의 관리비 <font color="#d4d8df"> ■</font> 아파트 평균 </div>
								</div>
								<!-- /.progress-group -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- ./box-body -->
					<div class="box-footer">
						<div class="row">
							<div class="col-sm-3 col-xs-6">
								<div class="description-block border-right">
									<span class="description-percentage text-green"><i
										class="fa fa-caret-up"></i> 17%</span>
									<h5 class="description-header"><b class="detailWaterFee"></b></h5>
									<span class="description-text">수도 요금</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-3 col-xs-6">
								<div class="description-block border-right">
									<span class="description-percentage text-yellow"><i
										class="fa fa-caret-left"></i> 0%</span>
									<h5 class="description-header"><b class="detailGasFee"></b></h5>
									<span class="description-text">가스 요금</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-3 col-xs-6">
								<div class="description-block border-right">
									<span class="description-percentage text-green"><i
										class="fa fa-caret-up"></i> 20%</span>
									<h5 class="description-header"><b class="detailWaterFee"></b></h5>
									<span class="description-text">전기 요금</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-3 col-xs-6">
								<div class="description-block">
									<span class="description-percentage text-red"><i
										class="fa fa-caret-down"></i> 18%</span>
									<h5 class="description-header"><b class="detailPublicFee"></b></h5>
									<span class="description-text">공동 관리비 증감</span>
								</div>
								<!-- /.description-block -->
							</div>
							
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-footer -->
				</div>
				<!-- /.box -->
			</div>
			<div class="col-md-3">
				<div class="box box-danger">
					<div class="box-header with-border">
						<h3 class="box-title" style="height: 2px">관리비
							종합&nbsp;&nbsp;&nbsp;[단위:원]</h3>
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
						<canvas id="pieChart" style="height: 230px"></canvas>
					</div>
					<!-- /.box-body -->
				</div>
				<div class="box box-danger">
					<div class="box-header with-border">
						<h3 class="box-title" style="height: 2px">이달의 관리비</h3>
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
						<div id="MntFeedetail" style="height: 119px"></canvas>
					</div>
					<!-- /.box-body -->
				</div>
			</div>

			<!-- /.col -->
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

 
				<!-- /.box -->

			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">&nbsp;</div>
			<div class="col-lg-12">&nbsp;</div>
		</div>

		<div class="row">
			<div class="col-lg-9"></div>
			<div class="col-lg-3">
				<select class="form-control" id="mntTable" name="feeGroup">
					<option value="201602">2016년 2월</option>
					<option value="201603">2016년 3월</option>
					<option value="201604">2016년 4월</option>
					<option value="201605">2016년 5월</option>
					<option value="201606" selected>2016년 6월</option>
				</select>
			</div>
			</form>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<h2>관리비 세부보기</h2>
				<div class="table-responsive">
					<table class="table table-bordered table-hover" id="mngtable">
						<thead>
							<tr style="background-color: skyBlue;">
								<th>관리비이름</th>
								<th>지난달 관리비</th>
								<th>이번달 관리비</th>
								<th>관리비 증감</th>
							</tr>
						</thead>
						<tbody id="mnt">
						</tbody>
					</table>
				</div>
			</div>
			</div>
		</div>
		</section>
		</div>
	</div></div>
	<!-- ./wrapper -->


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
	<script type="text/javascript" src="/resources/js/kyungtae/mntChart.js"></script>
	<!-- <script type="text/javascript" src="/resources/js/kyungtae/mntChartChange.js"></script> -->
	<div class="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</div>
</body>

</html>