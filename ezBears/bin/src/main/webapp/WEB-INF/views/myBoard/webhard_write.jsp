<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>



<!-- write / edit 같이 쓰게 수정하기 -->

<div class="container-fluid pt-4 px-4" id="harddetail">
	<div class="col-sm-12 col-xl-6">
		<div class="bg-secondary rounded h-100 p-4 hardfrm">
		  <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="<c:url value ='/myBoard/teamNotice'/>">마이보드</a></li>
                <li class="breadcrumb-item active" aria-current="page"><a href="#">개발1팀</a></li>
                <li class="breadcrumb-item active" aria-current="page">웹하드 게시판</li>
              </ol>
            </nav>
			<h6 class="mb-4">웹하드 등록</h6>
			<div class="appbox">
				<div class="form-floating mb-3">
					<input type="email" class="form-control" id="title" name ="title"
						placeholder="name@example.com">
						 <label for="floatingInput">제목 </label>

				</div>
				<div class="form-floating mb-3">
					<span class="sp1">첨부파일</span> <span> <img
						src="<c:url value=''/>" alt="파일 이미지">
					</span> 
					<span>다운</span>
				</div>
				<div class="form-floating">
					<textarea class="form-control textarea" placeholder="Leave a comment here"
						id="floatingTextarea" style="height: 150px;"></textarea>
					<label for="floatingTextarea">내용</label>
				</div> <br>
				<div class="web_hard">
					<input class="form-control webFile" type="file" id="webFile">
		       	</div>
			</div>
			<div class="hardbtn">
				<input type="Button"  value="등록" class="btn btn-sm btn-primary btn"
					OnClick="location.href='<c:url value='/myBoard/webhard'/>'" />
			</div>
		</div>
	</div>
	<div></div>
</div>

<%@include file="../inc/bottom.jsp"%>
