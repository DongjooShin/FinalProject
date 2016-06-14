<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="form" uri= "http://www.springframework.org/tags/form"   %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Site Join Inquiry</title>
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/bootstrap/bootstrap.min.css' type='text/css' media='all' />
<link rel='stylesheet' id='spacious-genericons-css'
	href='/resources/dist/css/mainFont.css' type='text/css' media='all' />
<link rel='stylesheet' id='google_fonts-css'
	href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
	type='text/css' media='all' />
<link rel='stylesheet' id='spacious_style-css' href='/resources/dist/css/main1.css'
	type='text/css' media='all' />
<style type= "text/css">
     .error{
           color: #ff0000;
     }
</style>
	
</head>
<body style="background-color: #eaeaea;">
<%-- -----------------Header include----------------- --%>	
	<div class="header">
		 <jsp:include page="../include/head.jsp"></jsp:include> 
	</div>
	
	<c:if test="${message == 'SUCCESS' }">
	<script type="text/javascript">
		alert("가입 문의 완료!");
	</script>
	</c:if>
	
<%-- ------------------------------Body------------------------------------------- --%>	
	<div class="main" id="page">
		<div class="container">
			<div class="col-md-3">
				<jsp:include page="../siteNotice/CustomerSidebar.jsp"></jsp:include>
			</div>
			
			<!-- 리스트,입력,상세보기 -->
			<div class="col-md-8" style="margin-top: 50px; margin-left:50px;">
				
			
				        <div>
				            <div class="text-center">
				                <h3>APT Manager와 함께 하시겠습니까?</h3>
				                <p>본사의 서비스를 이용하고 싶은 분, 본사와 함께 아파트를 이끌어 나고 싶으신 분들 모두 아파트 매니저를 고려해주셔서 감사합니다.<br>빠른 시일내에 연락을 드리겠습니다.</p>
				            </div>
				        </div><br>
				        
				        
				      <form action="joinRegist" method="post">  
				        <div>
		                    <div class="col-md-6">
		                        
		                            <input type="text" placeholder="성함" name="j_name">
		                      
		                            <input type="email" placeholder="이메일" name="j_email">
		                       
		                            <input type="text" placeholder="연락처" name="j_phone" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')">
		                       
		                            <input type="text" placeholder="아파트명" name="j_apt_name">
		                        
		                    </div>
		                    <div class="col-md-6">
		                        
		                            <textarea style="height:150px;" placeholder="문의사항" name="j_message"></textarea>
		                            <p class="help-block text-danger"></p>
		                        
		                    </div>
		                    <div class="clearfix"></div>
		                    <div class="text-center">
		                        <div id="success"></div>
		                        <button type="submit" class="btn btn-xl">보내기</button>
		                    </div>
				        </div>
				       </form>
				        
				    </div>
		
			</div>
	</div>

	
<%-- ----------------------Footer include----------------- --%>
	<div class = "footer">
	
	</div>
	
</body>
</html>