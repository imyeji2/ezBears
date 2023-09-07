<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="com.ez.ezBears.attendance.model.AttendanceVO"%>
<link href="${pageContext.request.contextPath}/css/choong/chi.css" rel="stylesheet">

<%@include file="../inc/top.jsp"%>

<script type="text/javascript">
	function pageFunc(page) {
		$('input[name="currentPage"]').val(page);
		$('form[name="frmPage"]').submit();
	}
</script>

<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/signManagement/underApproval'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchTitle" value="${param.searchTitle }">
	<input type="hidden" name="searchDeptNo" value="${param.searchDeptNo }">
	<input type="hidden" name="searchName" value="${param.searchName }">
</form>

<!-- Blank Start -->
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
		<div class="col-sm-12 col-xl-12">
		    <div class="bg-secondary rounded h-100 p-4">
		    
		    <!-- nav 임포트@@@@@@@@@@@@@@@@@ -->
			<c:import url="/signManagement/approvalManagementNavTab"></c:import>
			
			
				<div class="tab-pane fade show active">
				<!-- Recent Sales Start -->
					<div id="approval">
						<div class="d-flex align-items-center justify-content-between mb-4">
							<h6 class="mb-0">결재 중</h6>
							<!-- <a href="">Show All</a> -->
						</div>
						
						<form method="post" action="<c:url value='/signManagement/underApproval'/>" name="frmSearch">
				        	<table>
				        		<tr>
						    		<td class="t-search-title" style="width: 25%">
						    			제목
						    		</td>
						    		<td>
						    			<input type="text" name="searchTitle" id="searchTitle" style="width: 160px" value="${param.searchTitle }">
							      		<input type="submit" value="검색" id="btnSearch">
							      	</td>
							    </tr>
				        		<tr>
				        			<th>부서명</th>
				        			<td>
					        			<select name="searchDeptNo" style="width: 99%">
											<!-- 반복문 -->
											<option value="" selected="selected">전체 부서</option>
											<c:forEach var="deptVo" items="${deptList}">
												<option value ="${deptVo.deptNo}"
													<c:if test="${param.searchDeptNo == deptVo.deptNo }">selected</c:if>
												>${deptVo.deptName}</option>
											</c:forEach>
											<!-- 반복문 -->
			                            </select>
				        			</td>
				        		</tr>
				        		<tr>
				        			<th>사원명</th>
				        			<td><input type="text" name="searchName" style="width: 99%" value="${param.searchName }"></td>
				        		</tr>
				        		<!-- <tr>
				        			<th>근무 상태</th>
				        			<td><input type="text" name="searchACondition" style="width: 99%"></td>
				        		</tr> -->
				        	</table>
			        	</form>
						<br>
						<div class="table-responsive">
							<table class="table text-start align-middle table-bordered table-hover mb-0">
								<thead>
									<tr class="text-white">
										<th scope="col">문서 번호</th>
										<th scope="col">날짜</th>
										<th scope="col">제목</th>
										<th scope="col">부서명</th>
										<th scope="col">이름</th>
										<th scope="col">처리상태</th>
									</tr>
								</thead>
								<tbody id="table-body">
									<c:if test="${empty underList }">
										<tr>
											<th colspan="6">결재 요청이 없습니다.</th>
										</tr>
									</c:if>
									<c:if test="${!empty underList }">
										<c:forEach var="list" items="${underList }">
											<tr>
												<td>${list['DOC_NO'] }</td>
												<td><fmt:formatDate value="${list['REGDATE'] }"
														pattern="yyyy-MM-dd" /></td>
												<td><a
													href="<c:url value='/myBoard/Approval_detail?docNo=${list["DOC_NO"]}' />"
													style="color: #fff">${list["DOC_TITLE"]}</a></td>
												<td>${list['DEPT_NAME'] }</td>
												<td>${list['MEM_NAME'] }</td>
												<td>${list['STATUS']}</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
<!-- 						<button type="button" class="btn btn-sm btn-primary insertapp"
							data-toggle="modal" data-target="#approvalModal">결재작성
						</button> -->
						
					    <div class="divPage" style="text-align: center" >		
							<!-- 페이지 번호 추가 -->		
							<c:if test="${pagination.firstPage>1 }">
								<a href="#" onclick="pageFunc(${pagination.firstPage-1})">			
								    <img src='<c:url value="/images/first.JPG" />'  border="0">	</a>
							</c:if>
											
							<!-- [1][2][3][4][5][6][7][8][9][10] -->
							<c:forEach var="i" begin="${pagination.firstPage }" 
							end="${pagination.lastPage }">
								<c:if test="${i==pagination.currentPage }">
									<span style="color:#7000D8;font-weight:bold" class="curPageNum">${i}</span>
								</c:if>
								<c:if test="${i!=pagination.currentPage }">						
									<a href="#" onclick="pageFunc(${i})" style="color:yellow" class="etcPageNum">
										${i}
									</a>
								</c:if>
							</c:forEach>
								
							<c:if test="${pagination.lastPage<pagination.totalPage }">
								<a href="#" onclick="pageFunc(${pagination.lastPage+1})">			
									<img src="<c:url value="/images/last.JPG" />" border="0">
								</a>
							</c:if>
							<!--  페이지 번호 끝 -->
							
						</div>
						<!-- Approval -->
					</div>
				</div>

<h1>결제중 페이지</h1>




            </div>
        </div>
    </div>
</div>
<!-- Black End -->
<%@include file="../inc/bottom.jsp"%>