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
<form name="frmPage" method="post" action="<c:url value='/mBoard/list'/>">
	<input type="hidden" name="currentPage">	
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>
<!-- 페이징 처리 form 끝 -->

	<div class="col-12">
	    <div class="bg-secondary rounded h-100 p-4" id="rounded">
		    <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	           <ol class="breadcrumb">
	             <li class="breadcrumb-item active" aria-current="page">
	                <a href="<c:url value='/mboard/list'/>">게시글 관리</a>
	             </li>
	             <li class="breadcrumb-item active" aria-current="page">게시판 리스트</li>
	           </ol>
	         </nav>
	      
			<form class="btn-form" name="frm1" method="post" action="<c:url value ='/mboard/list'/>">
				<div class="btns">
					<input type="text" class ="txtboxSearch" id="txtboxSearch" name="searchKeyword" value="${param.searchKeyword}"placeholder="검색어를 입력해주세요">
					<button type="submit" class="btnSearch" id="btnSearch" >검색</button>
				</div>
				<br>
				<div class="table-out">
			        <div class="table-responsive" id="deptResp">
			            <table class="table">
			                <thead>
			                    <tr>
			                        <th scope="col" style="text-align: center">-</th>
			                        <th scope="col">게시판 이름</th>
			                        <th scope="col">담당자 이름</th>
			                        <th scope="col">담당자 부서</th>
			                        <th scope="col">담당자 부서번호</th>
			                    </tr>
			                </thead>
			                <tbody>
			                <c:if test="${empty list}">
			                	<tr>
			                		<td colspan="12" style="text-align: center">게시판이 존재하지 않습니다.</td>
			                	</tr>
			                </c:if>
			                <c:if test="${!empty list}">
			                	<c:forEach var="MBoardVo" items="${list}"> 
			                		<tr class="mboardList">
			                			<td id="mboardno">-<input type="hidden" name="MBoardNo" value="${MBoardVo.MBoardNo}"></td>
			                			<td>
			                				<a href ="<c:url value = '/myBoard/teamNotice?mBoardNo=${MBoardVo.MBoardNo}'/>" id="mboardNameA">
			                					${MBoardVo.MBoardName}
			                				</a>
			                			</td>
			                			<td >
			                				<a href ="<c:url value = '/Member/detail?memNo=${MBoardVo.memNo}'/>" id="mboardNameA">
			                					${MBoardVo.memName}
			                				</a>
			                			</td>
			                			<td >${MBoardVo.deptName}</td>
			                			<td >${MBoardVo.deptTel}</td>
			                		</tr>
			                	</c:forEach>
			                </c:if>
			                </tbody>
			            </table>
			        </div>
		        </div>
	        </form>
	     <c:if test="${pagingInfo.firstPage>1 }">
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
		</c:if>
	    </div>
	</div>

<%@include file="../inc/bottom.jsp"%>    