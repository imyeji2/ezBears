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

 

</script>
<form name="frmPage" method="post" action="<c:url value='/myBoard/Approval?mBoardNo=${mBoardNo }'/>">
	<input type="hidden" name="currentPage">	
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<%-- <input type="hidden" name="searchName" value="${param.searchName }"> --%>
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
					<!-- 검색 버튼 -->
				 <form id="app-form" action="<c:url value='/myBoard/Approval?mBoardNo=${mBoardNo }'/>" method="post" enctype="multipart/form-data" >
						<div class="col-auto d-flex align-items-center">
							<input type="hidden" name="mBoardNo" value="${mBoardNo}">

						    <input type="text" class="signTextSearch" id="txtboxSearch" name="searchKeyword" 
						 	   value="${param.searchKeyword }" placeholder="기안자를 입력해주세요" style="text-align: center;">
						    <button type="submit" class="btn btn-sm btn-primary signSearchBtn" id="btnSearch">검색</button>
						</div>
				</form> 
				
						</div>
						<div class="table-responsive">
							<table
								class="table text-start align-middle table-bordered table-hover mb-0">
								<thead>
									<tr class="text-white">
										<th scope="col">문서 번호</th>
										<th scope="col">기안 날짜</th>
										<th scope="col">제목</th>
										<th scope="col">기안자</th>
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
						<!-- <button type="button" class="btn btn-sm btn-primary insertapp"
							data-toggle="modal" data-target="#approvalModal">결재작성							
						</button> -->
					<a href='<c:url value='/myBoard/Approval_write?mBoardNo=${mBoardNo }'/>' role="button"
					class="btn btn-sm btn-primary insertapp">결재 작성</a>
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

				<div>
					<input type="hidden" name="mBoardNo" value="${mBoardNo}">
					 <input type="hidden" name="userid" value="${userid}"> 
						<input type="hidden" name="memNo" value="${memNo}"> 
						<input type="hidden" name="deptNo" value="${myBoardInfoVo.deptNo}">
						<input type="hidden" name="positionNo" value="${myBoardInfoVo.positionNo}">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Recent Sales End -->



<%@include file="../inc/bottom.jsp"%>
