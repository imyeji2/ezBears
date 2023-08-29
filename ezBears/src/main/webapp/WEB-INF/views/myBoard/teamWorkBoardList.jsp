<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../inc/top.jsp"%>

<script>
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
							
							<form action="<c:url value='/myBoard/teamNotice?mBoardNo=${mBoardNo}'/>" method="post" name="teamNoticeFrom">
								<input type="hidden" name="currentPage">
								<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
								<input type="hidden" name="searchCondition" value="${param.searchCondition}">
							</form>
							
							<form name="serchFrm" method="post" action="<c:url value='/myBoard/teamWorkBoard?mBoardNo=${mBoardNo}'/>">
								<div id="teamNotice_serch">
									<div class="serch_input">
										<div class="select_box">
											<select class="form-select" aria-label="Default select example" name="searchCondition">
											  <option value="default" selected>선택</option>
											  <option value="mem_name"
											  	<c:if test="${param.searchCondition=='mem_name'}">
								            		selected="selected"
								            	</c:if>            	
											  >이름</option>
											  <option value="team_notice_title"
											  	<c:if test="${param.searchCondition=='team_notice_title'}">
								            		selected="selected"
								            	</c:if>										  
											  >제목</option>
											  <option value="team_notice_content"
											  	<c:if test="${param.searchCondition=='team_notice_content'}">
								            		selected="selected"
								            	</c:if>											  
											  >내용</option>
											</select>							
										</div>
										<div class="text_box">
											<input type="text" class="form-control" name="searchKeyword"
												 placeholder="검색어를 입력해주세요" value="${param.searchKeyword }">
										</div>
										
										<div class="serch_btn">
											<button id="searchBtn">검색</button>
										</div><!-- serch_btn -->
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


					                  <tr class="table_info">
					                      <!-- <td><input class="form-check-input" type="checkbox"></td> -->
					                      <td>10</td>
					                      <td><a href="<c:url value='/myBoard/teamWorkBoardDetail'/>">개발1팀 8월 업무 리스트</a></td>
					                      <td>제이든</td>
					                      <td>2023-08-01</td>
					                      <td>5</td>
									   <!-- <td><a class="btn btn-sm btn-primary" href="">Detail</a></td> -->
					                  </tr>              
					                  <tr class="table_info">
					                      <!-- <td><input class="form-check-input" type="checkbox"></td> -->
					                      <td>9</td>
					                      <td>개발1팀 7월 업무 리스트</td>
					                      <td>제이든</td>
					                      <td>2023-07-01</td>
					                      <td>20</td>
									   <!-- <td><a class="btn btn-sm btn-primary" href="">Detail</a></td> -->
					                  </tr>
					                  <tr class="table_info">
					                      <td>4</td>
					                      <td>개발1팀 6월 업무 리스트</td>
					                      <td>제이든</td>
					                      <td>2023-06-01</td>
					                      <td>60</td>
					                  </tr>
					                  <tr class="table_info">
					                      <td>8</td>
					                      <td>개발1팀 5월 업무 리스트</td>
					                      <td>제이든</td>
					                      <td>2023-05-01</td>
					                      <td>50</td>
					                  </tr>
					                  <tr class="table_info">
					                      <td>7</td>
					                      <td>개발1팀 4월 업무 리스트</td>
					                      <td>제이든</td>
					                      <td>2023-04-01</td>
					                      <td>28</td>
					                  </tr>
					                  <tr class="table_info">
					                      <td>6</td>
					                      <td>개발1팀 4월 업무 리스트</td>
					                      <td>제이든</td>
					                      <td>2023-04-01</td>
					                      <td>30</td>
					                  </tr>
					                  <tr class="table_info">
					                      <!-- <td><input class="form-check-input" type="checkbox"></td> -->
					                      <td>5</td>
					                      <td>개발1팀 3월 업무 리스트</td>
					                      <td>제이든</td>
					                      <td>2023-03-01</td>
					                      <td>48</td>
									   <!-- <td><a class="btn btn-sm btn-primary" href="">Detail</a></td> -->
					                  </tr>
					                  <tr class="table_info">
					                      <!-- <td><input class="form-check-input" type="checkbox"></td> -->
					                      <td>4</td>
					                      <td>개발1팀 2월 업무 리스트</td>
					                      <td>제이든</td>
					                      <td>2023-02-01</td>
					                      <td>70</td>
									   <!-- <td><a class="btn btn-sm btn-primary" href="">Detail</a></td> -->
					                  </tr>
					                  <tr class="table_info">
					                      <!-- <td><input class="form-check-input" type="checkbox"></td> -->
					                      <td>3</td>
					                      <td>개발1팀 1월 업무 리스트</td>
					                      <td>제이든</td>
					                      <td>2023-01-01</td>
					                      <td>60</td>
									   <!-- <td><a class="btn btn-sm btn-primary" href="">Detail</a></td> -->
					                  </tr>
					                  <tr class="table_info">
					                      <!-- <td><input class="form-check-input" type="checkbox"></td> -->
					                      <td>2</td>
					                      <td>개발1팀 12월 업무 리스트</td>
					                      <td>제이든</td>
					                      <td>2022-12-01</td>
					                      <td>58</td>
									   <!-- <td><a class="btn btn-sm btn-primary" href="">Detail</a></td> -->
					                  </tr>
					                   <tr class="table_info">
					                      <!-- <td><input class="form-check-input" type="checkbox"></td> -->
					                      <td>1</td>
					                      <td>개발1팀 11월 업무 리스트</td>
					                      <td>제이든</td>
					                      <td>2022-11-01</td>
					                      <td>98</td>
									   <!-- <td><a class="btn btn-sm btn-primary" href="">Detail</a></td> -->
					                  </tr>                                                                                         
					              </tbody>
					          </table>
					      </div>
					      <div class="btnBox">
<!-- 								<a class="btn btn-sm btn-primary" href="">삭제</a>
								<a class="btn btn-sm btn-primary" href="">수정</a> -->
								<a class="btn btn-sm btn-primary" href="<c:url value='/myBoard/teamWorkBoardWrite?mBoardNo=${mBoardNo}'/>">등록</a>
						</div><!-- btnBox -->
					      <div class="page_box">
						      <nav aria-label="Page navigation example">
								  <ul class="pagination justify-content-center">
								    <li class="page-item">
								      <a class="page-link">Previous</a>
								    </li>
								    <li class="page-item active"><a class="page-link" href="#">1</a></li>
								    <li class="page-item"><a class="page-link" href="#">2</a></li>
								    <li class="page-item"><a class="page-link" href="#">3</a></li>
								    <li class="page-item">
								      <a class="page-link" href="#">Next</a>
								    </li>
								  </ul>
								</nav>
							</div>
						</div><!-- teamWorkBoardList -->
					</div>
				</div>
            </div>
        </div>
    </div>
    <!-- Recent Sales End -->

 <%@include file="../inc/bottom.jsp"%>   						