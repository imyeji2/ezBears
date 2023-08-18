<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">
<style>

.addDept {
    outline: none;
    background-color: #191C24;
    border: 1px solid #6C7293;
    color: #fff;
    padding: 5px 15px;
    border-radius: 5px;
}


</style>
	<div class="col-12">
	    <div class="bg-secondary rounded h-100 p-4">
	        <h6 class="mb-4">부서 관리</h6>
			<form class="btn-form" name="frm1" method="get" action="<c:url value ='/dept/list'/>">
				<input type="text" class="addDept" id = "deptName" placeholder="부서명">
				<input type="text" class="addDept" id = "deptTel" placeholder="부서전화번호">
				<button type="submit" class="btnAdd" id="btnAdd" value="등록">등록</button>
				<button type="button" class="btnEdit" id="btnEdit" value="수정">수정</button>
				<button type="button" class="btnDelete" id="btnDelete">삭제</button>
			</form>
	        <div class="table-responsive">
	            <table class="table">
	                <thead>
	                    <tr>
	                    
	                        <th scope="col">-</th>
	                        <th scope="col">번호</th>
	                        <th scope="col">부서이름</th>
	                        <th scope="col">전화번호</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td><input type="checkbox"></td>
	                        <th scope="row">1</th>
	                        <td>경영지원팀</td>
	                        <td>02-592-0001</td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>

<%@include file="../inc/bottom.jsp"%>    