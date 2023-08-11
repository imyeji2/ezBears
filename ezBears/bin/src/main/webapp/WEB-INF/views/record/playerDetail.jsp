<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>이젠 베어스 - 그룹웨어 시스템</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<!-- Favicon -->
<link href="/ezBears/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/ezBears/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="/ezBears/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/ezBears/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/ezBears/css/custom.css">

<!-- Template Stylesheet -->
<link href="/ezBears/css/style.css" rel="stylesheet">
<script type="text/javascript" src="/ezBears/js/jquery-3.7.0.min.js"></script>

<!-- 개인 css -->
<link href="/ezBears/css/yeji.css" rel="stylesheet">

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
								<h3 class="tit-page">선수 상세 정보</h3><br>
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
															<th scope="row">10</th>
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
												<br>
												<div class="player_records2"></div>
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
																<th scope="col">타율</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>100</td>
																<td>100</td>
																<td>200</td>
																<td>100</td>
																<td>10</td>
																<td>0</td>
																<td>5.55</td>
															</tr>
														</tbody>
													</table><br><br>
			
													<h6 class="mb-4">특이사항</h6>
													<ul class="list-unstyled mb-0">
														<li>땅콩 알레르기 있음</li>
													</ul>

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
		</div>
	</div>


<%@include file="../inc/bottom.jsp"%>