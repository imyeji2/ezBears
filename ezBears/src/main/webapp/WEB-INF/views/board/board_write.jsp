<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/gopanju.css" rel="stylesheet">
<div class="form-container">
	<form action="AddPostServlet" method="post">
		<label for="title">제목</label> 
		<input type="text" id="title" name="title" required> 
		<label for="content">내용</label>
		<textarea id="content" name="content" rows="5" required></textarea>
		<div class="col-sm-12 col-xl-6">
			<div class="bg-secondary rounded h-100 p-4">
				<div class="mb-3">
					<label for="formFileMultiple" class="form-label">Multiple files input example</label> 
					<input class="form-control bg-dark" type="file" id="formFileMultiple" multiple>
				</div>
			</div>
		</div>
		<button type="submit">등록</button>
	</form>
</div>
<%@include file="../inc/bottom.jsp"%>