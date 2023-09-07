<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../inc/top.jsp"%>
<script type="text/javascript">

	$(function(){
		
		$('#addBtn').click(function(){
			$('#staticBackdrop').modal('show');
		});
		
		$(document).on('show.bs.modal', '#staticBackdrop', function(event) {
			$('.memListBox').html("");
			MyBoardAddMemberList(1);
		});
	});

	
	
	
	function MyBoardAddMemberList(curPage){
		$('input[name="currentPage"]').val(curPage);
		 var sendDate = $('#sendFrm').serialize(); // 데이터 직렬화
		 console.log(sendDate);
		 $.ajax({
		        type: 'post',
		        url: "<c:url value='/myBoard/ajax_selectMyBoardMemberAll'/>",
		        data: sendDate,
		        dataType: 'json',
		        error: function(xhr, status, error){
		            alert(error);
		        },
		        success: function(res){
		            console.log(res); // 서버 응답 확인
		            $('.memListBox').html("");
		            if(res!=null){		
		            	var memberDate="";
		            	//페이징 처리
						totalCount=res.pagingInfo.totalRecord;
						var memberNo = $('#memNo').val();
			            $.each(res.resultList, function(idx, item){
			            	
							//출력 데이터
			            	var imagePath = "default_user.png";
			            	if(item.MEM_IMAGE!==null){
			            		var imagePath =item.memImage;
			            	}
			            	var allMemNo = item.memNo;
			            			            	
			            	memberDate+="<div class='mem_list_content'>";				        	
			            	memberDate+="<div class='mem_img_box'>";	
		            		memberDate+="<img src='<c:url value='/img/mem_images/"+imagePath+"'/>' alt='사원프로필'>";				        	
		            		memberDate+="</div>";				        	
		            		memberDate+="<div class='mem_info_box'>";				        	
		            		memberDate+="<div>"+item.memName+"/"+item.positionName+"</div>";				        	
		            		memberDate+="<input type='hidden' name='memNo' value='"+item.memNo+"'>";				        	
		            		memberDate+="</div>";				        	
		            		memberDate+="</div><!-- mem_list_content -->";				        	

			            });//.each
			         
			            //페이징
			            var str = "";
			            var firstPage = res.pagingInfo.firstPage;
			            var lastPage = res.pagingInfo.lastPage;
			            var currentPage = res.pagingInfo.currentPage;
			            var totalRecord = res.pagingInfo.totalRecord;
			            var totalPage = res.pagingInfo.totalPage;
	
			            // 이전 블럭으로
			            if (firstPage > 1) {
			                str += "<li class='page-item'>";
			                str += "<a class='page-link' onclick='MyBoardAddMemberList(" + (firstPage - 1) + ")'>";
			                str += "<";
			                str += "</a>";
			                str += "</li>";
			            }
	
			            // 페이지 번호 출력
			            for (var i = firstPage; i <= lastPage; i++) {
			                if (i == currentPage) {
			                    str += "<li class='page-item active' >";
			                    str += "<a class='page-link' href='#'>" + i + "</a>";
			                    str += "</li>";
			                } else {
			                    str += "<li class='page-item' >";
			                    str += "<a class='page-link' href='#' onclick='MyBoardAddMemberList(" + i + ")'>" + i + "</a>";
			                    str += "</li>";
			                }
			            }
	
			            // 다음 블럭으로
			            if (lastPage < totalPage) {
			                str += "<li class='page-item'>";
			                str += "<a class='page-link' onclick='MyBoardAddMemberList(" + (firstPage + 1) + ")'>";
			                str += ">";
			                str += "</a>";
			                str += "</li>";
			            }
			            $('.memListBox').append(memberDate);
			            $('#pageBox').html("");
			            $('#pageBox').html(str);	
			            
	       			}//not null if
			}//success
		});//ajax
	}
	
</script>

	<form name="sendFrm" id="sendFrm" method="post" action="<c:url value='/myBoard/myBoardMember?mBoardNo=${mBoardNo}'/>" >
		<input type="hidden" name="mBoardNo" value="${mBoardNo}">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="deptNo" value="${param.deptNo}">
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
															<div >
																<c:if test="${adminNo == memNo}">
																	<c:if test="${map['MEM_NO']!=memNo}">
																		<button class="btn btn-sm btn-primary btnLeft" style="margin-right:2%">채팅</button>
																		<button class="btn btn-sm btn-primary btnLeft">삭제</button>
																	</c:if>
																	<button class="btn btn-sm btn-primary">마이페이지</button>
																</c:if>
																<c:if test="${adminNo!=memNo}">
																	<c:if test="${map['MEM_NO']==memNo}">
																		<button class="btn btn-sm btn-primary">마이페이지</button>
																	</c:if>
																	<c:if test="${map['MEM_NO']!=memNo}">
																		<button class="btn btn-sm btn-primary">채팅</button>				
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

						        </div><!-- memListBox -->
						      <div class="page_box">
							      <nav aria-label="Page navigation example">
									  <ul class="pagination justify-content-center" id="pageBox">

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