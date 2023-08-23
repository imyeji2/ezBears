<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../inc/top.jsp"%>

<div class="container-fluid" id="board_style" style="margin-top: 1.5%">
	<div class="col-sm-12 col-xl-12">
		<div class="bg-secondary rounded h-100 p-4">
			<nav
				style="--bs-breadcrumb-divider: url(&amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&amp;amp;"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">경기기록</a></li>
				</ol>
			</nav>
			<br>
			<h4>경기기록</h4>
			<br>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">경기날짜</th>
							<th scope="col">선발투수</th>
							<th scope="col">상대팀</th>
							<th scope="col">구장</th>
							<th scope="col">승무패</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list }">
							<tr>
								<th colspan="6">경기정보가 존재하지 않습니다.</th>
							</tr>
						</c:if>
						<c:if test="${!empty list }">
							<c:forEach var="vo" items="${list }">
								<tr>
									<td>${vo.recodeNo }</td>
									<td><c:set var="year"
											value="${fn:substring(vo.regdate, 0, 4)}" /> <c:set
											var="month" value="${fn:substring(vo.regdate, 5, 7)}" /> <c:set
											var="day" value="${fn:substring(vo.regdate, 8, 10)}" />
										${year}년 ${month}월 ${day}일</td>
									<td>${vo.firstPitcher}</td>
									<td>${vo.otherTeam}</td>
									<td>${vo.ground}</td>
									<td>${vo.win}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="divBtn">
				<a href="<c:url value='/record/gameWrite'/>">경기정보 등록</a>
			</div>
			<div class="divBtn">
				<a href="<c:url value='/record/gameUpdate'/>">경기정보 수정</a>
			</div>
			<div class="divBtn">
				<a href="<c:url value='/record/gameDelete'/>">경기정보 삭제</a>
			</div>
		</div>
	</div>
</div>

<%@include file="../inc/bottom.jsp"%>