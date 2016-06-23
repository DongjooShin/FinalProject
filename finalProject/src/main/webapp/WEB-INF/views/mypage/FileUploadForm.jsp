<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<head>
<title>File Upload with Spring 3 MVC</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript"
	src="/resources/jquery/jQuery-2.1.4.min.js"></script>

<script type="text/javascript">
	$(function() {

		
		$('#fourthManu').css('background', '#09b9e5');
		if($('#insertCheck').val() == 200){
			alert("파일이 등록되었습니다.");
			$('#insertCheck').attr("value", "");
		}
		if($('#insertCheck').val() == 400){
			alert("파일이 등록이 실패 되었습니다.");
			$('#insertCheck').attr("value", "");
		}

	});
	
</script>
</head>
<body>
	<div class="header">
		<jsp:include page="../include/head.jsp"></jsp:include>
	</div>
	<div id="page" style="background: white; display: inline-block;">
		<div class="col-md-12">
			<div id="mypageLayout">

				<ul id=mypageUl>
					<jsp:include page="../include/siteManagerMypageHead.jsp"></jsp:include>

				</ul>
				<div id="passwordCheckDiv" class="col-lg-12">

					<div class="col-lg-10 col-lg-offset-1">
						<br> <br> <label
							style="font-size: 25px; color: black; border-bottom: 3px solid #eaeaea; padding: 0 15px 13px 15px; margin-bottom: 15px;">아파트
							실거래가 등록</label> <br> <br>
						<div class="col-lg-6  col-lg-offset-3"
							style="margin-top: 50px; margin-bottom:60px; border: 4px solid #eaeaea; border-radius: 5px; padding: 40px 0 0 25px;">
							<input type="hidden" value="${insertOK }" id="insertCheck">
							<form:form commandName="excel" enctype="multipart/form-data"
								method="POST" >
								<div class="col-lg-8 col-lg-offset-3">
									Name :
									<form:input type="file" path="file" />
								</div>
								<div class="col-lg-6 col-lg-offset-4">
									<input type="submit" value="Upload File" />
								</div>
							</form:form>
							<br>
							<br>
							<br>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>