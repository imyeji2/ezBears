<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>	
<!-- Recent Sales Start -->
<c:set var="checkedCount" value="0"/>
<c:set var="uncheckedCount" value="0"/>
<c:set var="totalCount" value="0"/>  
<div class="container-fluid pt-4 px-4" id="board_style">
	<div class="bg-secondary text-center rounded p-4">
    	<div class="bg-secondary rounded h-100 p-4">
          	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item active" aria-current="page">
			    	<a href="<c:url value='/myBoard/teamWorkBoardList?mBoardNo=${map["M_BOARD_NO"]}'/>">${myBoardName}</a>
			    </li>
			    <li class="breadcrumb-item active" aria-current="page">업무게시판</li>
			  </ol>
			</nav>   			
			<div id="teamWorkBoardDetail">
	        	<div class="detailWrap">
	        	
		        	<div class="detail_title">
		        		<div class="detail_left">
			        		<span class="title_txt">${map['TEAM_BOARD_TITLE']}</span>
							<span class="title_date">
								<fmt:formatDate value="${map['REGDATE']}" pattern="a hh:mm" />
							</span>
						</div><!-- detail_left -->
						<div class="detail_right">조회수 : ${map['VIEWS']}</div>
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
		        		
		        		<c:if test="${!empty map['ORIGIN_FILENAME']}">		       		        		       				        	
			        		<div class="detail_right">
			        			첨부파일 : <a href="<c:url value='/myBoard/teamWordBoardDownloadFile?teamBoardNo=${map["TEAM_NOTICE_NO"]}&fileName=${map["FILENAME"]}'/>">
			        				${map['ORIGIN_FILENAME']}(<fmt:formatNumber value="${map['FSIZE'] /1024.0}" type="number" pattern="#.##"/> KB)
			        				</a>
			        		</div><!-- detail_right -->
			        	</c:if>
			        	
		       		</div><!-- user_info -->
		       				 
		       		<div class="detail_content">
		       			<div class="detail_view">
		       				${map['TEAM_BOARD_CONTENT']}
		       			</div>
		       			
		       			
		       			<div class="detailTodoList">
		       				<div class="todoTitle">
		       					<h6 class="mb-0">To Do List(1/${totalCount})</h6>
								<fmt:parseDate var="startRegdateFmt" value="${toDoList.startRegdate}" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:parseDate var="doneRegdateFmt" value="${toDoList.doneRegdate}" pattern="yyyy-MM-dd HH:mm:ss" />
								
								<div class="todoDate">
								    <span>프로젝트 진행일 : </span>
								    <span>
								        <fmt:formatDate value="${startRegdateFmt}" pattern="yyyy-MM-dd"/> ~ 
								        <fmt:formatDate value="${doneRegdateFmt}" pattern="yyyy-MM-dd"/>
								    </span>
								</div>
		       				</div>
		       				
                         <div class="d-flex mb-2">
                                <input class="form-control border-0 todoInput" type="text" placeholder="업무를 입력하세요">
                                <button type="button" class="btn btn-primary ms-2">Add</button>
                            </div>
                            <br>
                            <div class="uncheckList">
                            	<h8>[진행중]</h8>
                            	<c:forEach var="list" items="${toDoListDetailList}">
	                            	<c:if test="${list.status=='Y'}">
	                            		<c:set var="uncheckedCount" value="${uncheckedCount + 1}"/>
			                            <div class="d-flex align-items-center border-bottom py-2 todoList">
			                               <input class="form-check-input m-0" type="checkbox">
			                                <div class="w-100 ms-3">
			                                    <div class="d-flex w-100 align-items-center justify-content-between">
			                                        <span>${list.todoContent}</span>
			                                    </div>
			                                </div>
			                            </div>		
		                            </c:if> 
	                            </c:forEach>   					      
                       		</div>
	                        <br>
	                        <div class="checkedList">
	                        	<h8>[완료]</h8>
	                        	<c:forEach var="list" items="${toDoListDetailList}" >
	                        		<c:set var="checkedCount" value="${checkedCount }"/>	
		                        	<c:if test="${list.status!='Y'}">
			                            <div class="d-flex align-items-center border-bottom py-2 todoList">
			                                <input class="form-check-input m-0" type="checkbox" checked="checked">
			                                <div class="w-100 ms-3">
			                                    <div class="d-flex w-100 align-items-center justify-content-between">
			                                        <span>EXERD 수정 및 ERD 확정</span>
			                                    </div>
			                                </div>
			                            </div>
		                            </c:if>
		                    	</c:forEach>
		                    	<c:set var="totalCount" value="${checkedCount+uncheckedCount}"/>                         	
	                        </div>                 
		       			</div> <!--writeTodoList -->
		       					     			
		       			<div class="detail_option_btn">
		       				<span class="user_dept">
		       					<a href="<c:url value='/myBoard/teamWorkBoard?mBoardNo=${map["M_BOARD_NO"]}'/>">목록</a>
		       				</span>
		       				<c:if test="${userid==map['MEM_ID']}">
		       					<span class="user_dept">
		       						<a href="<c:url value='/myBoard/teamWorkBoardEdit?mBoardNo=${map["M_BOARD_NO"]}&teamNoticeNo=${map["TEAM_NOTICE_NO"]}'/>">
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
	       		
	       		<div class="detail_reply_wrap">
	       			<div class="reply_tit">댓글(100)</div>
	       			
	       			<div class="reply_list">
	       				<div class="reply_content"> 
	       					<div class="reply_user">    					
		       					<div class="detail_left">
									<div class="user_img">
					        			<img src="<c:url value='/img/user.jpg'/>" alt="사원프로필">
					        		</div><!-- user_img -->
					        	</div>
				        		<div class="detail_left">
				        			<span class="user_name"><a href="#">박진수</a></span>
				        			<span class="user_dept">/ 💼개발1팀</span>
				        		</div><!-- detail_left -->	 					
	       					</div><!-- reply_user -->
	       					
	       					<div class="reply_txt">
		       					제이든님 공지 확인했습니다.<br>
		       					참여 신청은 인사팀에 직접 해야하나요?
	       					</div><!-- reply_txt -->
	       					
	       					<div class="reply_txt">
	       						<span>2023-08-03 13:01</span>
	       						<span><a href="#">수정</a></span>
	       						<span><a href="#">삭제</a></span>
	       						<span><a href="#">답글</a></span>
	       					</div><!-- reply_txt -->
	       				</div><!-- reply_content -->
	       				
	       					
       					<div class="r_reply_content">
	       					<div class="reply_user">    					
		       					<div class="detail_left">
									<div class="user_img">
					        			<img src="<c:url value='/img/user.jpg'/>" alt="사원프로필">
					        		</div><!-- user_img -->
					        	</div>
				        		<div class="detail_left">
				        			<span class="user_name"><a href="#">제이든</a></span>
				        			<span class="user_dept">/ 💼개발1팀</span>
				        		</div><!-- detail_left -->	 					
	       					</div><!-- reply_user -->
	       					
	       					<div class="reply_txt">
		       					넵, 첨부한 파일 참고하셔서<br>
		       					인사팀에 양식 전달해주시면 됩니다.
	       					</div><!-- reply_txt -->
	       					
	       					<div class="reply_txt">
	       						<span>2023-08-03 13:10</span>
	       						<span><a href="#">수정</a></span>
	       						<span><a href="#">삭제</a></span>
	       					</div><!-- reply_txt -->	       					
       					</div>	       				
	       			</div><!-- r_reply_content -->	      
	       			<div class="reply_line"></div> 
	       						
	       			<div class="reply_write">
						<div class="form-floating">
						  <textarea class="form-control" placeholder="Comments" 
						  id="floatingTextarea2" style="height: 100px"></textarea>
						  <label for="floatingTextarea2">Comments</label>
						</div>	
						       				
	       				<div class="reply_add">
	       					<button class="reply_add_btn">등록</button>
	       				</div>
	       			</div><!-- reply_write -->
	       			
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