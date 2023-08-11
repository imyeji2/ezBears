<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">

<style>

.register-form {
    width: 50%;
    margin: 0px 0px;
    display: flex;
    flex-direction: column;
    gap: 15px 0;
}
#deptwrite {
    height: 60%;
}
.register {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 70%;
}
</style>
<div class="col-12" id="deptwrite">
	<div class="bg-secondary rounded h-100 p-4">
	<h6 class="mb-4">부서 등록</h6>
		<div class="register">
			<form class="register-form" name="frmRegist" method="post" action="<%=request.getContextPath() %>/Member/list">

				<div class="form-floating">
					<input type="text" class="form-control" id="registerName" name="name"> 
					<label for="registerName">이름</label>
				</div>
				<div class="detail">
					<div class="form-floating">
						<input type="text" class="form-control" id="phoneNum" maxlength="13">
						<label for="phoneNum">전화번호</label>
					</div>
				</div>
				<button class="confirm" type="submit">등록</button>
			</form>
		</div>
	</div>
</div>
  
 <%@include file="../inc/bottom.jsp"%>    