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
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
       initialView : 'dayGridMonth', //초기 캘린더 화면
       headerToolbar : {
          start : 'prev next today',
          center : 'title',
          end : 'dayGridMonth,dayGridWeek,dayGridDay'
       },
 
    // --- ajax --------
   /* $.ajax({
       type: 'POST'
       ,cache: false
       ,url: "/myBoard/addEvent"
       ,dataType: 'json'
       ,contentType : "application/x-www-form-urlencoded; charset=UTF-8"
       ,success: function(event){
           var events = [];
           console.log(event);
           if(event.pValue != null && event.pValue === 'private'){
               events.push({
                   title : event.title
                   ,start : event.start
                   ,end : event.end
                   ,color : 'red'
           });
               */
       /* 일정등록 json으로 변환후 ajax 방식으로 등록   */
   
       
     
       events: [
 	      
 	      {
 	        title: '워크샵',
 	        start: '2023-08-07',
 	        end: '2023-08-10',
 	        backgroundColor: '#D1C4E9', // 일정 배경색    
 	    	 textColor : 'black'
 	      },
 	  		
 	      {
 	    	 title: '휴가',
  	     start: '2023-08-16',
  	     end: '2023-08-18',
  	     backgroundColor: '#F48FB1',
  	     textColor : 'black'
 	      }], 
 	   	
       titleFormat : function(date) {
          return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
       },
       //initialDate: '2023-08-01', // 초기 날짜 설정 (설정 x => 오늘날짜)
       selectable : true, // 달력 일자 드래그 가능
       droppable : true,
       editable : true,
       nowIndicator: true, 
       locale: 'ko' // 한국어로 변경해주기
      
    });
    calendar.render();
    
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
