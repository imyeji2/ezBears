<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">

	<div class="col-12">
	    <div class="bg-secondary rounded h-100 p-4">
	        <h6 class="mb-4">사원 리스트</h6>
			<form class="btn-form" name="frm1" method="get" action="<c:url value ='/Member/write'/>">
				<button type="submit" class="btnAdd" id="btnAdd" value="등록">등록</button>
				<button class="btnDelete" type="button" id="btnDelete">삭제</button>
			</form>
	        <div class="table-responsive">
	            <table class="table">
	                <thead>
	                    <tr>
	                        <th scope="col">-</th>
	                        <th scope="col">번호</th>
	                        <th scope="col">부서</th>
	                        <th scope="col">직급</th>
	                        <th scope="col">이름</th>
	                        <th scope="col">아이디</th>
	                        <th scope="col">핸드폰번호</th>
	                        <th scope="col">생년월일</th>
	                        <th scope="col">주소</th>
	                        <th scope="col">고용형태</th>
	                        <th scope="col">입사일</th>
	                        <th scope="col">퇴사일</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td><input type="checkbox"></td>
	                        <th scope="row">1</th>
	                        <td>경영지원팀</td>
	                        <td>팀장</td>
	                        <td>홍길동</td>
	                        <td>hong</td>
	                        <td>010-1111-2222</td>
	                        <td>1990-01-01</td>
	                        <td>서울시 서초구 방배동</td>
	                        <td>정규직</td>
	                        <td>2023.08.01</td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td><input type="checkbox"></td>
	                        <th scope="row">2</th>
	                        <td>경영지원팀</td>
	                        <td>사원</td>
	                        <td>김길동</td>
	                        <td>kim</td>
	                        <td>010-2222-3333</td>
	                        <td>2000-01-01</td>
	                        <td>서울시 동작구 사당동</td>
	                        <td>정규직</td>
	                        <td>2023.08.01</td>
	                        <td></td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>

<%@include file="../inc/bottom.jsp"%>    