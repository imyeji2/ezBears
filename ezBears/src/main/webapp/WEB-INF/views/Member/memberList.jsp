<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">
<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>
<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" action="<c:url value='/Member/memberList'/>">
	<input type="hidden" name="currentPage">	
</form>
<!-- 페이징 처리 form 끝 -->

	<div class="col-12">
	    <div class="bg-secondary rounded h-100 p-4">
	        <h6 class="mb-4">사원 리스트</h6>
			<form class="btn-form" name="frm1" method="get" action="<c:url value ='/Member/write'/>">
				<input type="text" class ="txtboxSearch" id="txtboxSearch" value="검색어를 입력해주세요">
				<button class="btnSearch" id="btnSearch" value="검색">검색</button>
				<button type="submit" class="btnAdd" id="btnAdd" value="등록">등록</button>
				<button class="btnDelete" type="button" id="btnDelete">삭제</button>
			</form>
			<br>
	        <div class="table-responsive">
	            <table class="table">
	                <thead>
	                    <tr>
	                        <th scope="col" style="text-align: center">-</th>
	                        <th scope="col">부서</th>
	                        <th scope="col">직급</th>
	                        <th scope="col">이름</th>
	                        <th scope="col">아이디</th>
	                        <th scope="col">핸드폰번호</th>
	                        <th scope="col">생년월일</th>
	                        <th scope="col">주소</th>
	                        <th scope="col">고용형태</th>
	                        <th scope="col">입사일</th>
	                        <th scope="col">퇴사일</th>
	                    </tr>
	                </thead>
	                <tbody>
	                <c:if test="${empty list}">
	                	<tr>
	                		<td colspan="12">사원이 존재하지 않습니다.</td>
	                	</tr>
	                </c:if>
	                <c:if test="${!empty list}">
	                	<c:forEach var="memberVo" items="${list}"> 
	                		<tr class="memList">
	                			<td><input type="checkbox"></td>
	                			<td>${memberVo.deptName}</td>
	                			<td>${memberVo.positionName}</td>
	                			<td>
	                				<a href="<c:url value='/Member/detail?memNo=${memberVo.memNo}'/>">${memberVo.memName}</a>
	                			</td>
	                			<td>
	                				<a href="<c:url value='/Member/detail?memNo=${memberVo.memNo}'/>">${memberVo.memId}</a>
	                			</td>
	                			<td>${memberVo.memTel}</td>
	                			<td>${memberVo.memBirth.substring(0, 10)}</td>
	                			<td>${memberVo.memAddress} ${memberVo.memAddressDetail}</td>
	                			<td>${memberVo.type}</td>
	                			<td>${memberVo.contractStart.substring(0, 10)}</td>
	                			<td>${memberVo.contractDone.substring(0, 10)}</td>
	                		</tr>
	                	</c:forEach>
	                </c:if>
	                </tbody>
	            </table>
	        </div>
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
						<span style="color:#7000D8;font-weight:bold">${i}</span>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">						
						<a href="#" onclick="pageFunc(${i})" style="color:white">
							[${i}]
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
	    </div>
	</div>

<%@include file="../inc/bottom.jsp"%>    