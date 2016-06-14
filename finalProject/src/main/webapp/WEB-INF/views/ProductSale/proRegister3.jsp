<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01

 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
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


 <script src="https://code.jquery.com/jquery.js"></script>

 
</head>
<body>


<script type="text/javascript">

//폼객체를 불러와서
var form = $('form')[0];
//FormData parameter에 담아줌
var formData = new FormData(form);


$(function(){
    $("#uploadbutton").click(function(){
        var form = $('form')[0];
        var formData = new FormData(form);
            $.ajax({
               url: '/ProductSale/proRegister3',
               processData: false,
                   contentType: false,
               data: formData,
               type: 'GET',
               success: function(result){
                   alert("업로드 성공!!");
               }
           });
        });
})





</script>






<body>

<form action="/" method="post" onsubmit="return upload();">
 <fieldset>
    <legend>Upload photo</legend>
   <input type="file" name="photo" id="photo">
   <input type="submit" value="Upload">
  </fieldset>
</form>


</body>

</html>
