<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>이젠 베어스 - 그룹웨어 시스템</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
</head>


<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-sm-12 col-xl-12">
			<div class="bg-secondary rounded h-100 p-4">
				<div class="col-12">
					<div class="bg-secondary rounded h-100 p-4">


						<div id="contents" class="content01">
							<!--sub title & location -->
							<div class="location">
								<h3 class="tit-page">선수 기록 정보</h3>
								<br>
								<!-- // sub title & location -->

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
													<td>10</td>
													<td>알칸타라</td>
													<td>투수</td>
													<td>1999 9 9</td>
													<td>199 cm</td>
													<td>99 kg</td>
													<td>9999 만원</td>
													<td>1군</td>
												</tr>
											</tbody>
										</table>
										<br>
										<div class="player_records">
											<h6>${vo.regdate}기록</h6>
										</div>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th scope="col">사구</th>
														<th scope="col">삼진</th>
														<th scope="col">총 이닝</th>
														<th scope="col">피안타</th>
														<th scope="col">실점</th>
														<th scope="col">자책점</th>
														<th scope="col">피홈런</th>
														<th scope="col">평균자책점</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2.65</td>
														<td>45</td>
														<td>0</td>
														<td>0</td>
														<td>4</td>
														<td>0</td>
														<td>2</td>
														<td>1.1</td>
													</tr>
												</tbody>
											</table>
										</div>
										<br>
										<div class="player_records">
											<h6>2023 성적</h6>
										</div>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th scope="col">사구</th>
														<th scope="col">삼진</th>
														<th scope="col">총 이닝</th>
														<th scope="col">피안타</th>
														<th scope="col">실점</th>
														<th scope="col">자책점</th>
														<th scope="col">피홈런</th>
														<th scope="col">평균자책점</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2.65</td>
														<td>45</td>
														<td>0</td>
														<td>0</td>
														<td>4</td>
														<td>0</td>
														<td>2</td>
														<td>1.1</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="divBtn">
											<a href="<c:url value='/record/pitcherRecordWrite'/>">기록정보
												등록</a>
										</div>
										<div class="divBtn">
											<a href="<c:url value='/record/pitcherRecordEdit'/>">기록정보
												수정</a>
										</div>
										<div class="divBtn">
											<a href="<c:url value='/record/pitcherRecordDelete'/>">기록정보
												삭제</a>
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