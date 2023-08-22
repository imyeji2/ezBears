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
				<div class="btns">
					<input type="text" class="addDept" id = "deptName" placeholder="부서명">
					<input type="text" class="addDept" id = "deptTel" placeholder="부서전화번호">
					<button type="submit" class="btnAdd" id="btnAdd" value="등록">등록</button>
				</div>
			</form>
			
			
			<form class="btn-form" name="frm2" method="get" action="<c:url value ='/dept/list'/>">
				<div>
					<button type="button" class="btnEdit" id="btnEdit" value="수정">수정</button>
					<button type="button" class="btnDelete" id="btnDelete">삭제</button>
				</div>
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
							<c:if test="${empty list}">
			                	<tr>
			                		<td colspan="3" style="text-align: center">부서가 존재하지 않습니다.</td>
			                	</tr>
			                </c:if>
			                <c:if test="${!empty list}">
			                	<c:forEach var="deptVo" items="${list}"> 
			                		<tr class="memList">
			                			<td><input type="checkbox"></td>
			                			<td>${deptVo.deptNo}</td>
			                			<td>${deptVo.deptName}</td>
			                			<td>${deptVo.deptTel}</td>
			                		</tr>
			                	</c:forEach>
			                </c:if>
		                </tbody>
		            </table>
		        </div>
	        </form>
	    </div>
	</div>

<%@include file="../inc/bottom.jsp"%>    