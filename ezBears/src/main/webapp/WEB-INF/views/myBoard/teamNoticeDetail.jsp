<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>	
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!-- Recent Sales Start -->
<script type="text/javascript">
	
	$(function(){
		
		var totalCount=0;
		send(1);
		
		//글 삭제
		$('#del').click(function(){
			event.preventDefault();
			 if (confirm("정말 삭제하시겠습니까?")){
			 	location.href="<c:url value='/myBoard/teamNoticeDel?mBoardNo=${map["M_BOARD_NO"]}&teamNoticeNo=${map["TEAM_NOTICE_NO"]}&oldFileName=${map["FILENAME"]}'/>"
			 }
		});
		
		
		            
		 //댓글 수정     
		$(document).on('click', '.editReply', function(e) {       
		    event.preventDefault();
		    var $replyContainer = $(this).closest('.reply_content');
		    $replyContainer.find('.replyWriteForm').hide();
		    $replyContainer.find('.replyEditForm').show();
		});
				 
		 
		 
		 //댓글 수정 취소
		  $(document).on('click', '.reply_add_cencle',function(e) {       
			  alert("야");
			  	event.preventDefault();
			    var $replyContainer = $(this).closest('.reply_content');
			    $replyContainer.find('.replyEditForm').hide();
			    $replyContainer.find('.replyWriteForm').show();
		  });
			
		 
		 
		  //대댓글 등록
		  $(document).on('click', '.add_r_reply',function(e) {       
			  	event.preventDefault();
			    var $replyContainer = $(this).closest('.reply_content');
			    $replyContainer.find('.replyaddForm').show();
		  });	

		  //대댓글 등록 취소
		  $(document).on('click', '.add_R_replyCencleBtn',function(e) {       
			  	event.preventDefault();
			    var $replyContainer = $(this).closest('.reply_content');
			    $replyContainer.find('.replyaddForm').hide();
		  });

		
		//ajax
		
		//댓글 등록 ajax
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
		            $('#addComment').val('');
		            send(1);
		            $("html, body").animate({ scrollTop: 0 }, "slow");
		            alert("댓글이 등록되었습니다.");
		        
		        }
		    });
		});//댓글 등록 끝
		
		
		//댓글 수정 ajax
		$(document).on('click', '#r_replyAddBtn', function(e) {       
		    event.preventDefault(); // 이벤트의 기본 동작 방지
		    var $replyContainer = $(this).closest('form[name=replyEditForm]');
		    var replyData = $replyContainer.serialize(); // 데이터 직렬화
		    
		    $.ajax({
		        type: 'post',
		        url: "<c:url value='/myBoard/reply_update'/>",
		        data: replyData,
		        dataType: 'json',
		        error: function(xhr, status, error){
		            alert(error);
		        },
		        success: function(res){
		            console.log(res); // 서버 응답 확인  
		            if(res.cnt>0){
			            $('#addComment').val('');
			            send(res.curPage);
			            alert("댓글이 수정되었습니다.");
		            }else{
		            	alert("댓글 수정 실패");
		            }
		        }
		    });			
		});
		
		
		//대댓글 등록 ajax
		$(document).on('click', '#add_R_replyBtn', function(e) {       	
		    e.preventDefault(); // 이벤트의 기본 동작 방지
		    var memNo = $('#memNo').val();
            var groupno = $('#groupno').val();
            var mBoardNo = $('#mBoardNo').val();
            var sortno = $('#sortno').val();
            var step = 1
            
            var $replyContainer = $(this).closest('.replyaddForm');
            var comments = $replyContainer.find('textarea[name=comments]').val();
            
            console.log('Comments:', comments); // 확인을 위해 콘솔에 출력
            
            var replyData = {
            	    memNo: memNo,
            	    groupno: groupno,
            	    mBoardNo: mBoardNo,
            	    sortno: sortno,
            	    comments: comments,
            	    step:step
            	    
            	};
		    
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
		            $('#addComment').val('');
		            alert("댓글이 등록되었습니다.");
		        
		        }
		    });
		});//댓글 등록 끝		
		
		
	});//$(functin(){})
	
	
	
	//전체 댓글 불러오기 ajax처리
	function send(curPage){		
		
		$('input[name="currentPage"]').val(curPage);
		 var sendDate = $('form[name=sendFrom]').serialize(); // 데이터 직렬화
		 $.ajax({
		        type: 'post',
		        url: "<c:url value='/myBoard/reply_select'/>",
		        data: sendDate,
		        dataType: 'json',
		        error: function(xhr, status, error){
		            alert(error);
		        },
		        success: function(res){
		            console.log(res); // 서버 응답 확인
		            $('.reply_list').html("");
	            
		            if(res!=null){
		            	var replyData="";
			            $.each(res.replyList, function(idx, item){
			            	
			            	//페이징 처리
							totalCount=item.totalCount;
							var errorCode=item.errorCode;
							var errorMessage=item.errorMessage;
							
							//출력 데이터
							var step= item.STEP
			            	var imagePath = "/img/mem_images/" + item.MEM_IMAGE;
			            	var comment = item.COMMENTS.replace(/\r\n/ig, '<br>');
			            	var recomment = comment.replace(/<br>/ig, "\n");
				            var date = new Date(item.REGDATE);
				            var userid='<%=session.getAttribute("userid")%>';
				            const regdate = new Date(date.getTime()).toISOString().split('T')[0] + " " + date.toTimeString().split(' ')[0];				            
				           
				            if(step=== 1){//댓글일 때
			            		replyData="<div class='reply_content'>"
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
			            		replyData+="<div class='reply_txt'>"+comment+"</div><!-- reply_txt -->";
			            		replyData+="<div class='reply_txt'>";
			            		replyData+="<span>"+regdate+"</span>";
			            		
			            		if(userid==item.MEM_ID){
			            			replyData+=" <span><a href='#' class='editReply'>수정</a></span>";
			            			replyData+=" <span><a href='#' id='delReply'>삭제</a></span>";
			            		
				            		replyData+="</div><!-- reply_txt -->";
				            		replyData+="</div><!-- replyWriteForm -->";
				            		replyData+="<!-- 댓글 수정 -->";
				            		replyData+="<div class='replyEditForm' style='display:none;'>";
				            		replyData+="<form name='replyEditForm' method='post' action='#'>";
				            		replyData += "<input type='hidden' name='teamNoticeNo' value='" +item.TEAM_NOTICE_NO+ "'>";
				            		replyData += "<input type='hidden' name='curPage' value='" +curPage+ "'>";
				            		replyData+="<div class='reply_write'>";
				            		replyData+="<div class='form-floating'>";
				            		replyData+="<textarea class='form-control' placeholder='Comments'id='floatingTextarea2' name='comments' style='height: 100px'>"+recomment+"</textarea>";
				            		replyData+="<label for='floatingTextarea2'>Comments</label>";
				            		replyData+="</div>";
				            		replyData+="<div class='reply_add'>";
				            		replyData+="<button class='reply_add_btn2' style='margin-bottom: 4px;' id='r_replyAddBtn'>수정</button>";
				            		replyData+="<button class='reply_add_btn2 reply_add_cencle'id='r_replyCencleBtn'>취소</button>";
				            		replyData+="</div>";
				            		replyData+="</div><!-- reply_write -->";
				            		replyData+="</form><!--댓글 수정--->";
				            		replyData+="</div><!--reply_user-->";
				            		
			            		}else{
			            			replyData+=" <span><a href='#' class='add_r_reply'>답글</a></span>";
			            			replyData+="<!-- 대댓글 등록 -->";
				            		replyData+="<div class='replyaddForm' style='display:none;>";
				            		replyData+="<form name='rAddForm' method='post' action='#'>";
				            		replyData+="<div class='reply_write'>";
				            		replyData+="<div class='form-floating'>";
				            		replyData+="<textarea class='form-control' placeholder='Comments'id='comments' name='comments'style='height: 100px'></textarea>";
				            		replyData+="<label for='floatingTextarea2'>Comments</label>";
				            		replyData+="</div>";
				            		replyData+="<div class='reply_add'>";
				            		replyData+="<button class='reply_add_btn2' id='add_R_replyBtn' style='margin-bottom: 4px;'>등록</button>";
				            		replyData+="<button class='reply_add_btn2 add_R_replyCencleBtn'>취소</button>";
				            		replyData+="</div><!--reply_add-->";
				            		replyData+="</div><!-- reply_write -->";
				            		replyData+="</form>";
				            		replyData+="</div><!-- replyaddForm -->";
			            		}

			            		
			            		replyData+="</div><!--reply_content-->";
			            		
			            		
			            	}else{//대댓글일때
			            		
			            		replyData="<div class='r_reply_content'>";
			            		replyData+="<!-- 대댓글 보기 -->";
			            		replyData+="<div class='r_reply_write_form'>";
			            		replyData+="<div class='reply_user'>";
			            		replyData+="<div class='detail_left'>";
			            		replyData+="<div class='user_img'>";
			            		replyData+="<img src='<img src='<c:url value='/img/mem_images/"+item.MEM_IMAGE+"'/>' alt='사원프로필'>";
			            		replyData+="</div><!-- user_img -->";
			            		replyData+="</div>";
			            		replyData+="<div class='detail_left'>";
			            		replyData+="<span class='user_name'><a href='#'>"+item.MEM_NAME+"</a></span>";
			            		replyData+="<span class='user_dept'>/ 💼"+item.DEPT_NAME+"</span>";
			            		replyData+="</div><!-- detail_left -->";
			            		replyData+="</div><!-- reply_user -->";
			            		replyData+="<div class='r_replyWrite'>";
			            		replyData+="<div class='reply_txt'>"+comment+"</div><!-- reply_txt -->";
			            		replyData+="<div class='reply_txt'>";
			            		replyData+="<span>"+regdate +" </span>";
			            		
			            		if(userid==item.MEM_ID){
				            		replyData+=" <span><a href='#'>수정</a></span>";
				            		replyData+=" <span><a href='#'>삭제</a></span>";
			            		
				            		replyData+="</div><!-- reply_txt -->";
				            		replyData+="</div><!--r_replyWrite-->";
				            		replyData+="</div><!--r_reply_write_form-->";
				            		replyData+="<!-- 대댓글 보기 -->";
				            		
				            		replyData+="<!--대댓글 수정-->"
				            		replyData+="<div id='r_replyEditForm' style='display:none;'>";
				            		replyData+="<form name='rEditForm' method='post' action='#'>";
		       				
				            		replyData+="<div class='reply_write'>";
				            		replyData+="<div class='form-floating'>";
				            		replyData+="<textarea class='form-control' placeholder='Comments'id='floatingTextarea2' name='comments'style='height: 100px'>"+recomment+"</textarea>";
				            		replyData+="<label for='floatingTextarea2'>Comments</label>";
				            		replyData+="</div>";
				            		replyData+="<div class='reply_add'>";
				            		replyData+="<button class='reply_add_btn2' style='margin-bottom: 4px;' id=''>등록</button>";
				            		replyData+="<button class='reply_add_btn2' id=''>취소</button>";
				            		replyData+="</div>";
				            		replyData+="</div><!-- reply_write -->";
				            		replyData+="</form><!--rEditForm-->";
				            		replyData+="</div><!-- r_replyEditForm -->";			            		
				            		replyData+="<!--대댓글 수정-->"
				            		replyData+="</div><!-- r_reply_content -->";
				            		replyData+="<div class='reply_line'></div>";
	
				            	}//else
			            	}
			            		
				            $('.reply_list').after(replyData);
			            	
			            });//.each
			            
			            
			            
			            //페이징
			            var str = "";
			            var firstPage = res.pagingInfo.firstPage;
			            var lastPage = res.pagingInfo.lastPage;
			            var currentPage = res.pagingInfo.currentPage;
			            var totalRecord = res.pagingInfo.totalRecord;
			            var totalPage = res.pagingInfo.totalPage
	
			            
			            $('.reply_tit').text("댓글("+totalRecord+")")
	
			            // 이전 블럭으로
			            if (firstPage > 1) {
			                str += "<li class='page-item'>";
			                str += "<a class='page-link' onclick='send(" + (firstPage - 1) + ")'>";
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
			                    str += "<a class='page-link' href='#' onclick='send(" + i + ")'>" + i + "</a>";
			                    str += "</li>";
			                }
			            }
	
			            // 다음 블럭으로
			            if (lastPage < totalPage) {
			                str += "<li class='page-item'>";
			                str += "<a class='page-link' onclick='send(" + (firstPage + 1) + ")'>";
			                str += ">";
			                str += "</a>";
			                str += "</li>";
			            }
	
			            $('#pageBox').html(str);
			    		
	       			}//not null if
			}//success
		});//ajax
	}//function
	

</script>

<form method="post" name="sendFrom">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="groupno" value="${map['TEAM_NOTICE_NO']}">
</form>


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
	       			<div class="reply_tit"></div>
	       			<div class="reply_list">
	       				<!-- 댓글 영역 -->

	    				<!-- 댓글 영역 -->		
	    				
	    				<!-- 대댓글 영영 -->
		    				
	    				<!-- 대댓글 영영 -->

	       			</div><!-- reply_list -->
	       		 
	       			<!-- 댓글 등록 -->
	       			<form name="reply_frm" method="post" action="#">
	       				<input type="hidden" name="memNo" id="memNo" value="${userNo}">
	       				<input type="hidden" name="groupno" id="groupno" value="${map['TEAM_NOTICE_NO']}"> 
	       				<input type="text" name="mBoardNo" id="mBoardNo" value="${map['M_BOARD_NO']}">
	       				<input type="hidden" name="sortno" id="sortno" value="${map['SORTNO']}">
	       				<input type="hidden" name="step" value="${map['STEP']}">
	       				
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
	       			</form><!-- 댓글 등록 -->
	       		</div><!-- detail_reply_wrap -->
		       			
			      <div class="page_box">
				      <nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center" id="pageBox">
	
						  </ul>
						</nav>
				</div><!-- page_box --> 
      		</div><!-- detail_reply_wrap -->   		
		</div><!-- teamNoticeDetail -->
	</div>
</div>
<%@include file="../inc/bottom.jsp"%>  