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
													<td>${list2[0].BACK_NO}</td>
													<td>${list2[0].PLAYER_NAME}</td>
													<td>타자</td>
													<td><fmt:formatDate value="${list2[0]['PLAYER_BIRTH'] }" pattern="yyyy-MM-dd"/></td>
													<td>${list2[0].HEIGHT}cm</td>
													<td>${list2[0].WEIGHT}kg</td>
													<td>${list2[0].PLAYER_SAL}원</td>
													<td>${list2[0].PLAYER_STATUS}</td>
												</tr>
											</tbody>
										</table>
										<br>
										<br>
										<h4>시즌 기록</h4>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th scope="col">타수</th>
														<th scope="col">득점</th>
														<th scope="col">안타</th>
														<th scope="col">타점</th>
														<th scope="col">사구</th>
														<th scope="col">삼진</th>
														<th scope="col">홈런</th>
														<th scope="col">타율</th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${empty statlist }">
														<tr>
															<th colspan="6">기록이 존재하지 않습니다.
														</tr>
													</c:if>
													<c:if test="${!empty statlist }">
															<tr>
																<td>${statlist[0].AB }</td>
																<td>${statlist[0].RS }</td>
																<td>${statlist[0].H }</td>
																<td>${statlist[0].RBI }</td>
																<td>${statlist[0].BB }</td>
																<td>${statlist[0].SO }</td>
																<td>${statlist[0].HR }</td>
																<td>${statlist[0].BA }</td>
															</tr>										
													</c:if>
												</tbody>
											</table>
											<br><br>
										</div>
										<br>
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