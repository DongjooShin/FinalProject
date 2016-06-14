<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>store register page</title>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	
	<div class="header">
		 <jsp:include page="../include/head.jsp"></jsp:include> 
	</div>
	<div class="main">
		<div class="container" id="page">
			<div class="col-md-3">
				
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
				<div id="primary" style="height: 1000px;"></div>

			</div>
			
			<!-- 리스트,입력,상세보기 -->
			<div class="col-md-8" style="margin-top: 50px;">
				<div class='container2'>
					<form class='form-horizontal' role='form' action="/store/register" method="post" enctype="multipart/form-data">
						<div class='row'>
							<label class='control-label col-md-2' for="s_group">상가 이름</label> 
							
							<!-- <div class="col-md-1" style="padding-left: 0px"> -->
							<div class="col-md-2" style="padding-left: 0px;">
								<select	class="form-control" name="s_group">
									<option value="푸드">푸드</option>
									<option value="패션/잡화">패션/잡화</option>
									<option value="학원">학원</option>
									<option value="생활">생활</option>
									<option value="기타">기타</option>
								</select> 
							</div>
				
							<div class="col-md-7">
								<div class='form-group'>
									<input class='form-control' type="text" id="s_name" placeholder="상가이름을 입력하세요"  name="s_name" >
								</div>
							</div>
							
						</div>
				
						 <div class="row">
							<label class='control-label col-md-2' for="s_tel">상가 전화번호</label> 
							<div class='form-group  col-md-10'>
								<input type="text" class="form-control" id="s_tel" placeholder="전화번호" name="s_tel">
							</div>
						</div>
						
						<div class="row">
							<label class='control-label col-md-2' for="s_content">상가 소개</label>
							<div class='form-group  col-md-10'> 
								<!-- <input type="text" class="form-control" id="s_content" placeholder="상가 소개를 적어주세요" name="s_content"> -->
								<textarea rows="5" cols="10" id="s_content" placeholder="상가 소개를 적어주세요" name="s_content"></textarea>
							</div>
						</div>
						
						<div class="row">
							
								<label class='control-label col-md-2' for="s_openTime">오픈시간</label>
								<div class="col-md-2">
									<div class="form-group">
										<input type="time" class="form-control" id="s_openTime" name="s_openTime">
									</div>
								</div>
							
							
							<label class='control-label col-md-2' >마감시간</label>
							<div class="col-md-2">
								<div class='form-group'>
									<input type="time" class="form-control" id="s_closeTime" name="s_closeTime">
								</div>
							</div>
						</div>
						<br>
						<div class="row">
							<label class="control-label col-md-2" for="storeUploadFile">파일 업로드</label> 
							<div class="col-md-3">
								<div class="form-group">
									<input type="file" name="storeUploadFile" class="form-control" id="storeUploadFile" >
								</div>
							</div>
						</div>
						<br>
						<div class="col-md-2 col-md-offset-5">
							<div class="row">
								<button type="submit" class="btn btn-default">제출</button>
								<button type="button" class="btn btn-default">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	
</body>
</html>