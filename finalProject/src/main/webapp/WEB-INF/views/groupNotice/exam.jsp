<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-lg-10 col-lg-offset-1">
<label style="font-size: 25px; color : black; border-bottom: 3px solid #eaeaea; padding : 0 15px 13px 15px; margin-bottom: 15px;">최신 공지사항</label>
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

	</div>
</body>
</html>