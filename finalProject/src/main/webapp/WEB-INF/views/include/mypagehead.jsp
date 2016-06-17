<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

           <div id="mypageLayout">
				<ul id=mypageUl>
               <a href="/mypage/userMypage"><li id="firstManu" class="manu ">커뮤니티</li></a>
               <a href="/managementFee/managementFeePay"><li id="secondManu" class="manu">관리비</li></a>
               <a href="/publicmana/list"><li id="thirdManu" class="manu">건의/불만</li></a>
               <a href="/siteNotice/mypage_SiteInquiry""><li id="fourthManu" class="manu">1:1:문의</li></a>
               <a href="/mypage/readMessageList "><li id="fifthManu" class="manu">쪽지</li></a>
               <a href="/mypage/passwordCheck"><li id="sixthManu" class="manu">개인정보 수정</li></a>
               <c:if test="${member.m_grade ==2}">
               <a href="/mypage/passwordCheck"><li id="sixthManu" class="manu">개인정보 수정</li></a>
               <a href="/mypage/passwordCheck"><li id="sixthManu" class="manu">개인정보 수정</li></a>
               </c:if>
               
               
					</ul>
				</div>
               
					
</body>
</html>