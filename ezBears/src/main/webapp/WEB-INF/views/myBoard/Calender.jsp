<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>

<div class="container-fluid pt-4 px-4" id="board_style">
	<div class="bg-secondary text-center rounded">
		<div class="bg-secondary rounded h-100 p-4">
			<c:import url="/myBoard/myBoardNavTab?mBoardNo=${mBoardNo}"></c:import>
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active">

<link href="<c:url value='/lib/fullcalendar/main.css'/>" rel='stylesheet' />
<script src="<c:url value='/lib/fullcalendar/main.js'/> "></script>
<script src="<c:url value='/lib/fullcalendar/locales-all.min.js'/> "></script>
           

<script>
$.ajax({
    url: '<c:url value ="/myBoard/Calender"/>',
    type: 'GET',
    dataType: 'json',
    success: function(res){
       var list = res;
       console.log(list);
       alert(res);
       
       
        var calendarEl = document.getElementById('calendar');
       
       var events = list.map(function(item) {
          return {
            title : item.SCHEDULE_TITLE,
            start : item.reservationDate + "T" + item.reservationTime
         }
       });
       
      var calendar = new FullCalendar.Calendar(calendarEl, {
         events : events,
         eventTimeFormat: { // like '14:30:00'
             hour: '2-digit',
             minute: '2-digit',
             hour12: false
           }
      });
      calendar.render();
    },
 });
</script>

<div id="insertcal">
<div class="btn">
			<a href='<c:url value='/myBoard/Calender_write?mBoardNo=${mBoardNo }'/>' role="button"
				class="btn btn-sm btn-primary schedulein">일정등록</a>
</div>
</div>
	<div id='calendar'></div>
	
		<div>
			<input type="text" name="mBoardNo" value="${mBoardNo}"> 
			<input type="text" name="userid" value="${userid}">
		</div>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- Recent Sales End -->



<%@include file="../inc/bottom.jsp"%>
