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
<style>

tbody {
    display: flex;
    flex-wrap: wrap;
}

tr.memList {
    width: 330px;
}


</style>
<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" action="<c:url value='/Member/list'/>">
	<input type="hidden" name="currentPage">	
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>
<!-- 페이징 처리 form 끝 -->

	<div class="col-12">
	    <div class="bg-secondary rounded h-100 p-4">
		    <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	           <ol class="breadcrumb">
	             <li class="breadcrumb-item active" aria-current="page">
	                <a href="<c:url value='/Member/memberInfo'/>">주소록</a>
	             </li>
	             <li class="breadcrumb-item active" aria-current="page">사원 리스트</li>
	           </ol>
	         </nav>
	      
			<form class="btn-form" name="frm1" method="post" action="<c:url value ='/Member/memberInfo'/>">
				<div class="btns">
					<input type="text" class ="txtboxSearch" id="txtboxSearch" name="searchKeyword" value="${param.searchKeyword}" placeholder="검색어를 입력해주세요" style="text-align: center;">
					<button type="submit" class="btnSearch" id="btnSearch" >
						<img class ="searchImg" alt="" src="<c:url value='/img/search.png'/>" >
					</button>
				</div>
			
				<br>
				<div>
					<c:if test="${empty param.searchKeyword}">
					   <p>전체 ${pagingInfo.totalRecord}명의 사원이 검색되었습니다.</p>
					</c:if>   
					<c:if test="${!empty param.searchKeyword}">
					   <p>'${param.searchKeyword}' 검색한 결과, ${pagingInfo.totalRecord}명의 사원이 검색되었습니다.</p>
					</c:if>   
				</div>
		        <div class="table-responsive">
		            <table class="table">
		                <thead>
		                    <tr>
		                        <th scope="col" style="text-align: center">-</th>
		                    </tr>
		                </thead>
		                <tbody>
		                <c:if test="${empty list}">
		                	<tr>
		                		<td style="text-align: center">사원이 존재하지 않습니다.</td>
		                	</tr>
		                </c:if>
		                <c:if test="${!empty list}">
		                	<c:forEach var="memberVo" items="${list}">
			                		<tr class="memList">
			                			<td>
			                			<div class="perPerson">
											<div class ="imgdiv">
												<c:choose>
													<c:when test ="${empty memberVo.memImage}">
														<img alt="" src="<c:url value = '/img/defaultUSER.png'/>" style="width:120px; height:120px;" class="memberImageInfo" id="previewImage" name="memImage">
													</c:when>
													<c:otherwise>
														<img alt="" src="<c:url value = '/img/mem_images/${memberVo.memImage}'/>" style="width:110px; height:120px;" class="memberImageInfo" id="previewImage" name="memImage">
													</c:otherwise>
												</c:choose>	
											</div>
											<div class = "infodiv">
				                				<a id="AdeptName">${memberVo.deptName}</a>
				                				<br>
				                				<a id="AmemName" href="<c:url value='/Member/detail?memNo=${memberVo.memNo}'/>">${memberVo.memName} ${memberVo.positionName}</a>
				                				<br>
				                				<br>
					                			<a id="AmemTel">${memberVo.memTel}</a>
				                				<br>
				                				<a href="<c:url value='/Member/detail?memNo=${memberVo.memNo}'/>">${memberVo.memId}</a>
			                				</div>
		                				</div>
			                		</tr>
		                	</c:forEach>
		                </c:if>
		                </tbody>
		            </table>
		        </div>
	        </form>
	    </div>
	</div>

<%@include file="../inc/bottom.jsp"%>    