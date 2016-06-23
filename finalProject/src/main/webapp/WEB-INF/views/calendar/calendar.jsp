<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

  
  
<link rel='stylesheet' type='text/css' href='http://arshaw.com/css/main.css?6' />
<link rel='stylesheet' type='text/css' href='http://arshaw.com/css/fullcalendar.css?3' />
 

<link rel='stylesheet' type='text/css' href='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.css' />
<script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-1.10.2.min.js'></script>
<script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/jquery/jquery-ui-1.10.3.custom.min.js'></script>
<script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.6.3/fullcalendar/fullcalendar.min.js'></script>


<!-- dialog -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style type="text/css">
.fc-sat {color:blue; background: #ebf8ff}
.fc-sun {color:red; background: #fff0f0}

</style>
<script type='text/javascript'>


      $(function () {
         
      
         var list = [];//리스트
         $.ajax({
            url : '/list',
            type : 'post',
            dataType : 'json',
            success : function(json) {
               
               for (var i = 0; i < json.length; i++) {
                  var jsonObj = {};//객체
                  
                  jsonObj.title = json[i].c_schedule;
                  jsonObj.start = json[i].c_startdate;
                  jsonObj.end = json[i].c_enddate;
                  jsonObj.description=json[i].c_content;

                  list.push(jsonObj);
                 
               }
               $('#calendar').fullCalendar({
                  header : {
                     left : 'prev,next today',
                     center : 'title',

                     right : 'momth'
                  },
                  editable : true,
                  events : list,
                  eventClick : function(calEvent, jsEvent, view) {

                      var start = $.fullCalendar.formatDate(calEvent.start, 'yyyy-MM-dd');
                      var end = $.fullCalendar.formatDate(calEvent.end, 'yyyy-MM-dd');
                      if(end ==null){
                         end=star;
                      }
                     $("#name").val(calEvent.title);

                     $("#start").val(start);

                     $("#end").val(end);
                     
                     $("#description").val(calEvent.description);

                     $('#Modal').modal("show");
                  },
                  firstDay: 0,            //---   0. 일요일
                  weekends: true,
                  allDaySlot: true,
                  allDayText: '종일',
                  axisFormat : 'hh:mm tt',
                  slotMinutes: 30,
                  defaultEventMinutes: 60,
                  firstHour: 9,
                  timeFormat: 'hh:mm tt',
                  columnFormat: {month: 'ddd', week: 'M/d ddd', day: 'M/d dddd'},
                  titleFormat: {month: 'yyyy년 M월', week: 'yyyy년 M월 d일{ — [yyyy년] [M월] d일 }', day: 'yyy y년 M월 d일 dddd'},
                  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] ,
                  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], 
                  dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토']
                  
               });
               
            },
            error : function() {
               alert('실패');
            }

         })
         

         
         
         
      });



</script>
</head>
<body style="background-color:white;">
   <div id='calendar' style='margin: 0; font-size: 13px'></div>
   
   
  <!-- Modal -->
  <div class="modal fade" id="Modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">일정 세부 보기</h4>
        </div>
        
        <div class="modal-body">
        <form class="form-horizontal" method="post" action="/calendar/delete" role="form">
                           일정 제목<input type="text" name="c_schedule" id="name" class="form-control"/>
                           일정 시작일<input type="text" name="c_startdate" id="start" class="form-control">
                           일정 종료일<input type="text" name="c_enddate" id="end" class="form-control"/>
                    일정 내용<textarea rows="3" cols="3" name="c_content" id="description"></textarea>
             <c:if test="${member.m_grade eq 2 }">
             <button type="submit" class="btn btn-default" >삭제</button>
           </c:if>
           <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          
        
        </form>
        </div>
      </div>
      
    </div>
  </div>

</body>
</html>