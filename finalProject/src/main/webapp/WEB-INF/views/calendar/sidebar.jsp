<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' id='spacious-genericons-css'
   href='/resources/bootstrap/bootstrap.min.css' type='text/css'
   media='all' />

<link rel='stylesheet' id='spacious-genericons-css'
   href='/resources/dist/css/mainFont.css' type='text/css' media='all' />

<link rel='stylesheet' id='google_fonts-css'
   href='//fonts.googleapis.com/css?family=Lato&#038;ver=e7d1598c32c9180e5e08e97723f82bcd'
   type='text/css' media='all' />
<link rel='stylesheet' id='spacious_style-css'
   href='/resources/dist/css/main1.css' type='text/css' media='all' />



<!-- datepicker -->



<!-- modal -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!--  jQuery UI CSS파일  -->
<link rel="stylesheet"
   href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
   type="text/css" />


<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet"
   href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.min.css" />
<!-- <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> -->

<link rel='stylesheet'  href='/resources/dist/css/main1.css' type='text/css' rel="stylesheet" />
<style type="text/css">
#secondary ul li a{
   color: #0fbe7c;
}
</style>

<!-- datepicker스크립트 -->
<script type="text/javascript">
   //script구문 내부에 해당 메소드를 입력합니다.
   $(function() {
      // FullCalnedar


      $(document).ready(
            
            
            
            function() {
               $('.datepicker').datepicker(
                     {
                        dateFormat : 'yy-mm-dd',
                        changeMonth : true,
                        changeYear : true,
                        nextText : '다음 달',
                        prevText : '이전 달',
                        dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일',
                              '토요일', '일요일' ],
                        dayNamesMin : [ '일','월', '화', '수', '목', '금', '토'
                               ],
                        monthNamesShort : [ '1', '2', '3', '4', '5',
                              '6', '7', '8', '9', '10', '11', '12' ],
                        monthNames : [ '1월', '2월', '3월', '4월', '5월',
                              '6월', '7월', '8월', '9월', '10월', '11월',
                              '12월' ]

                     });

            });

   });
</script>
</head>
<body>
<jsp:include page="../include/head.jsp"></jsp:include>
   <div class="container" id="page">
   
      <div class="col-md-3">
         
    <jsp:include page="../Community/CommunitySidebar.jsp"></jsp:include>
           
         
      </div>

      <div class="col-md-8">
         <!-- 일정추가모달 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
         <br>

         <c:if test="${member.m_grade eq 2 }">
         <div class="container" id="calContainer" style="display: inline;">
            <!-- <h2>Modal Example</h2> -->
            <!--   Trigger the modal with a button  class="btn btn-info btn-lg" -->
            <button type="button" class="btn btn-default" data-toggle="modal"
               data-target="#myModal">일정 추가</button>

            <!--    Modal -->
            <div class="modal fade" id="myModal" role="dialog">
               <div class="modal-dialog">

                  <!--  Modal content -->
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">일정 추가</h4>
                     </div>
                     <div class="modal-body">


                        <form class="form-horizontal" method="post" action="/calendar/add" role="form">
                           <div class="form-group">
                              <label for="inputSchedule" class="col-sm-2 control-label">일정
                                 제목</label>
                              <div class="col-sm-9">
                                 <input type="text" id="inputSchedule" class="form-control"
                                    name="c_schedule" size="30px">
                              </div>
                              <div class="col-sm-1">
                                 <%-- <input type="hidden" id="inputSchedule" name="apt_APTGNo"
                                    value="${member.getApt_APTGNo() }"> --%>
                              </div>
                           </div>
                           <div class="form-group">
                              <label for="textareaContent" class="col-sm-2 control-label">일정
                                 내용</label>
                              <div class="col-sm-9">
                                 <textarea rows="3" cols="3" id="textareaContent" name="c_content"></textarea>
                              </div>
                              <div class="col-sm-1">
                                 <%-- <input type="hidden" id="inputSchedule" name="apt_APTGNo"
                                    value="${member.getApt_APTGNo() }"> --%>
                              </div>
                           </div>
                           <div class="form-group">
                              <label for="inputStart" class="col-sm-2 control-label">시작일</label>
                              <div class="col-sm-9">
                                 <input type="text" id="inputStart"
                                    class="form-control datepicker" name="c_startdate">
                              </div>
                              <div class="col-sm-1">
                                 <input type="hidden" id="inputStart" name="c_startdateHidden">
                              </div>
                           </div>
                           <div class="form-group">
                              <label for="inputEnd" class="col-sm-2 control-label">종료일</label>
                              <div class="col-sm-9">
                                 <input type="text" id="inputEnd"
                                    class="form-control datepicker" name="c_enddate">

                              </div>
                              <div class="col-sm-1">
                                 <input type="hidden" id="inputEnd" name="c_enddateHidden">
                              </div>
                           </div>

                           <div class="modal-footer">
                              <button type="submit" id="success" class="btn btn-default"
                                 value="성공">
                                 성공
                                 <button type="button" class="btn btn-default"
                                    data-dismiss="modal">닫기</button>
                           </div>


                        </form>


                     </div>

                  </div>

               </div>
            </div>

            <!-- </div> -->

            <!-- 일정삭제@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2 -->
            
            <!-- <h2>Modal Example</h2> -->
            <!--   Trigger the modal with a button  class="btn btn-info btn-lg" -->
            <button type="button" class="btn btn-default" data-toggle="modal"
               data-target="#myModal2" style="margin-left: 10px;">일정 삭제</button>

            <!--    Modal -->
            <div class="modal fade" id="myModal2" role="dialog">
               <div class="modal-dialog">

                  <!--  Modal content -->
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">일정 삭제</h4>
                     </div>
                     <div class="modal-body">


                        <form class="form-horizontal" method="post" action="/calendar/delete" role="form">
                           <div class="form-group">
                              <label for="inputSchedule1" class="col-sm-2 control-label">일정
                                 내용</label>
                              <div class="col-sm-9">
                                 <input type="text" id="inputSchedule1" class="form-control"
                                    name="c_schedule" size="30px">
                              </div>
                              <div class="col-sm-1">
                                 <input type="hidden" id="inputSchedule"
                                    name="c_scheduleHidden">
                              </div>
                           </div>
                           <div class="form-group">
                              <label for="inputStart1" class="col-sm-2 control-label">시작일</label>
                              <div class="col-sm-9">
                                 <input type="text" id="inputStart1"
                                    class="form-control datepicker" name="c_startdate">
                              </div>
                              <div class="col-sm-1">
                                 <%-- <input type="hidden" id="inputStart" name="apt_APTGNo"
                                    value="${member.getApt_APTGNo() }"> --%>
                              </div>
                           </div>
                           <div class="form-group">
                              <label for="inputEnd1" class="col-sm-2 control-label">종료일</label>
                              <div class="col-sm-9">
                                 <input type="text" id="inputEnd1"
                                    class="form-control datepicker" name="c_enddate">
                                 <!-- <input type="text" id="inputEnd"
                                       class="form-control datepicker" name="c_enddate"> -->
                              </div>
                              <div class="col-sm-1">
                                 <input type="hidden" id="inputEnd" name="c_enddateHidden">
                              </div>
                           </div>

                           <div class="modal-footer">
                              <button type="submit" id="success" class="btn btn-default" value="성공">성공</button>
                                 <button type="button" class="btn btn-default"
                                    data-dismiss="modal">닫기</button>
                           </div>


                        </form>


                     </div>

                  </div>

               </div>
            </div>

         </div>
         </c:if>

         <!-- 캘린더@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
         <jsp:include page="calendar.jsp"></jsp:include>
      </div>
      </div>
   </div>

</body>
</html>