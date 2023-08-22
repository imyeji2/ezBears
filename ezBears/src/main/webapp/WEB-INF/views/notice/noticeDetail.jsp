<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Recent Sales Start -->
<div class="container-fluid pt-4 px-4" id="board_style">
	<div class="bg-secondary text-center rounded p-4">
		<div class="bg-secondary rounded h-100 p-4">
			<nav
				style="--bs-breadcrumb-divider: url(&amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&amp;#34;);"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">공용</a></li>
					<li class="breadcrumb-item active" aria-current="page"><a
						href="<c:url value='/notice/noticeList'/>">공지사항</a></li>
				</ol>
			</nav>
			<div id="teamNoticeDetail">
				<div class="detailWrap">
					<div class="detail_title">
						<div class="detail_left">
							<span class="title_txt">${map['NOTICE_TITLE']}</span> <span
								class="title_date"><fmt:formatDate
									value="${map['REGDATE']}" pattern="yyyy-MM-dd" /> </span>
						</div>
						<!-- detail_left -->
						<div class="detail_right">조회수 : ${map['VIEWS']}</div>
					</div>
					<!-- detail_title -->

					<div class="user_info">
						<div class="detail_left">
							<div class="user_img">
								<img src="<c:url value='/img/user.jpg'/>" alt="사원프로필">
							</div>
							<!-- user_img -->
							<div class="detail_left">
								<span class="user_name"><a href="#">${sessionScope.name }</a></span>
								<span class="user_dept">/ 💼${sessionScope.dept_name }</span>
							</div>
							<!-- detail_left -->
						</div>
						<!-- detail_left -->

						<div class="detail_right">
							첨부파일 : <a href="#">${map['ORIGIN_FILENAME']}&nbsp; (<fmt:formatNumber
									value="${map['FSIZE'] /1024.0}" type="number" pattern="#.##" />
								KB)
							</a>
						</div>
						<!-- detail_right -->
					</div>
					<!-- user_info -->

					<div class="detail_content">
						<div class="detail_view"></div>
						${map['NOTICE_CONTENT']}

						<div class="detail_option_btn">
							<span class="user_dept">
							<a href="<c:url value='/notice/noticeList'/>">목록</a></span>
							<c:if test="${map['DEPT_NO']==1}">
								<span class="user_dept"><a href="#">수정</a></span> 
								<span class="user_dept"><a href="#">삭제</a></span>
							</c:if>
						</div>
					</div>
					<!-- detail_content -->
					<hr>
				</div>
				<!-- detailWrap -->

				<div class="detail_reply_wrap">
					<div class="reply_tit">공지사항 전체글</div>

					<div class="reply_list">
						<div class="reply_content">
							<div class="reply_user">
								<div class="detail_left">
									<c:forEach var="map" items="${list }" begin="0" end="5">
										<span class="user_name"><a
											href="<c:url value='/notice/noticeDetail?noticeNo=${map["NOTICE_NO"]}'/>">${map['MEM_NAME']}</a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					       					<a
											href="<c:url value='/notice/noticeDetail?noticeNo=${map["NOTICE_NO"]}'/>">${map['NOTICE_TITLE']}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd" />
										<br>
									</c:forEach>
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
