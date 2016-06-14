<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>최신글 5개만</h3>
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
				<td align="center">
					<fmt:formatDate value="${gn.g_date}" pattern="yyyy-MM-dd"/>
				</td>
				<td align="center">${gn.g_hit}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>