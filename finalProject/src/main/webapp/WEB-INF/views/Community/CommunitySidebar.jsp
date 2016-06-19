<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/bootstrap/bootstrap.min.css' type='text/css' media='all' />
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/dist/css/mainFont.css' type='text/css' media='all' />
<link rel='stylesheet' id='google_fonts-css'
	href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
	type='text/css' media='all' />
<link rel='stylesheet' id='spacious_style-css' href='/resources/dist/css/main1.css'
	type='text/css' media='all' />
<style type="text/css">

#sideBar li a{

  color: #0fbe7c;

}

#sideBar li {
  margin-bottom: 10px; 
}

</style>
</head>
<body>

		<div id="secondary" style="background-color: white;text-align: center;">
			<aside id="archives" class="widget">
			<h3 class="widget-title">${aptName }</h3>
			<ul id="sideBar">
				 
				<li ><a href='/calendar/calendar'>캘린더</a></li>
				<li><a href='/Property/aptRealTransaction?page=0'>아파트시세</a></li>
				<li><a href='/store/listStore'>상가정보</a></li>
				<li><a href='/voter/groupPresiMain'>입주자대표선거</a></li>
				<li><a href='/voter/buildingPresiMain'>동대표선거</a></li>
				<li><a href=''>중고거래</a></li>
				<li><a href=''>설문조사</a></li>
				<li><a href='/groupNotice/listAll'>공지사항</a></li>
			</ul>
			</aside>
		</div>
	

</body>
</html>