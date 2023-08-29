<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="com.ez.ezBears.attendance.model.AttendanceVO"%>

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
				end : ''
			},
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},
			//initialDate: '2023-08-01', // 초기 날짜 설정 (설정 x => 오늘날짜)
			selectable : false, // 달력 일자 드래그 가능
			droppable : false,
			editable : false,
			nowIndicator: true, 
			locale: 'ko', // 한국어로 변경해주기
			events : [
				<%List<AttendanceVO> attendanceList = (List<AttendanceVO>)request.getAttribute("list");  %>
				<%if(attendanceList != null && !attendanceList.isEmpty()){ %>
					<%for(AttendanceVO vo : attendanceList){ %>
					{
						title : '출근',
						start : '<%=vo.getInTime()%>',
						display : 'block'
						
					},
					{
						title : '퇴근',
						start : '<%=vo.getOutTime()%>',
						display : 'block',
						backgroundColor : 'red'
					},
					<%}%>
				<%}%>
				
			]
			
		});
		calendar.render();
	});

</script>
<style>
	.vh-110{
		height: 110vh;
	}
</style>
<!-- Blank Start -->
<div class="container-fluid pt-4 px-4">
    <div class="row vh-110 bg-secondary rounded align-items-center justify-content-center mx-0">
            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	           <ol class="breadcrumb" style="margin-left: 0.5%;">
	             <li class="breadcrumb-item active" aria-current="page">
	                <a href="<c:url value='/attendanceManagement/attendanceSearch'/>">근태 관리</a>
	             </li>
	             <li class="breadcrumb-item active" aria-current="page">출/퇴근 현황</li>
	           </ol>
         	</nav>
        <div class="col-md-8 text-center">
        	<h3>월별 근태조회</h3><br>
       		<div id='calendar'></div>
       
        </div>
    </div>
</div>
<!-- Blank End -->

<%@include file="../inc/bottom.jsp"%>