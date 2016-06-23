<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content= "IE=edge">      <!-- 구형 익스플로러를 위해 써주는 부분 -->
<meta name="viewport" content= "width=device-width, initial-scale=1" >    <!-- 이부분이 바로 반응형 웹!! 디바이스의 가로크기에 맞춰 컨텐트의 가로를 맞춘다. -->
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/voteCss/vote.css"> 
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/bootstrap/bootstrap.min.css' type='text/css' media='all' />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>

<script type="text/javascript">


function fn_insertForm() {
	 $('.insertForm').prepend('<div style="padding-top:20px;margin-left:20px;"><form action="/voter/insertBCandidate" method="post" enctype="multipart/form-data"><table border="1px" class="candidatelist"><tr><td>입주민 선택</td><td>' 		
	/*		$('.insertForm').prepend('<div style="padding-top:20px;margin-left:20px;"><form action="/voter/insertBCandidate" method="post">'+	*/
			'<table border="1px" class="candidatelist"><tr><td>입주민 선택</td><td>'+	
			+'<input type="text" name="m_memberNo" style="width:100%;"></td></tr>'+
		 	'<tr><td>이미지파일</td><td id="fileInto" data-toggle="tooltip" data-placement="right" title="jpg,png,gif만 지원. 투명배경 지원X"><input type="file" name="file" style="width:100%;"></td></tr>' 
			+'<tr><td>동수</td><td><input type="text" name="cd_buildingNo" style="width:100%;"></td></tr>'
			+'<tr><td>기호</td><td><input type="text" name="cd_symbol" style="width:100%;"></td></tr>'+
			'<tr><td>학력</td><td><input type="text" name="cd_eduLevel" style="width:100%;"></td></tr>'+
			'<tr><td>직업</td><td><input type="text" name="cd_job" style="width:100%;"></td></tr><tr><td colspan="2">경력</td></tr>'
			+'<tr><td colspan="2"><textarea rows="7" cols="100%" name="cd_career"></textarea></td></tr><tr><td colspan="2">공약</td></tr>'
			+'<tr><td colspan="2"><textarea rows="7" cols="100%" name="cd_promise"></textarea> </td></tr></table><br>'+
			'<input type="hidden" name="cd_group" value="동대표"><input type="submit" value="추가" style="margin-left:350px;"></form>'+
			'<div class="col-md-2"><form action="/voter/groupPresiRegist"><input type="submit" style="margin-left:335px;" value="취소"></form></div></div>');
}


$('#putInto').tooltip({
	placement: 'right',
	viewport: {selector: 'body', padding:2}
});
$('#fileInto').tooltip({
	placement: 'right',
	viewport: {selector: 'body', padding:2}
});
</script>

<title>Building President Regist</title>
</head>
<body>
<%-- -----------------Header include----------------- --%>	
	<div class="header">
		 <jsp:include page="../include/head.jsp"></jsp:include> 
	</div>	

<%-- ------------------------------Body------------------------------------------- --%>
	<div id= "page">
		<div class="col-md-3">
					<jsp:include page="../Community/CommunitySidebar.jsp"></jsp:include>
		</div>
		<div class="col-md-8" style="margin-top:50px;margin-left:10px;">
			<%-- -----------IF GROUPPRESI EXIST-------------- --%>
			<c:if test="${blist != null}">
			   <h3><img alt="" src="/resources/images/vote/exclamation.png"> 모든 현 동대표를 일반 입주자로 변경해야 후보를 등록할 수 있습니다.</h3>
			   <br>
	   	       <c:forEach items="${blist}" var="gpms">
			   <div class="col-md-4"></div>
			   <div class="col-md-2"><span><marquee behavior="alternate" width="280"> ${gpms.getM_name()} (${gpms.getM_buildingNo()}동 ${gpms.getM_roomNo()}호)</marquee></span></div> 
			   <div class="col-md-6"></div><br><br>
			   </c:forEach>
			   <div class="col-md-5"></div>
			   <div class="col-md-2"><form action="/voter/levelDownBP"><input type="submit" value="권한 하향하기"></form></div>
			   <div class="col-md-5"></div>
			   <br><br>
			</c:if>

			
			<%-- -------------LIST------------------%>	
		
			<c:if test="${!clist.isEmpty() }">
				<br><br>
				<h4>현재 등록된 후보자</h4><br><br>
				<c:forEach var="cn" items="${clist }">
					<div class="col-md-6">
						<form action="/voter/deleteBP" method="post">
							<input type="hidden" name="cno" value="${cn.candidateNo }"> 
							<table class="candidatelist" border="1px" >
								<tr>
									<td rowspan="4" width="300px">
											<img alt="" src="${uploadPath }\${cn.cd_imageName}">
									</td>
									<td width="100px">분류</td>
									<td width="300px">${cn.cd_group}</td>
								</tr>
								<tr><td>직업</td><td>${cn.cd_job }</td></tr>
								<tr><td>최종학력</td><td>${cn.cd_eduLevel }</td></tr>
								<tr><td>기호</td><td>${cn.cd_symbol }</td></tr>
								<tr><td colspan="3">경력</td></tr>
								<tr><td colspan="3" height="150">${cn.cd_career }</td></tr>
								<tr><td colspan="3">공약</td></tr>
								<tr><td colspan="3" height="150">${cn.cd_promise }</td></tr>
							</table>
							<br><input type="submit" value="삭제하기" style="margin-left:100px;">
						</form>
					</div>
				</c:forEach>
				<br><br>
			</c:if>		
		
			<br>
				
			<%-- ERROR MESSAGE PRINT --%>
			<c:if test="${BPmessage != null }">
				<span id="msg">${BPmessage }</span>
			</c:if>
			<br>
			<div class="insertForm" ></div><br>
			<div class="col-md-5"></div>
			<div class="col-md-2" style="padding-top:50px;" id="putInto" data-toggle="tooltip" data-placement="right" title="클릭하면 추가를 위한 폼이 나타납니다.">
			<img src="/resources/images/vote/candidate_plus.png" onclick="fn_insertForm()" style="margin-left:30px"></div>
			<div class="col-md-12"></div>
			
			<div class="col-md-4" ></div>
			<div class="col-md-2" style="padding-top:50px; margin-left:50px; padding-left:0; padding-right:0;"><form action="/voter/startVote"><input type="submit" value="투표시작"></form></div>
			<div class="col-md-4"></div>	
			<br/><br/><br/>		
				


 









		</div>
	</div>	
<%-- ----------------------Footer include----------------- --%>
	<div class = "footer">
	
	</div>

</body>
</html>