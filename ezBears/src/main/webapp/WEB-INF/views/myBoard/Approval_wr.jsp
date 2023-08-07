<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>

<style>
/* .bg-secondary.rounded.h-100.p-4 {
    width: 1250px;
}  

input.btn.btn-sm.btn-primary {
    width: 70px;
    margin-left: 1135px;
    margin-top: 14px;
} 
 .appbox{
	width: 70%;
	margin: 0 auto;
} 
#floatingTextarea{
	resize: none;
} */
</style>
<div class="container-fluid pt-4 px-4" id ="Approval_wr">
	<div class="col-sm-12 col-xl-6">
		<div class="bg-secondary rounded h-100 p-4 Appfrm">
			<h6 class="mb-4">결재 입력</h6>
			<div class="appbox">
				<div class="form-floating mb-3">
					<input type="email" class="form-control" id="floatingInput"
						placeholder="name@example.com">
						 <label for="floatingInput"> 제목 </label>
				</div>
				<div class="form-floating mb-3">
					<select class="form-select" id="floatingSelect"
						aria-label="Floating label select example">
						<option selected></option>
						<option value="1">휴가</option>
						<option value="2">반차</option>
						<option value="3">월차</option>
					</select> <label for="floatingSelect">결재 분류</label>
				</div>
				<div class="form-floating">
					<textarea class="form-control textarea" placeholder="Leave a comment here"
						id="floatingTextarea" style="height: 150px;" ></textarea>
					<label for="floatingTextarea">내용</label>
				</div>
			</div>
		<div>
		<input type="button" value="입력" class="btn btn-sm btn-primary btn"/>
		</div>
		</div>
	</div>
</div>
<%@include file="../inc/bottom.jsp"%>
