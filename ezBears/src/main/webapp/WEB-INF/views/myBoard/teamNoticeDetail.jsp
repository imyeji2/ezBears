<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>	
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!-- Recent Sales Start -->
<script>
	
	$(function(){
		
		//전체 댓글 불러오기 ajax처리
		 var groupNo = $('input[name=groupno]').serialize(); // 데이터 직렬화
		
		 
		 $.ajax({
		        type: 'post',
		        url: "<c:url value='/myBoard/reply_select'/>",
		        data: groupNo,
		        dataType: 'json',
		        error: function(xhr, status, error){
		            alert(error);
		        },
		        success: function(res){
		            console.log(res); // 서버 응답 확인
		            alert("댓글 불러오기");
		            
		            $.each(res, function(idx, item){
		            	var step= item.STEP
		            	var imagePath = "/img/mem_images/" + item.MEM_IMAGE;
		            	var comment = item.COMMENTS.replace(/\r\n/ig, '<br>');
			            var date = new Date(item.REGDATE);
			            var userid='<%=session.getAttribute("userid")%>';
			            const regdate = new Date(date.getTime()).toISOString().split('T')[0] + " " + date.toTimeString().split(' ')[0];
			           
			            if(step=== 1){
		            		var replyData="<div class='reply_content'>"
		            		replyData+="<div class='reply_user'>";
		            		replyData+="<div class='detail_left'>";
		            		replyData+="<div class='user_img'>";
		            		replyData+="<img src='<c:url value='/img/mem_images/"+item.MEM_IMAGE+"'/>' alt='사원프로필'>";
		            		replyData+="</div><!-- user_img -->";
		            		replyData+="</div><!--detail_left-->";
		            		replyData+="<div class='detail_left'>";
		            		replyData+="<span class='user_name'><a href='#'>"+item.MEM_NAME+"</a></span>";
		            		replyData+="<span class='user_dept'>/💼"+item.DEPT_NAME+"</span>";
		            		replyData+="</div><!-- detail_left -->";
		            		replyData+="</div><!-- reply_user -->";
		            		replyData+="<div class='replyWriteForm'>";
		            		replyData+="<div class='reply_txt'>";
		            		replyData+="<div class='reply_txt'>"+comment+"</div><!-- reply_txt -->";
		            		replyData+="<div class='reply_txt'>";
		            		replyData+="<span>"+regdate+"</span>";
		            		
		            		if(userid==item.MEM_ID){
		            			replyData+="<span><a href='#' class='editReply'>수정</a></span>";
		            			replyData+="<span><a href='#' id='delReply'>삭제</a></span>";
		            		}else{
		            			replyData+="<span><a href='#' id='add_r_reply'>답글</a></span>";
		            		}
		            		
		            		replyData+="</div><!-- reply_txt -->";
		            		replyData+="</div><!-- replyWriteForm -->";
		            		replyData+="<!-- 댓글 수정 -->";
		            		replyData+="<div class='replyEditForm' style='display:none;'>";
		            		replyData+="<form name='replyEditForm' method='post' action='#'>";
		            		replyData+="<div class='reply_write'>";
		            		replyData+="<div class='form-floating'>";
		            		replyData+="<textarea class='form-control' placeholder='Comments'id='floatingTextarea2' name='comments' style='height: 100px'>"+comment+"</textarea>";
		            		replyData+="<label for='floatingTextarea2'>Comments</label>";
		            		replyData+="</div>";
		            		replyData+="<div class='reply_add'>";
		            		replyData+="<button class='reply_add_btn2' style='margin-bottom: 4px;'>등록</button>";
		            		replyData+="<button class='reply_add_btn2 reply_add_cencle'>취소</button>";
		            		replyData+="</div>";
		            		replyData+="</div><!-- reply_write -->";
		            		replyData+="</form><!--댓글 수정--->";
		            		replyData+="</div><!--reply_user-->";
		            		replyData+="</div><!--reply_content-->";
		            		$('.reply_list').prepend(replyData);
		            	}else{
		            		
		            	}
			            
		            	
		            });
		            

		        }
		 });
		
		            
		            
		            
		            
		$('#del').click(function(){
			event.preventDefault();
			 if (confirm("정말 삭제하시겠습니까?")){
			 	location.href="<c:url value='/myBoard/teamNoticeDel?mBoardNo=${map["M_BOARD_NO"]}&teamNoticeNo=${map["TEAM_NOTICE_NO"]}&oldFileName=${map["FILENAME"]}'/>"
			 }
		});
		
		$(".editReply").click(function(event){
		    event.preventDefault();
		    var $replyContainer = $(this).closest('.reply_content');
		    $replyContainer.find('.replyWriteForm').hide();
		    $replyContainer.find('.replyEditForm').show();
		});

		$(".reply_add_cencle").click(function(event){
		    event.preventDefault();
		    var $replyContainer = $(this).closest('.reply_content');
		    $replyContainer.find('.replyEditForm').hide();
		    $replyContainer.find('.replyWriteForm').show();

		});
		
		
		$('#add_reply').click(function(event){
		    event.preventDefault(); // 이벤트의 기본 동작 방지
		    var replyData = $('form[name=reply_frm]').serialize(); // 데이터 직렬화
		    
		    $.ajax({
		        type: 'post',
		        url: "<c:url value='/myBoard/reply_insert'/>",
		        data: replyData,
		        dataType: 'json',
		        error: function(xhr, status, error){
		            alert(error);
		        },
		        success: function(res){
		            console.log(res); // 서버 응답 확인
		            alert("댓글이 등록되었습니다.");
		            
		            var comment = res.COMMENTS.replace(/\r\n/ig, '<br>');;
		            var date = new Date(res.REGDATE);
		            var userid='<%=session.getAttribute("userid")%>';
		            const regdate = new Date(date.getTime()).toISOString().split('T')[0] + " " + date.toTimeString().split(' ')[0];
		            
					var reply_content = "<div class='reply_content'>";
					reply_content+="<div class='reply_user'>";
					reply_content+="<div class='detail_left'>";
					reply_content+="<div class='user_img'>";
					reply_content+="<img src='<c:url value='/img/mem_images/"+res.MEM_IMAGE+"'/>' alt='사원프로필'>";
					reply_content+="</div><!-- user_img -->";
					reply_content+="</div>";
					reply_content+="<div class='detail_left'>";
					reply_content+="<span class='user_name'><a href='#'>"+res.MEM_NAME+"</a></span>";
					reply_content+="<span class='user_dept'>/ 💼"+res.DEPT_NAME+"</span>";
					reply_content+="</div><!-- detail_left -->";
					reply_content+="</div><!-- reply_user -->";
					reply_content+="<div class='replyWriteForm'>";
					reply_content+="<div class='reply_txt'>"+comment+"<div>";
					reply_content+="<div class='reply_txt'>";
					reply_content+="<span>"+regdate+"</span>";
					
					if(userid==res.MEM_ID){
						reply_content+="<span><a href='#' class='editReply'> 수정</a></span>";
						reply_content+="<span><a href='#' id='delReply'> 삭제</a></span>";
					}else{

						reply_content+="<span><a href='#' id='add_r_reply'> 답글</a></span>";
					}

					reply_content+="</div><!-- reply_txt -->";
					reply_content+="</div><!-- replyWriteForm -->";
					reply_content+="</div>";	

					
					
					$('.reply_list').prepend(reply_content);
					$('#addComment').val('');
					$("html, body").animate({ scrollTop: 0 }, "slow");

		        }
		    });
		});
	});
</script>
<div class="container-fluid pt-4 px-4" id="board_style">
	<div class="bg-secondary text-center rounded p-4">
    	<div class="bg-secondary rounded h-100 p-4">
          	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item active" aria-current="page">
			    	<a href="<c:url value='/myBoard/teamNotice?mBoardNo=${map["M_BOARD_NO"]}'/>">${myBoardName}</a>
			    </li>
			    <li class="breadcrumb-item active" aria-current="page">공지사항</li>
			  </ol>
			</nav>   			
			<div id="teamNoticeDetail">
	        	<div class="detailWrap">
	        	
		        	<div class="detail_title">
		        		<div class="detail_left">
			        		<span class="title_txt">${map["TEAM_NOTICE_TITLE"]}</span>
							<span class="title_date">
								<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd a hh:mm"/>
							</span>
						</div><!-- detail_left -->
						
						<div class="detail_right">조회수 : ${map["VIEWS"]}</div>
		        	</div><!-- detail_title -->
		        	
		       		<div class="user_info">		
		       			<div class="detail_left">
							<div class="user_img">
			        			<c:set var="userimg" value="default_user.png"/>
			        			<c:if test="${!empty map['MEM_IMAGE']}">
			        				<c:set var="userimg" value="${map['MEM_IMAGE']}"/>
			        			</c:if>								
			        			<img src="<c:url value='/img/mem_images/${userimg}'/>" alt="사원프로필">
			        		</div><!-- user_img -->
			        		<div class="detail_left">
			        			<span class="user_name"><a href="#">${map['MEM_NAME']}</a></span>
			        			<span class="user_dept">/ 💼${map['DEPT_NAME']}</span>
			        		</div><!-- detail_left -->
		        		</div><!-- detail_left -->
		        				       		      
		        		<c:if test="${!empty map['ORIGINNAME']}">
			        		<div class="detail_right">
			        			첨부파일 :
			        			<a href="<c:url value='/myBoard/downloadFile?teamNoticeNo=${map["TEAM_NOTICE_NO"]}&fileName=${map["FILENAME"]}'/>">
			        				${map['ORIGINNAME']}
			        			</a>
			        		</div><!-- detail_right -->
		        		</c:if> 
		       		</div><!-- user_info -->
		       				 
		       		<div class="detail_content">
		       			<div class="detail_view">
		       				${map['TEAM_NOTICE_CONTENT']}
		       			</div>
		       			
		       			<div class="detail_option_btn">
		       				<span class="user_dept">
		       					<a href="<c:url value='/myBoard/teamNotice?mBoardNo=${map["M_BOARD_NO"]}'/>">목록</a>
		       				</span>
		       				<c:if test="${userid==map['MEM_ID']}">
		       					<span class="user_dept">
		       						<a href="<c:url value='/myBoard/teamNoticeEdit?mBoardNo=${map["M_BOARD_NO"]}&teamNoticeNo=${map["TEAM_NOTICE_NO"]}'/>">
		       						수정
		       						</a>
		       					</span>
		       					
			        			<span class="user_dept">
			        				<a href="#" id="del">삭제</a>
			        			</span>
		        			</c:if>
		       			</div>
		       		</div><!-- detail_content -->
	       		</div><!-- detailWrap -->	 
	       		
	       		<!-- 댓글 리스트 -->
	       		<div class="detail_reply_wrap">
	       			<div class="reply_tit">댓글(${totalCount})</div>
	       			<div class="reply_list">
	       				<!-- 댓글 영역 -->
	       				<!-- <div class="reply_content">
 
							
	       				</div>reply_content
	      				 -->
	    						
      					<div class="r_reply_content">
      						<%-- <!-- 대댓글 보기 -->
      						<div class="r_reply_write_form">
		       					<div class="reply_user">    					
			       					<div class="detail_left">
										<div class="user_img">
						        			<img src="<c:url value='/img/mem_images/${replyMap["MEM_IMAGE"]}'/>" alt="사원프로필">
						        		</div><!-- user_img -->
						        	</div>
					        		<div class="detail_left">
					        			<span class="user_name"><a href="#">${replyMap['MEM_NAME']}</a></span>
					        			<span class="user_dept">/ 💼${replyMap['DEPT_NAME']}</span>
					        		</div><!-- detail_left -->	 					
		       					</div><!-- reply_user -->
		       					
		       					<div class="reply_txt">
			       					${fn:replace(replyMap['COMMENTS'], newLineChar, "<br/>")}
		       					</div><!-- reply_txt -->
		       					
		       					<div class="reply_txt">
		       						<span>
		       							<fmt:formatDate value="${replyMap['REGDATE']}" pattern="yyyy-MM-dd hh:mm"/>
		       						</span>
		       						<c:if test="${userid==replyMap['MEM_ID']}">
			       						<span><a href="#">수정</a></span>
			       						<span><a href="#">삭제</a></span>
		       						</c:if>
		       					</div><!-- reply_txt -->
		       				</div>
		       				<!-- 대댓글 보기 -->
		       				
		       				<!-- 대댓글 등록 -->
							<div id="replyaddForm" style="display:none;">
								<form name="rAddForm" method="post" action="#">
									<div class="reply_write">
										<div class="form-floating">
										  <textarea class="form-control" placeholder="Comments" 
										  id="floatingTextarea2" name="comments"
										   style="height: 100px"></textarea>
										  <label for="floatingTextarea2">Comments</label>
										</div>
										       				
					       				<div class="reply_add">
					       					<button class="reply_add_btn2" style="margin-bottom: 4px;" id="">등록</button>
					       					<button class="reply_add_btn2" id="">취소</button>						       					
					       				</div>
					       			</div><!-- reply_write -->	
				       			</form>										
							</div><!-- replyaddForm -->					       					       					
      					</div><!-- r_reply_content -->	
      				<div class="reply_line"></div>  	       				
		       		<!-- 대댓글 등록 -->	 --%>
		       	
	       			
	       		</div><!-- reply_list -->
	       		
	       			<!-- 댓글 등록 -->
	       			<form name="reply_frm" method="post" action="#">
	       				<input type="hidden" name="memNo" value="${userNo}">
	       				<input type="hidden" name="groupno" value="${map['TEAM_NOTICE_NO']}"> 
	       				<input type="hidden" name="mBoardNo" value="${map['M_BOARD_NO']}">
	       				
 		       			<div class="reply_write">
							<div class="form-floating">
							  <textarea class="form-control" placeholder="Comments" 
							  id="addComment" name="comments"
							   style="height: 100px"></textarea>
							  <label for="floatingTextarea2">Comments</label>
							</div>	
							       				
		       				<div class="reply_add">
		       					<button class="reply_add_btn" id="add_reply">등록</button>
		       				</div>
		       			</div><!-- reply_write -->
	       			</form>
	       			<!-- 댓글 등록 -->
	       		</div>
	       			
			        <div class="page_box">
				    	<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
						    <li class="page-item">
						      <a class="page-link">Previous</a>
						    </li>
						    <li class="page-item active"><a class="page-link" href="#">1</a></li>
						    <li class="page-item">
						    	<a class="page-link" href="#">2</a>
						    </li>
						    <li class="page-item">
						    	<a class="page-link" href="#">3</a>
						    </li>
						    <li class="page-item">
						      <a class="page-link" href="#">Next</a>
						    </li>
						  </ul>
						</nav>
					</div><!-- page_box -->  
	       		</div><!-- detail_reply_wrap -->   		
			</div><!-- teamNoticeDetail -->
		
	</div>
	</div>
</div>
<%@include file="../inc/bottom.jsp"%>  