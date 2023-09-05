<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="inc/top.jsp"%>
<script>
	$(function(){
		naverNewsLoad();
		setInterval(naverNewsLoad,10000);
		//600000
		

	})
	

	function naverNewsLoad(){
		var newContent="";
		
        $.ajax({
            type: 'post',
            url: "<c:url value='/api/naverNews'/>",
            dataType: 'json',
            error: function(xhr, status, error) {
                alert(error);
            },
            success: function(res) {
                console.log(res);
              	$('#naverNews thead').html('');
               	$('#naverNews tbody').html('');
               	
                $.each(res.items, function(idx, item){
                	newContent+="<tr>";
                	newContent+="<td>";
                	newContent+="<a href='"+item.link+"'>"+item.title+"</a>";
                	newContent+="</td>";
                	newContent+="</tr>";
                	
                	
                });

                const TIME_ZONE = 9 * 60 * 60 * 1000; // 9시간
                const d = new Date(res.lastBuildDate);

                const date = new Date(d.getTime() + TIME_ZONE).toISOString().split('T')[0];
                const time = d.toTimeString().split(' ')[0];

                console.log();

                var newsDate="<tr>";
                newsDate+="<th scope='col'>"+date + ' ' + time.substring(0, 5)+" 기준</th>"; // 시간 문자열에서 앞 5글자만 가져옴 (시:분)
                newsDate+="</tr>";


			    
              	$('#naverNews thead').append(newsDate);
               	$('#naverNews tbody').append(newContent);

            }
        });
	}
</script>
 <!-- Navbar End -->
 <!-- top ë©”ë‰´ ì¢…ë£Œ -->
<div id="main">
<c:if test="${type=='사원'}">
     <div class="container-fluid pt-4 px-4">
         <div class="row g-4">
             <div class="col-sm-12 col-xl-6">
                 <div class="bg-secondary text-center rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-4">
                         <h6 class="mb-0">업무 진행률</h6>
                     </div>
                 </div>
             </div>
             
             
             <div class="col-sm-12 col-xl-6 naverNews">
                 <div class="bg-secondary text-center rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-4">
                         <h6 class="mb-0">최신 뉴스</h6>
                     </div>
                     <table class="table text-truncate" style="max-width: 95%;" id="naverNews">
						 <thead>

						  </thead>
						  <tbody>
						    						    
						</tbody>
					</table>                     
                 </div>
             </div>
         </div>
     </div>


     <!-- 2번째 줄 게시판 모음 -->   
     <div class="container-fluid pt-4 px-4">
         <div class="row g-4">
             <div class="col-sm-12 col-xl-6">
                 <div class="bg-secondary text-center rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-2">
                         <h6 class="mb-0">공지사항</h6>
                     </div>
                     <div class="d-flex align-items-center py-3">
			           		<table class="table notice">
							 <thead>
							    <tr>
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
                        
             <div class="col-sm-12 col-xl-6">
                 <div class="bg-secondary text-center rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-2">
                         <h6 class="mb-0">${mBoardName}</h6>
                         <a href="">변경하기</a>
                     </div>
                     <div class="d-flex align-items-center py-3">
			           		<table class="table">
							 <thead>
							    <tr>
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
								      <td style="text-align:left;">
								      	<a href="<c:url value='/myBoard/teamNoticeDetail?mBoardNo=${myNoticeMap["M_BOARD_NO"]}&teamNoticeNo=${myNoticeMap["TEAM_NOTICE_NO"]}'/>">
								      		${myNoticeMap['TEAM_NOTICE_TITLE']} 
										</a>								      		
								      		
								      </td>
								      <td>${myNoticeMap['MEM_NAME']}</td>
								      <td>
							      		<c:if test="${myNoticeMap['DATEGAP']<1}">방금전</c:if>	
							      		<c:if test="${myNoticeMap['DATEGAP']>=1}">${regdate}</c:if>									      	
								      
								      </td>
								    </tr>				  		
							  	</c:forEach>
							  </c:if>			    
							</tbody>
						</table>
                     </div>
                 </div>
             </div>                
          </div>
     </div>
             
<!--              <div class="col-sm-12 col-md-6 col-xl-4">
                 <div class="h-100 bg-secondary rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-4">
                         <h6 class="mb-0">Calender</h6>
                         <a href="">Show All</a>
                     </div>
                     <div id="calender"></div>
                 </div>
             </div> -->

	     <!-- 2번째 줄 게시판 모음 -->   
 	</c:if>
 	
 	<!-- 스태프 메인 -->
 	<c:if test="${type=='스태프'}">
 	 
 	</c:if>
</div><!-- main -->
 <%@include file="inc/bottom.jsp"%>
