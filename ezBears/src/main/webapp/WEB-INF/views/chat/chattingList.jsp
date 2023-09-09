<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
		<script type="text/javascript" src="<c:url value='/js/chattingScripts.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
		
		<link href="${pageContext.request.contextPath}/css/chattingStyle.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/yeji.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
    </head>
   
    <script>
    $(function(){
    	$('.chat-container').hide();
    	
    	$('.list-group-item').click(function(){
    		$('.chat-container').show();
    		$('.chat-defult').hide();
    		
    	});

		//멤버 추가 버튼
		$('#addBtn').click(function(){
			$('#staticBackdrop').modal('show');
		});
		
		//모달 열릴 때 이벤트
		$(document).on('show.bs.modal', '#staticBackdrop', function(event) {
			$('.memListBox').html("");
			chatAddMember(1);
		});
		
		//멤버 검색
		$('#deptSearch').change(function() {
			chatAddMember(1);
		});

		//멤버 추가 ajax
		$(document).on('click', '.mem_list_content', function(event) {
			var memName = $(this).find('#memName').text();
			var memNo = $(this).find('input[name=memNo]').val();
			var mBoardNo = $('#mBoardNo').val();
			if(confirm(memName+"님과 채팅하시겠습니까?")){
			    $.ajax({
			        type: 'post',
			        url: "<c:url value='/chat/ajax_addChatRoom'/>",
			        data: {memNo: memNo},
			        dataType: 'json',
			        error: function(xhr, status, error) {
			            alert(error);
			        },
			        success: function(res) {
			            console.log(res); // 서버 응답 확인 
			            if (res > 0) {
			                alert(memName+"님과 채팅을 시작합니다."); 
			                $('#staticBackdrop').modal('hide');
			        		$('.chat-container').show();
			        		$('.chat-defult').hide();
			            } else {
			                alert('다시 시도해주세요');
			            }
			        }
			    }); // ajax
			}
		});		

		
    })
    
	function chatAddMember(curPage){
		$('input[name="currentPage"]').val(curPage);
		 var sendDate = $('#serchFrm').serialize(); // 데이터 직렬화
		 $.ajax({
		        type: 'post',
		        url: "<c:url value='/chat/ajax_selecAddChatMember'/>",
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
			            	if(item.MEM_IMAGE!==null){
			            		imagePath =item.MEM_IMAGE;
			            	}
			            	var allMemNo = item.MEMNO;
			            	memberDate+="<div class='mem_list_content'>";				        	
			            	memberDate+="<div class='mem_img_box'>";	
		            		memberDate+="<img src='<c:url value='/img/mem_images/"+imagePath+"'/>' alt='사원프로필'>";				        	
		            		memberDate+="</div>";				        	
		            		memberDate+="<div class='mem_info_box'>";				        	
		            		memberDate+="<div class='mem_info_box2'><span id='memName' class='memName '>"+item.MEM_NAME+"</span>/<span style='vertical-align: middle;'>"+item.POSITION_NAME+"</span></div>";				        	
		            		memberDate+="<div>💼 "+item.DEPT_NAME+"</div>";				        	
		            		memberDate+="<input type='hidden' name='memNo' value='"+item.MEM_NO+"'>";				        	
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
			                str += "<a class='page-link' onclick='chatAddMember(" + (firstPage - 1) + ")'>";
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
			                    str += "<a class='page-link' href='#' onclick='chatAddMember(" + i + ")' style='background-color:#fff; color:#7000D8'>" + i + "</a>";
			                    str += "</li>";
			                }
			            }
	
			            // 다음 블럭으로
			            if (lastPage < totalPage) {
			                str += "<li class='page-item'>";
			                str += "<a class='page-link' onclick='chatAddMember(" + (firstPage + 1) + ")'>";
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

	function loadChatRoom(){
		 $.ajax({
		        type: 'post',
		        url: "<c:url value='/chat/ajax_selectChatRoom'/>",
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
			            	if(item.MEM_IMAGE!==null){
			            		imagePath =item.MEM_IMAGE;
			            	}
			            	var allMemNo = item.MEMNO;
			            	memberDate+="<div class='mem_list_content'>";				        	
			            	memberDate+="<div class='mem_img_box'>";	
		            		memberDate+="<img src='<c:url value='/img/mem_images/"+imagePath+"'/>' alt='사원프로필'>";				        	
		            		memberDate+="</div>";				        	
		            		memberDate+="<div class='mem_info_box'>";				        	
		            		memberDate+="<div class='mem_info_box2'><span id='memName' class='memName '>"+item.MEM_NAME+"</span>/<span style='vertical-align: middle;'>"+item.POSITION_NAME+"</span></div>";				        	
		            		memberDate+="<div>💼 "+item.DEPT_NAME+"</div>";				        	
		            		memberDate+="<input type='hidden' name='memNo' value='"+item.MEM_NO+"'>";				        	
		            		memberDate+="</div>";				        	
		            		memberDate+="</div><!-- mem_list_content -->";				        	

			            });//.each    
   </script>
    
	<style>
	body {
	    margin: 0;
	    padding: 0;
	    font-family: Arial, sans-serif;
	}
	
	.chat-defult{
	  display: flex;
	  justify-content: center; 
	  align-items: center; /* 세로 가운데 정렬 */
	  height: 93vh; 
	}		
	.chat-container {
	    display: flex;
	    flex-direction: column;
	    justify-content: space-between;
	    height: 93vh;
	}
	
	
	.chat-messages {
	    flex-grow: 1; 
	    overflow-y: auto; 
	    padding: 10px;
	}
	
	.fixed-textarea {
	    width: 100%;
	    padding: 10px;
	    resize: none; 
	    position: fixed; 
	    bottom: 0;
	    background-color: #f2f2f2;
	}
	</style>
	
    <body>
        <div class="d-flex" id="chatList">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">
                	채팅 <i class="bi bi-plus-circle-fill" id="addBtn" style="color:#7000D8;"></i>
                </div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Dashboard</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Shortcuts</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Overview</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Events</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Profile</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Status</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">리스트보기</button>
                      
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
                	<div class="chat-defult">
                		<i class="bi bi-chat-dots-fill"></i>원하는 대화방을 선택하세요
                	</div>
				    <div class="chat-container">
				        <div class="chat-messages">
				            <!-- 채팅 메시지가 표시되는 부분 -->
				        </div>
				        
						<div class="input-group mb-3 chat-input">
						  <textarea class="form-control fixed-textarea" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2"></textarea>
						  <button class="btn btn-outline-secondary" type="button" id="button-addon2">전송</button>
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
			      <form name="serchFrm"  id="serchFrm" method="post" action="<c:url value='/myBoard/myBoardMember?mBoardNo=${mBoardNo}'/>">
					   <input type="hidden" name="memNo" value="${memNo}" id="memNo">
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
        

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
