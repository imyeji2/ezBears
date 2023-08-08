<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">
<style>
.memImg {
    float: left;
}

.memInfo {
    float: right;
}

.inner {
    display: flex;
    justify-content: center;
    gap: 0 11%;
    margin-top: 5%;
}

@media (max-width: 720px) {
	
}
</style>
	<div class="col-12">
	    <div class="bg-secondary rounded h-100 p-4">
	        <h6 class="mb-4">사원 상세페이지</h6>
			<form class="btn-form" name="frm1" method="post" action="<c:url value ='/Member/write'/>">
				<button type="submit" class="btnAdd" id="btnAdd" value="수정">수정</button>
				<button class="btnDelete" type="button" id="btnDelete">삭제</button>
			</form>
	        <div class="inner">
	        	<div class="memImg">
	        		<img alt="" src="<c:url value ='/img/hong.jpg'/> " style="width:150px; height:200px;">
	        	</div>
	        	<div class = "memInfo" style="width:50%;">
	        	 <table class="table">
	                    <tr>
	                        <th scope="col">부서</th>
	                        <td>경영지원팀</td>
	                        <th scope="col">직급</th>
	                        <td>팀장</td>
	                    </tr>
	                    <tr>
	                        <th scope="col">이름</th>
	                        <td>홍길동</td>
	                        <th scope="col">아이디</th>
	                        <td>hong</td>
	                    </tr>
	                    <tr>
	                        <th scope="col">연봉</th>
	                        <td>8000</td>
	                        <th scope="col">고용형태</th>
	                        <td>정규직</td>
	                    </tr>
	                    <tr>
	                        <th scope="col">전화번호</th>
	                        <td>010-1111-2222</td>
	                        <th scope="col">생일</th>
	                        <td>1990-01-01</td>
	                    </tr>
	                    <tr>
	                        <th scope="col">입사일</th>
	                        <td>2015.01.01</td>
	                        <th scope="col">퇴사일</th>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <th scope="col">주소</th>
	                        <td colspan="3">서울시 서초구 방배동</td>
	                    </tr>
	                    
	            </table>
	        	</div>
	     	</div>
	    </div>
	</div>

<%@include file="../inc/bottom.jsp"%>    