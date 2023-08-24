<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/css/jquery-ui.min.css'/>"type="text/css">
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script>
	var jb = jQuery.noConflict();
	jb(function() {
		jb("#schedulStart").datepicker({
			dateFormat: 'yy-mm-dd',
			changeYear: true,
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		});
		
		jb("#schedulEnd").datepicker({
			dateFormat: 'yy-mm-dd',
			changeYear: true,
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		});
	});
</script>
<c:if test="${type=='write'}">
	<c:set var="url" value="/myBoard/Calender_write?mBoardNo=${mBoardNo }"/>
</c:if>
<c:if test="${type=='edit'}">
	<c:set var="url" value="/myBoard/Calender_edit/${sc.scheduleNo}"/>
</c:if>
<div class="container-fluid pt-4 px-4" id="board_style">
	<div class="bg-secondary text-center rounded p-4">
		<div class="bg-secondary rounded h-100 p-4">
			<form method="post" action="<c:url value='/myBoard/Calender_write'/>">
			 	<input type ="hidden" name ="userid" id="userid" value="${userid }">
				<input type="hidden" name="myBoardNo" id="myBoardNo"value="${myBoardInfoVo.myBoardNo}"> 
				<input type="hidden" name="memNo" id="memNo" value="${myBoardInfoVo.memNo}"> 
				<input type="text" name="scheduleNo" id="scheduleNo" value="${scheduleNo}"> 
					
				<h6 class="mb-4">일정 등록</h6>
				<div class="appbox">
					<div class="form-floating mb-3">
						<input type="text" class="form-control schedulTitle"
							name="schedulTitle" id="schedulTitle" placeholder="일정 타이틀">
						<label for="floatingInput"> 일정 제목 </label>
					</div>

					<div class="form-floating mb-3">
						<input type="text" class="form-control schedulStart"
							name="schedulStart" id="schedulStart"> <label
							for="floatingInput"> 시작일 </label>
						<!-- jq 달력 넣기  -->

					</div>

					<div class="form-floating mb-3">
						<input type="text" class="form-control schedulEnd"
							name="schedulEnd" id="schedulEnd"> <label
							for="floatingInput"> 종료일 </label>
						<!-- jq 달력 넣기  -->
					</div>

					<div class="form-floating">
						<textarea class="form-control textarea"
							placeholder="schedulContent" name="schedulContent"
							id="schedulContent" style="height: 150px;"></textarea>
						<label for="floatingTextarea"> 내용 </label>
					</div>
				</div>
				<div>
					<input type="submit" value="일정등록"
						class="btn btn-sm btn-primary btn" />
				</div>
			</form>
		</div>
	</div>
</div>

<%@include file="../inc/bottom.jsp"%>
