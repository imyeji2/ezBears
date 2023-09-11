<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../inc/top.jsp"%>

<link href="${pageContext.request.contextPath}/css/choong/chi.css" rel="stylesheet">

<script type="text/javascript">
	function pageFunc(page) {
		$('input[name="currentPage"]').val(page);
		$('form[name="frmPage"]').submit();
	}
</script>

<!-- 페이징 처리 관련 form -->
<!-- /staff/staffList?currentPage=2&searchKeyword=gil&searchCondition=name -->
<!-- <form action="<c:url value='/staff/staffList'/>" 
	name="frmPage" method="post">
	<input type="text" name="currentPage">
	<input type="text" name="searchKeyword" value="${param.searchKeyword}">
	<input type="text" name="searchCondition" value="${param.searchCondition}">
</form> -->

<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
		<div class="col-sm-12 col-xl-12">
		    <div class="bg-secondary rounded h-100 p-4">
		        <h6 class="mb-4">선수 리스트</h6>
		        
				
		        <table class="table table-hover">
		            <thead>
		                <tr>
		                    <th scope="col">등번호</th>
		                    <th scope="col">이름</th>
		                    <th scope="col">포지션</th>
		                    <th scope="col">상태</th>
		                </tr>
		            </thead>
		            <tbody>
		            	<c:if test="${empty list }">
		            		<tr>
		            			<th colspan="3">등록된 사원이 존재하지 않습니다.</th>
		            		</tr>
		            	</c:if>
		            	<c:if test="${!empty list }">
			            	<c:forEach var="vo" items="${list }">
				                <tr>
				                    <td>${vo.staffPosition }</td>
				                    <td><a href="<c:url value='/staff/staffDetail?staffNo=${vo.staffNo }'/>" style="color: #fff">${vo.staffName }</a></td>
				                    <td><a href="<c:url value='/staff/staffDetail?staffNo=${vo.staffNo }'/>" style="color: #fff">${vo.staffId }</a></td>
				                    <td>${vo.staffInfo }</td>
				                    <td>${vo.staffTel }</td>
				                    <td>${vo.staffAddr }</td>
				                </tr>
			            	</c:forEach>
		            	</c:if>
		            </tbody>
		        </table>
		        <br>
				<div class="divBtn">
				    <a href="<c:url value='/staff/staffWrite'/>">스태프 등록</a>
				</div>
				<br>
				
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
				<br>
				<div class="divSearch">
				   	<form name="frmSearch" method="POST" action="<c:url value='/staff/staffList'/>">
				        <select name="searchCondition">
				            <option value="STAFF_NAME" 
				            	<c:if test="${param.searchCondition=='STAFF_NAME'}">
				            		selected="selected"
				            	</c:if>            	
				            >이름</option>
				            <option value="STAFF_POSITION"
				            	<c:if test="${param.searchCondition=='STAFF_POSITION'}">
				            		selected="selected"
				            	</c:if> 
				            >포지션</option>
				            <option value="STAFF_ID" 
				            	<c:if test="${param.searchCondition=='STAFF_ID'}">
				            		selected="selected"
				            	</c:if> 
				            >아이디</option>
				        </select>   
				        <input type="text" name="searchKeyword" title="검색어 입력" 
				        	value="${param.searchKeyword }">   
						<input type="submit" value="검색" id="btnSearch">
				    </form>
				</div>
				
		    </div>
		</div>
	</div>
</div>

 <%@include file="../inc/bottom.jsp"%>