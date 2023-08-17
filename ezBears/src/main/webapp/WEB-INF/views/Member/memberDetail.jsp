<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">

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
			<form class="btn-form" name="frm1" method="post" action="<c:url value ='/Member/write'/>">
				<button type="submit" class="btnAdd" id="btnAdd" value="수정">수정</button>
				<button class="btnDelete" type="button" id="btnDelete">삭제</button>
			</form>
	        <div class="inner">
	        	<div class="memImg">
	        		<img alt="" src="<c:url value ='/img/mem_images/${memberVo.memImage }'/> " style="width:180px; height:200px;">
	        	</div>
	        	<div class = "memInfo" style="width:50%;">
	        	 <table class="table">
	                    <tr>
	                        <th scope="col">부서</th>
	                        <td>${memberVo.deptName}</td>
	                        <th scope="col">직급</th>
	                        <td>${memberVo.positionName}</td>
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
	                        	<fmt:formatNumber value="${memberVo.memSal/10000}" pattern="#,###"/>만원
	                        </td>
	                        <th scope="col">고용형태</th>
	                        <td>${memberVo.type}</td>
	                    </tr>
	                    <tr>
	                        <th scope="col">전화번호</th>
	                        <td>${memberVo.memTel}</td>
	                        <th scope="col">생일</th>
	                        <td>${memberVo.memBirth.substring(0, 10)}</td>
	                    </tr>
	                    <tr>
	                        <th scope="col">입사일</th>
	                        <td>${memberVo.contractStart.substring(0, 10)}</td>
	                        <th scope="col">퇴사일</th>
	                        <td>${memberVo.contractDone.substring(0, 10)}</td>
	                    </tr>
	                    <tr>
	                        <th scope="col">주소</th>
	                        <td colspan="3">${memberVo.memAddress} ${memberVo.memAddressDetail}</td>
	                    </tr>
	                    
	            </table>
	        	</div>
	     	</div>
	    </div>
	</div>

<%@include file="../inc/bottom.jsp"%>    