<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link class="include" rel="stylesheet" type="text/css"
	href="jquery.jqplot.min.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../js/gidae/jquery.jqplot.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Morris charts -->
<!-- Theme style -->


<link rel="stylesheet"
	href="../../../resources/plugins/gidae/morris/morris.css">
<link rel="stylesheet"
	href="../../../resources/dist/css/gidae/AdminLTE.min.css">
<script
	src="../../../resources/plugins/gidae/jQuery/jQuery-2.1.4.min.js"></script>
<script src="../../../resources/plugins/gidae/morris/morris.min.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<title>우리 아파트</title>


<!-- Morris Charts JavaScript -->
<script src="../../../resources/js/gidae/morris/raphael.min.js"></script>
<!-- Bootstrap Core CSS -->



<link href="../../../resources/css/gidae/bootstrap.min.css"
	rel="stylesheet">
<script src="../../../resources/js/gidae/bootstrap.min.js"></script>

<link href="../../../resources/css/gidae/sb-admin.css" rel="stylesheet">

<script src="../../../resources/js/gidae/jquery-1.11.0.js"></script>

<script src="../../../resources/js/gidae/morris/morris-data.js"></script>

<style type="text/css">
.feee{
	display:  none;
}
</style>
</head>

<body>
	<div class="header">
		<jsp:include page="../include/head.jsp"></jsp:include>
	</div>
	<div class="main">
		<div>
			<div id="page" class="hfeed site">
			<div class="row">
				<div class="col-lg-2">
				
				<div id="secondary">
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
				<div id="primary" style="height: 1000px;"></div>

			</div>
					<div class="col-lg-10">
					<div class="col-lg-12">
					<br/>
					<br/>
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title">연별 공동관리비</h3>
									<div class="box-tools pull-right">
									</div>
								</div>
								<div class="box-body chart-responsive">
									<div class="chart" id="line-chart2" style="height: 300px;"></div>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>
					<div class="col-lg-3"></div>
				<div class="row">
					<div class="col-lg-2"></div>
					<div class="col-lg-12">
						<h2>관리비 내역</h2>
						<button name="excel" value="엑셀파일로" id="excel">엑셀파일로 보기</button>
						<div class="table-responsive">
									<table class="table table-bordered table-hover">
									<thead>
										<tr style="background-color: skyblue;">
											<th>관리비이름</th>
											<th>${p.pm_publicFeeNo }년도 결산</th>
											<th>${p2.pm_publicFeeNo }년도 결산</th>
											<th>공동관리비 증감</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>청소비</td>
											<td>${p2. pm_clean}</td>
											<td>${p. pm_clean}</td>
											<c:choose>
												<c:when test="${p. pm_clean-p2. pm_clean>0}">
													<td style="color: red;">▲${p. pm_clean-p2. pm_clean}</td>
												</c:when>
												<c:otherwise>
													<td style="color: blue;">▼${(p. pm_clean-p2. pm_clean)}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>소독비</td>
											<td>${p2. pm_disinfection}</td>
											<td>${p. pm_disinfection}</td>
											<c:choose>
												<c:when test="${p. pm_disinfection-p2. pm_disinfection>0}">
													<td style="color: red;">▲${p. pm_disinfection-p2. pm_disinfection}</td>
												</c:when>
												<c:otherwise>
													<td style="color: blue;">▼${(p. pm_disinfection-p2. pm_disinfection)}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>일반관리비</td>
											<td>${p2. pm_general}</td>
											<td>${p. pm_general}</td>
											<c:choose>
												<c:when test="${p. pm_general-p2. pm_general>0}">
													<td style="color: red;">▲${p. pm_general-p2. pm_general}</td>
												</c:when>
												<c:otherwise>
													<td style="color: blue;">▼${(p. pm_general-p2. pm_general)}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>수선유지비</td>
											<td>${p2. pm_maintain}</td>
											<td>${p. pm_maintain}</td>
											<c:choose>
												<c:when test="${p. pm_maintain-p2. pm_maintain>0}">
													<td style="color: red;">▲${p. pm_maintain-p2. pm_maintain}</td>
												</c:when>
												<c:otherwise>
													<td style="color: blue;">▼${(p. pm_maintain-p2. pm_maintain)}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>승강기유지비</td>
											<td>${p2. pm_liftMaintain}</td>
											<td>${p. pm_liftMaintain}</td>
											<c:choose>
												<c:when test="${p. pm_liftMaintain-p2. pm_liftMaintain>0}">
													<td style="color: red;">▲${p. pm_liftMaintain-p2. pm_liftMaintain}</td>
												</c:when>
												<c:otherwise>
													<td style="color: blue;">▼${(p. pm_liftMaintain-p2. pm_liftMaintain)}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>경비용역비</td>
											<td>${p2. pm_security}</td>
											<td>${p. pm_security}</td>
											<c:choose>
												<c:when test="${p. pm_security-p2. pm_security>0}">
													<td style="color: red;">▲${p. pm_security-p2. pm_security}</td>
												</c:when>
												<c:otherwise>
													<td style="color: blue;">▼${(p. pm_security-p2. pm_security)}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>음식물수거비</td>
											<td>${p2. pm_foodWaste}</td>
											<td>${p. pm_foodWaste}</td>
											<c:choose>
												<c:when test="${p. pm_foodWaste-p2. pm_foodWaste>0}">
													<td style="color: red;">▲${p. pm_foodWaste-p2. pm_foodWaste}</td>
												</c:when>
												<c:otherwise>
													<td style="color: blue;">▼${(p. pm_foodWaste-p2. pm_foodWaste)}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>화재보험료</td>
											<td>${p2. pm_fireInsurance}</td>
											<td>${p. pm_fireInsurance}</td>
											<c:choose>
												<c:when test="${p. pm_fireInsurance-p2. pm_fireInsurance>0}">
													<td style="color: red;">▲${p. pm_fireInsurance-p2. pm_fireInsurance}</td>
												</c:when>
												<c:otherwise>
													<td style="color: blue;">▼${(p. pm_fireInsurance-p2. pm_fireInsurance)}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>위탁수수료</td>
											<td>${p2. pm_commission}</td>
											<td>${p. pm_commission}</td>
											<c:choose>
												<c:when test="${p. pm_commission-p2. pm_commission>0}">
													<td style="color: red;">▲${p. pm_commission-p2. pm_commission}</td>
												</c:when>
												<c:otherwise>
													<td style="color: blue;">▼${(p. pm_commission-p2. pm_commission)}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>동대표회의비</td>
											<td>${p2. pm_meeting}</td>
											<td>${p. pm_meeting}</td>
											<c:choose>
												<c:when test="${p. pm_meeting-p2. pm_meeting>0}">
													<td style="color: red;">▲${p. pm_meeting-p2. pm_meeting}</td>
												</c:when>
												<c:otherwise>
													<td style="color: blue;">▼${(p. pm_meeting-p2. pm_meeting)}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>공동전기료</td>
											<td>${p2. pm_publicElectric}</td>
											<td>${p. pm_publicElectric}</td>
											<c:choose>
												<c:when
													test="${p. pm_publicElectric-p2. pm_publicElectric>0}">
													<td style="color: red;">▲${p. pm_publicElectric-p2. pm_publicElectric}</td>
												</c:when>
												<c:otherwise>
													<td style="color: blue;">▼${(p. pm_publicElectric-p2. pm_publicElectric)}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>승강기전기료</td>
											<td>${p2. pm_liftElectric}</td>
											<td>${p. pm_liftElectric}</td>
											<c:choose>
												<c:when test="${p. pm_liftElectric-p2. pm_liftElectric>0}">
													<td style="color: red;">▲${p. pm_liftElectric-p2. pm_liftElectric}</td>
												</c:when>
												<c:otherwise>
													<td style="color: blue;">▼${(p. pm_liftElectric-p2. pm_liftElectric)}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<td>tv수신료</td>
											<td>${p2. pm_TVFee}</td>
											<td>${p. pm_TVFee}</td>
											<c:choose>
												<c:when test="${p. pm_TVFee-p2. pm_TVFee>0}">
													<td style="color: red;">▲${p. pm_TVFee-p2. pm_TVFee}</td>
												</c:when>
												<c:otherwise>
													<td style="color: blue;">▼${(p. pm_TVFee-p2. pm_TVFee)}</td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr style="background-color: skyblue;">
											<th>계</th>
											<th>${(p2.pm_clean+p2.pm_general+p2.pm_maintain+p2.pm_liftMaintain+p2.pm_security +p2.
                  							  pm_foodWaste +p2.pm_fireInsurance +p2.pm_commission +p2.pm_meeting +p2.pm_publicElectric +p2.pm_liftElectric +p2.
                   							 pm_TVFee +p2.pm_disinfection)}</th>
											<th>${p.pm_clean+p.pm_general+p.pm_maintain+p.pm_liftMaintain+p.pm_security +p.
                   							 pm_foodWaste +p.pm_fireInsurance +p.pm_commission +p.pm_meeting +p.pm_publicElectric +p.pm_liftElectric +p.
                    						pm_TVFee +p.pm_disinfection}</th>
											<c:choose>
												<c:when
													test="${(p.pm_clean+p.pm_general+p.pm_maintain+p.pm_liftMaintain+p.pm_security +p.
                   							 pm_foodWaste +p.pm_fireInsurance +p.pm_commission +p.pm_meeting +p.pm_publicElectric +p.pm_liftElectric +p.
                    						pm_TVFee +p.pm_disinfection)-(p2.pm_clean+p2.pm_general+p2.pm_maintain+p2.pm_liftMaintain+p2.pm_security +p2.
                  							  pm_foodWaste +p2.pm_fireInsurance +p2.pm_commission +p2.pm_meeting +p2.pm_publicElectric +p2.pm_liftElectric +p2.
                   							 pm_TVFee +p2.pm_disinfection)>0}">
													<th style="color: red;">▲${(p.pm_clean+p.pm_general+p.pm_maintain+p.pm_liftMaintain+p.pm_security +p.
                   							 pm_foodWaste +p.pm_fireInsurance +p.pm_commission +p.pm_meeting +p.pm_publicElectric +p.pm_liftElectric +p.
                    						pm_TVFee +p.pm_disinfection)-(p2.pm_clean+p2.pm_general+p2.pm_maintain+p2.pm_liftMaintain+p2.pm_security +p2.
                  							  pm_foodWaste +p2.pm_fireInsurance +p2.pm_commission +p2.pm_meeting +p2.pm_publicElectric +p2.pm_liftElectric +p2.
                   							 pm_TVFee +p2.pm_disinfection)}</th>
												</c:when>
												<c:otherwise>
													<th style="color: blue;">▼${
													((p.pm_clean+p.pm_general+p.pm_maintain+p.pm_liftMaintain+p.pm_security +p.
                   							 pm_foodWaste +p.pm_fireInsurance +p.pm_commission +p.pm_meeting +p.pm_publicElectric +p.pm_liftElectric +p.
                    						pm_TVFee +p.pm_disinfection)-(p2.pm_clean+p2.pm_general+p2.pm_maintain+p2.pm_liftMaintain+p2.pm_security +p2.
                  							  pm_foodWaste +p2.pm_fireInsurance +p2.pm_commission +p2.pm_meeting +p2.pm_publicElectric +p2.pm_liftElectric +p2.
                   							 pm_TVFee +p2.pm_disinfection))}</th>
												</c:otherwise>
											</c:choose>
										</tr>
									</tbody>
								</table>
						</div>
					</div>
				</div>
				</div>
			</div>
			</div>


		</div>
				</div>
	
			<div class="footer"></div>
</body>
</html>