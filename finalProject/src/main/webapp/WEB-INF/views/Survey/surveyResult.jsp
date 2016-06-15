<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<script type="text/javascript">


$(document).ready(function(){
	
	$('#select123').on('change',function(){
	//	alert(this.value);
		var a = this.value;
	//	alert(a+"입니다.");
		
		$.ajax({
		
			url: '/Survey/surveyResult?dateNum='+this.value,
			dataType:'json',
			type: 'post',
			success: function(data){
			//	alert("뭐지");
				var i = 1;
			 $('#resultInfo').html("");

				$.each(data, function(index, sendMessage){
					
					 var ab = "'#main"+i+"'";
					// alert(ab);
					var cc = Math.round(sendMessage.avgSum); //반올림해서 뭐 색칠하던지요
					
					  $('#resultInfo').append("<div class='resultSurvey'>&nbsp;&nbsp;&nbsp;제목 :"+sendMessage.su_title+"&nbsp;&nbsp;&nbsp;시작일 :"+sendMessage.su_startdate+"&nbsp;&nbsp;&nbsp;종료일 :"+sendMessage.su_enddate+"<br>"+
							  "&nbsp;&nbsp;&nbsp;투표수 :"+sendMessage.totalCount +"명&nbsp;&nbsp;&nbsp;투표율 :"+sendMessage.totalCount+"/그룹아파트총인원수%" +"&nbsp;&nbsp;&nbsp평점 :"+sendMessage.avgSum+"/10 </div>");
				
				//	  $('#resultInfo').append("&nbsp;&nbsp;&nbsp;투표수 :"+sendMessage.totalCount +"명&nbsp;&nbsp;&nbsp;투표율 :"+sendMessage.totalCount+"/그룹아파트총인원수%" +"&nbsp;&nbsp;&nbsp평점 :"+sendMessage.avgSum+"/10 </div>");
					  $('#resultInfo').append('<div id="mainBar" class="main'+i+'"><div id="realbar" class="red'+i+'" style= width:'+sendMessage.avgSum*10 +'%;></div></div>');
				//	  $('#resultInfo').append('<div id="detail'+i+'"><a href="javascript:detailclick('+sendMessage.su_group+','+i+')" > 상세보기</a></div>');
				
					  $('#resultInfo').append('<div id="detail'+i+'"><div id="resultContext'+i+'" class="resultContext"></div><div id="resultGrape'+i+'" class="resultGrape"></div></div> <div id="buttonSwitch'+i+'"><input type="button" onclick="detailclick('+sendMessage.su_group+','+i+')" value="상세보기"></div>');
					  $('#resultInfo').append('<div id="detailbut'+i+'"><div>');
					  
					  $('#resultGrape'+i).hide();//테두리 색깔보여서
					  i++;
				});
				
				
			}
			
			
		})
		
		
		
	});
	
	

	
	
});



function detailclick(sugroup, i){
	
/* 	alert("클릭했다");
	alert(sugroup);
	
	alert(i+"i값입니다.");
	 */
	 
	$.ajax({
		
		url: '/Survey/surveyDetail?sugroup='+sugroup,
		dataType:'json',
		type: 'post',
		success: function(data){
		//	alert("서베이 디테일입니다.");
		
			 $('#resultGrape'+i).show();
			
			$.each(data, function(index, sendMessage){
				
				var cc = Math.round((sendMessage.su_sum/sendMessage.su_count));
				
				 //alert("서버디테일성공");
				 
				
//			  	  $("#detail"+i).append("<div class='resultSurvey'>&nbsp;&nbsp;&nbsp;"+sendMessage.su_surveyNo+"."+sendMessage.su_context+"&nbsp;&nbsp;&nbsp;투표수 :"+sendMessage.su_count+"&nbsp;&nbsp;&nbsp;투표율 :"+sendMessage.su_count+"/아파트그룹총인원수"+"&nbsp;&nbsp;&nbsp;평점"+sendMessage.su_sum/sendMessage.su_count*2+"/10"+"<br>" );
//				 $("#detail"+i).append('<div id="mainBar" class="main"><div id="realbar" class="red" style= width:'+sendMessage.su_sum/sendMessage.su_count*20 +'%;></div></div>');
				  
				  $("#resultContext"+i).append("<div class='resultSurvey1'>&nbsp;&nbsp;&nbsp;"+sendMessage.su_surveyNo+"."+sendMessage.su_context+"&nbsp;&nbsp;&nbsp;투표수 :"+sendMessage.su_count+"&nbsp;&nbsp;&nbsp;투표율 :"+sendMessage.su_count+"<br>" );
				  $("#resultGrape"+i).append('<div id="mainBar1" class="main"><div id="realbar1" class="red'+cc+'" style= width:'+sendMessage.su_sum/sendMessage.su_count*20 +'%;></div></div>');
				 
				  //	alert($('#detail'+i).html()+"입니다.");
				
				
			});
			  $("#detailbut"+i).append('<div id="deleteSurvey'+i+'" class="deleteSurvey"><div class="scoreLine">123456789</div><div class="scoreLine1">10</div> <div class=closeDetail><a href="javascript:deleteSurvey('+i+')" > 접어두기</a></div></div>');
	
			  $("#buttonSwitch"+i).hide();
			
		}
		
		
	})
	
	
	
}


function deleteSurvey(divnum){
	
	//alert(divnum+"번삭제");

	$.ajax({
		
		success: function(data){
			
		//	alert("성공");
//			$("#detail"+divnum).html("");
			 $("#resultContext"+divnum).html("");
			 $("#resultGrape"+divnum).html("");
			 $("#detailbut"+divnum).html("");
			 
			 $('#resultGrape'+divnum).hide(); //테두리색보여서
			 
			$("#buttonSwitch"+divnum).show();
		}
		
	});
}


</script>

<style type="text/css">

	#mainBar{
	
		height: 50px;
		width: 36%;
		border-color: black;
		border-style: solid; 
		margin-top: 20px;
		margin-bottom: 40px;
	
	}
	
	#realbar{
		height: 50px;
		background-color: red;
	}

	
	
	
	
    .resultContext {
		
		float: left;
		width: 40%;
		text-align: right;
		padding-right: 2%;
	}
	
	.resultGrape {
		float : left;
		width : 40%;
		border-bottom-color: #727272;
		border-left-color: #727272;
		border-left-width: 0.3em;
		border-bottom-width: 0.3em;
		border-style: solid;
		height: auto;
	
		
	}
	



	
	.main{
	
	
		height: 50px;
		width: 70%;
		padding-top: 2%;
		margin-bottom: 10px;
	}
	
	
	.red{
		height: 35px;
		background-color: #FF2424;
		
	}
	
	.red1{
		height: 35px;
		background-color: #D9534F;
		
	}
	.red2{
		height: 35px;
		background-color: #D9534F;
		
	}
	.red3{
		height: 35px;
		background-color: #5BC0DE;
		
	}
	.red4{
		height: 35px;
		background-color: #F0AD4E;
		
	}
	.red5{
		height: 35px;
		background-color: #FAED7D;
		
	}
	.red6{
		height: 35px;
		background-color: #E5D85C;
		
	}
	.red7{
		height: 35px;
		background-color: #F0AD4E;
		
	}
	.red8{
		height: 35px;
		background-color: #F0AD4E;
		
	}
	.red9{
		height: 35px;
		background-color: #008000;
		
	}
	.red10{
		height: 35px;
		background-color: #008000;
		
	}
	
	
	
	.scoreLine{
		padding-left: 43%;
		text-align: right;
   		letter-spacing: 2em;
   		float: left;
	}
	
	.scoreLine1{
		text-align: left;
   		
	}
	
	.deleteSurvey{
		float: none;
		clear: both;
	
	}
	.closeDetail{
		float: none;
	}
	
	.resultSurvey1{
	
	    margin-bottom: 2em;
  		margin-top: 18px;
	}
</style>
</head>

<body>
	<div class="header">
				 <jsp:include page="../include/head.jsp"></jsp:include>  
	</div>
	삐용
	<div class="sutitle" id="sutitle">
	<select class="form-control" name="su_title" id="select123" >
	
	<c:forEach begin="1" end="12" var="list">
	
		<option value="${list }">${list}월</option>
		
		
	</c:forEach>

	
	</select>
	
	
	
	</div>

	<div id="resultInfo" class="resultInfo"></div>
	

 <div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
  aria-valuemin="0" aria-valuemax="100" style="width:40%">
    40% Complete (success)
  </div>
</div>

<div class="progress">
  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50"
  aria-valuemin="0" aria-valuemax="100" style="width:50%">
    50% Complete (info)
  </div>
</div>

<div class="progress">
  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60"
  aria-valuemin="0" aria-valuemax="100" style="width:60%">
    60% Complete (warning)
  </div>
</div>

<div class="progress">
  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70"
  aria-valuemin="0" aria-valuemax="100" style="width:70%">
    70% Complete (danger)
  </div>
</div>


	
	
	<%-- <c:forEach begin="1" end="12" var="list2">
	
		제목 : ${list2.su_title }
		
		
	</c:forEach>

	
	<c:forEach items="${list }" var="list">
	<div id="resultInfo">
	제목: ${list.su_title } 
	
	총 투표수 :${list2.totalCount }  투표율 : ${list2.totalCount }/아파트그룹총인원 평점 :  ${list2.su_avgSum}
	</div>
	<div id="resultbarMain" >
	
	
	<div id="realbar"></div>
	
	36%
	</div>
	
	<a href="" onclick="detailclick()"> 상세보기</a> : Ajax로 펼치기
	 <c:forEach items="${list2 }" var="list2"> ${list2 }</c:forEach>
	</c:forEach>
	
	
	<br>
	
	 --%>

	

</body>
</html>