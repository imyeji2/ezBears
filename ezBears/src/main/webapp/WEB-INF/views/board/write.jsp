<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>

<!-- <div class="container-fluid pt-4 px-4">
        <div class="bg-secondary text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4"> -->


<div id="board_write">
	<form action="AddPostServlet" method="post">
		<div class="col-sm-12 col-xl-12">
			<div class="bg-secondary rounded h-200 p-5">
			
				<h6 class="mb-4">공용 > 공지사항 > 공지사항 등록</h6>

				<div class="input-group mb-3">
					<input type="text" placeholder="제목을 입력해주세요" class="form-control" id="title">
				</div>

				<div class="input-group mb-3 ">
					<textarea class="form-control infotext" placeholder="내용을 입력해주세요" id="floatingTextarea" style="height: 150px;"></textarea>
				</div>
				<br>

				<div class="form-floating">
					<div class="mb-3">
						<input class="form-control bg-dark" type="file" id="formFileMultiple" multiple>
					</div>
				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-primary">등록</button>
					<button class="btn btn-primary">취소</button>
				</div>

			</div>
		</div>
	</form>
</div>
<%@include file="../inc/bottom.jsp"%>