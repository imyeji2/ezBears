<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../inc/top.jsp"%>

<script type="text/javascript">
	function pageFunc(page) {
		$('input[name="currentPage"]').val(page);
		$('form[name="frmPage"]').submit();
	}
</script>

<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-sm-12 col-xl-12">
			<div class="bg-secondary rounded h-100 p-4">
				<div class="col-12">
					<div class="bg-secondary rounded h-100 p-4">
						<div id="contents" class="content01">
							<div class="location">
								<h3 class="tit-page">선수 기록 정보</h3>
								<br>
								<div class="inquiry">
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th scope="col">선수 등번호</th>
													<th scope="col">선수 이름</th>
													<th scope="col">포지션</th>
													<th scope="col">생년월일</th>
													<th scope="col">키</th>
													<th scope="col">몸무게</th>
													<th scope="col">연봉</th>
													<th scope="col">상태</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>${list[0]['BACK_NO']}</td>
													<td>${list[0].PLAYER_NAME}</td>
													<td>투수</td>
													<td><fmt:formatDate
															value="${list[0]['PLAYER_BIRTH'] }" pattern="yyyy-MM-dd" /></td>
													<td>${list[0].HEIGHT}cm</td>
													<td>${list[0].WEIGHT}kg</td>
													<td>${list[0].PLAYER_SAL}원</td>
													<td>${list[0].PLAYER_STATUS}</td>
												</tr>

											</tbody>
										</table>
										<br>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th scope="col">날짜</th>
														<th scope="col">사구</th>
														<th scope="col">삼진</th>
														<th scope="col">투구이닝</th>
														<th scope="col">피안타</th>
														<th scope="col">실점</th>
														<th scope="col">자책점</th>
														<th scope="col">피홈런</th>
														<th scope="col">평균자책점</th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${empty list }">
														<tr>
															<th colspan="6">기록이 존재하지 않습니다.
														</tr>
													</c:if>
													<c:if test="${!empty list }">
														<c:forEach var="map" items="${list }">
															<tr>
																<td><fmt:formatDate value="${map['REGDATE'] }"
																		pattern="yyyy-MM-dd" /></td>
																<td>${map.BB }</td>
																<td>${map.SO }</td>
																<td>${map.IP }</td>
																<td>${map.HA }</td>
																<td>${map.RC }</td>
																<td>${map.ER }</td>
																<td>${map.HR }</td>
																<td>${map.ERA }</td>
															</tr>
														</c:forEach>
													</c:if>
												</tbody>
											</table>
											<br> <br>
										</div>
										<div class="divPage">
											<!-- 페이지 번호 추가 -->
											<!-- 이전 블럭으로 이동 -->
											<c:if test="${pagination.firstPage>1 }">
												<a href="#" onclick="pageFunc(${pagination.firstPage-1})">
													<img src="<c:url value='/img/first.JPG'/>">
												</a>
											</c:if>

											<!-- [1][2][3][4][5][6][7][8][9][10] -->
											<c:forEach var="i" begin="${pagination.firstPage }"
												end="${pagination.lastPage }">
												<c:if test="${i == pagination.currentPage }">
													<span
														style="color: yellow; font-weight: bold; font-size: 1em">${i}</span>
												</c:if>
												<c:if test="${i != pagination.currentPage }">
													<a href="#" onclick="pageFunc(${i})">[${i }]</a>
												</c:if>
											</c:forEach>

											<!-- 다음 블럭으로 이동 -->
											<c:if test="${pagination.lastPage < pagination.totalPage }">
												<a href="#" onclick="pageFunc(${pagination.lastPage+1})">
													<img src="<c:url value='/img/last.JPG'/>">
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
				            	</c:if>>경기날짜</option>
													<option value="PLAYER_NAME"
														<c:if test="${param.searchCondition=='PLAYER_NAME'}">
				            		selected="selected"
				            	</c:if>>이름</option>
												</select> <input type="text" name="searchKeyword" title="검색어 입력"
													value="${param.searchKeyword }"> <input
													type="submit" value="검색" id="btnSearch">
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@include file="../inc/bottom.jsp"%>