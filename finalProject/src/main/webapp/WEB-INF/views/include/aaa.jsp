<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#mypageUl {
	margin-top: -53px;
}

#mypageUl li {
	display: inline;
	float: left;
	position: relative;
	margin-right: 5px;
	padding: 10px;
	background-color: rgba(0, 0, 0, 0.3);
	padding: 15px 35px 15px 35px;
	border-radius: 3px;
	color: #fff;
	font-size: 21px;
}

#mypageLayout {
	border: 3px solid #eaeaea;
	border-top: 4px solid #09b9e5;
	display: inline-block;
	width: 100%;
	margin-top: 70px;
}</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
               <a href="/mypage"><li id="firstManu" class="manu ">커뮤니티</li></a>
               <a href="/managementFee/managementFeePay"><li id="secondManu" class="manu">관리비</li></a>
               <a href="/publicmana/list"><li id="thirdManu" class="manu">문의답변</li></a>
               <a href="/siteNotice/mypage_SiteInquiry""><li id="fourthManu" class="manu">1:1:문의</li></a>
               <a href="/mypage/readMessageList "><li id="fifthManu" class="manu">쪽지</li></a>
               <a href="/mypage/passwordCheck"><li id="sixthManu" class="manu">개인정보 수정</li></a>
					
</body>
</html>