<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>

<!-- Popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
//폼 출력

function submitForm() {
    var selectedCategory = document.getElementById("approvalCategory").value;
    
    if (selectedCategory === "휴가") {
        window.location.href = "<c:url value='/myBoard/Approval_write?mBoardNo=${mBoardNo }'/>";
    } else if (selectedCategory === "기안서") {
        window.location.href = "기안서";
    } else if (selectedCategory === "품의서") {
        window.location.href = "품의사";
    } else if (selectedCategory === "지출결의서") {
        window.location.href = "지출결의서";
    }

    // 모달 닫기
    $('#approvalModal').modal('hide');
}
document.addEventListener("DOMContentLoaded", function() {
    // 휴가신청서 클릭 시 휴가신청서 페이지로 이동
    document.getElementById("vacationForm").addEventListener("click", function() {
        document.getElementById("approvalCategory").value = "휴가신청서";
        submitForm();
    });

    // 기안서 클릭 시 기안서 페이지로 이동
    document.getElementById("draftForm").addEventListener("click", function() {
        document.getElementById("approvalCategory").value = "기안서";
        submitForm();
    });

    // 품의서 클릭 시 휴가신청서 페이지로 이동
    document.getElementById("requisitionForm").addEventListener("click", function() {
        document.getElementById("approvalCategory").value = "품의서";
        submitForm();
    });

    // 지출결의서 클릭 시 기안서 페이지로 이동
    document.getElementById("expenseForm").addEventListener("click", function() {
        document.getElementById("approvalCategory").value = "지출결의서";
        submitForm();
    });
});
    
</script>


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
							<button type="button" class="btn btn-sm btn-primary insertapp"
								data-toggle="modal" data-target="#approvalModal">결재작성</button>
						</div>
					</div><!-- Approval -->

				</div>	<!-- Recent Sales End -->
			
				<!-- 모달 -->
				<div class="modal fade" id="approvalModal" tabindex="-1"
					role="dialog" aria-labelledby="approvalModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="approvalModalLabel">결재 작성</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<!-- 결재분류 선택 -->
								<div class="form-group">
									<label for="approvalCategory">결재분류</label> 
									<select class="form-control" id="approvalCategory"
										name="approvalCategory">
										<option value="" disabled selected>선택하세요</option>
										<option value="휴가" id="vacationForm" >휴가신청서</option>
										<option value="기안서" id="draftForm">기안서</option>
										<option value="품의서" id="requisitionForm">품의서</option>
										<option value="지출결의서" id="expenseForm" >지출결의서</option>
									</select>
								</div>
																
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									onclick="submitForm()">작성</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
				<!-- approvalModal -->

				<div>
					<input type="text" name="mBoardNo" value="${mBoardNo}"> <input
						type="text" name="userid" value="${userid}"> <input
						type="text" name="memNo" value="${memNo}">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Recent Sales End -->



<%@include file="../inc/bottom.jsp"%>
