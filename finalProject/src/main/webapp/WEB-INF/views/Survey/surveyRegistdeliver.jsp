
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../js/Min/script.js"></script>
<link type="text/css" rel="stylesheet" href="../css/Min/survey/styles.css"/>
<title>jQuery To Do List Plugin Demo</title>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<!-- Custom CSS -->
<link rel="stylesheet" href="../css/Min/survey/styles.css">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">




<link href="../css/Min/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/Min/bootstrap/css/styles.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="http://snipplicious.com/css/bootstrap-3.1.1.min.css">

<link rel="stylesheet" type="text/css" href="http://snipplicious.com/css/font-awesome-4.0.3.min.css">
<style>
.forum.table > tbody > tr > td {
    vertical-align: middle;
}

.forum .fa {
    width: 1em;
    text-align: center;
}

.forum.table th.cell-stat {
    width: 6em;
}

.forum.table th.cell-stat-2x {
    width: 14em;
    text-align: center;
}

.pagecenter{

	width: 100%;
	text-align: center;
}
.col-md-2{
	margin-top : 10%;


} 

row{
width: 100%;
}
.container{
	width: 100%;
}

</style>
<script src="http://snipplicious.com/js/jquery.js"></script>
<script src="http://snipplicious.com/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>



	 <jsp:include page="../include/head.jsp"></jsp:include> 

	
	
		<div class="row">
			
			
		<div class="col-md-3" style="padding-left: 60px;">
		
			 <jsp:include page="SurveySideBar.jsp"></jsp:include> 
		</div>
		
		<div class="col-md-9" style="margin-top: 50px;">

		
		<div class="container mainpage1" id="main" style="padding-right: 220px;">


<%-- <h1>아파트 설문조사</h1> 날짜 : ${survey.su_enddate }까지 제출바랍니다.
 --%>
 
<form action="/Survey/surveyRegistdeliver" method="post">

<input type="hidden"  name="size" value="${survey.size() }">
<input type="hidden" name="su_group" value="${su_group }">


<c:forEach var="survey" items="${survey}"  >
<div class="bb">
<li class="list-group-item">

<div class="text_holder">

${survey.su_surveyNo }. ${survey.su_context }

<div class="btn-group pull-right">
<button class="delete btn btn-warning">삭제</button>
</div>
</div>
<div class="radiobox">
<input type="radio" value="1" name="check${survey.su_surveyNo }">
매우좋음
</div>
<div class="radiobox">
<input type="radio" value="2" name="check${survey.su_surveyNo }">
좋음
</div>
<div class="radiobox">
<input type="radio" value="3" name="check${survey.su_surveyNo }">
보통
</div>
<div class="radiobox">
<input type="radio" value="4" name="check${survey.su_surveyNo }">
나쁨
</div>
<div class="radiobox">
<input type="radio" value="5" name="check${survey.su_surveyNo }">
매우나쁨
</div>
</li>
</div>
</c:forEach>


<input type="submit" value="설문지 작성완료">
</div>
<br><br>

</form>
		
		
		
				</div>
		</div>
		

<script type="text/javascript">
$(document).ready(function(){
	
	
	alert("시작이된다.");
	
	$.ajax({
	
		url : '/Survey/surveyRegistdeliver2',
		type : 'post',
		dataType : 'texst',
		success : function(data){
		
				alert("ajax성공했습니다.");
		
		}
		
	
	});
	
	
});


</script>


</body>


</html>