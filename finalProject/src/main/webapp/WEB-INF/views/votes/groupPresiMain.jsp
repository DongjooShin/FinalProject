<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content= "IE=edge">      <!-- 구형 익스플로러를 위해 써주는 부분 -->
<meta name="viewport" content= "width=devsice-width, initial-scale=1" >    <!-- 이부분이 바로 반응형 웹!! 디바이스의 가로크기에 맞춰 컨텐트의 가로를 맞춘다. -->
<title>Group President Vote</title>
<link rel="stylesheet" href="/resources/voteCss/vote.css"> 
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/bootstrap/bootstrap.min.css' type='text/css' media='all' />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>	
</head>
<body>
<%-- -----------------Header include----------------- --%>	
	<div class="header">
		 <jsp:include page="../include/head.jsp"></jsp:include> 
	</div>	
	<div class="page">
		<jsp:include page="../include/middle.jsp"></jsp:include>
	</div>


	<div id= "page">
		<div class="col-md-3">
			<jsp:include page="../Community/CommunitySidebar.jsp"></jsp:include>
		</div>
		<div class="col-md-8" style="margin-top:30px; margin-left:30px;">
			<c:choose>
			<%-- ****************************CASE : MANAGER************************ --%>
				<c:when test="${m.getM_grade() == 2 }">
					<c:choose>
					<%-- ......FLAG 1 : NO ELECTION. THERE IS GROUP PRESI....... --%>
						<c:when test="${m.getV_flag() == 1 }">
							<form action="/voter/groupPresiRegist">
								<input type="submit" value="후보자 등록" id="candiRegiButton" class="btn btn-primary btn-lg" >
							</form>
						</c:when>
					<%-- ......FLAG 2 : THIS CASE PROCESS IN CONTROLLER....... --%>					

					<%-- ......FLAG 3 : ELECTION IS PROCESSING...... --%>	
						<c:when test="${m.getV_flag() == 3 }">
							<br><br><br>
							<h3>선거 진행 현황</h3><br>
							<form action="/voter/closeVote" method="get">
								<div class="progress">
									<div class="progress-bar" role="progressbar" aria-valuenow="2" 
										aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: ${voterate}%;">
												 ${voterate} %
									</div>
								</div>
								<h4>현재 총 실 가구수 <b>${groupNum }</b> 가구 중  <b>${voterNum }</b> 가구의 투표로 ${voterate }% 의 투표가 이루어졌습니다.</h4>
								<div class="col-md-5"></div>
								<div class="col-md-2" style="padding-left:0px;"><input type="submit" value="선거종료"></div>
							</form>
						</c:when>
					<%-- ......FLAG 4 : RESULT IS NOTICING NOW...... --%>	
						<c:when test="${m.getV_flag() == 4 }">
							<br>
							<h2><img alt="" src="/resources/images/vote/fireworks.png">선거종료<img alt="" src="/resources/images/vote/fireworks.png"></h2>
							<br><br><h3>선거결과</h3><br><br>
							<div class="hGraph">
								<ul>
									<c:forEach var="vr" items="${vr }">
										<li><span class="gTerm">${vr.name }</span>
										<span class="gBar" style="width:${vr.percent }">
										<span> ${vr.percent }%</span>
										</span></li>
									</c:forEach>
								</ul>
							</div>
							<br><br>
							<h4>최종투표율</h4><br><br>
					
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="2" 
									aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: ${voterate}%;">
											 ${voterate} %
								</div>
							</div>
							<h4 style="margin-top:30;">총 실 가구수 <b>${groupNum }</b><br></h4>
							<h4 style="margin-top:5;">투표가구수 <b>${voterNum }</b><br></h4>
							<h4 style="margin-top:5;">투표율 <b>${voterate }%</b><br></h4>
				
							<div class="col-md-5"></div>
							<div class="col-md-2" style="padding-left:0px;">
								<form action="/voter/returnFirst">
									<br><input type="submit" value="결과게시종료"style="margin-top:20px;">
								</form>
							</div>
										
						</c:when>
					</c:choose>
				</c:when>
			<%-- **************END OF MANAGER CASE*************** --%>	
			
			<%-- ***********************CASE : RESIDENT************************** --%>	
				<c:otherwise>
					
					<c:choose>
						<%-- ..........FLAG 1 : NO ELECTION.......... --%>
						<c:when test="${m.getV_flag() == 1 }">
							
							<br><br><h3>우리 단지의 입주자 대표</h3><br><br>
							<c:if test="${gpm != null }">
								<table class="nowPresi">
									<tr><td colspan="2">${gpm.getM_name() }</td></tr>
									<tr><td colspan="2">${gpm.getM_memberNo() }</td></tr>
									<tr><td>${gpm.getM_buildingNo()} 동</td><td>${gpm.getM_roomNo() } 호</td></tr>
									<tr><td colspan="2" >${gpm.getM_age() } 세</td></tr>
									<tr><td colspan="2">${gpm.getM_email() }</td></tr>
								</table>
							</c:if>
						</c:when>
						<%-- .........FLAG 2 : ELECTION IS ONGOING & VOTE X........ --%>
						<c:when test="${m.getV_flag() == 2}">
							<br><br><h3>입주자대표 선거가 진행중입니다.</h3><br><br>
							<h4>여러분의 소중한 한 표가 우리 아파트의 발전을 만들어 나갑니다.</h4>
							<div class="col-md-12"><br></div>
							<form action="/voter/voteSubmitOk" method="post">
								<div class="col-md-12">
									<c:forEach var="cn" items="${groupPresi }">
										<div class="radio col-md-5" style="margin:0 0 0 10px;padding:0px;">
											<table class="voteCandiList" style="width:320px;">
												<tr><td colspan="2" height="400"><img alt="" src="../j_upload/${cn.cd_imageName }"></td></tr>
												<tr><td><b>기호</b></td><td>${cn.cd_symbol}</td></tr>
												<tr><td><b>학력</b></td><td>${cn.cd_eduLevel }</td></tr>
												<tr><td><b>직업</b></td><td>${cn.cd_job }</td></tr>
												<tr><td colspan="2"><b>경력</b></td></tr>
												<tr><td colspan="2" height="120">${cn.cd_career }</td></tr>
												<tr><td colspan="2"><b>공약</b></td></tr>
												<tr><td colspan="2" height="300">${cn.cd_promise }</td></tr>
												
												<tr><td height="40px" colspan="2" style="padding:10px;">
													<input type="radio"name="onechoose" checked="checked" value="${cn.m_memberNo }" style="margin-top:0px;margin-left:0px;">
												</td></tr>
											</table>
										</div>
									</c:forEach>
								</div>
								<br><br>
								<c:if test="${msg != null }">
									<script type="text/javascript">
										var msg = '${msg}'; 
										alert(msg);
										location.href="/voter/groupPresiMain";
									</script>
								</c:if>
								<div class="col-md-12"><br></div>
								<div class="col-md-3"></div>
								<div class="col-md-2"><input type="password" style="margin-right:50px" name = "pass" placeholder="비밀번호"></div>
								<div class="col-md-1"><input type="submit" value="제출"></div>
								<br><Br>
							</form>
								
						</c:when>				
						<%-- .........FLAG 3 : ELECTION IS ONGOING & VOTE O........ --%>
						<c:when test="${m.getV_flag() == 3}">
							
							<div style="height: 300px;margin-top:150px;">
								<marquee direction="up" behavior="alternate" >
									<marquee behavior="alternate">
										<h1><img alt="" src="/resources/images/vote/progressing1.png" width="100px">우리 단지의 투표가 진행중입니다.<img alt="" src="/resources/images/vote/progressing2.png" width="100px"> </h1>
									</marquee>
								</marquee>
								<br><br>	
							</div>
						</c:when>
						<%-- .........FLAG 4 : VOTE RESULT IS NOTICING........ --%>
						<c:when test="${m.getV_flag() == 4}">
							<br>
							<h2><img alt="" src="/resources/images/vote/fireworks.png">선거종료<img alt="" src="/resources/images/vote/fireworks.png"></h2>
							<br><br><h2>선거결과</h2><br><br>
							<div class="hGraph">
								<ul>
									<c:forEach var="vr" items="${vr }">
										<li><span class="gTerm">${vr.name }</span>
										<span class="gBar" style="width:${vr.percent }">
										<span> ${vr.percent }%</span>
										</span></li>
									</c:forEach>
								</ul>
							</div>
							<br><br>
							<h4>최종투표율</h4><br><br>
					
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="2" 
									aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: ${voterate}%;">
											 ${voterate} %
								</div>
							</div>
							<h4 style="margin-top:30;">총 실 가구수 <b>${groupNum }</b><br></h4>
							<h4 style="margin-top:5;">투표가구수 <b>${voterNum }</b><br></h4>
							<h4 style="margin-top:5;">투표율 <b>${voterate }%</b><br></h4>
				
						</c:when>
					</c:choose>
				</c:otherwise>
			<%-- ***********END OF RESIDENT CASE***************** --%>	
			</c:choose>
		</div>
	</div>


<%-- ----------------------Footer include----------------- --%>
	<div class = "footer">
	
	</div>





</body>
