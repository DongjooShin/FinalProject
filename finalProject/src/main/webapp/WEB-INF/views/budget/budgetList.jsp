<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	/* 	request.setAttribute("budget1", list.get(0));
		request.setAttribute("budget2", list.get(1));
		request.setAttribute("budget3", list.get(2));
		request.setAttribute("budget4", list.get(3));
		request.setAttribute("budget5", list.get(4)); */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link class="include" rel="stylesheet" type="text/css"
	href="jquery.jqplot.min.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../js/gidae/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="../js/gidae/bargraph.js"></script>
<script type="text/javascript"
	src="../plugins/gidae/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript"
	src="../plugins/gidae/jqplot.pointLabels.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>우리 아파트</title>

<!-- Bootstrap Core CSS -->
<link href="../css/gidae/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/gidae/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../css/gidae/plugins/morris.css" rel="stylesheet">
<!-- jQuery Version 1.11.0 -->
<script src="../js/gidae/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/gidae/bootstrap.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="../js/gidae/morris/raphael.min.js"></script>
<script src="../js/gidae/morris/morris.min.js"></script>
<script src="../js/gidae/morris/morris-data.js"></script>
</head>
<body>
	<div class="header">
		<jsp:include page="../include/head.jsp"></jsp:include>
	</div>
	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div class="col-lg-2"></div>
			<h2>연도별 예산책정치</h2>
			<div class="panel panel-red">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-long-arrow-right"></i> 연도별 공동관리비
					</h3>
				</div>
				<div class="panel-body">
					<div id="morris-line-chart5"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div class="col-lg-2"></div>
			<h2>예산 내역</h2>
			<button name="excel" value="엑셀파일로">엑셀파일로 보기</button>
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead>
						<tr style="background-color: skyBlue;">
							<th>예산항목이름</th>
							<th>올해 (${budget1.b_date }) 예산</th>
							<th>지난해 (${budget2.b_date }) 예산</th>
							<th>${budget3.b_date }예산</th>
							<th>${budget4.b_date }예산</th>
							<th>${budget5.b_date }예산</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>청소비</td>
							<td>${budget1.b_clean}</td>
							<td>${budget2. b_clean}</td>
							<td>${budget3. b_clean}</td>
							<td>${budget4. b_clean}</td>
							<td>${budget5. b_clean}</td>
						</tr>
						<tr>
							<td>소독비</td>
							<td>${budget1. b_disinfection}</td>
							<td>${budget2. b_disinfection}</td>
							<td>${budget3. b_disinfection}</td>
							<td>${budget4. b_disinfection}</td>
							<td>${budget5. b_disinfection}</td>

						</tr>
						<tr>
							<td>일반관리비</td>
							<td>${budget1. b_general}</td>
							<td>${budget2. b_general}</td>
							<td>${budget3. b_general}</td>
							<td>${budget4. b_general}</td>
							<td>${budget5. b_general}</td>
						</tr>
						<tr>
							<td>수선유지비</td>
							<td>${budget1. b_maintain}</td>
							<td>${budget2. b_maintain}</td>
							<td>${budget3. b_maintain}</td>
							<td>${budget4. b_maintain}</td>
							<td>${budget5. b_maintain}</td>
						</tr>
						<tr>
							<td>승강기유지비</td>
							<td>${budget1. b_liftMaintain}</td>
							<td>${budget2. b_liftMaintain}</td>
							<td>${budget3. b_liftMaintain}</td>
							<td>${budget4. b_liftMaintain}</td>
							<td>${budget5. b_liftMaintain}</td>
						</tr>
						<tr>
							<td>경비용역비</td>
							<td>${budget1. b_security}</td>
							<td>${budget2. b_security}</td>
							<td>${budget3. b_security}</td>
							<td>${budget4. b_security}</td>
							<td>${budget5. b_security}</td>
						</tr>
						<tr>
							<td>음식물수거비</td>
							<td>${budget1. b_foodWaste}</td>
							<td>${budget2. b_foodWaste}</td>
							<td>${budget3. b_foodWaste}</td>
							<td>${budget4. b_foodWaste}</td>
							<td>${budget5. b_foodWaste}</td>
						</tr>
						<tr>
							<td>화재보험료</td>
							<td>${budget1. b_fireInsurance}</td>
							<td>${budget2. b_fireInsurance}</td>
							<td>${budget3. b_fireInsurance}</td>
							<td>${budget4. b_fireInsurance}</td>
							<td>${budget5. b_fireInsurance}</td>

						</tr>
						<tr>
							<td>위탁수수료</td>
							<td>${budget1. b_commission}</td>
							<td>${budget2. b_commission}</td>
							<td>${budget3. b_commission}</td>
							<td>${budget4. b_commission}</td>
							<td>${budget5. b_commission}</td>
						</tr>
						<tr>
							<td>동대표회의비</td>
							<td>${budget1. b_meeting}</td>
							<td>${budget2. b_meeting}</td>
							<td>${budget3. b_meeting}</td>
							<td>${budget4. b_meeting}</td>
							<td>${budget5. b_meeting}</td>
						</tr>
						<tr>
							<td>공동전기료</td>
							<td>${budget1. b_publicElectric}</td>
							<td>${budget2. b_publicElectric}</td>
							<td>${budget3. b_publicElectric}</td>
							<td>${budget4. b_publicElectric}</td>
							<td>${budget5. b_publicElectric}</td>
						</tr>
						<tr>
							<td>승강기전기료</td>
							<td>${budget1. b_liftElectric}</td>
							<td>${budget2. b_liftElectric}</td>
							<td>${budget3. b_liftElectric}</td>
							<td>${budget4. b_liftElectric}</td>
							<td>${budget5. b_liftElectric}</td>
						</tr>
						<tr>
							<td>tv수신료</td>
							<td>${budget1. b_TVFee}</td>
							<td>${budget2. b_TVFee}</td>
							<td>${budget3. b_TVFee}</td>
							<td>${budget4. b_TVFee}</td>
							<td>${budget5. b_TVFee}</td>
						</tr>
						<tr>
							<td>장기수선충당금</td>
							<td>${budget1. b_appropriation}</td>
							<td>${budget2. b_appropriation}</td>
							<td>${budget3. b_appropriation}</td>
							<td>${budget4. b_appropriation}</td>
							<td>${budget5. b_appropriation}</td>
						</tr>
						<tr style="background-color: skyBlue;">
							<th>계</th>
							<th>${budget1.b_clean+budget1.b_general+budget1.b_maintain+budget1.b_liftMaintain+budget1.b_security +budget1.
                   							 b_foodWaste +budget1.b_fireInsurance +budget1.b_commission +budget1.b_meeting +budget1.b_publicElectric +budget1.b_liftElectric +budget1.
                    						b_TVFee +budget1.b_disinfection+budget1.b_appropriation}</th>
							<th>${(budget2.b_clean+budget2.b_general+budget2.b_maintain+budget2.b_liftMaintain+budget2.b_security +budget2.
                  							  b_foodWaste +budget2.b_fireInsurance +budget2.b_commission +budget2.b_meeting +budget2.b_publicElectric +budget2.b_liftElectric +budget2.
                   							 b_TVFee +budget2.b_disinfection+budget2.b_appropriation)}</th>
							<th>${(budget3.b_clean+budget3.b_general+budget3.b_maintain+budget3.b_liftMaintain+budget3.b_security +budget3.
                  							  b_foodWaste +budget3.b_fireInsurance +budget3.b_commission +budget3.b_meeting +budget3.b_publicElectric +budget3.b_liftElectric +budget3.
                   							 b_TVFee +budget3.b_disinfection+budget3.b_appropriation)}</th>
							<th>${(budget4.b_clean+budget4.b_general+budget4.b_maintain+budget4.b_liftMaintain+budget4.b_security +budget4.
                  							  b_foodWaste +budget4.b_fireInsurance +budget4.b_commission +budget4.b_meeting +budget4.b_publicElectric +budget4.b_liftElectric +budget4.
                   							 b_TVFee +budget4.b_disinfection+budget4.b_appropriation)}</th>
							<th>${(budget5.b_clean+budget5.b_general+budget5.b_maintain+budget5.b_liftMaintain+budget5.b_security +budget5.
                  							  b_foodWaste +budget5.b_fireInsurance +budget5.b_commission +budget5.b_meeting +budget5.b_publicElectric +budget5.b_liftElectric +budget5.
                   							 b_TVFee +budget5.b_disinfection+budget5.b_appropriation)}</th>
							<%-- <c:choose>
								<c:when
									test="${(budget1.b_clean+budget1.b_general+budget1.b_maintain+budget1.b_liftMaintain+budget1.b_security +budget1.
                   							 b_foodWaste +budget1.b_fireInsurance +budget1.b_commission +budget1.b_meeting +budget1.b_publicElectric +budget1.b_liftElectric +budget1.
                    						b_TVFee +budget1.b_disinfection)-(budget2.b_clean+budget2.b_general+budget2.b_maintain+budget2.b_liftMaintain+budget2.b_security +budget2.
                  							  b_foodWaste +budget2.b_fireInsurance +budget2.b_commission +budget2.b_meeting +budget2.b_publicElectric +budget2.b_liftElectric +budget2.
                   							 b_TVFee +budget2.b_disinfection)>0}">
									<th style="color: red;">${(budget1.b_clean+budget1.b_general+budget1.b_maintain+budget1.b_liftMaintain+budget1.b_security +budget1.
                   							 b_foodWaste +budget1.b_fireInsurance +budget1.b_commission +budget1.b_meeting +budget1.b_publicElectric +budget1.b_liftElectric +budget1.
                    						b_TVFee +budget1.b_disinfection)-(budget2.b_clean+budget2.b_general+budget2.b_maintain+budget2.b_liftMaintain+budget2.b_security +budget2.
                  							  b_foodWaste +budget2.b_fireInsurance +budget2.b_commission +budget2.b_meeting +budget2.b_publicElectric +budget2.b_liftElectric +budget2.
                   							 b_TVFee +budget2.b_disinfection)}</th>
								</c:when>
								<c:otherwise>
									<th style="color: blue;">${(budget1.b_clean+budget1.b_general+budget1.b_maintain+budget1.b_liftMaintain+budget1.b_security +budget1.
                   							 b_foodWaste +budget1.b_fireInsurance +budget1.b_commission +budget1.b_meeting +budget1.b_publicElectric +budget1.b_liftElectric +budget1.
                    						b_TVFee +budget1.b_disinfection)-(budget2.b_clean+budget2.b_general+budget2.b_maintain+budget2.b_liftMaintain+budget2.b_security +budget2.
                  							  b_foodWaste +budget2.b_fireInsurance +budget2.b_commission +budget2.b_meeting +budget2.b_publicElectric +budget2.b_liftElectric +budget2.
                   							 b_TVFee +budget2.b_disinfection)}</th>
								</c:otherwise>
							</c:choose> --%>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


</body>
</html>