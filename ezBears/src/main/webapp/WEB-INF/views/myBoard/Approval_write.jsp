<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>


<div class="container-fluid pt-4 px-4" id ="Approval_wr">
	<div class="col-sm-12 col-xl-6">
		<div class="bg-secondary rounded h-100 p-4 Appfrm">
		 <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="<c:url value ='/myBoard/teamNotice'/>">마이보드</a></li>
                <li class="breadcrumb-item active" aria-current="page"><a href="#">개발1팀</a></li>
                <li class="breadcrumb-item active" aria-current="page">결재 게시판</li>
              </ol>
            </nav>
			<h6 class="mb-4">결재 입력</h6>
			<div class="appbox">
				<div class="form-floating mb-3">
					<input type="email" class="form-control" id="floatingInput"
						placeholder="name@example.com">
						 <label for="floatingInput"> 제목 </label>
						 <%-- <input type="text" name="docNo" value="${docNo}"> --%>
		
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
