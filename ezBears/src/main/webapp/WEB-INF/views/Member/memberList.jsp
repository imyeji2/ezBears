<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">
<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	$(function(){
		
		var url =window.location.pathname;
		var type =url.lastIndexOf("/");
		var id= url.substr(type+1);
		$('#'+id).addClass('active');
		
	    $('.btnDelete').click(function(){
			if (confirm("삭제하시겠습니까?")) {
		        var memNo = $('.MemChk:checked').closest('tr').find('#hiddenMemNo').val();
		        var url = "<c:url value='/Member/delete?memNo=" + memNo + "'/>";
		        $('.btn-form').attr('action', url);
		        $('.btn-form').submit();
			}else {
		    	event.preventDefault();
			}
	    });
	});
	
</script>
<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" action="<c:url value='/Member/list'/>">
	<input type="hidden" name="currentPage">	
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>
<!-- 페이징 처리 form 끝 -->

	<div class="col-12">
	    <div class="bg-secondary rounded h-100 p-4" id="rounded">
		    <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	           <ol class="breadcrumb">
	             <li class="breadcrumb-item active" aria-current="page">
	                <a href="<c:url value='/Member/list'/>">사원관리</a>
	             </li>
	           </ol>
	         </nav>
	        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			    <li class="nav-item" role="presentation">
			        <a class="nav-link tap_txt" id="list" href="<c:url value='/Member/list'/>">사원 리스트</a>
			    </li>
			    <li class="nav-item" role="presentation">
			        <a class="nav-link tap_txt" id="SMSSend" href="<c:url value='/Member/sendMSG'/>">SMS전송</a>
			    </li>                                 
			</ul>
			
			<form class="btn-form" name="frm1" method="post" action="<c:url value ='/Member/list'/>">
				<div class="btns">
					<input type="text" class ="txtboxSearch" id="txtboxSearch" name="searchKeyword" value="${param.searchKeyword}" placeholder="검색어를 입력해주세요" style="text-align: center;">
					<button type="submit" class="btnSearch" id="btnSearch" >검색</button>
					<a href = "<c:url value='/Member/write'/>" class="btnAdd" id ="btnAdd">등록</a>
					<button class="btnDelete" type="button" id="btnDelete" >퇴사</button>
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
		                        <th scope="col">부서</th>
		                        <th scope="col">직급</th>
		                        <th scope="col">이름</th>
		                        <th scope="col">아이디</th>
		                        <th scope="col">핸드폰번호</th>
		                        <th scope="col">고용형태</th>
		                        <th scope="col">입사일</th>
		                        <th scope="col">퇴사일</th>
		                    </tr>
		                </thead>
		                <tbody>
		                <c:if test="${empty list}">
		                	<tr>
		                		<td colspan="12" style="text-align: center">사원이 존재하지 않습니다.</td>
		                	</tr>
		                </c:if>
		                <c:if test="${!empty list}">
		                	<c:forEach var="memberVo" items="${list}"> 
		                		<tr class="memList">
		                			<td><input type="checkbox" class="MemChk"></td>
		                			<td>${memberVo.deptName}</td>
		                			<td>${memberVo.positionName}</td>
		                			<td>
		                				<a href="<c:url value='/Member/detail?memNo=${memberVo.memNo}'/>">${memberVo.memName}</a>
		                			</td>
		                			<td>
		                				<a href="<c:url value='/Member/detail?memNo=${memberVo.memNo}'/>">${memberVo.memId}</a>
		                			</td>
		                			<td>${memberVo.memTel}</td>
		                			<td>${memberVo.type}</td>
		                			<td>${memberVo.contractStart.substring(0, 10)}</td>
		                			<td>${memberVo.contractDone.substring(0, 10)}</td>
		                			<td><input type="hidden" id="hiddenMemNo" value = "${memberVo.memNo}"></td>
		                		</tr>
		                	</c:forEach>
		                </c:if>
		                </tbody>
		            </table>
		        </div>
	        </form>
	     
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
	    </div>
	</div>

<%@include file="../inc/bottom.jsp"%>    