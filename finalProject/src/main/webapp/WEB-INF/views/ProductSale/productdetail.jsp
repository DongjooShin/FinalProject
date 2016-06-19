

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="../css/Min/bootstrap/bootstrap.min.css" rel="stylesheet">
  <style type="text/css">
 @import url("http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css");
 .panel-pricing {
  -moz-transition: all .3s ease;
  -o-transition: all .3s ease;
  -webkit-transition: all .3s ease;
}
.panel-pricing:hover {
  box-shadow: 0px 0px 30px rgba(0, 0, 0, 0.2);
}
.panel-pricing .panel-heading {
  padding: 20px 10px;
}
.panel-pricing .panel-heading .fa {
  margin-top: 10px;
  font-size: 58px;
}
.panel-pricing .list-group-item {
  color: #777777;
  border-bottom: 1px solid rgba(250, 250, 250, 0.5);
}
.panel-pricing .list-group-item:last-child {
  border-bottom-right-radius: 0px;
  border-bottom-left-radius: 0px;
}
.panel-pricing .list-group-item:first-child {
  border-top-right-radius: 0px;
  border-top-left-radius: 0px;
}
.panel-pricing .panel-body {
  background-color: #f0f0f0;
  font-size: 40px;
  color: #777777;
  padding: 20px;
  margin: 0px;
}
 </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    
<script type="text/javascript">




$(document).ready(function(){
	
	//alert("키자마자 ajax 메소드호출");
	reloadpage();//키자마자 댓글불러오는 메소드입니다.
		
	$("#retextbtn").on("click", function() {
		
	//	alert("클릭되었다.2");
		var replytext = $("#retext").val();
		var pro_no = $(".pro_no").val();

		$.ajax({
			url : '/ProductSale/replyadd',
			type : 'post',
			data : {
				"replytext" : replytext,
				"pro_no" : pro_no
			},
			dataType : 'text',
			success  : function(data){
				
			//	alert("성공");
				reloadpage();
			}
			
		})
		
		
	});	

	
	
});

function reloadpage(){ //클릭시 리스트 다시호출시켜야되.
	
//	alert("리페이지 하겠습니다.");
	
	
	var pro_no = $(".pro_no").val();
	
	
	$.ajax({ 																							 //여기가 켜지자마사 댓글목록을 불러와줘
	
		url : '/ProductSale/Replylist',
		type :'post',
		data : {
			"pro_no" : pro_no
		},
		dataType : 'json',
		success : function(data){
			$('.replydiv').empty();
																										//alert("목록부르기성공");
			$.each(data, function(index, product){
				
				
			
			var html2 = '<div class="bb">';
				html2 += '<div>';
				html2 +='목록 번호:'+product.re_no+'작성자 :'+product.m_memberno+'날짜 : '+product.re_date +'';
				html2 +='<div>글 내용:'+product.re_text+'</div>';
				html2 +='<button class="deleteReply" onclick="deleteReply('+product.re_no+","+ product.pro_no+')" >삭제하기</button></div>';
				html2 += '</div>';
				$('#replydiv').append(html2);
			
			});
			
		}
		
	
	});
	
	
	
}



function maxnum(formdata){

	//alert("함수로 왔다.")
	
	if(formdata.maxnum > formdata.check_num){
		alert("최대구매수량보다 작게 입력하세요");
		return false;
	}
	else if(formdata.check_num > totalnum){
		alert("재고가 부족합니다.");
		return false;
	}
	
	
	
}


function deleteReply(rno,pno){
	
	//alert("삭제버튼으로 왔습니다.");
	
	$.ajax({
		
		url : '/ProductSale/deleteRno',
		type : 'post',
		data :{ "rno" : rno,
			   "pno" : pno
				},	
		dataType : 'text',
		success : function(data){
			
		//	alert("데이터삭제 성공");
			
			reloadpage();
			
		}
	
	});
	
}


</script>
 
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


</head>
<body>

 <form action="/ProductSale/proCheck" method="get"  >
 
    <section id="plans">
        <div class="container">
            <div class="row">

             
                <!-- item -->
                <div class="col-md-11 text-center">
                    <div class="panel panel-success panel-pricing">
                       
                        <div class="panel-body text-center">
                      		<p><strong>목록번호 : ${product.pro_no }</strong></p>
                            <p><strong>판매자 : ${product.m_memberNo }</strong></p>
                            <p><strong>연락처 :${product.pro_tel }</strong></p>
                            <p><strong>시작일 :${product.pro_startdate } ~ 종료일 : ${product.pro_enddate }</strong></p>
                          
                        
                        </div>
                        <ul class="list-group text-center">
                        <li class="list-group-item"><i class="fa fa-check"></i>분류 : ${product.pro_group  }</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>판매상품명 : ${product.pro_name }</li>
                            <li class="list-group-item"><i class="fa fa-check"></i>판매가격 : ${product.pro_price }</li>
                          
                            <li class="list-group-item"><i class="fa fa-check"></i>구매수량:<input type="text" name="check_num"> /최대구매수량${product.pro_maxnum} 남은수량 :${product.pro_num }</li>
                           
       						<li class="list-group-item"><i class="fa fa-check"></i>택배비용 : ${product.checkPost }원</li>
                          
                            <li class="list-group-item"><i class="fa fa-check"></i>판매내용 : ${product.pro_context }</li>
                            
                            
                          <li class="list-group-item"><i class="fa fa-check"></i>이미지 : 
                            <c:if test="${product.pro_img1 != null}">
				
						<c:set var="head"
							value="${fn:substring(product.pro_img1,0,fn:length(product.pro_img1)-4) }"></c:set>
						<c:set var="pattern"
							value="${fn:substringAfter(product.pro_img1, head) }"></c:set>
						 <img src="../M_upload1/${head }_small${pattern}" /> 
						
					</c:if>
					
                            </li>
                            
                            
                            
                            
                        </ul>
                        
                        
                        <div class="panel-footer">
                    
                       <input type="hidden" name="maxnum" value="${product.pro_maxnum}">
                       <input type="hidden" name="totalnum" value="${product.pro_num }">
                        <input type="hidden" name="check_price" value="${product.pro_price }">
                       <input type="hidden" name="check_seller" value="${product.m_memberNo }">
                       <input type="hidden" name="check_name" value="${product.pro_name }">
                	   <input type="hidden" class="pro_no" name="pro_no" value="${product.pro_no }">
                	   <input type="hidden" name="check_Post" value="${product.checkPost }">
                	   <input type="hidden" name="check_img1" value="${product.pro_img1 }">
                	   
					  
					  
					    <input type="submit" value="구매하기" onclick="maxnum(this.form)">
                       
                       </form>
                                              
                        </div>
                    </div>
                </div>
                <!-- /item -->

            </div>
            
        </div>
    </section>


	
     	<div>
       <h2>댓글 목록</h2>
      
      	 <textarea name="re_text" id="retext"></textarea>
				<button id="retextbtn">댓글달기</button>	
       </div>
       
       <div class="replydiv" id="replydiv">
       </div>
            

</body>
</html>