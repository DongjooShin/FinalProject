<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
   src="/resources/jquery/jQuery-2.1.4.min.js"></script>
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
}

.content {
   display: none;
   margin-top: 15px;
}

#sixthContent {
   min-height: 500px;
}

.manu {
   color: white;
}
</style>

</head>
<body>
 	<div class="main">
		<!-- 리스트,입력,상세보기 -->
		<div class="header">

			<jsp:include page="../include/head.jsp"></jsp:include>
		</div>
		<div id="page" style="background: white; display: inline-block;">
			<div class="col-md-12">
			
						<jsp:include page="../include/mypagehead.jsp"></jsp:include>

				<div class="col-md-12">


				</div>
			</div>
		</div>
	</div>

					<jsp:include page="readPage.jsp"></jsp:include>
</body>
</html>