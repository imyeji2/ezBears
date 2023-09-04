<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="inc/top.jsp"%>

 <!-- Navbar End -->
 <!-- top ë©”ë‰´ ì¢…ë£Œ -->
<div id="main">
     <div class="container-fluid pt-4 px-4">
         <div class="row g-4">
             <div class="col-sm-12 col-xl-6">
                 <div class="bg-secondary text-center rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-4">
                         <h6 class="mb-0">업무 진행률</h6>
                     </div>
                 </div>
             </div>
             
             
             <div class="col-sm-12 col-xl-6">
                 <div class="bg-secondary text-center rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-4">
                         <h6 class="mb-0">최신 뉴스</h6>
                     </div>
                     <table class="table ">
						 <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">First</th>
						      <th scope="col">Last</th>
						      <th scope="col">Handle</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">1</th>
						      <td>Mark</td>
						      <td>Otto</td>
						      <td>@mdo</td>
						    </tr>
						    <tr>
						      <th scope="row">2</th>
						      <td>Jacob</td>
						      <td>Thornton</td>
						      <td>@fat</td>
						    </tr>
						    <tr>
						      <th scope="row">3</th>
						      <td colspan="2">Larry the Bird</td>
						      <td>@twitter</td>
						    </tr>
						    <tr>
						      <th scope="row">3</th>
						      <td colspan="2">Larry the Bird</td>
						      <td>@twitter</td>
						    </tr>
						    <tr>
						      <th scope="row">3</th>
						      <td colspan="2">Larry the Bird</td>
						      <td>@twitter</td>
						    </tr>						    						    
						</tbody>
					</table>                     
                 </div>
             </div>
         </div>
     </div>


     <!-- 2번째 줄 게시판 모음 -->   
     <div class="container-fluid pt-4 px-4">
         <div class="row g-4">
             <div class="col-sm-12 col-md-6 col-xl-4">
                 <div class="h-100 bg-secondary rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-2">
                         <h6 class="mb-0">공지사항</h6>
                     </div>
                     <div class="d-flex align-items-center py-3">
			           		<table class="table">
							 <thead>
							    <tr>
							      <th scope="col">번호</th>
							      <th scope="col">제목</th>
							      <th scope="col">작성자</th>
							      <th scope="col">등록일</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:if test="${empty noticeList}">
							  	<tr>
							  		<th scope="row" colspan="4">등록된 게시글이 없습니다.</th>
							  	</tr>
							  </c:if>
							  <c:if test="${!empty noticeList}">
							  	<c:forEach var="noticeMap" items="${noticeList}">
							  	<fmt:formatDate var="regdate" value="${noticeMap['REGDATE']}" pattern="yyyy-MM-dd"/>
								    <tr>
								      <th scope="row">${noticeMap['RNUM']}</th>
								      <td>
								      	<a href="<c:url value='/notice/noticeDetail?noticeNo=${noticeMap["NOTICE_NO"]}'/>">
								      		${noticeMap['NOTICE_TITLE']}
								      	</a>
								      </td>
								      <td>${noticeMap['MEM_NAME']}</td>
								      <td>${regdate}</td>
								    </tr>				  		
							  	</c:forEach>
							  </c:if>			    
							</tbody>
						</table>
                     </div>
                 </div>
             </div>
                        
             <div class="col-sm-12 col-md-6 col-xl-4">
                 <div class="h-100 bg-secondary rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-2">
                         <h6 class="mb-0">${mBoardName}</h6>
                         <a href="">변경하기</a>
                     </div>
                     <div class="d-flex align-items-center py-3">
			           		<table class="table">
							 <thead>
							    <tr>
							      <th scope="col">번호</th>
							      <th scope="col">제목</th>
							      <th scope="col">작성자</th>
							      <th scope="col">등록일</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:if test="${empty myNoticeList}">
							  	<tr>
							  		<th scope="row" colspan="4">등록된 게시글이 없습니다.</th>
							  	</tr>
							  </c:if>
							  <c:if test="${!empty myNoticeList}">
							  	<c:forEach var="myNoticeMap" items="${myNoticeList}">
							  	<fmt:formatDate var="regdate" value="${myNoticeMap['REGDATE']}" pattern="yyyy-MM-dd"/>
								    <tr>
								      <th scope="row">${myNoticeMap['RNUM']}</th>
								      <td>
								      	<a href="<c:url value='/myBoard/teamNoticeDetail?mBoardNo=${myNoticeMap["M_BOARD_NO"]}&teamNoticeNo=${myNoticeMap["TEAM_NOTICE_NO"]}'/>">
								      		${myNoticeMap['TEAM_NOTICE_TITLE']}
								      	</a>
								      </td>
								      <td>${myNoticeMap['MEM_NAME']}</td>
								      <td>${regdate}</td>
								    </tr>				  		
							  	</c:forEach>
							  </c:if>			    
							</tbody>
						</table>
                     </div>
                 </div>
             </div>                
 
             
             <div class="col-sm-12 col-md-6 col-xl-4">
                 <div class="h-100 bg-secondary rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-4">
                         <h6 class="mb-0">Calender</h6>
                         <a href="">Show All</a>
                     </div>
                     <div id="calender"></div>
                 </div>
             </div>
         </div>
     </div>
     <!-- 2번째 줄 게시판 모음 -->   
 
</div><!-- main -->
 <%@include file="inc/bottom.jsp"%>
