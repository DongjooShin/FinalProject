<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
   src="/resources/jquery/jQuery-2.1.4.min.js"></script>

<script type="text/javascript">
   $(function() {
      
      $('#sixthContent').load("/member/passwordCheck");
      $('#firstContent1').load("/calendar/exam");
      $('#firstContent2').load("/groupNotice/exam");
      /* $('#thirdContent').load("/publicmana/list"); */
      
      $('#firstManu').css('background', '#0fbe7c');

      $('#firstManu').css('background', '#09b9e5');
      $('#firstManu').css('display', 'block');

      $('#firstManu').click(function() {
         $('.manu').css('background-color', 'rgba(0, 0, 0, 0.3)');
         $('#firstManu').css('background-color', '#0fbe7c');
         $('.content').css('display', 'none');
         $('#firstContent').css('display', 'block');
      });

      $('#secondManu').click(function() {
         $('.manu').css('background-color', 'rgba(0, 0, 0, 0.3)');
         $('#secondManu').css('background-color', '#0fbe7c');
         $('.content').css('display', 'none');
         $('#secondContent').css('display', 'block');
      });

      $('#thirdManu').click(function() {
         $('.manu').css('background-color', 'rgba(0, 0, 0, 0.3)');
         $('#thirdManu').css('background-color', '#0fbe7c');
         $('.content').css('display', 'none');
         $('#thirdContent').css('display', 'block');

      });

      $('#fourthManu').click(function() {
         $('.manu').css('background-color', 'rgba(0, 0, 0, 0.3)');
         $('#fourthManu').css('background-color', '#0fbe7c');
         $('.content').css('display', 'none');
         $('#fourthContent').css('display', 'block');

      });
    }); 
   
</script> 
<script type="text/javascript">
 $(function () {
   
      $('#fifthManu').click(function() {
         $('.manu').css('background-color', 'rgba(0, 0, 0, 0.3)');
         $('#fifthManu').css('background-color', '#0fbe7c');
         $('.content').css('display', 'none');
         $('#fifthContent').css('display', 'block');

      });

      $('#sixthManu').click(function() {
         $('.manu').css('background-color', 'rgba(0, 0, 0, 0.3)');
         $('#sixthManu').css('background-color', '#0fbe7c');
         $('.content').css('display', 'none');
         $('#sixthContent').css('display', 'block');

      });

})
</script>

<style type="text/css">
#mypageUl {
   margin-top: -53px;
}

#mypageUl li {
   display: inline;
   float: left;
   position: relative;
   margin-right: 5px;
   padding: 10px;
   background-color: rgba(0, 0, 0, 0.3);
   padding: 15px 35px 15px 35px;
   border-radius: 3px;
   color: #fff;
   font-size: 21px;
}
#mypageLayout {
   border: 3px solid #eaeaea;
   border-top: 4px solid #eaeaea;
   display: inline-block;
   width: 100%;
   margin-top: 70px;
}

.manu {
   color: white;
}
</style>
</head>
<body>
   <div class="header">
      <jsp:include page="../include/head.jsp"></jsp:include>
   </div>
   <div id="page"
      style="background: white; display: inline-block;  margin-left: 7.9%;">
      <div class="col-md-12">
         <div id="mypageLayout">
            <ul id=mypageUl>
                  <jsp:include page="../include/aaa.jsp"></jsp:include>
            
            </ul>
            <br>


            <div class="col-md-12">
               <div id="firstContent" class="content  " style="height: 500px;">
                  <div id="firstContent1">
                  
                  </div>
                  
                     <div id="firstContent2">
                  
                  </div>
               </div>



               <div id="secondContent" class="content "
                  style="height: 500px;"></div>



               <div id="thirdContent" class="content "
                  style=" height: 500px;"><jsp:include page="../complaint/complaintList.jsp"></jsp:include></div>



               <div id="fourthContent" class="content "
                  style="background: red; height: 500px;"></div>


               <div id="fifthContent" class="content "
                  style="background: green; height: 600px;"></div>

               <div id="sixthContent" class="content "></div>
            </div>

         </div>
      </div>
   </div>    

</body>
</html>