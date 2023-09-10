<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../inc/top.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<div class="container-fluid" id="board_style" style="margin-top: 1.5%">
	<div class="col-sm-12 col-xl-12">
		<div class="bg-secondary rounded h-100 p-4">
			<nav
				style="--bs-breadcrumb-divider: url(&amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&amp;amp;"
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
									<td><a
										href="<c:url value='/record/gameRecordDetail?recodeNo=${vo.recodeNo}'/>"
										style="color: #fff">${vo.recodeNo}</a></td>
									<td><a
										href="<c:url value='/record/gameRecordDetail?recodeNo=${vo.recodeNo}'/>"
										style="color: #fff">${fn:substring(vo.playDate, 0, 10)}</a></td>
									<td><a
										href="<c:url value='/record/gameRecordDetail?recodeNo=${vo.recodeNo}'/>"
										style="color: #fff">${vo.firstPitcher}</a></td>
									<td><a
										href="<c:url value='/record/gameRecordDetail?recodeNo=${vo.recodeNo}'/>"
										style="color: #fff">${vo.otherTeam}</a></td>
									<td><a
										href="<c:url value='/record/gameRecordDetail?recodeNo=${vo.recodeNo}'/>"
										style="color: #fff">${vo.ground}</a></td>
									<td><a
										href="<c:url value='/record/gameRecordDetail?recodeNo=${vo.recodeNo}'/>"
										style="color: #fff">${vo.win}</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>

			<div class="divPage">
				<!-- 페이지 번호 추가 -->
				<!-- 이전 블럭으로 이동 -->
				<c:if test="${pagination.firstPage>1 }">
					<a href="#" onclick="pageFunc(${pagination.firstPage-1})"> <img
						src="<c:url value='/img/first.JPG'/>">
					</a>
				</c:if>

				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<c:forEach var="i" begin="${pagination.firstPage }"
					end="${pagination.lastPage }">
					<c:if test="${i == pagination.currentPage }">
						<span style="color: yellow; font-weight: bold; font-size: 1em">${i}</span>
					</c:if>
					<c:if test="${i != pagination.currentPage }">
						<a href="#" onclick="pageFunc(${i})">[${i }]</a>
					</c:if>
				</c:forEach>

				<!-- 다음 블럭으로 이동 -->
				<c:if test="${pagination.lastPage < pagination.totalPage }">
					<a href="#" onclick="pageFunc(${pagination.lastPage+1})"> <img
						src="<c:url value='/img/last.JPG'/>">
					</a>
				</c:if>
				<!--  페이지 번호 끝 -->
			</div>
			<br>
			<div class="divSearch">
			
				<form name="frmSearch" method="POST"
					action="<c:url value='/record/gameList'/>">
					<select name="searchCondition">
						<option value="PLAYDATE"
							<c:if test="${param.searchCondition=='PLAY_DATE'}">
				            		selected="selected"
				            	</c:if>>날짜</option>
						<option value="FIRST_PITCHER"
							<c:if test="${param.searchCondition=='FIRST_PITCHER'}">
				            		selected="selected"
				            	</c:if>>선발투수</option>
					</select> <input type="text" name="searchKeyword" title="검색어 입력"
						value="${param.searchKeyword }"> <input type="submit"
						value="검색" id="btnSearch">
				</form>
			</div>
			<c:if test="${sessionScope.type eq '스태프'}">
			<div class="divBtn">
				<a href="<c:url value='/record/gameWrite'/>">경기정보 등록</a>
			</div>
			</c:if>
		</div>
	</div>
</div>

<%@include file="../inc/bottom.jsp"%>