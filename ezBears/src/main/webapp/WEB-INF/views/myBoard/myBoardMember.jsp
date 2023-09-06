<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../inc/top.jsp"%>
<script type="text/javascript">

	
</script>

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
																	<button class="btn btn-sm btn-primary">삭제</button>
																</c:if>
															</div>
														</div>
													</div>
												</form>	
											</div>
										</c:forEach>									
									</c:if>	
									
									<div class="memberListBox">
										<div class="memberBox1">
											<a href="#" style="color:#fff">
												<i class="bi bi-person-plus" id="addBtn">&nbsp;추가</i>
											</a>
										</div>
									</div>	
								</div>	 	
						 	</div>
						</div>
					</div>
				</div>
            </div>
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
		        <c:forEach var="memMap" items="${mem_list}">
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
	      </div>
	      <div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div><!-- Modal-footer -->
	    </div><!-- modal-content -->
	  </div>
	</div>
	<!--Modal-->	

 <%@include file="../inc/bottom.jsp"%>    					