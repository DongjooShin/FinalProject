<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
   src="/resources/jquery/jQuery-2.1.4.min.js"></script>

<script type="text/javascript">
	$(function() {

		$('#firstManu').css('background', '#09b9e5');


	});
</script>
<style type="text/css">

#sixthContent {

	min-height: 500px;

}

.manu {

	color: white;

}
</style>
</head>
<body>

	<div class="header">
		<jsp:include page="../include/head.jsp"></jsp:include>
	</div>

	<div id="page" style="background: white; display: inline-block;">

		<div class="col-md-12">

			<div id="mypageLayout">

				<ul id=mypageUl>
					<jsp:include page="../include/aaa.jsp"></jsp:include>

				</ul>


				<div class="col-lg-10 col-lg-offset-1">
					<br> <br> <label
						style="font-size: 25px; color: black; border-bottom: 3px solid #eaeaea; padding: 0 15px 13px 15px; margin-bottom: 15px;">스케줄</label>
					<a href="/calendar/calendar">더 많은 스케줄보기</a> <br> <br>
					<div class="col-lg-10 ">
						<label class="labelDay">오늘 :</label>
						<c:forEach var="cal" items="${nowlist}">
							<label class="labelDay">${cal.c_schedule }</label>
						</c:forEach>


						<br> <br> <label class="labelDay">1일전 :</label>
						<c:forEach var="cal" items="${list}">
							<label class="labelDay">${cal.c_schedule }</label>

						</c:forEach>

						<br> <br> <label class="labelDay">2일전 :</label>
						<c:forEach var="cal" items="${list2}">
							<label class="labelDay">${cal.c_schedule }</label>
						</c:forEach>
						<br> <br> <label class="labelDay">3일전 :</label>
						<c:forEach var="cal" items="${list3}">
							<label class="labelDay">${cal.c_schedule }</label>
						</c:forEach>

						<br> <br> <br> <br>
					</div>
				</div>

				<div class="col-lg-10 col-lg-offset-1">
					<label
						style="font-size: 25px; color: black; border-bottom: 3px solid #eaeaea; padding: 0 15px 13px 15px; margin-bottom: 15px;">최신
						공지사항</label> <a href="/groupNotice/listAll">더 많은 공지사항보기</a>
					<table class="table table-striped">
						<tr height="30">
							<th width="50">번호</th>
							<th width="250">제목</th>
							<th width="150">작성자</th>
							<th width="150">작성일</th>
							<th width="100">조회수</th>
						</tr>
						<c:forEach var="gn" items="${newlist}">
							<tr>
								<td align="center">${gn.g_subNo }</td>
								<td align="left"><a href="/groupNotice/read">${gn.g_title}</a></td>

								<td align="center">${gn.m_memberNo}</td>
								<td align="center"><fmt:formatDate value="${gn.g_date}"
										pattern="yyyy-MM-dd" /></td>
								<td align="center">${gn.g_hit}</td>
							</tr>
						</c:forEach>
					</table>
					<br> <br> <br>
				</div>

			</div>

		</div>
	</div>



</body>
</html>