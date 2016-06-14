<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

<!-- Modal -->

    <div class="modal-dialog">
     <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">상점 세부 보기</h4>
        </div>
        <form class="form-horizontal" method="post" action="/store/delete" role="form">
	        <div class="modal-body" id="modal-content">
	        	<img alt="food" src="/resources/images/syeon/bb.jpg">
		        <p>상가이름 : 김밥천국</p>
		        <p>상가전화번호 : 02)324-0394</p>
		        <label>오픈시간 : 1:59</label> ~
		        <label>마감시간 : 21:00</label>
		        <p>상가위치 : 1F B3</p>
		        <p>상가소개 : 천국의 그맛!!!!!!!!!!!</p>
	        
	        </div>
	        <div class="modal-footer">
	          <button type="submit" class="btn btn-default" >삭제</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        </div>
        </form>
      </div>
    
      
    </div>

</body>
</html>