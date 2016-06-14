<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/bootstrap/bootstrap.min.css' type='text/css'
	media='all' />

<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/dist/css/mainFont.css' type='text/css' media='all' />

<link rel='stylesheet' id='google_fonts-css'
	href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
	type='text/css' media='all' />
<link rel='stylesheet' id='spacious_style-css'
	href='/resources/dist/css/main1.css' type='text/css' media='all' />



<!-- modal -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="header">
		 <jsp:include page="../include/head.jsp"></jsp:include> 
	</div>
	<div class="container" id="page">
		<div class="col-md-3">
			<!-- <div id="page" class="hfeed site"> -->

				<div id="secondary">
					<aside id="archives" class="widget">
					<h3 class="widget-title">Archives</h3>
					<ul>
						<li><a href='http://demo.themegrill.com/spacious/2014/03/'>March
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/02/'>February
								2014</a></li>

						<li><a href='http://demo.themegrill.com/spacious/2014/03/'>March
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/02/'>February
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/03/'>March
								2014</a></li>
						<li><a href='http://demo.themegrill.com/spacious/2014/02/'>February
								2014</a></li>
					</ul>
					</aside>
				</div>
				<div id="primary" style="height: 1000px; "></div>
			
		</div>
		<!-- 리스트,입력,상세보기 -->
		<div class="col-md-8" style="margin-top: 50px;">
			<jsp:include page="/resources/editor/GNupdateSmartEditor2.jsp"></jsp:include>
		</div>
	</div>

</body>
</html>