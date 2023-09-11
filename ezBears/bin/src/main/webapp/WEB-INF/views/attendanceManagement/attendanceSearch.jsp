<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="${pageContext.request.contextPath}/css/choong/chi.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">

<%@include file="../inc/top.jsp"%>

<script type="text/javascript">
	function pageFunc(page) {
		$('input[name="currentPage"]').val(page);
		$('form[name="frmPage"]').submit();
	}
</script>

<script type="text/javascript">
	$(function () {
		$('#date11').on('input', function() {
		    var inputTel = $(this).val();
		    
		    // Remove existing "-" characters
		    var cleanedTel = inputTel.replace(/-/g, '');

		    if (cleanedTel.length >= 5) {
		        cleanedTel = cleanedTel.substring(0, 4) + '-' + cleanedTel.substring(4);
		    }
		    if (cleanedTel.length >= 8) {
		        cleanedTel = cleanedTel.substring(0, 7) + '-' + cleanedTel.substring(7);
		    }
		    
		    // Update the value of the input field
		    $(this).val(cleanedTel);
		});
		
		$('#date22').on('input', function() {
		    var inputTel = $(this).val();
		    
		    // Remove existing "-" characters
		    var cleanedTel = inputTel.replace(/-/g, '');

		    if (cleanedTel.length >= 5) {
		        cleanedTel = cleanedTel.substring(0, 4) + '-' + cleanedTel.substring(4);
		    }
		    if (cleanedTel.length >= 8) {
		        cleanedTel = cleanedTel.substring(0, 7) + '-' + cleanedTel.substring(7);
		    }
		    
		    // Update the value of the input field
		    $(this).val(cleanedTel);
		});
		
		$('#excelDownload').click(function () {
			if(confirm('파일로 다운로드 받으시겠습니까?')){
				$('#frmExcel').submit();
			}
		})
		
		
	})
</script>

<style>
	a {
		color: #953de7;
	}
</style>

<!-- 페이징 처리 관련 form -->
<form action="<c:url value='/attendanceManagement/attendanceSearch'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="date11" value="${param.date11 }">
	<input type="hidden" name="date22" value="${param.date22 }">
	<input type="hidden" name="searchDeptNo" value="${param.searchDeptNo }">
	<input type="hidden" name="searchName" value="${param.searchName }">
</form>

<!-- 엑셀 다운로드 처리 관련 form -->
<form action="<c:url value='/attendanceManagement/excel'/>" 
	id="frmExcel" method="post">
	<!-- <input type="hidden" name="currentPage"> -->
	<input type="hidden" name="date11" value="${param.date11 }">
	<input type="hidden" name="date22" value="${param.date22 }">
	<input type="hidden" name="searchDeptNo" value="${param.searchDeptNo }">
	<input type="hidden" name="searchName" value="${param.searchName }">
</form>


<div id="attendanceAll">
	<div class="container-fluid pt-4 px-4">
	    <div class="row g-4">
			<div class="col-sm-12 col-xl-12">
			    <div class="bg-secondary rounded h-100 p-4">
	   	            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			           <ol class="breadcrumb">
			             <li class="breadcrumb-item active" aria-current="page">
			                <a href="<c:url value='/attendanceManagement/attendanceSearch'/>">근태 관리</a>
			             </li>
			             <li class="breadcrumb-item active" aria-current="page">출/퇴근 현황</li>
			           </ol>
		         	</nav>
		         	<div class="col-md-12 text-center">
        				<h3>출/퇴근 현황 조회</h3>
        			</div><br>
        			
        			<form method="post" action="<c:url value='/attendanceManagement/attendanceSearch'/>" name="frmSearch">
			        	<table>
			        		<tr>
					    		<td class="t-search-title" style="width: 25%">
					    			기간
					    		</td>
					    		<td>
						      		<input type="text" name="date11" id="date11" style="width: 120px" maxlength="10" max="9999-12-31" value="${param.date11 }"> ~ 
						      		<input type="text" name="date22" id="date22" style="width: 120px" maxlength="10" max="9999-12-31" value="${param.date22 }">
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
	        		<a href="#" style="float: right;" id="excelDownload">다운로드</a>
        			<br><br>
        			
        			
			        <table class="table table-hover">
			            <thead>
			                <tr style="border-top: 1px solid white;">
			                    <th scope="col">일자</th>
			                    <th scope="col">부서명</th>
			                    <th scope="col">사원명</th>
			                    <th scope="col">출근시간</th>
			                    <th scope="col">퇴근시간</th>
			                    <th scope="col">근무시간</th>
			                    <th scope="col">근무상태</th>
			                </tr>
			            </thead>
			            <tbody>
			            	<c:if test="${empty attendanceList }">
			            		<tr>
			            			<td colspan="6">검색 결과가 없습니다.</td>
			            		</tr>
			            	</c:if>
			            	<c:if test="${!empty attendanceList }">
				            	<c:forEach var="map" items="${attendanceList }">
					                <tr>
					                    <th scope="row"><fmt:formatDate value="${map['IN_TIME'] }" pattern="yyyy-MM-dd EEE"/></th>
					                    <td>${map['DEPT_NAME'] }</td>
					                    <td>${map['MEM_NAME'] }</td>
					                    <td><fmt:formatDate value="${map['IN_TIME'] }" pattern="HH:mm:ss"/></td>
					                    <td><fmt:formatDate value="${map['OUT_TIME'] }" pattern="HH:mm:ss"/></td>
					                    <td>${map['hourGap'] } 시간</td>
					                    <td>${map['STATUS'] }</td>
					                </tr>
				            	</c:forEach>
			            	</c:if>
			            </tbody>
			        </table>
			        
       		        <div class="divPage">
						<!-- 페이지 번호 추가 -->		
						<!-- 이전 블럭으로 이동 -->
						<c:if test="${pagination.firstPage>1 }">
							<a href="#" onclick="pageFunc(${pagination.firstPage-1})">
								<img src="<c:url value='/img/first.JPG'/>">
							</a>
						</c:if>	
										
						<!-- [1][2][3][4][5][6][7][8][9][10] -->
						<c:forEach var="i" begin="${pagination.firstPage }" end="${pagination.lastPage }">		
							<c:if test="${i == pagination.currentPage }">		
								<span style="color: yellow;font-weight: bold;font-size: 1em">${i}</span>
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
					
			        
			        
			        
			        
			        
			    </div>
			</div>
		</div>
	</div>
</div>
 <%@include file="../inc/bottom.jsp"%>