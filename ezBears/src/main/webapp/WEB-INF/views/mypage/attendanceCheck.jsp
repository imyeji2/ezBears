<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../inc/top.jsp"%>
<link href= "<c:url value='/lib/fullcalendar/main.css'/>"  rel='stylesheet' />
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
<!-- Blank Start -->
<div class="container-fluid pt-4 px-4">
    <div class="row vh-100 bg-secondary rounded align-items-center justify-content-center mx-0">
        <div class="col-md-8 text-center">
        	<h3>월별 근태조회</h3>
        	<br>
       
       		<div id='calendar'></div>
        </div>
    </div>
</div>
<!-- Blank End -->


<%@include file="../inc/bottom.jsp"%>