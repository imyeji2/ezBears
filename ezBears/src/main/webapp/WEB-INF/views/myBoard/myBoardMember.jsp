<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../inc/top.jsp"%>
<script type="text/javascript">

	$(function(){
		
		//멤버 추가 버튼
		$('#addBtn').click(function(){
			$('#staticBackdrop').modal('show');
		});
		
		//모달 열릴 때 이벤트
		$(document).on('show.bs.modal', '#staticBackdrop', function(event) {
			$('.memListBox').html("");
			MyBoardAddMemberList(1);
		});
		
		//멤버 검색
		$('#deptSearch').change(function() {
			MyBoardAddMemberList(1);
		});
		
		//마이페이지 클릭시
		$('#myPage').click(function(){
			event.preventDefault()
			location.href="<c:url value='/mypage/pwdchk'/>";
		})
		
		
		//멤버 삭제 버튼 클릭시
		$('.memberDelBtn').click(function(){
			event.preventDefault();
			var memName = $(this).closest("form[name=removeMemberForm]").find('.memName').text().trim();
			if(confirm(memName+"님을 멤버에서 삭제하시겠습니까?")){
				$(this).closest('form[name=removeMemberForm]').submit();
				return false;
			 }
		});		
		
		
		//멤버 추가 ajax
		$(document).on('click', '.mem_list_content', function(event) {
			var memName = $(this).find('#memName').text();
			var memNo = $(this).find('input[name=memNo]').val();
			var mBoardNo = $('#mBoardNo').val();
			if(confirm(memName+"님을 멤버로 추가하시겠습니까?")){
			    $.ajax({
			        type: 'post',
			        url: "<c:url value='/myBoard/ajax_addMyBoardMember'/>",
			        data: { memNo: memNo, mBoardNo: mBoardNo },
			        dataType: 'json',
			        error: function(xhr, status, error) {
			            alert(error);
			        },
			        success: function(res) {
			            console.log(res); // 서버 응답 확인 
			            if (res > 0) {
			            	MyBoardAddMemberList(1)
			                alert(memName+"님을 멤버로 추가했습니다.");
			                $('#staticBackdrop').modal('hide');
			                location.reload();
			            } else {
			                alert('다시 시도해주세요');
			            }
			        }
			    }); // ajax
			}
		});		
	});

	
	
	
	function MyBoardAddMemberList(curPage){
		$('input[name="currentPage"]').val(curPage);
		 var sendDate = $('#serchFrm').serialize(); // 데이터 직렬화
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
			            $.each(res.allMemberList, function(idx, item){
			            	
							//출력 데이터
			            	var imagePath = "default_user.png";
			            	if(item.memImage!==null){
			            		imagePath =item.memImage;
			            	}
			            	var allMemNo = item.memNo;
			            	memberDate+="<div class='mem_list_content'>";				        	
			            	memberDate+="<div class='mem_img_box'>";	
		            		memberDate+="<img src='<c:url value='/img/mem_images/"+imagePath+"'/>' alt='사원프로필'>";				        	
		            		memberDate+="</div>";				        	
		            		memberDate+="<div class='mem_info_box'>";				        	
		            		memberDate+="<div class='mem_info_box2'><span id='memName' class='memName'>"+item.memName+"</span>/<span style='vertical-align: middle;'>"+item.positionName+"</span></div>";				        	
		            		memberDate+="<div>💼 "+item.deptName+"</div>";				        	
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
			                    str += "<li class='page-item'>";
			                    str += "<a class='page-link' href='#' onclick='MyBoardAddMemberList(" + i + ")' style='background-color:#fff; color:#7000D8'>" + i + "</a>";
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
	
	function messageSend(memNo){
	    location.href="<c:url value='/message/messageWrite?receiveNo="+memNo+"'/>";
	}
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
						 			<h5>🧑‍💼 보드 멤버(${totalMember})</h5>
						 		</div>
						 		<div class="myBoardMemberContentBox">
									<c:if test="${empty myBoardMemberList}">
									</c:if>		
									<c:if test="${!empty myBoardMemberList}">
										<c:forEach var="map" items="${myBoardMemberList}">
											<div class="memberListBox">
												<form name="removeMemberForm" method="post" action="<c:url value='/myBoard/delMyBoardMember'/>">
													<input type="hidden" name="mBoardNo" value="${mBoardNo}">
													<input type="hidden" name="memNo" value="${map['MEM_NO']}">
													<div class="memberBox">
														<div class="memberImg">
															<c:if test="${empty map['MEM_IMAGE']}">
																<img src="<c:url value='/img/mem_images/default_user.png'/>" alt="사원이미지">
															</c:if>
															<c:if test="${!empty map['MEM_IMAGE']}">
																<img src="<c:url value='/img/mem_images/${map["MEM_IMAGE"]}'/>" alt="사원이미지">
															</c:if>															
														</div>
														<div class="memInfo">
															<div class="memInfoText">
																<div class="memName">&nbsp;${map['MEM_NAME']}</div>
																<div class="memDeptName">💼 ${map['DEPT_NAME']}</div>
															</div>
															<div >
																<!-- 관리자일 때 -->
																<c:if test="${adminNo == memNo}">
																	<!-- 본인이 아니면 쪽지/삭제 -->
																	<c:if test="${map['MEM_NO']!=memNo}">
																		<input type="button" class="btn btn-sm btn-primary btnLeft messageBtn" style="margin-right:2%" value="쪽지" onclick="messageSend(${map['MEM_NO']})"/>
																		<button class="btn btn-sm btn-primary btnLeft memberDelBtn">삭제</button>
																	</c:if>
																	<!-- 본인이면 마이페이지 -->
																	<c:if test="${map['MEM_NO']==memNo}">
																		<button class="btn btn-sm btn-primary" id="myPage">마이페이지</button>
																	</c:if>
																</c:if>
																<!-- 관리자가 아닐 떄 -->
																<c:if test="${adminNo!=memNo}">
																	<!-- 본인이면 마이페이지 -->
																	<c:if test="${map['MEM_NO']==memNo}">
																		<button class="btn btn-sm btn-primary" id="myPage">마이페이지</button>
																	</c:if>
																	<!-- 본인이 아니면 쪽지 -->
																	<c:if test="${map['MEM_NO']!=memNo}">
																		<input type="button" class="btn btn-sm btn-primary messageBtn" value="쪽지" onclick="messageSend(${map['MEM_NO']})">
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
						      <form name="serchFrm"  id="serchFrm" method="post" action="<c:url value='/myBoard/myBoardMember?mBoardNo=${mBoardNo}'/>">
						      	   <input type="hidden" name="mBoardNo" value="${mBoardNo}" id="mBoardNo">
						      	   <input type="hidden" name="currentPage">
							        <select class="form-select" name="deptNo" id="deptSearch">
							        <option selected value='0'>부서 선택</option>
							       	   <c:forEach var="detpVo" items="${deptList}">
							       	   		<c:if test="${detpVo.deptName!='선수'}">
							       	   			<c:if test="${detpVo.deptName!='스태프'}">
							       	   				<option value="${detpVo.deptNo}">${detpVo.deptName}</option>
							       	   			</c:if>
							       	   		</c:if>
										</c:forEach>
									</select>
								</form>
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