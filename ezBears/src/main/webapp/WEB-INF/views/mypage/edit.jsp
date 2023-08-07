<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>

<div class="form-container">
	<form action="mypage_edit" method="post">
	
		<div class="container-fluid">
			<div class="row h-100 align-items-center justify-content-center"
				style="min-height: 100vh;">
				<div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
					<div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
						<div
							class="d-flex align-items-center justify-content-between mb-3">
							<a href="index.html" class="">
								<h3 class="text-primary">
									<i class="fa fa-user-edit me-2"></i>회원정보 수정
								</h3>
							</a>
						</div>
						<div class="form-floating mb-3">
							<input type="text" id="address" class="form-control" id="floatingText" placeholder="address"> 
							<label for="floatingText">주소</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" id="tel" class="form-control" id="floatingInput" placeholder="Password"> 
							<label for="floatingInput">핸드폰 번호</label>
						</div>
						<div class="form-floating mb-4">
							<input type="text" id="pwd" class="form-control" id="floatingPassword" placeholder="Password"> 
							<label for="floatingPassword">비밀번호</label>
						</div>
						
						<button type="submit" class="btn btn-primary py-3 w-100 mb-4">수정</button>
						<p class="text-center mb-0">
							Would you like to go back? <a href="">click</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		
	</form>
</div>
<%@include file="../inc/bottom.jsp"%>