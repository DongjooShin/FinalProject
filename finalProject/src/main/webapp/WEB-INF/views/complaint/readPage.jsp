<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Main content -->
<div class="col-lg-12">
<div class="col-lg-1"></div>
<div class="col-lg-10" style="background-color:  white;">
<section class="content" >
	<div class="row ">
		<!-- left column -->
		<div class="col-md-12" >
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">건의 / 불만</h3>
				</div>
				<!-- /.box-header -->

				<form role="form" action="modifyPage" method="post">
				<c:if test="${member.m_grade ==2 }">
						<select name="cp_state">
						<option value="처리중">처리중</option>
						<option value="처리완료">처리완료</option>
							</select>
				</c:if>
					<input type='hidden' name='cp_complaintNo' value="${complaint.cp_complaintNo}"> <input
						type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

				</form>

				<div class="box-body">
					<div class="form-group">

						<label for="exampleInputEmail1">Title</label> <input type="text"
							name='cp_title' class="form-control" value="${complaint.cp_title}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="cp_content" rows="3"
							readonly="readonly">${complaint.cp_content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label> <input type="text"
							name="m_memberNo" class="form-control" value="${complaint.m_memberNo}"
							readonly="readonly" height="20">
					</div>
				</div>
				<!-- /.box-body -->

			  <div class="box-footer">
			  <c:if test="${member.m_grade ==2 }">
			    <button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
			    <button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
			    </c:if>
			    <button type="submit" class="btn btn-primary" id="goListBtn">GO LIST </button>
			  </div>



			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->


	<div class="row">
		<div class="col-md-12">


				<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv"><span class="bg-green">
					</span></li>
			</ul>
			

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>






					 <input  type="hidden" value="${member.m_memberNo }"id="newReplyWriter">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">새 댓글</h3>
				</div>
				<div class="box-body">
					<label for="exampleInputEmail1"></label>
						 <label for="exampleInputEmail1">내용
						</label> <input class="form-control" type="text"
						placeholder="REPLY TEXT" id="newReplyText">

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">등록
						</button>
				</div>
			</div>



		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->

          
<!-- Modal -->

</section>
</div>
</div>
<!-- /.content -->

<script id="template" type="text/x-handlebars-template">
{{#each .}}
	<div>
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="timeline-header">[{{m_memberno}}]</span>
  <span class="time">
    <i class="fa fa-clock-o"></i>{{ rdate}}
  </span>
	<input type="hidden" class="rno" value="{{rno}}">
  <div class="timeline-body"><h3 id="text">{{replytext}}</h3> </div>
  <div class="check">
  </div>
  </div>
<hr/>
</li>
</div>
{{/each}}
</script>

<script>

$(function () {
	getPage("/publicmana/replies/" + cp_complaintNo + "/1");
})

$(document).on("click",".modiBtn",function(index){
	var button = '<button  class="btn btn-info creaBtn" >수정</button>';
 	var replytext = $(this).parent().parent().find('#text').html();
	var textarea="<textarea class='text'>"+replytext+"</textarea>"; 

 	  $(this).parent().parent().find('.timeline-body').empty();
 		//$(this).parent().empty();
 		//$(this).parent().find('.check').remove();
 		//$('.check').empty();
 	  // $(this).parent().find('.check').empty();
 	  // $(this).parent().parent().find('.check').empty();
 	  //$(this).parent().find('.Btn').removeClass();
 	  $(this).removeClass('modiBtn');
 	  $(this).addClass('creaBtn');
	  $(this).parent().parent().find('.timeline-body').append(textarea); 
 	 	$(this).stopPropagation();
	  

})
$(document).on("click",".remoBtn",function(index){
	var rno = $(this).parent().parent().find('.rno').val();
	
	  $.ajax({
			type:'delete',
			url:'/publicmana/replies/'+rno,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "DELETE" },
			data:JSON.stringify({cp_complaintNo:cp_complaintNo}), 
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("삭제 되었습니다.");
					getPage("/replies/"+cp_complaintNo+"/"+replyPage );
				}
		}});
	  

})
$(document).on("click",".creaBtn",function(index){
	alert($(this).parent().parent().find('.text').val());
 	var rno = $(this).parent().parent().find('.rno').val();
		  var replytext = $(this).parent().parent().find('.text').val();
	  $.ajax({
			type:'put',
			url:'/publicmana/replies/'+rno,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "PUT" },
			data:JSON.stringify({replytext:replytext}), 
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("수정 되었습니다.");
					$('#repliesDiv').empty();
					getPage("/publicmana/replies/"+cp_complaintNo+"/"+replyPage );
				}
		}}); 

})
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var cp_complaintNo = ${complaint.cp_complaintNo};
	var replyPage = 1;

	function getPage(pageInfo) {
		var id = "["+"<c:out value='${member.m_memberNo}' />"+"]";
		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			$('.timeline-header').each(function () {
				if($(this).html() == id ){
					var button = '<button  class="btn btn-info modiBtn" >수정</button>';
					   button += '<button  class="btn btn-info remoBtn" >삭제</button>'
					$(this).parent().find('.check').append(button);
				}
			})
			$("#replycntSmall").html("["+data.pageMaker.totalCount+"]");
			
		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};


	

	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/publicmana/replies/"+cp_complaintNo+"/"+replyPage);
		
	});
	

	$("#replyAddBtn").on("click",function(){
		 var replytextObj = $("#newReplyText");
		 var m_memberno = "<c:out value='${member.m_memberNo}' />";
		 var replytext = replytextObj.val();
		  
		  $.ajax({
				type:'post',
				url:'/publicmana/replies/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({cp_complaintNo:cp_complaintNo, m_memberno:m_memberno, replytext:replytext}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/replies/"+cp_complaintNo+"/"+replyPage );
						replyerObj.val("");
						replytextObj.val("");
					}
			}});
	});


	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
		
	});
	
	

	$("#replyModBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'put',
				url:'/publicmana/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/publicmana/replies/"+cp_complaintNo+"/"+replyPage );
					}
			}});
	});

	
</script>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/publicmana/modifyPage");
		formObj.attr("method", "post");		
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		formObj.attr("action", "/publicmana/removePage");
		formObj.submit();
	});
	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/publicmana/list");
		formObj.submit();
	});
	
});
</script>






