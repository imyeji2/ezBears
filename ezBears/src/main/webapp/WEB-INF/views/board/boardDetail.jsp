<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Recent Sales Start -->
<script type="text/javascript">
	$(function() {
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
	});
	
	
</script>
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
							<span class="title_txt">${map['BOARD_TITLE']}</span> 
							<span class="title_date"> 
								<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd" />
							</span>
						</div>
						<!-- detail_left -->
						<c:if test="${!empty map }">
							<div class="detail_right">조회수 : ${map['VIEWS']}</div>
						</c:if>
					</div>
					<!-- detail_title -->

					<div class="user_info">
						<div class="detail_left">
						<%-- <c:if test="${!empty list}"> --%>
								<div class="user_img">
			        			<c:set var="userimg" value="defaultUSER.png"/>
			        			<%-- <c:if test="${!empty map['MEM_IMAGE']}">
			        				<c:set var="userimg" value="${map['MEM_IMAGE']}"/>
			        			</c:if>	 --%>							
			        			<img src="<c:url value='/img/${userimg}'/>" alt="사원프로필">
			        		</div><!-- user_img -->
						<%-- </c:if>	 --%>
							<!-- user_img -->
							<div class="detail_left">
								<span class="user_name">${map['RANDOM_ID'] }</a></span>
								<%-- <span class="user_dept">/ 💼${sessionScope.dept_name }</span> --%>
							</div>
							<!-- detail_left -->
						</div>
						<!-- detail_left -->
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
						<!-- detail_right -->
					</div>
					<!-- user_info -->

					<div class="detail_content">
						<div class="detail_view"></div>
						${map['BOARD_CONTENT']}

						<div class="detail_option_btn">
							<span class="user_dept"> <a
								href="<c:url value='/board/boardList'/>">목록</a></span>
								<c:if test="${userid==map['MEM_ID'] }">
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
					</div>
					<!-- detail_content -->
					<hr>
				</div>
				<!-- detailWrap -->

				<div class="detail_reply_wrap">
					<div class="reply_tit">자유게시판 전체글</div>

					<div class="reply_list">
						<div class="reply_content">
							<div class="reply_user">
								<div class="detail_left">
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
			</div>
		</div>
	</div>
</div>
<%@include file="../inc/bottom.jsp"%>
