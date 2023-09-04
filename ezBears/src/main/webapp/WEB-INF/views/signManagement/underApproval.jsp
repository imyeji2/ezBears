<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="com.ez.ezBears.attendance.model.AttendanceVO"%>

<%@include file="../inc/top.jsp"%>

<script type="text/javascript">
	$(function () {
		// Ajax 요청을 보냅니다.
	    $.ajax({
	        type: "GET",
	        url: "/signManagement/underApprovalAjax", // 서버에서 데이터를 제공하는 URL로 변경해야 합니다.
	        dataType: "json", // 데이터 유형을 JSON으로 설정합니다. 필요에 따라 변경할 수 있습니다.
	        success: function(jsonStr) {
	            // 성공적으로 데이터를 가져왔을 때 실행되는 콜백 함수입니다.
	            // 데이터를 사용하여 원하는 방식으로 페이지를 업데이트하세요.
	            // 이 예제에서는 underList 데이터를 사용하여 테이블을 업데이트합니다.
	            updateTable(jsonStr);
	        },
	        error: function(xhr, textStatus, errorThrown) {
	            // 요청이 실패했을 때 실행되는 콜백 함수입니다.
	            console.error("Error:", errorThrown);
	        }
	    });

	    function updateTable(jsonStr) {
	    	var htmlStr = "";
	       	htmlStr += "<table class="table text-start align-middle table-bordered table-hover mb-0">";
	       	htmlStr += "<thead>";
	       	htmlStr += "<tr class="text-white">";
	       	htmlStr += "<th scope="col">문서 번호</th>";
	       	htmlStr += "<th scope="col">날짜</th>";
	       	htmlStr += "<th scope="col">제목</th>";
	       	htmlStr += "<th scope="col">부서명</th>";
	       	htmlStr += "<th scope="col">이름</th>";
	       	htmlStr += "<th scope="col">처리상태</th>";
	       	htmlStr += "</tr>";
	       	htmlStr += "</thead>";
	       			
/* 	        // 데이터를 테이블에 추가합니다.
	        $.each(jsonStr,function(index,value){
	        	htmlStr += "<tr>";
	        	htmlStr += "<td>"+this.DOC_NO+"</td>";
	            row.append("<td>" + data[i].DOC_NO + "</td>");
	            row.append("<td>" + data[i].REGDATE + "</td>");
	            row.append("<td><a href='/myBoard/Approval_detail?docNo=" + data[i].DOC_NO + "'>" + data[i].DOC_TITLE + "</a></td>");
	            row.append("<td>" + data[i].DEPT_NAME + "</td>");
	            row.append("<td>" + data[i].MEM_NAME + "</td>");
	            row.append("<td>" + data[i].STATUS + "</td>");
	            tableBody.append(row);
	        } */
	    }
	});
		
		
		
	


</script>



<!-- Blank Start -->
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
		<div class="col-sm-12 col-xl-12">
		    <div class="bg-secondary rounded h-100 p-4">
			<c:import url="/signManagement/approvalManagementNavTab"></c:import>
			
			
				<div class="tab-pane fade show active">
				<!-- Recent Sales Start -->
					<div id="approval">
						<div class="d-flex align-items-center justify-content-between mb-4">
							<h6 class="mb-0">결재 중</h6>
							<!-- <a href="">Show All</a> -->
						</div>
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
									<%-- <c:if test="${empty underList }">
										<tr>
											<th colspan="6">결재 요청이 없습니다.</th>
										</tr>
									</c:if>
									<c:if test="${!empty underList }">
										<c:forEach var="list" items="${underList }">
											<tr>
												<td>${list.DOC_NO }</td>
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
									</c:if> --%>
								</tbody>
							</table>
						</div>
<!-- 						<button type="button" class="btn btn-sm btn-primary insertapp"
							data-toggle="modal" data-target="#approvalModal">결재작성
						</button> -->
						
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

<h1>결제중 페이지</h1>




            </div>
        </div>
    </div>
</div>
<!-- Black End -->
<%@include file="../inc/bottom.jsp"%>