<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>

<!-- Recent Sales Start -->
<div class="container-fluid pt-4 px-4" id="board_style">
	<div class="bg-secondary text-center rounded">
		<div class="bg-secondary rounded h-100 p-4">
			<c:import url="/myBoard/myBoardNavTab?mBoardNo=${mBoardNo}"></c:import>
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active">
					<!-- Recent Sales Start -->
					<div id="approval">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<h6 class="mb-0">결재</h6>
							<a href="">Show All</a>
						</div>
						<div class="table-responsive">
							<table
								class="table text-start align-middle table-bordered table-hover mb-0">
								<thead>
									<tr class="text-white">
										<th scope="col"><input class="form-check-input"
											type="checkbox"></th>
										<th scope="col">날짜</th>
										<th scope="col">제목</th>
										<th scope="col">이름</th>
										<th scope="col">분류</th>
										<th scope="col">처리상태</th>
									</tr>
								</thead>
								<tbody>



									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td>2023-01-21</td>
										<td><a href="Approval_detail">TEST</a></td>
										<td>Jhon Doe</td>
										<td>휴가</td>

										<td><a class="btn btn-sm btn-primary" href="">대기</a></td>
									</tr>
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td>2023-01-21</td>
										<td><a href="Approval_detail">TEST</a></td>
										<td>Jhon Doe</td>
										<td>결재</td>

										<td><a class="btn btn-sm btn-primary" href="">승인</a></td>
									</tr>
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td>2023-01-21</td>
										<td><a href="Approval_detail">TEST</a></td>
										<td>Jhon Doe</td>
										<td>휴가</td>

										<td><a class="btn btn-sm btn-primary" href="">대기</a></td>
									</tr>
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td>2023-01-21</td>
										<td><a href="Approval_detail">TEST</a></td>
										<td>Jhon Doe</td>
										<td>결재</td>

										<td><a class="btn btn-sm btn-primary" href="">대기</a></td>
									</tr>
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
										<td>2023-01-21</td>
										<td><a href="Approval_detail">TEST</a></td>
										<td>Jhon Doe</td>
										<td>결재</td>

										<td><a class="btn btn-sm btn-primary" href="">대기</a></td>
									</tr>
								</tbody>
							</table>

							<a href='<c:url value='/myBoard/Approval_write'/>' role="button"
								class="btn btn-sm btn-primary" id="Approvalbtn">결재작성</a>

						</div>
					</div>
					<!-- Approval -->
					<!-- Recent Sales End -->
				</div>
			</div>
		</div>
	</div>

</div>
<!-- Recent Sales End -->



<%@include file="../inc/bottom.jsp"%>
