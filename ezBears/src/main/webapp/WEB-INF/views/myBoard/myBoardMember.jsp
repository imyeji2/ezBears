<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../inc/top.jsp"%>
<script type="text/javascript">

	$(function(){
		
		$('#addBtn').click(function(){
			$('#staticBackdrop').modal('show');
		});
		
	});
	
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="myBoardMemberFrm"]').submit();
	}
	
</script>

	<form action="<c:url value='/myBoard/myBoardMember?mBoardNo=${mBoardNo}'/>" method="post" name="myBoardMemberFrm">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="searchCondition" value="${param.searchCondition}">
	</form>
	
    <!-- Recent Sales Start -->
    <div class="container-fluid pt-4 px-4" id="board_style">
        <div class="bg-secondary text-center rounded">
            <div class="bg-secondary rounded h-100 p-4">
           	 <c:import url="/myBoard/myBoardNavTab?mBoardNo=${mBoardNo}"></c:import>
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active">
						<div id="myBoardMember">
						 	<div class="myBoardMemberBox">
						 		<div class="topBtnBox">
						 			<h5>🧑‍💼 보드 멤버</h5>
						 		</div>
						 		<div class="myBoardMemberContentBox">
									<c:if test="${empty myBoardMemberList}">
										<div class="">등록된 멤버가 없습니다.</div>
									</c:if>		
									<c:if test="${!empty myBoardMemberList}">
										<c:forEach var="map" items="${myBoardMemberList}">
											<div class="memberListBox">
												<form name="removeMemberForm" method="post" action="<c:url value='/myBoard/delMyBoardMember'/>">
													<input type="hidden" name="mBoardNo" value="${mBoardNo}">
													<input type="hidden" name="memNo" value="${map['MEM_NO']}">
													<div class="memberBox">
														<div class="memberImg">
															<img src="<c:url value='/img/mem_images/${map["MEM_IMAGE"]}'/>" alt="사원이미지">
														</div>
														<div class="memInfo">
															<div class="memInfoText">
																<div class="memName">&nbsp;${map['MEM_NAME']}</div>
																<div class="memDeptName">💼 ${map['DEPT_NAME']}</div>
															</div>
															<div>
																<c:if test="${adminNo == memNo}">
																	<c:if test="${map['MEM_NO']!=memNo}">
																		<button class="btn btn-sm btn-primary">삭제</button>
																	</c:if>
																</c:if>
															</div>
														</div>
													</div>
												</form>	
											</div>
										</c:forEach>									
									</c:if>	
									<c:if test="${adminNo == memNo}">
										<div class="memberListBox">
											<div class="memberBox1">
												<a href="#" style="color:#fff">
													<i class="bi bi-person-plus" id="addBtn">&nbsp;추가</i>
												</a>
											</div>
										</div>	
									</c:if>
								</div>	 	
						 	</div>
						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						   	  	<h1 class="modal-title fs-5" id="staticBackdropLabel" style="color:#191C24">팀 멤버</h1>
						   	  </div>				    
						      <div class="modal-body">
						        <div class="memListBox">
						        <input type="hidden" name="todoDetailNo" value="">   
							        <c:forEach var="memMap" items="${allMemberList}">
							        	<div class="mem_list_content">
											<div class="mem_img_box">
												<c:if test="${empty memMap['MEM_IMAGE']}">
													<img src="<c:url value='/img/mem_images/default_user.png'/>" alt="사원이미지">
												</c:if>
						
												<c:if test="${!empty memMap['MEM_IMAGE']}">
													<img src="<c:url value='/img/mem_images/${memMap["MEM_IMAGE"]}'/>" alt="사원이미지">
												</c:if>
											</div>
											<div class="mem_info_box">
												<div>${memMap["MEM_NAME"]}/${memMap["POSITION_NAME"]}</div>
												<div>${memMap["DEPT_NAME"]}</div>
												<input type="hidden" name="memNo" value=${memMap["MEM_NO"]}>   
												
											</div> 
										</div><!-- mem_list_content --> 
									</c:forEach>	
						        </div><!-- memListBox -->
						      <div class="page_box">
							      <nav aria-label="Page navigation example">
									  <ul class="pagination justify-content-center">
									  <c:if test="${pagingInfo.firstPage>1}">
										    <li class="page-item">
										      <a class="page-link" onclick="pageFunc(${pagingInfo.firstPage-1})">
										      	<
										      </a>
										    </li>
									    </c:if>
									    <c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">		
											<c:if test="${i == pagingInfo.currentPage}">		
											    <li class="page-item active" >
											    	<a class="page-link" href="#">${i}</a>
											    </li>
											   </c:if>
												<c:if test="${i != pagingInfo.currentPage }">
												    <li class="page-item">
												    	<a class="page-link" href="#" onclick="pageFunc(${i})">${i}</a>
												    </li>
											    </c:if>   		
											</c:forEach>
										<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">													    
										    <li class="page-item">
										      <a class="page-link"  href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">Next</a>
										    </li>
									    </c:if>
									  </ul>
									</nav>
							</div><!-- page_box -->						        
						      </div>
						      <div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						      </div><!-- Modal-footer -->
						    </div><!-- modal-content -->
						  </div>
						</div>
						<!--Modal-->						
						</div>
					</div>
				</div>
            </div>
        </div>
    </div>
    


 <%@include file="../inc/bottom.jsp"%>    					