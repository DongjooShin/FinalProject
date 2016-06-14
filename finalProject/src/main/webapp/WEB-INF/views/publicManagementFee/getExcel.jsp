<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>

	<table border="1">
	<tr style="background-color: skyBlue;">
		<th rowspan="2">계정과목</th>
<c:forEach items="${list }" var="pm">
		<th colspan="2">${pm.pm_publicFeeNo}년도 결산</th>
</c:forEach>
	</tr>
	<tr>
<c:forEach items="${list }" var="pm">
		<td>월간</td>
		<td>연간</td>
</c:forEach>
	</tr>
		<tr>
			<td>청소비</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_clean/12}" pattern="."/></td>
			<td>${pm.pm_clean}</td>
		</c:forEach></tr>
		<tr>
			<td>소독비</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_disinfection/12}" pattern="."/></td>
			<td>${pm.pm_disinfection}</td>
		</c:forEach></tr>
		<tr>

			<td>일반관리비</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_general/12}" pattern="."/></td>
			<td>${pm.pm_general}</td>
		</c:forEach></tr>
		<tr>
			<td>수선유지비</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_maintain/12}" pattern="."/></td>
			<td>${pm.pm_maintain}</td>
		</c:forEach></tr>
		<tr>
			<td>승강기유지비</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_liftMaintain/12}" pattern="."/></td>
			<td>${pm.pm_liftMaintain}</td>
		</c:forEach></tr>

		<tr>
			<td>경비용역비</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_security/12}" pattern="."/></td>
			<td>${pm.pm_security}</td>
		</c:forEach></tr>
		<tr>
			<td>음식물수거비</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_foodWaste/12}" pattern="."/></td>
			<td>${pm.pm_foodWaste}</td>
		</c:forEach></tr>
		<tr>
			<td>화재보험료</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_fireInsurance/12}" pattern="."/></td>
			<td>${pm.pm_fireInsurance}</td>
		</c:forEach></tr>
		<tr>
			<td>위탁수수료</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_commission/12}" pattern="."/></td>
			<td>${pm.pm_commission}</td>
		</c:forEach></tr>
		<tr>
			<td>동대표회의비</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_meeting/12}" pattern="."/></td>
			<td>${pm.pm_meeting}</td>
		</c:forEach></tr>
		<tr>
			<td>장기수선충당금</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_meeting/12}" pattern="."/></td>
			<td>${pm.pm_meeting}</td>
		</c:forEach></tr>
		<tr>
			<td>공동전기료</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_publicElectric/12}" pattern="."/></td>
			<td>${pm.pm_publicElectric}</td>
		</c:forEach></tr>
		<tr>
			<td>승강기전기료</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_liftElectric/12}" pattern="."/></td>
			<td>${pm.pm_liftElectric}</td>
		</c:forEach></tr>
		<tr>
			<td>tv수신료</td>
		<c:forEach items="${list }" var="pm">
			<td><fmt:formatNumber value="${pm.pm_TVFee/12}" pattern="."/></td>
			<td>${pm.pm_TVFee}</td>
		</c:forEach></tr>
		<tr style="background-color: skyBlue;">
			<th>계</th>
		<c:forEach items="${list }" var="pm">
			<th>
                    						
        <fmt:formatNumber value="${(pm.pm_clean/12)+(pm.pm_general/12)+(pm.pm_maintain/12)+(pm.pm_liftMaintain/12)+(pm.pm_security /12)+(pm.
                   							 pm_foodWaste /12)+(pm.pm_fireInsurance /12)+(pm.pm_commission /12)+(pm.pm_meeting /12)+(pm.pm_publicElectric /12)+(pm.pm_liftElectric /12)+(pm.
                    						pm_TVFee /12)+(pm.pm_disinfection/12)}" pattern="."/>
                    						</th>
			<th>${pm.pm_clean+pm.pm_general+pm.pm_maintain+pm.pm_liftMaintain+pm.pm_security +pm.
                   							 pm_foodWaste +pm.pm_fireInsurance +pm.pm_commission +pm.pm_meeting +pm.pm_publicElectric +pm.pm_liftElectric +pm.
                    						pm_TVFee +pm.pm_disinfection}</th>
		</c:forEach>
		</tr>
		</table>

</body>
</html>