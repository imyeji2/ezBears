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
	    	timeZone: 'UTC',
	        initialView : 'dayGridMonth', //초기 캘린더 화면
	        headerToolbar : {
	        start : 'prev next today',
	        center : 'title',
	        end : 'dayGridMonth,dayGridWeek,dayGridDay'
         },
		    selectable : true, //일자 드래그 가능
		    droppable : true,
		    editable : true,
		    nowIndicator: true, 
		    locale: 'ko', // 한국어로 변경
		    //일정 출력시 앞에 시간뜨는거 숨기기
		    eventTimeFormat: { hour: 'numeric', minute: '2-digit', meridiem: false },

	        // 일정 렌더링을 사용자 정의
	        eventContent: function(arg) {
	            var eventTitle = arg.event.title;
	            return { html: '<div class="event-title">' + eventTitle + '</div>' };
	      }
	    
	    
	  
    });
    
    var events = [];
		
    <c:forEach items="${list}" var="event">
		var id =  '<c:out value="${event.SCHEDULE_NO}"/>'; // 일정 수정시 필요함
    	var title = '<c:out value="${event.SCHEDULE_TITLE}" />';
	    var start = '<c:out value="${event.SCHEDULE_START}" />';
	    var end = '<c:out value="${event.SCHEDULE_END}" />';
	 
	    // events 배열에 추가
	    events.push({
	    	id : id,
	        title: title,
	        start: start,
	        end: end + 'T23:59:59',
	        backgroundColor: '#D1C4E9', // 일정 배경색 나중에 바꾸기
	    	textColor : 'black' //일정 글씨색 나중에 바꾸기
	    });
	    // 콘솔에 값 출력
	    console.log("id: "+ id +", title: " + title + ", start: " + start + ", end: " + end);
	</c:forEach>


	calendar.setOption('events', events);
    console.log(events);
	
   
    calendar.render();
/* ----------------- 일정 수정 & 삭제 ----------------- */    
    
    // 일정을 클릭할 때 발생하는 이벤트 핸들러
    calendar.setOption('eventClick', function(info) {
        var event = info.event; // 클릭한 일정 가져오기

        // 팝업 또는 컨텍스트 메뉴 표시
        var choice = confirm('일정을 수정 또는 삭제하시겠습니까?');
        if (choice) {
            // 사용자가 [확인] 선택한 경우
            var action = prompt('수정 또는 삭제를 입력하세요. (수정/삭제)');

            if (action === '수정') {
                // 수정 로직 
                alert('일정을 수정합니다.');
                var newTitle = prompt('새로운 일정 이름', event.title);
                var newStartDate = prompt('새로운 시작 날짜 (YYYY-MM-DD)', event.startStr.split('T')[0]); //시간표시 제거
                var newEndDate = prompt('새로운 종료 날짜 (YYYY-MM-DD)', event.endStr.split('T')[0]);

                if (newTitle !== null && newStartDate !== null && newEndDate !== null) {
                    
                    var eventId = event.id; 
                    
                    $.ajax({
                        url: "<c:url value= '/myBoard/eventUpdate'/>", 
                        type: 'POST',
                        data: {
                            eventId: eventId,
                            newTitle: newTitle,
                            newStartDate: newStartDate,
                            newEndDate: newEndDate 
                        },
                        success: function(response) {
                            if (response.success) {
                                alert('일정이 수정되었습니다.');
                                event.setProp('title', newTitle);
                                event.setStart(newStartDate); 
                                event.setEnd(newEndDate+ 'T23:59:59'); 
                                calendar.render(); 
                            } else {
                                alert('일정 수정에 실패했습니다.');
                            }
                        },
                        error: function() {
                            alert('일정 수정 중 오류가 발생했습니다.');
                        }
                    });
                }
                
           
            }else if (action === '삭제') {
                // 삭제 로직 추가
                 var eventId = event.id;

                if (confirm('정말로 이 일정을 삭제하시겠습니까?')) {
                    $.ajax({
                        url: "<c:url value='/myBoard/deleteEvent'/>", 
                        type: 'POST',
                        contentType: 'application/json', 
                        data: JSON.stringify({
								eventId: eventId 
						}),
                        success: function(response) {
                            if (response.success) {
                                alert('일정이 삭제되었습니다.');
                                event.remove(); // 캘린더에서 일정 제거
                            } else {
                                alert('일정 삭제에 실패했습니다.');
                            }
                        },
                        error: function() {
                            alert('일정 삭제 중 오류가 발생했습니다.');
                        }
                    });
                }
            } else {
                alert('올바른 작업을 선택해주세요. (수정/삭제)');
            }
        }
 
    
    }); 
    
  
});
</script>

<div id="insertcal">
<div class="btn">
			<a href='<c:url value='/myBoard/Calender_write?mBoardNo=${mBoardNo }'/>' role="button"
				class="btn btn-sm btn-primary schedulein">일정등록</a>
</div>
</div>
<div id="cal">
	<div id='calendar' class='calendar'></div>
</div>	
		<div>
			<input type="hidden" name="mBoardNo" value="${mBoardNo}"> 
			<input type="hidden" name="userid" value="${userid}">
			<input type="hidden" id="list" name="list" value="${list}">
		</div>
	
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Recent Sales End -->



<%@include file="../inc/bottom.jsp"%>
