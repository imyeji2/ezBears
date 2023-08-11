<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>

<article class="simpleForm">
	<form name="frmLogin" method="post"	action="<c:url value='/login/login'/>">
<div class="container-fluid position-relative d-flex p-0">
	<!-- Sign In Start -->
	<div class="container-fluid">
		<div class="row h-100 align-items-center justify-content-center"
			style="min-height: 100vh;">
			<div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
				<div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
					<div class="d-flex align-items-center justify-content-between mb-3">
						<!-- <a href="index.html" class=""> -->
							<h3 class="text-primary">
								<i class="fa fa-user-edit me-2"></i>로그인
							</h3>
						</a>
						<h3>Sign In</h3>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="userid" id="userid"
							placeholder="name@example.com"> 
							<label for="floatingInput">ID</label>
					</div>
					<div class="form-floating mb-4">
						<input type="password" class="form-control" name="pwd" id="pwd"
							placeholder="Password"> <label for="floatingPassword">Password</label>
					</div>
					<div class="d-flex align-items-center justify-content-between mb-4">
						<div>
							 <select class="form-select mb-3" name="position" id="position">
                                <option selected value="front">프론트</option>
                                <option value="player">선수</option>
                            </select>
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" name="chkSave" id="chkSave"
								<c:if test="${!empty cookie.ck_userid }">
									checked="checked"
								</c:if>
							> 
							<label class="form-check-label" for="chkSave">Check me out</label>
						</div>
					</div>
					<input type="submit" class="btn btn-primary py-3 w-100 mb-4" id="lg_submit" value="Sign In">
					<p class="text-center mb-0">
						Would you like to go back? <a href="">back</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Sign In End -->
</div>
</form>
</article>
<%@include file="../inc/bottom.jsp"%>