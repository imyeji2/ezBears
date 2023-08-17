<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form method="post" action = "<c:url value=''/>"> 
	<h6 class="mb-4">일정 등록</h6>
	<div class="appbox">
		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="floatingInput"
				placeholder="일정 타이틀"> <label for="floatingInput"> 제목
			</label>
		</div>


		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="floatingInput"
				placeholder="yyyy-mm-dd"> <label for="floatingInput">
				시작일 </label>
		</div>

		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="floatingInput"
				placeholder="yyyy-mm-dd"> <label for="floatingInput">
				종료일 </label>
		</div>

		<div class="form-floating">
			<textarea class="form-control textarea"
				placeholder="Leave a comment here" id="floatingTextarea"
				style="height: 150px;"></textarea>
			<label for="floatingTextarea">내용</label>
		</div>
	</div>
</form>
<div>
	<input type="button" value="입력" class="btn btn-sm btn-primary btn" />
</div>
