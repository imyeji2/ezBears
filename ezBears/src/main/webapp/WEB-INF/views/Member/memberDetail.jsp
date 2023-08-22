<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">
<script type="text/javascript" src="<c:url value ='/js/member.js"'/>"></script>
<script>
function confirmAndSubmit() {
    if (confirm("수정하시겠습니까?")) {
        $('.btn-form').submit();
    }
}
</script>
	<div class="col-12">
	    <div class="bg-secondary rounded h-100 p-4">
	    	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	           <ol class="breadcrumb">
	             <li class="breadcrumb-item active" aria-current="page">
	                <a href="<c:url value='/Member/list'/>">사원관리</a>
	             </li>
	             <li class="breadcrumb-item active" aria-current="page">사원 상세페이지</li>
	           </ol>
	         </nav>
			<form class="btn-form" name="frm1" method="post" action="<c:url value ='/Member/detail'/>">
				<div class = "btns">
					<button type="submit" class="btnAdd" id="btnAdd" value="수정" onclick="confirmAndSubmit()">수정</button>
					<button class="btnDelete" type="button" id="btnDelete">삭제</button>
				</div>
		        <div class="inner">
		        <input type="hidden" name="memNo" value="${memberVo.memNo}">
		        	<div class="memImg">
		        		<img alt="" src="<c:url value ='/img/mem_images/${memberVo.memImage }'/> " style="width:180px; height:200px;">
		        	</div>
		        	<div class = "memInfo" style="width:70%;">
		        	 <table class="table">
		                    <tr>
		                        <th scope="col">부서</th>
		                        <td>
		                        	<input type="text" class="edittext" id="deptName" value="${memberVo.deptName}" disabled="disabled">
		                        	
		                        	<select class="showEditDept" name="deptNo" id="dept">
							        	<option value="" >부서</option>
										<!-- 반복문 -->
										<c:forEach var="deptVo" items="${deptList}" >
											<option value ="${deptVo.deptNo}"
												<c:if test="${deptVo.deptNo == memberVo.deptNo}">
													selected="selected"
												</c:if>
											>${deptVo.deptName}</option>
											
										</c:forEach>
										<!-- 반복문 -->
							       	</select>
							       	
		                        	<img class="editIcon" id="editDept" src="<c:url value='/img/editIcon.png'/>" >
		                        </td>
		                        <th scope="col">직급</th>
		                        <td>
		                        	<input type="text" class="edittext" id="position" value="${memberVo.positionName}"  disabled="disabled">
		                        	<select class="showEditPosition"name="positionNo" id="grade">
							        	<option value="" >직급</option>
							        	<!-- 반복문 -->
										<c:forEach var="positionVo" items="${positionList}">
											<option value ="${positionVo.positionNo}"
												<c:if test="${positionVo.positionNo == memberVo.positionNo}">
													selected="selected"
												</c:if>
											>${positionVo.positionName}</option>
										</c:forEach>
							        	<!-- 반복문 -->
							       	</select>
		                        	<img class="editIcon" id="editPosition" src="<c:url value='/img/editIcon.png'/>" >
	                        	</td>
		                    </tr>
		                    <tr>
		                        <th scope="col">이름</th>
		                        <td>${memberVo.memName}</td>
		                        <th scope="col">아이디</th>
		                        <td>${memberVo.memId}</td>
		                    </tr>
		                    <tr>
		                        <th scope="col">연봉</th>
		                        <td>
			                        <input type="text" class="edittext" id="sal" name="sal"
			                        value="<fmt:formatNumber value="${memberVo.memSal/10000}" pattern="#,###"/>" disabled="disabled">
			                        	만원
		                        	<img class="editIcon" id="editSal" src="<c:url value='/img/editIcon.png'/>" >
		                        </td>
		                        <th scope="col">고용형태</th>
		                        <td>
		                        	<input type="text" class="edittext" id="type" value="${memberVo.type}"  disabled="disabled">
		                        	<select class ="showEditType" name="type" id="test">
							        	<option value="" >고용형태</option>
							            <option value="계약직"
							            	<c:if test="${memberVo.type == '계약직'}">
												selected="selected"
											</c:if>
							            >계약직</option>
							            <option value="정규직"
							            	<c:if test="${memberVo.type == '정규직'}">
												selected="selected"
											</c:if>
							            >정규직</option>
							       	</select>
		                        	<img class="editIcon" id="editType" src="<c:url value='/img/editIcon.png'/>" >
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="col">전화번호</th>
		                        <td>
		                        	<input type="text" class="edittext" value="${memberVo.memTel}" disabled="disabled">
		                        </td>
		                        <th scope="col">생일</th>
		                        <td disabled="disabled">${memberVo.memBirth.substring(0, 10)}</td>
		                    </tr>
		                    <tr>
		                        <th scope="col">입사일</th>
		                        <td >${memberVo.contractStart.substring(0, 10)}</td>
		                        <th scope="col">퇴사일</th>
		                        <td >
		                        	<input type="text" class="edittext" name="contractDone" value="${memberVo.contractDone.substring(0, 10)}"  disabled="disabled">
		                        	<img class="editIcon" id="editConDone" src="<c:url value='/img/editIcon.png'/>" >
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="col">주소</th>
		                        <td colspan="3">
		                        	<input type="text" class="edittext" name= "memAddress" value="${memberVo.memAddress}" disabled="disabled" style="width:80%">
		                        	<input type="text" class="edittext" name= "memAddressDetail" value="${memberVo.memAddressDetail}" disabled="disabled" style="width:80%">
		                        </td>
		                    </tr>
		                    
		            </table>
		        	</div>
		     	</div>
	     	</form>
	    </div>
	</div>

<%@include file="../inc/bottom.jsp"%>    