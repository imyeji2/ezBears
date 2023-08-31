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
		$('.popup-inner').hide();

		$('.popup-background').click(function() {
			$('.popup').removeClass('open');
		});
		
		$('.close-btn').click(function() {
			$('.popup').removeClass('open');
		});
		
		$(document).keyup(function(e) {
		    if (e.key === "Escape") { 
		        $('.popup-inner').hide(); 
		        $('.popup.members-popup').removeClass('open');
		    }
		});
		
		$('.infodiv #btInfo').click(function(){
		    var memNo = $(this).closest('.memList').find('.memNo').val(); // 수정된 부분
		    
		    $.ajax({
		        url: "<c:url value='/Member/memberDetail'/>",
		        type: 'get',
		        data: { memNo: memNo },
		        dataType: 'json',
		        success: function(res){
		            console.log(res);

		            $('.popup-inner #previewImage').attr("src","../img/mem_images/" + res.memImage);
		            $('.popup-inner #deptName').val(res.deptName);
		            $('.popup-inner #positionName').val(res.positionName); 
		            $('.popup-inner #memName').val(res.memName);
		            $('.popup-inner #memId').val(res.memId); 
		            $('.popup-inner #memTel').val(res.memTel); 
		            
		            if (res.memBirth) {
		                $('.popup-inner #memBirth').val(res.memBirth.substring(0, 10));
		            }
		            
				    $('.popup-inner').show();
				    $('.popup.members-popup').addClass('open');
		        },
		        error: function(xhr, status, error){
		            alert(status + " : " + error);
		        }
		    });
		});
		
		
	})

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
		        <div class="table-responsive">
		            <table class="table">
		                <thead>
		                    <tr>
		                        <th scope="col" style="text-align: center">
									<div>
										<c:if test="${empty param.searchKeyword}">
										   <p class="Allcnt">총 ${pagingInfo.totalRecord}명의 사원이 검색되었습니다.</p>
										</c:if>   
										<c:if test="${!empty param.searchKeyword}">
										   <p class="Allcnt">'${param.searchKeyword}' 검색한 결과, ${pagingInfo.totalRecord}명의 사원이 검색되었습니다.</p>
										</c:if>   
									</div>
				                    <div class="searchbtn">
				                    	<button class="searchAll">전체</button>
				                    
				                    	<select name="MemDeptNo" id="MemDeptNo">
								        	<option value="" >부서별</option>
										
											<c:forEach var="deptVo" items="${deptList}">
												<option class="memClass" value ="${deptVo.deptNo}">${deptVo.deptName}</option>
											</c:forEach>
											
								       	</select>
								       								
								        <select name="MemPositionNo" id="MemPositionNo">
								        	<option value="" >직급</option>
								        	<!-- 반복문 -->
											<c:forEach var="positionVo" items="${positionList}">
												<option class="memClass" value ="${positionVo.positionNo}">${positionVo.positionName}</option>
											</c:forEach>
								        	<!-- 반복문 -->
								       	</select>
				                    </div>
		                       	</th>
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
										<div class = "hiddenNo"><input type="hidden" name="memNo" class="memNo" id="memNo" value="${memberVo.memNo }"></div>
										<div class = "infodiv">
			                				<a id="AdeptName">${memberVo.deptName}</a>
			                				<br>
			                				<a id="AmemPosition">${memberVo.positionName}</a>
			                				<br>
			                				<a id="AmemName">${memberVo.memName}</a>
		                					<br>
		                					<br>
		                					<div class ="twoBt">
		                						<a id="btChat">채팅</a>
		                						<a id="btInfo">정보</a>
		                					</div>
											<%@include file="../Member/memberPopup.jsp"%>    
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