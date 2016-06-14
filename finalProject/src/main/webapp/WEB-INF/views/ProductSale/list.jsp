<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
  
<script type="text/javascript">
$(function() {
	$('#storeRegist').on("click", function(evt) {

		self.location = "register";

	});
	
	$('#storeList li a').each(function(index) {
		$(this).click(function() {
			$('#storeTable').empty();
			
			if (index == 0) {
				
				$.ajax({
					url : '/listStoreFood',
					type : 'post',
					dataType : 'json',
					success : function(json) {
						
						for (var i = 0; i < json.length; i++) {

							
							var html='<tr><td><a>'+json[i].s_name+'</a></td>';
							html+='<td>'+json[i].s_tel+'</td>';
							html+='<td><button class="detail" value="'+i+'"><i class="fa fa-search-plus"></i></button></td></tr>';
							

							$('#storeTable').append(html);
							
							
							
						}
						
						$('.detail').on('click',function(){
							//alert("dskfja;lsdkf");
							$('#modal-content').empty();
							
							
							
							var html2='<img alt="storeImage" src="/resources/images/syeon/food3.PNG">';
							
							html2+='<input type="hidden" name="s_storeNo" id="s_storeNo" value="'+json[$(this).val()].s_storeNo+'">';
							html2+='<p>상가이름: '+json[$(this).val()].s_name+'</p>';
							html2+='<p>전화번호: '+json[$(this).val()].s_tel+'</p>';
							html2+='<p>상가정보: '+json[$(this).val()].s_content+'</p>';
							html2+='<p>오픈/마감 시간: '+json[$(this).val()].s_openTime+' ~ '+json[$(this).val()].s_closeTime+'</p>';
							$('#modal-content').append(html2);
							$('#Modal').modal("show");
							
						})
						
						
						
						
					},
					error : function() {
						alert('실패');
					}

				})
			} else if (index == 1) {
				
				
				$.ajax({
					url : '/listStoreFashion',
					type : 'post',
					dataType : 'json',
					success : function(json) {
					
						for (var i = 0; i < json.length; i++) {

							
							var html='<tr><td><a>'+json[i].s_name+'</a></td>';
							html+='<td>'+json[i].s_tel+'</td>';
							html+='<td><button class="detail" value="'+i+'"><i class="fa fa-search-plus"></i></button></td></tr>';

							$('#storeTable').append(html);
						}
						$('.detail').on('click',function(){
							//alert("dskfja;lsdkf");
							$('#modal-content').empty();
							
							
							//alert(json[$(this).val()].s_group+" 버튼 클릭!!@!##$#@%");
							var html2='<img alt="storeImage" src="/resources/images/syeon/food3.PNG">';
							
							html2+='<input type="hidden" name="s_storeNo" id="s_storeNo" value="'+json[$(this).val()].s_storeNo+'">';
							html2+='<p>상가이름: '+json[$(this).val()].s_name+'</p>';
							html2+='<p>전화번호: '+json[$(this).val()].s_tel+'</p>';
							html2+='<p>상가정보: '+json[$(this).val()].s_content+'</p>';
							html2+='<p>오픈/마감 시간: '+json[$(this).val()].s_openTime+' ~ '+json[$(this).val()].s_closeTime+'</p>';
							$('#modal-content').append(html2);
							$('#Modal').modal("show");
							
						})
						
						
						
					},
					error : function() {
						alert('실패');
					}

				})
			}// end if
			else if (index == 2) {
				
				$.ajax({
					url : '/listStoreAcademy',
					type : 'post',
					dataType : 'json',
					success : function(json) {
					
						for (var i = 0; i < json.length; i++) {

							
							var html='<tr><td><a>'+json[i].s_name+'</a></td>';
							html+='<td>'+json[i].s_tel+'</td>';
							html+='<td><button class="detail" value="'+i+'"><i class="fa fa-search-plus"></i></button></td></tr>';

							$('#storeTable').append(html);
						}
						$('.detail').on('click',function(){
							//alert("dskfja;lsdkf");
							$('#modal-content').empty();
							
							
							//alert(json[$(this).val()].s_group+" 버튼 클릭!!@!##$#@%");
							var html2='<img alt="storeImage" src="/resources/images/syeon/food3.PNG">';
							
							html2+='<input type="hidden" name="s_storeNo" id="s_storeNo" value="'+json[$(this).val()].s_storeNo+'">';
							html2+='<p>상가이름: '+json[$(this).val()].s_name+'</p>';
							html2+='<p>전화번호: '+json[$(this).val()].s_tel+'</p>';
							html2+='<p>상가정보: '+json[$(this).val()].s_content+'</p>';
							html2+='<p>오픈/마감 시간: '+json[$(this).val()].s_openTime+' ~ '+json[$(this).val()].s_closeTime+'</p>';
							$('#modal-content').append(html2);
							$('#Modal').modal("show");
							
						})
						
						
						
					},
					error : function() {
						alert('실패');
					}

				})
			}// end if

			else if (index == 3) {
				
				$.ajax({
					url : '/listStoreLife',
					type : 'post',
					dataType : 'json',
					success : function(json) {
					
						for (var i = 0; i < json.length; i++) {
							
							var html='<tr><td><a>'+json[i].s_name+'</a></td>';
							html+='<td>'+json[i].s_tel+'</td>';
							html+='<td><button class="detail" value="'+i+'"><i class="fa fa-search-plus"></i></button></td></tr>';

							$('#storeTable').append(html);
						}
						$('.detail').on('click',function(){
							//alert("dskfja;lsdkf");
							$('#modal-content').empty();
							
							
							//alert(json[$(this).val()].s_group+" 버튼 클릭!!@!##$#@%");
							var html2='<img alt="storeImage" src="/resources/images/syeon/food3.PNG">';
							
							html2+='<input type="hidden" name="s_storeNo" id="s_storeNo" value="'+json[$(this).val()].s_storeNo+'">';
							html2+='<p>상가이름: '+json[$(this).val()].s_name+'</p>';
							html2+='<p>전화번호: '+json[$(this).val()].s_tel+'</p>';
							html2+='<p>상가정보: '+json[$(this).val()].s_content+'</p>';
							html2+='<p>오픈/마감 시간: '+json[$(this).val()].s_openTime+' ~ '+json[$(this).val()].s_closeTime+'</p>';
							$('#modal-content').append(html2);
							$('#Modal').modal("show");
							
						})
						
						
						
					},
					error : function() {
						alert('실패');
					}

				})
			}// end if
			else if(index=4){
				
				$.ajax({
					url : '/listStoreEtc',
					type : 'post',
					dataType : 'json',
					success : function(json) {
					
						for (var i = 0; i < json.length; i++) {

							
							var html='<tr><td><a>'+json[i].s_name+'</a></td>';
							html+='<td>'+json[i].s_tel+'</td>';
							html+='<td><button class="detail" value="'+i+'"><i class="fa fa-search-plus"></i></button></td></tr>';

							$('#storeTable').append(html);
						}
						$('.detail').on('click',function(){
							//alert("dskfja;lsdkf");
							$('#modal-content').empty();
							
							
							//alert(json[$(this).val()].s_group+" 버튼 클릭!!@!##$#@%");
							var html2='<img alt="storeImage" src="/resources/images/syeon/food3.PNG">';
							
							html2+='<input type="hidden" name="s_storeNo" id="s_storeNo" value="'+json[$(this).val()].s_storeNo+'">';
							html2+='<p>상가이름: '+json[$(this).val()].s_name+'</p>';
							html2+='<p>전화번호: '+json[$(this).val()].s_tel+'</p>';
							html2+='<p>상가정보: '+json[$(this).val()].s_content+'</p>';
							html2+='<p>오픈/마감 시간: '+json[$(this).val()].s_openTime+' ~ '+json[$(this).val()].s_closeTime+'</p>';
							$('#modal-content').append(html2);
							$('#Modal').modal("show");
							
						})
						
						
						
					},
					error : function() {
						alert('실패');
					}

				})
			}

		});// end click
	});// end each
	

});// end function



</script>
<title>Insert title here</title>
</head>
<body>
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
				 <div class="container">
					<div>
						<button type="button" class="btn btn-default col-md-offset-7" id="storeRegist">상가 등록</button>
					</div>
					<br>
					<div class="row  pad-top">
						
			            <div class="col-md-8">
			            	
							
			                <ul class="nav nav-tabs" id="storeList">
			                    <li class="active"><a href="#home" data-toggle="tab">푸드</a>
			                    </li>
			                    <li class=""><a href="#fashion" data-toggle="tab">패션/잡화</a>
			                    </li>
			                    <li class=""><a href="#academy" data-toggle="tab">학원</a>
			                    </li>
			                    <li class=""><a href="#life" data-toggle="tab">생활</a>
			                    </li>
			                    <li class=""><a href="#etc" data-toggle="tab">기타</a>
			                    </li>
			                </ul>
			                <br>
							<div id="storebody">
								<div class="container">
									<table class="table table-striped" id="storeTable" style="width: 700px;">
										<tr>찾으시려는 분류를 클릭하세요.</tr>
									</table>
									
								</div>
<!-- Modal -->
  <div class="modal fade" id="Modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">상점 세부 보기</h4>
        </div>
        <form class="form-horizontal" method="post" action="/store/delete" role="form">
	        <div class="modal-body" id="modal-content">
	        	
	        </div>
	        <div class="modal-footer">
	          <button type="submit" class="btn btn-default" >삭제</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        </div>
        </form>
      </div>
      
    </div>
  </div>
							</div>
						</div>
							
			
			
			        </div>
			    </div>
			</div>
		</div>
	</div>
</body>

</html>