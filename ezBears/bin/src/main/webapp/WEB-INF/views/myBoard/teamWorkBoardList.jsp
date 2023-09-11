<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../inc/top.jsp"%>

<script>
$(function(){
	$('#searchBtn').click(function(){
	    event.preventDefault();

	    if ($('#searchCondition').val() === "default") {
	        alert("검색할 카테고리를 선택해주세요");
	        $('#searchCondition').focus();
	        return false;
	    } else if ($('#searchKeyword').val().length < 1) {
	        alert('검색어를 입력해주세요');
	        $('#searchKeyword').focus();
	        return false;
	    }else{
	    	$('form[name=serchFrm]').submit();
	    }

	});
	

})
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="teamWorkBoardFrom"]').submit();
	}
</script>

    <!-- Recent Sales Start -->
    <div class="container-fluid pt-4 px-4" id="board_style">
        <div class="bg-secondary text-center rounded">
            <div class="bg-secondary rounded h-100 p-4">
				<c:import url="/myBoard/myBoardNavTab?mBoardNo=${mBoardNo}"></c:import>
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active">
						<div id="teamWorkBoardList">
							<br>
							
							<form action="<c:url value='/myBoard/teamWorkBoard?mBoardNo=${mBoardNo}'/>" method="post" name="teamWorkBoardFrom">
								<input type="hidden" name="currentPage">
								<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
								<input type="hidden" name="searchCondition" value="${param.searchCondition}">
							</form>
							
							<form name="serchFrm" method="post" action="<c:url value='/myBoard/teamWorkBoard?mBoardNo=${mBoardNo}'/>">
								<div id="teamNotice_serch">
									<div class="serch_input">
										<div class="select_box">
											<select class="form-select" aria-label="Default select example" 
												name="searchCondition" id="searchCondition">
											  <option value="default" selected>선택</option>
											  <option value="mem_name"
											  	<c:if test="${param.searchCondition=='mem_name'}">
								            		selected="selected"
								            	</c:if>            	
											  >이름</option>
											  <option value="team_board_title"
											  	<c:if test="${param.searchCondition=='team_board_title'}">
								            		selected="selected"
								            	</c:if>										  
											  >제목</option>
											  <option value="team_board_content"
											  	<c:if test="${param.searchCondition=='team_board_content'}">
								            		selected="selected"
								            	</c:if>											  
											  >내용</option>
											</select>							
										</div>
										<div class="text_box">
											<input type="text" class="form-control" name="searchKeyword" id="searchKeyword"
												 placeholder="검색어를 입력해주세요" value="${param.searchKeyword }">
										</div>
										
										<div class="serch_btn">
											<button id="searchBtn">검색</button>
										</div><!-- serch_btn -->
										
							        <div class="btnBox">
										<a class="btn btn-sm btn-primary" 
											href="<c:url value='/myBoard/teamWorkBoardWrite?mBoardNo=${mBoardNo}'/>">등록</a>
									</div><!-- btnBox --> 
																			
									</div><!-- serch_input -->
								</div><!-- teamNotice_serch -->
							</form>
							
							<br>
					      <div class="table-responsive">
					          <table class="table text-start align-middle table-bordered table-hover mb-0">
					              <thead>
					                  <tr class="text-white">
					                      <!-- <th scope="col"><input class="form-check-input" type="checkbox"></th> -->
					                      <th scope="col">번호</th>
					                      <th scope="col">제목</th>
					                      <th scope="col">작성자</th>
					                      <th scope="col">등록일</th>
					                      <th scope="col">조회수</th>
					                  </tr>
					              </thead>
					              <tbody>
					                  				              							
							<c:if test="${empty list}">
								<tr class="table_info">	
									<td scope="col" colspan="5">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${!empty list}">
								<c:if test="${!empty param.searchKeyword}">
									<div style="text-align:center">
										${pagingInfo.totalRecord}건이 검색되었습니다.
									</div>
									<br><br>
								</c:if>
								<!-- 반복시작 -->
								
								<!-- 반복 끝 -->
								</c:if>							
								<c:set var="idx" value="${(pagingInfo.totalRecord - (pagingInfo.currentPage - 1) * pagingInfo.recordCountPerPage)}"/>
									<c:forEach var="map" items="${list}">
						                  <tr class="table_info">
						                      <!-- <td><input class="form-check-input" type="checkbox"></td> -->
						                      <td>${idx}</td>
						                      <td>
						                      	<a href="
						                      	<c:url value='/myBoard/teamWorkBoardCountUpdate?mBoardNo=${mBoardNo}&teamBoardNo=${map["TEAM_BOARD_NO"]}'/>" style="color:#fff;">
						                      		${map['TEAM_BOARD_TITLE']}
						                      		<c:if test="${map['FILENAME'] != null}">
						                      			💾
													</c:if>
						                      	</a>
						                      </td>
						                      <td>${map['MEM_NAME']}</td>
						                      <td>
						                      	<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd"/>						                      
						                      </td>
						                      <td>${map['VIEWS']}</td>
										   <!-- <td><a class="btn btn-sm btn-primary" href="">Detail</a></td> -->
						                  </tr>
						                 <c:set var="idx" value="${idx-1}"/>     
									</c:forEach>        
					              </tbody>
					          </table>
					      </div>
					      <div class="page_box">
						      <nav aria-label="Page navigation example">
								  <ul class="pagination justify-content-center">
								  <c:if test="${pagingInfo.firstPage>1}">
									    <li class="page-item">
									      <a class="page-link" onclick="pageFunc(${pagingInfo.firstPage-1})">
									      	<
									      </a>
									    </li>
								    </c:if>
								    <c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">		
										<c:if test="${i == pagingInfo.currentPage}">		
										    <li class="page-item active" >
										    	<a class="page-link" href="#">${i}</a>
										    </li>
										   </c:if>
											<c:if test="${i != pagingInfo.currentPage }">
											    <li class="page-item">
											    	<a class="page-link" href="#" onclick="pageFunc(${i})">${i}</a>
											    </li>
										    </c:if>   		
										</c:forEach>
									<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">													    
									    <li class="page-item">
									      <a class="page-link"  href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">Next</a>
									    </li>
								    </c:if>
								  </ul>
								</nav>
						</div><!-- page_box -->
					</div><!-- teamWorkBoardList -->
				</div>
			</div>
           </div>
       </div>
</div>
    <!-- Recent Sales End -->

 <%@include file="../inc/bottom.jsp"%>   						