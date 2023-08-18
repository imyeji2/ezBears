<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../inc/top.jsp"%>

    <!-- Recent Sales Start -->
    <div class="container-fluid pt-4 px-4" id="board_style">
        <div class="bg-secondary text-center rounded">
            <div class="bg-secondary rounded h-100 p-4">
 				<c:import url="/myBoard/myBoardNavTab?myBoardNo=${myBoardNo}"></c:import>
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active">
						<div id="teamNoticeList">
							<br><br>
							<div class="teamNotice_serch">
								<div class="serch_input">
									<div class="select_box">
										<select class="form-select" aria-label="Default select example">
										  <option selected>선택</option>
										  <option value="name">이름</option>
										  <option value="subject">제목</option>
										  <option value="content">내용</option>
										</select>				
									</div>
									<div class="text_box">
										<input type="text" class="form-control" id="exampleFormControlInput1"
											 placeholder="검색어를 입력해주세요">
									</div>
									
									<div class="serch_btn">
										<button>검색</button>
									</div><!-- serch_btn -->
								</div><!-- serch_input -->
							</div><!-- teamNotice_serch -->
							
							<br><br>
						
							<c:if test="${empty list}">
								<div class="notice_list_box">
						        	<div style="text-align:center">등록된 글이 없습니다.</div>
						        </div>
							</c:if>
							
							<c:if test="${!empty list}">
								<!-- 반복시작 -->
								<c:forEach var="map" items="${list}">
									<div class="notice_list_box">
							        	<div>
								        	<div class="list_box_title">
								        		<div class="user_img">
								        			<c:set var="userimg" value="default_user.png"/>
								        			<c:if test="${!empty map['MEM_IMAGE']}">
								        				<c:set var="userimg" value="${map['MEM_IMAGE']}"/>
								        			</c:if>
								        			<img src="<c:url value='/img/mem_images/${userimg}'/>" alt="사원프로필">
								        		</div>
								        		<div class="user_txt">
								        			<span class="user_txt_name">${map['MEM_NAME']}</span>
								        			<span class="user_txt_time"> 
								        				&#183 <fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd a hh:mm"/>
								        			</span>
								        		</div>
								        		<div class="user_dept">${map['DEPT_NAME']}</div>
								        	</div>
								       		<div class="list_box_content">
								       			<div class="content_title">${map['TEAM_NOTICE_TITLE']}</div>
								       			<div class="content_txt">
								       			${map['TEAM_NOTICE_CONTENT']}
								       			</div>
								       		</div>
								       		<c:if test="${!empty map['FILENAME']}">
								       			<div class="list_box_file">
								       				<a href="#"> ${map['ORIGINNAME']}&nbsp;
								       				(<fmt:formatNumber value="${map['FSIZE'] /1024.0}" type="number" pattern="#.##"/> KB)
								       				</a>
								       			</div>
								       		</c:if>
								       		
							       		</div>
							       		<div class="notice_reply">
							       			<div>
							       				<a href="<c:url value='/myBoard/teamNoticeDetail?myBoardNo=${map["MY_BOARD_NO"]}&teamNoticeNo=${map["TEAM_NOTICE_NO"]}'/>">댓글 달기</a>
							       			</div>
							       		</div>
							        </div><!-- notice_list_box -->		
														
								</c:forEach>
						        <!-- 반복 끝 -->
					        </c:if>
					                    
					        <div class="list_line"></div>     
					        
					        <div class="btnBox">
								<a class="btn btn-sm btn-primary" href="">삭제</a>
								<a class="btn btn-sm btn-primary" href="">수정</a>
								<a class="btn btn-sm btn-primary" 
									href="<c:url value='/myBoard/teamNoticeWrite?myBoardNo=${myBoardNo}'/>">등록</a>
							</div><!-- btnBox --> 
							         
							  <c:if test="${!empty list}">          
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
							</c:if>
						</div><!-- teamNoticeList -->
					</div>
				</div>
            </div>
        </div>
    </div>
    <!-- Recent Sales End -->

 <%@include file="../inc/bottom.jsp"%>    					