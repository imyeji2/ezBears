<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>	
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!-- Recent Sales Start -->
<script type="text/javascript">
	
	$(function(){		
		var totalCount=0;
		send(1);
		
		$('.fileupload_right').hide();
		$('.fileupload').click(function() {
			$('.fileupload_right').toggle();
		});
		
		$('#del').click(function(){
			event.preventDefault();
			 if (confirm("정말 삭제하시겠습니까?")){
			 	location.href="<c:url value='/board/boardDelte?boardNo=${map["BOARD_NO"]}'/>"
			 }
		});

		
		//ajax
		//댓글 등록 ajax
		$('#add_reply').click(function(event){
		    event.preventDefault(); // 이벤트의 기본 동작 방지
		    var replyData = $('form[name=reply_frm]').serialize(); // 데이터 직렬화
		    alert(replyData);
		    $.ajax({
		        type: 'post',
		        url: "<c:url value='/board/reply_insert'/>",
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
		

        
		 //댓글 수정     
		$(document).on('click', '.editReply', function(e) {       
		    event.preventDefault();
		    var $replyContainer = $(this).closest('.reply_content');
		    $replyContainer.find('.replyWriteForm').hide();
		    $replyContainer.find('.replyEditForm').show();
		    $replyContainer.find('textarea').focus();
		});
				 
		 
		 
		 //댓글 수정 취소
		  $(document).on('click', '.reply_add_cencle',function(e) {       
			  	event.preventDefault();
			    var $replyContainer = $(this).closest('.reply_content');
			    $replyContainer.find('.replyEditForm').hide();
			    $replyContainer.find('.replyWriteForm').show();
		  });
			
		 
		
		//댓글 수정 ajax
		$(document).on('click', '#r_replyAddBtn', function(e) {       
		    event.preventDefault(); // 이벤트의 기본 동작 방지
		    var $replyContainer = $(this).closest('form[name=replyEditForm]');
		    var replyData = $replyContainer.serialize(); // 데이터 직렬화
		    
		    $.ajax({
		        type: 'post',
		        url: "<c:url value='/board/reply_update'/>",
		        data: replyData,
		        dataType: 'json',
		        error: function(xhr, status, error){
		            alert(error);
		        },
		        success: function(res){
		            console.log(res); // 서버 응답 확인  
		            var curPage = res.curPage;
		            if(res.cnt>0){
			            $('#addComment').val('');
			            send(curPage);
			            alert("댓글이 수정되었습니다.");
		            }else{
		            	alert("댓글 수정 실패");
		            }
		        }
		    });			
		});
		
		
		//댓글 삭제 ajax
		$(document).on('click', '#delReply', function(e) {       
		    event.preventDefault(); // 이벤트의 기본 동작 방지
		    var $replyContainer = $(this).closest('.reply_content');
		    var $replyDelForm = $replyContainer.find('form[name=replyDelForm]');// replyDelForm 선택
		    var replyData = $replyDelForm.serialize(); // 데이터 직렬화
		    if(confirm('정말 삭제하시겠습니까?')){
			    $.ajax({
			        type: 'post',
			        url: "<c:url value='/board/reply_delete'/>",
			        data: replyData,
			        dataType: 'json',
			        error: function(xhr, status, error){
			            alert(error);
			        },
			        success: function(res){
			            console.log(res); // 서버 응답 확인  
			           		if(res=-1){
					            alert("삭제되었습니다.");
					            send(1);
			           		}else{
			           			alert("댓글 삭제 실패");
			           		}
			             
			        }
			    });			
		    }
		});	
		 
		 
		 
		 
		//대댓글 등록
		$(document).on('click', '.add_r_reply',function(e) {       
		 	event.preventDefault();
		   var $replyContainer = $(this).closest('.reply_content');
		   $replyContainer.find('.replyaddForm').show();
		   $replyContainer.find('#comments').focus();
		   
		});	
		
		
		//대댓글 등록 취소
		$(document).on('click', '.add_R_replyCencleBtn',function(e) {       
		 	event.preventDefault();
		   var $replyContainer = $(this).closest('.reply_content');
		   $replyContainer.find('.replyaddForm').hide();
		});
		  
		
		//대댓글 등록 ajax
		$(document).on('click', '#add_R_replyBtn', function(e) {       	
		    e.preventDefault(); // 이벤트의 기본 동작 방지
		    var $replyContainer = $(this).closest('form[name=rAddForm]');
		    var replyData = $replyContainer.serialize(); // 데이터 직렬화      
            var curPage = $replyContainer.find('input[name=curPage]').val();
		    alert(replyData);
		    $.ajax({
		        type: 'post',
		        url: "<c:url value='/board/reReply_insert'/>",
		        data: replyData,
		        dataType: 'json',
		        error: function(xhr, status, error){
		            alert(error);
		        },
		        success: function(res){
		            console.log(res); // 서버 응답 확인  
		            $('#addComment').val('');
		            send(curPage);
		            alert("대댓글이 등록되었습니다.");
		            
		        
		        }
		    });
		    
		});//댓글 등록 끝		

		
		 //대댓글 수정     
		$(document).on('click', '.editReplyBtn1', function(e) {       
		    event.preventDefault();
		    var $replyContainer = $(this).closest('.r_reply_content');
		    $replyContainer.find('.r_replyWrite').hide();
		    $replyContainer.find('.r_replyEditForm').show();
		    $replyContainer.find('textarea').focus();
		    
		});
				 
		 
		 
		 //대댓글 수정 취소
		  $(document).on('click', '#cenceleditreReplyBtn',function(e) {       
			  	event.preventDefault();
			    var $replyContainer = $(this).closest('.r_reply_content');
			    $replyContainer.find('.r_replyEditForm').hide();
			    $replyContainer.find('.r_replyWrite').show();
		  });
					

			//대댓글 수정 ajax
			$(document).on('click', '#editReplyBtn2', function(e) {       
			    event.preventDefault(); // 이벤트의 기본 동작 방지
			    var $replyContainer = $(this).closest('form[name=rEditForm]');
			    var replyData = $replyContainer.serialize(); // 데이터 직렬화
			    
			    $.ajax({
			        type: 'post',
			        url: "<c:url value='/board/reply_update'/>",
			        data: replyData,
			        dataType: 'json',
			        error: function(xhr, status, error){
			            alert(error);
			        },
			        success: function(res){
			            console.log(res); // 서버 응답 확인  
			            var curPage = res.curPage;
			            if(res.cnt>0){
				            $('#addComment').val('');
				            send(curPage);
				            alert("댓글이 수정되었습니다.");
			            }else{
			            	alert("댓글 수정 실패");
			            }
			        }
			    });			
			});
			
			
			
			//대댓글 삭제 ajax
			$(document).on('click', '.delteReplyBtn', function(e) {       
			    event.preventDefault(); // 이벤트의 기본 동작 방지
		        var $replyContainer = $(this).closest('.r_reply_write_form');
		        var $replyDelForm = $replyContainer.find('form[name=reReplyDelFrom]'); // replyDelForm 선택
		        var replyData = $replyDelForm.serialize(); // 데이터 직렬화
			    console.log(replyData);
			    if(confirm('정말 삭제하시겠습니까?')){
				    $.ajax({
				        type: 'post',
				        url: "<c:url value='/board/reply_delete'/>",
				        data: replyData,
				        dataType: 'json',
				        error: function(xhr, status, error){
				            alert(error);
				        },
				        success: function(res){
				            console.log(res); // 서버 응답 확인  
				           		if(res=-1){
						            alert("삭제되었습니다.");
						            send(1);
				           		}else{
				           			alert("댓글 삭제 실패");
				           		}
				             
				        }
				    });			
			    }
			});			  
		
	});//$(functin(){})
	
	
	
	//전체 댓글 불러오기 ajax처리
	function send(curPage){		
		$('.reply_list').html("");
		$('input[name="currentPage"]').val(curPage);
		 var sendDate = $('form[name=sendFrom]').serialize(); // 데이터 직렬화
		 $.ajax({
		        type: 'post',
		        url: "<c:url value='/board/reply_select'/>",
		        data: sendDate,
		        dataType: 'json',
		        error: function(xhr, status, error){
		            alert(error);
		        },
		        success: function(res){
		            console.log(res); // 서버 응답 확인
	            
		            if(res!=null){		
		            	var replyData="";
			            $.each(res.replyList, function(idx, item){
			            	
			            	//페이징 처리
							totalCount=item.totalCount;
							var errorCode=item.errorCode;
							var errorMessage=item.errorMessage;
							
							//출력 데이터
							var step= item.STEP;
			            	var imagePath = "defaultUSER.png";
			            	if(item.MEM_IMAGE!==null){
			            		var imagePath =item.MEM_IMAGE;
			            	}
			            	var comment = item.COMMENTS.replace(/\r\n/ig, '<br>');
			            	var recomment = comment.replace(/<br>/ig, "\n");
				            var date = new Date(item.REGDATE);
				            var userid='<%=session.getAttribute("userid")%>';
				            const regdate = new Date(date.getTime()).toISOString().split('T')[0] + " " + date.toTimeString().split(' ')[0];				            
				         	var type = $('input[name=type]').val();
				           	
				            if(step=== 1){//댓글일 때
				            	if(item.STATUS==='N'){
				                    replyData = "<div class='reply_content'>";
				                    replyData += "<div class='del_content'>이미 삭제된 댓글입니다.</div>"; 
				                    replyData += "</div>";
				            	}else{
				            		replyData="<div class='reply_content'>"
				            		replyData+="<div class='reply_user'>";
				            		replyData+="<div class='detail_left'>";
				            		replyData+="<div class='user_img'>";
				            		replyData += "<img src='<c:url value='/img/defaultUSER.png'/>' alt='사원프로필'>";
				            		replyData+="</div><!-- user_img -->";
				            		replyData+="</div><!--detail_left-->";
				            		replyData+="<div class='detail_left'>";
				            		replyData+="<span class='user_name'><a href='#'>"+item.RANDOM_WRITE+"</a></span>"; //수정해야됨
				            		/* replyData+="<span class='user_dept'>/💼"+item.DEPT_NAME+"</span>"; */
				            		replyData+="</div><!-- detail_left -->";
				            		replyData+="</div><!-- reply_user -->";
				            		replyData+="<div class='replyWriteForm'>";
				            		replyData+="<div class='reply_txt'>"+comment+"</div><!-- reply_txt -->";
				            		replyData+="<div class='reply_txt'>";
				            		replyData+="<span>"+regdate+"</span>";
				            		
				            		if(userid==item.MEM_ID||userid==item.STAFF_ID){
				            			replyData+=" <span><a href='#' class='editReply'>수정</a></span>";
				            			replyData+=" <span><a href='#' id='delReply'>삭제</a></span>";
					            		replyData+="<form name='replyDelForm' method='post' action='#'>";
					            		replyData +="<input type='hidden' name='boardNo' value='" +item.BOARD_NO+ "'>";
					            		replyData +="</form>";
					            		replyData+="</div><!-- reply_txt -->";
					            		replyData+="</div><!-- replyWriteForm -->";
					            		replyData+="<!-- 댓글 수정 -->";
					            		replyData+="<div class='replyEditForm' style='display:none;'>";
					            		replyData+="<form name='replyEditForm' method='post' action='#'>";
					            		replyData += "<input type='hidden' name='boardNo' value='" +item.BOARD_NO+ "'>";
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
					            		replyData+="<div class='replyaddForm' style='display:none;'>";
					            		replyData+="<form name='rAddForm' method='post' action='#'>";
					            		
					            		replyData+="<input type='hidden' name='groupno' value='" +item.GROUP_NO+ "'>";
					            		replyData+="<input type='hidden' name='step' value='"+item.STEP+"'>";
					            		/* replyData+="<input type='hidden' name='mBoardNo' value='"+item.M_BOARD_NO+"'>"; */
					            		replyData+="<input type='hidden' name='contentno' value='"+item.CONTENTNO+"'>";
					            		if(type==='사원'){
							            	replyData+="<input type='hidden' name='memNo' value='${userNo}'>";
					            		}else{
							            	replyData+="<input type='hidden' name='staffNo' value='${userNo}'>";
					            		}
					            		replyData += "<input type='hidden' name='curPage' value='" +curPage+ "'>";
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
				            	}
				            

			            		
			            		replyData+="</div><!--reply_content-->";
			            		$('.reply_list').append (replyData);
			            		
			            	}else{//대댓글일때

			            		replyData="<div class='board_r_reply_content'>";
			            		replyData+="<!-- 대댓글 보기 -->";			       
			            		replyData+="<div class='r_reply_write_form'>";
			            		replyData+="<form name='reReplyDelFrom' method='post' action='#'>";
			            		replyData += "<input type='hidden' name='boardNo' value='" +item.BOARD_NO+ "'>";
			            		replyData +="</form>"
			            		replyData+="<div class='reply_user'>";
			            		replyData+="<div class='detail_left'>";
			            		replyData+="<div class='user_img'>";
			            		replyData += "<img src='<c:url value='/img/defaultUSER.png'/>' alt='사원프로필'>";
			            		replyData+="</div><!-- user_img -->";
			            		replyData+="</div>";
			            		replyData+="<div class='detail_left'>";
			            		replyData+="<span class='user_name'><a href='#'>"+item.RANDOM_WRITE+"</a></span>"; //수정해야됨
			            		/* replyData+="<span class='user_dept'>/ 💼"+item.DEPT_NAME+"</span>"; */
			            		replyData+="</div><!-- detail_left -->";
			            		replyData+="</div><!-- reply_user -->";
			            		replyData+="<div class='r_replyWrite'>";
			            		replyData+="<div class='reply_txt'>"+comment+"</div><!-- reply_txt -->";
			            		replyData+="<div class='reply_txt'>";
			            		replyData+="<span>"+regdate +" </span>";
			            		
			            		if(userid==item.MEM_ID){
				            		replyData+=" <span><a href='#' class='editReplyBtn1'>수정</a></span>";
				            		replyData+=" <span><a href='#' class='delteReplyBtn'>삭제</a></span>";
			            		
				            		replyData+="</div><!-- reply_txt -->";
				            		replyData+="</div><!--r_replyWrite-->";
				            		replyData+="</div><!--r_reply_write_form-->";
				            		replyData+="<!-- 대댓글 보기 -->";
				            		
				            		replyData+="<!--대댓글 수정-->"
				            		replyData+="<div class='r_replyEditForm' style='display:none;'>";
				            		replyData+="<form name='rEditForm' method='post' action='#'>";
				            		replyData += "<input type='hidden' name='boardNo' value='" +item.BOARD_NO+ "'>";
				            		replyData += "<input type='hidden' name='curPage' value='" +curPage+ "'>";
				            		replyData+="<div class='reply_write'>";
				            		replyData+="<div class='form-floating'>";
				            		replyData+="<textarea class='form-control' placeholder='Comments'id='floatingTextarea2' name='comments'style='height: 100px'>"+recomment+"</textarea>";
				            		replyData+="<label for='floatingTextarea2'>Comments</label>";
				            		replyData+="</div>";
				            		replyData+="<div class='reply_add'>";
				            		replyData+="<button class='reply_add_btn2' style='margin-bottom: 4px;' id='editReplyBtn2'>수정</button>";
				            		replyData+="<button class='reply_add_btn2' id='cenceleditreReplyBtn'>취소</button>";
				            		replyData+="</div>";
				            		replyData+="</div><!-- reply_write -->";
				            		replyData+="</form><!--rEditForm-->";
				            		replyData+="</div><!-- r_replyEditForm -->";			            		
				            		replyData+="<!--대댓글 수정-->"
				            		replyData+="</div><!-- r_reply_content -->";
				            		replyData+="<div class='reply_line'></div>";
				            		
				            	}//else

			            		$('.reply_list').append(replyData);
			            	}
				        	
			            });//.each
			           
			            
			            
			            //페이징
			            var str = "";
			            var firstPage = res.pagingInfo.firstPage;
			            var lastPage = res.pagingInfo.lastPage;
			            var currentPage = res.pagingInfo.currentPage;
			            var totalRecord = res.pagingInfo.totalRecord;
			            var totalPage = res.pagingInfo.totalPage;
	
			            
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
			            $('#pageBox').html("");
			            $('#pageBox').html(str);
			    		
	       			}//not null if
			}//success
		});//ajax
	}//function
	

</script>

<style>
</style>
<form method="post" name="sendFrom">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="contentno" value="${map['BOARD_NO']}">
</form>

<input type="hidden" name="contentno" id="contentno">

<div class="container-fluid pt-4 px-4" id="board_style">
	<div class="bg-secondary text-center rounded p-4">
    	<div class="bg-secondary rounded h-100 p-4">
          	<nav
				style="--bs-breadcrumb-divider: url(&amp; amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&amp;amp;#34;);"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">공용</a></li>
					<li class="breadcrumb-item active" aria-current="page"><a
						href="<c:url value='/board/boardList'/>">자유게시판</a></li>
				</ol>
			</nav>   			
			<div id="teamNoticeDetail">
	        	<div class="detailWrap">
	        	
		        	<div class="detail_title">
		        		<div class="detail_left">
			        		<span class="title_txt">${map["BOARD_TITLE"]}</span>
							<span class="title_date">
								<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd a hh:mm"/>
							</span>
						</div><!-- detail_left -->
						
						<div class="detail_right">조회수 : ${map["VIEWS"]}</div>
		        	</div><!-- detail_title -->
		        	
		       		<div class="user_info">		
		       			<div class="detail_left">
							<div class="user_img">
			        			<c:set var="userimg" value="defaultUSER.png"/>
			        			<%-- <c:if test="${!empty map['MEM_IMAGE']}">
			        				<c:set var="userimg" value="${map['MEM_IMAGE']}"/>
			        			</c:if>	 --%>							
			        			<img src="<c:url value='/img/${userimg}'/>" alt="사원프로필">
			        		</div><!-- user_img -->
			        		<div class="detail_left">
			        			<span class="user_name"><a href="#">${map['RANDOM_ID']}</a></span>
			        			<%-- <span class="user_dept">/ 💼${map['DEPT_NAME']}</span> --%>
			        		</div><!-- detail_left -->
		        		</div><!-- detail_left -->
		        				       		      
		        		<c:if test="${!empty filemap }">
							<div class="noticeFiles">
								<div class="fileupload">
									<a href="#">첨부파일</a>
								</div>
								<div class="fileupload_right">
									<c:forEach var="map" items="${filemap }">
										<a href="<c:url value='/board/Filedownload?boardNo=${map["BOARD_NO"]}&fileName=${map["FILE_NAME"]}&boardFileNo=${map["BOARD_FILE_NO"] }'/>">
										${map['ORIGIN_FILENAME']}&nbsp; (<fmt:formatNumber
												value="${map['FILE_SIZE'] /1024.0}" type="number" pattern="#.##" />
											KB)
										</a>
										<br>
									</c:forEach>
								</div>
							</div>
						</c:if>
		       		</div><!-- user_info -->
		       				 
		       		<div class="detail_content">
		       			<div class="detail_view">
		       				${map['BOARD_CONTENT']}
		       			</div>
		       			
		       			<div class="detail_option_btn">
		       				<span class="user_dept">
		       					<a href="<c:url value='/board/boardList'/>">목록</a>
		       				</span>
		       				<c:if test="${userid==map['MEM_ID'] || userid==map['STAFF_ID']}">
		       					<span class="user_dept">
		       						<a href="<c:url value='/board/boardEdit?boardNo=${map["BOARD_NO"]}'/>">
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


	       			</div><!-- reply_list -->
	       		 
	       			<!-- 댓글 등록 -->
	       			<form name="reply_frm" method="post" action="#">
	       				<c:if test="${sessionScope.type=='사원' }">
		       				<input type="hidden" name="memNo" id="memNo" value="${userNo}">
		       				<input type="hidden" name="type" id="type" value="${sessionScope.type}">
	       				</c:if>
	       				<c:if test="${sessionScope.type=='스태프' }">
		       				<input type="hidden" name="staffNo" id="staffNo" value="${userNo}">
		       				<input type="hidden" name="type" id="type" value="${sessionScope.type}">
	       				</c:if>
	       				<input type="hidden" name=contentno id="contentno" value="${map['BOARD_NO']}"> 
	       				<%-- <input type="hidden" name="mBoardNo" id="mBoardNo" value="${map['M_BOARD_NO']}"> --%>
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
				
				
				<!-- 이전페이지 시작 -->
				<div class="detail_next_wrap">
					<div class="reply_next_tit">자유게시판 전체글</div>

					<div class="reply_next_list">
						<div class="reply_next_content">
							<div class="reply_next_user">
								<div class="detail_next_left">
									<%-- <c:forEach var="map" items="${list }" begin="0" end="5"> --%>
									<c:set var="currentNo" value="${map.BOARD_NO}" />
									<span class="user_name1">
									    <c:if test="${!empty nextPage}">
									        <c:forEach var="map1" items="${nextPage}">
									            <c:if test="${currentNo == map1.BOARD_NO}">
									                <c:set var="prevDisable" value="${map1.PREV_NUM == 0}" />
									                이전글 : 
									                <c:choose>
									                    <c:when test="${prevDisable}">
									                        <span style="color: gray;">이전글이 없습니다</span>
									                    </c:when>
									                    <c:otherwise>
									                        <a href="<c:url value='/board/boardDetail?boardNo=${map1.PREV_NUM}'/>">
									                            <span style="color: blue;">${map1.PREV_TITLE}</span>
									                        </a>
									                    </c:otherwise>
									                </c:choose>
									                <br>
									                <c:set var="nextDisable" value="${map1.NEXT_NUM == 0}" />
									                다음글 :
									                <c:choose>
									                    <c:when test="${nextDisable}">
									                        <span style="color: gray;">다음글이 없습니다</span>
									                    </c:when>
									                    <c:otherwise>
									                        <a href="<c:url value='/board/boardDetail?boardNo=${map1.NEXT_NUM}'/>">
									                            <span style="color: blue;">${map1.BOARD_TITLE}</span>
									                        </a>
									                    </c:otherwise>
									                </c:choose>
									            </c:if>
									        </c:forEach>
									        <br>
									    </c:if>
									</span>
								</div>
							</div>
							<!-- noticeDetail -->
						</div>
					</div>
				</div>
				
				<!-- 이전페이지 끝 -->
      		</div><!-- detail_reply_wrap -->   	
      			
		</div><!-- teamNoticeDetail -->
	</div>
</div>
<%@include file="../inc/bottom.jsp"%>  