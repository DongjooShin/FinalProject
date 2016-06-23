<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content= "IE=edge">      <!-- 구형 익스플로러를 위해 써주는 부분 -->
<meta name="viewport" content= "width=devsice-width, initial-scale=1" >    <!-- 이부분이 바로 반응형 웹!! 디바이스의 가로크기에 맞춰 컨텐트의 가로를 맞춘다. -->
<title>1:1 Inquiry</title>
<link rel="stylesheet" href="/resources/voteCss/vote.css"> 
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/bootstrap/bootstrap.min.css' type='text/css' media='all' />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>	<title>Insert title here</title>
</head>
<body style="background-color: #eaeaea;">
<%-- -----------------Header include----------------- --%>	
	<div class="header">
		 <jsp:include page="../include/head.jsp"></jsp:include> 
	</div>
	
<%-- ------------------------------Body------------------------------------------- --%>	
	<div class="main" id="page">
		<div class="container">
			<div class="col-md-3">
				<jsp:include page="../siteNotice/CustomerSidebar.jsp"></jsp:include>
			</div>
			
			<!-- 리스트,입력,상세보기 -->
			<div class="col-md-8" style="margin-top: 50px; margin-left:50px;">
				<c:choose>	
					<%-- ----------CASE : INQUIRY BY MEMBER---------------- --%>
					<c:when test="${member.m_grade != 0 }">
							<jsp:include page="/resources/editor/InqSmartEditor.jsp"></jsp:include>		
					</c:when>
					<%-- ----------CASE : ANSWER BY SITE MANAGER--------------- --%>
					<c:otherwise>
							<jsp:include page="smanagerPage.jsp"></jsp:include>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
			
	</div>
	
<%-- ----------------------Footer include----------------- --%>
<div class="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</div>

	
</body>
</html>