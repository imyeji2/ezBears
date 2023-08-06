<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../inc/top.jsp"%>	

<div id="teamWorkBoardList">
	<br>
	<div id="teamNotice_serch">
		<div class="serch_input">
			<div class="select_box">
				<select class="form-select" aria-label="Default select example">
					<option selected>선택</option>
					<option value="name">이름</option>
					<option value="subject">제목</option>
					<option value="content">내용</option>
				</select>
			</div>
			<div class="text_box">
				<input type="text" class="form-control"
					id="exampleFormControlInput1" placeholder="검색어를 입력해주세요">
			</div>

			<div class="serch_btn">
				<button>검색</button>
			</div>
			<!-- serch_btn -->
		</div>
		<!-- serch_input -->
	</div>
	<!-- teamNotice_serch -->

	<br>
	
</div>

<%@include file="../inc/bottom.jsp"%>