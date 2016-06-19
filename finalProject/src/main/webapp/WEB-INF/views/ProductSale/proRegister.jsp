<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01

 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<link rel='stylesheet' href='/resources/bootstrap/bootstrap.min.css' type='text/css' rel="stylesheet" />
<link rel='stylesheet' href='/resources/dist/css/mainFont.css'
	type='text/css' rel="stylesheet" />
<link rel='stylesheet'
	href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
	type='text/css' media='all' />
<link rel='stylesheet' href='/resources/dist/css/main1.css'
	type='text/css' rel="stylesheet" />
<title>회원가입 창</title>

<style type="text/css">

	#div{
	
	height: 50;
	}

	.fileDrop1 {
	
	width: 100%;
	height: 250px;
	border: 1px dotted blue;
	background-color: white;
	padding: 33%;
	}
	

	
	.fileDrop {
	
	width: 85%;
	height: 200px;
	border: 1px dotted blue;
	background-color: white;
	padding: 27%;
	margin-left: 7%;
	
	
	
	}



</style>


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->

<script src="../../../resources/js/Min/jquery.ui.widget.js"></script>

<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->

<script src="/resources/js/Min/jquery.iframe-transport.js""></script>

<!-- The basic File Upload plugin -->

<script src="/resources/js/Min/jquery.fileupload.js"></script>

<style type="text/css">
.font{
font-size: 23px;
font-weight: bold;
float: left;
}


</style>
</head>
<body style="padding: 0;">






<script type="text/javascript">
/* 
$(document).ready(function(){
   

   $("input[type='file']").on("change", function(){
   
      var a = this.value;
      var b = this.id;
      alert(a+"입니다.");
      alert(b+"입니다.");
      alert("변경된그림");
      
      var photo =  document.getElementById(b);
      alert(photo);
      var file = photo.files[0];
      console.log("File name: ");
      console.log("File name: " + file.fileName);
      console.log("File size: " + file.fileSize);
      console.log("Binary content: " + file.getAsBinary());
      console.log("Text content: " + file.getAsText(""));
      
           $.ajax({
                   url: '/ProductSale/ajaxForm',
                   data: $("#ajaxform").serialize(), 
               type: 'get',
                   success: function(result){
                      
                       alert("업로드 성공!!");
                       
                   }
      

      }); 




      });
   


});   
   */
   
   
   $(function(){
	   $("#checkPost").attr("disabled","disabled"); 
   })

function Postcost(value){
   
   if(value==1){
	   $("#checkPost").attr("value","0");
      $("#checkPost").attr("disabled","disabled");
      document.ajaxform.checkPost.value = "";
      
        
   }
   
}

function Postcost2(value){
	 if(value==2){
		 $("#checkPost").removeAttr("disabled");
	 }
   
   
} 


</script>

	
	<div id="page" class="hfeed site" style="display: inline-block;  ; border-top: 2px solid; margin: 0">
		<div class="col-md-12" style=" margin-top: 100px;" >
			


			<!-- <div class="col-xs-8" style="border: 4px solid #eaeaea;" > -->
					<div class="col-lg-12">
					
					
					<form action="" id="ajaxform" name="ajaxform" method="post" enctype="multipart/form-data" >
					
						<div class="form-group">
									<label class="col-lg-2 control-label">판매자명</label> 
									<div class="col-lg-10">
										<input type="text" class="form-control" name="m_memberNo" value="${product.m_memberNo}" disabled="disabled" >
									</div>
						</div>
							
							
					
								
						<div class="form-group">
									<label class="col-lg-2 control-label">휴대폰번호</label>
									
										<div class="col-lg-3 phoneNumfirst">
											<input type="text" name="pro_tel1" class="form-control"
												placeholder="010">
										</div>

										<div class="col-lg-3 phoneNum">
											<input type="text" name="pro_tel2" class="form-control"
												placeholder="1234">
										</div>

										<div class="col-lg-3 phoneNum">
											<input type="text" name="pro_tel3" class="form-control"
												placeholder="5678">
										</div>
									
						</div>
						
						
						
					
							<div class="form-group">
									<label class="col-lg-2 control-label">분류</label>
									<div class="col-lg-10">
								
										${product.pro_group}
									
										<input type="hidden" name="pro_group" value="${product.pro_group}">
									
									</div>
							</div>
							
							
							<div class="form-group">
									<label class="col-lg-2 control-label">판매상품명</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" name="pro_name"
											placeholder="판매상품명">
									</div>
							</div>
							
							<div class="form-group">
									<label class="col-lg-2 control-label">가격</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" name="pro_price"
											placeholder="가격">
									</div>
							</div>
							
							<div class="form-group">
									<label class="col-lg-2 control-label">수량</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" name="pro_num"
											placeholder="수량">
									</div>
							</div>
							
							
							<div class="form-group">
									<label class="col-lg-2 control-label">최대 구매수량</label>
									<div class="col-lg-10">
										<input type="text" class="form-control" name="pro_maxnum"
											placeholder="수량">
									</div>
							</div>
							
							
							<div class="form-group">
									<label class="col-lg-2 control-label">상품이미지</label>
									
									<div class="col-lg-6 col-lg-offset-2" style="margin-bottom: 30px;">
									<div class="fileDrop1">
									
										<input type="file" id="pro_img1" name="pro_img1" style="width: 100%">
									
									</div>
									</div>
									
							</div>	
							
							
							
							<div class="form-group">
									
									
									<div class="col-lg-5" style="margin-left: 38%;margin-bottom: 30px;">
									<div class="fileDrop">
								
										<input type="file" id="pro_img2" name="pro_img2" value="img2">
									
									</div>
									</div>
							</div>
							

							<div class="form-group">
								
									
									<div class="col-lg-5" style="margin-left: 38%; margin-bottom: 30px;">
									<div class="fileDrop">
								
										<input type="file" id="pro_img3" name="pro_img3" value="img3">
									
									</div>
									</div>
							</div>
							
							
						
							
							
							<div class="form-group">
									<label class="col-lg-3 control-label"></label>
									<div class="col-lg-7">
										
									<label class="font">시작일</label>
									<select class="form-control" name="pro_sdate1" id="select" style="width: 90px; float: left;">
										
									
										<div>
											<option>2016</option>
											</select>
											<label class="font">년</label>
											
											<select class="form-control" name="pro_sdate2" id="select" style="width: 70px; float: left;">
											<c:forEach begin="1" end="9" var="list">
											<option>0${list}</option>
											</c:forEach>
											<option>10</option>
											<option>11</option>
											<option>12</option>
											</select>
											<label class="font">월</label>
											
											
											<select class="form-control" name="pro_sdate3" id="select" style="width: 70px; float: left;">
											<c:forEach begin="1" end="9" var="list">
											<option>0${list}</option>
											</c:forEach>
											<c:forEach begin="10" end="31" var="list">
											<option>${list}</option>
											</c:forEach>
											</select>
											<label class="font">일</label>
									
							<br><br>
										
									
										<label class="font">종료일</label> <select class="form-control" name="pro_edate1" id="select" style="width: 90px; float: left;">
											<option>2016</option>
											
											</select>
											<label class="font">년</label>
											<select class="form-control" name="pro_edate2" id="select" style="width: 70px; float: left;">
											<c:forEach begin="1" end="9" var="list">
											<option>0${list}</option>
											</c:forEach>
											<option>10</option>
											<option>11</option>
											<option>12</option>
											</select><label class="font">월</label>
											
											<select class="form-control" name="pro_edate3" id="select" style="width: 70px; float: left;">
											
											<c:forEach begin="1" end="9" var="list">
											<option>0${list}</option>
											</c:forEach>
											<c:forEach begin="10" end="31" var="list">
											<option>${list}</option>
											</c:forEach>
											</select><label class="font">일</label>
											</div>
									</div>
							</div>
							
							
							
								
							
							<div class="form-group">
									<label class="col-lg-3 control-label">배송방법&배송비</label>
									<div class="col-lg-7" >
								 
									<p>	<input type="radio" name="1" value="1" onchange="Postcost(this.value)" checked="checked">배송비무료&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="1" value="2" onchange="Postcost2(this.value)">배송비유료  </p>
									 
									 <input type="text" name="checkPost"   id="checkPost" placeholder="가격" >
									<div class="addinput" >
									</div>	
									</div>
							</div>
							
							
							
								
								
								
							<div class="form-group">
									<label class="col-lg-3 control-label">상품내용</label>
									<div class="col-lg-7">
									<textarea class="form-control" rows="3" name="pro_context" id="textArea"></textarea>
										
									</div>
							
							</div>
							
							
								<div class="form-group">
									<label class="col-lg-3 control-label"> &nbsp;&nbsp;&nbsp;&nbsp; </label>
									<div class="col-lg-7">
									
									<input type="submit" value="등록하기">	
									</form>
									
									</div>
							
							</div>
							
							

        
				
	
						
						
						
								
				</div>
			</div>
			
		</div>
	</div>
	
	
</body>
</html>
