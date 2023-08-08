<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>



<!-- write / edit 같이 쓰게 수정하기 -->

<div class="container-fluid pt-4 px-4" id="harddetail">
	<div class="col-sm-12 col-xl-6">
		<div class="bg-secondary rounded h-100 p-4 hardfrm">
			<h6 class="mb-4">웹하드</h6>
			<div class="appbox">
				<div class="form-floating mb-3">
					<input type="email" class="form-control" id="floatingInput"
						placeholder="name@example.com">
						 <label for="floatingInput">제목 </label>

				</div>
				<div class="form-floating mb-3">
					<span class="sp1">첨부파일</span> <span> <img
						src="<c:url value=''/>" alt="파일 이미지">
					</span> <span>다운</span>
				</div>
				<div class="form-floating">
					<textarea class="form-control textarea" placeholder="Leave a comment here"
						id="floatingTextarea" style="height: 150px;"></textarea>
					<label for="floatingTextarea">내용</label>
				</div>
			</div>
			<div class="hardbtn">
				<input type="button"  value="수정" class="btn btn-sm btn-primary btn"
					OnClick="location.href='<c:url value='/myBoard/hard_detail'/>'" />
				<input type="Button"  value="삭제" class="btn btn-sm btn-primary btn"
					OnClick="location.href='<c:url value='/myBoard/hard_delete'/>'" />
			</div>
		</div>
	</div>
	<div></div>
</div>

<%@include file="../inc/bottom.jsp"%>
