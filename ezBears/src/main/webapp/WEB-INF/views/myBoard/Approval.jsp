<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>

<!-- Popper.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Bootstrap JS -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function pageFunc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}

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
<form name="frmPage" method="post" action="<c:url value='/myBoard/Approval?mBoardNo=${mBoardNo }'/>">
	<input type="hidden" name="currentPage">	
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>

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
										<th scope="col">문서 번호</th>
										<th scope="col">날짜</th>
										<th scope="col">제목</th>
										<th scope="col">이름</th>
										<th scope="col">처리상태</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
										<tr>
											<th colspan="6">결재 요청이 없습니다.</th>
										</tr>
									</c:if>
									<c:if test="${!empty list }">
										<c:forEach var="list" items="${list}">
											<tr>
												<td>${list.DOC_NO }</td>
												<td><fmt:formatDate value="${list['REGDATE'] }"
														pattern="yyyy-MM-dd" /></td>
												<td><a
													href="<c:url value='/myBoard/Approval_detail?docNo=${list["DOC_NO"]}' />"
													style="color: #fff">${list["DOC_TITLE"]}</a></td>
												<td>${list['MEM_NAME'] }</td>
												<td>${list['STATUS']}</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						<button type="button" class="btn btn-sm btn-primary insertapp"
							data-toggle="modal" data-target="#approvalModal">결재작성</button>
					
					  <div class="divPage" style="text-align: center" >		
				<!-- 페이지 번호 추가 -->		
				<c:if test="${pagingInfo.firstPage>1 }">
					<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">			
					    <img src='<c:url value="/images/first.JPG" />'  border="0">	</a>
				</c:if>
								
				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<c:forEach var="i" begin="${pagingInfo.firstPage }" 
				end="${pagingInfo.lastPage }">
					<c:if test="${i==pagingInfo.currentPage }">
						<span style="color:#7000D8;font-weight:bold" class="curPageNum">${i}</span>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">						
						<a href="#" onclick="pageFunc(${i})" style="color:white" class="etcPageNum">
							${i}
						</a>
					</c:if>
				</c:forEach>
					
				<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
					<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">			
						<img src="<c:url value="/images/last.JPG" />" border="0">
					</a>
				</c:if>
				<!--  페이지 번호 끝 -->
						
						</div>
						<!-- Approval -->
					</div>
				</div>
				<!-- Recent Sales End -->

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
									<label for="approvalCategory">결재분류</label> <select
										class="form-control" id="approvalCategory"
										name="approvalCategory">
										<option value="" disabled selected>선택하세요</option>
										<option value="휴가" id="vacationForm">휴가신청서</option>
										<option value="기안서" id="draftForm">기안서</option>
										<option value="품의서" id="requisitionForm">품의서</option>
										<option value="지출결의서" id="expenseForm">지출결의서</option>
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
						type="text" name="memNo" value="${memNo}"> <input
						type="text" name="deptNo" value="${myBoardInfoVo.deptNo}">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Recent Sales End -->



<%@include file="../inc/bottom.jsp"%>
