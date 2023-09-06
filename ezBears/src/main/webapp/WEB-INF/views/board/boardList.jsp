<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../inc/top.jsp"%>
<script type="text/javascript">
$(function(){
    send(1);
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
    
    
    $(window).scroll(function() {            
        if (!isLoading && $(window).scrollTop() + $(window).height() >= $(document).height()-200) {
            var curPage = $('input[name="currentPage"]').val();
            var totalPage=$('input[name="totalPage"]').val();
            
            if(curPage<=totalPage){
                isLoading = true; // 스크롤 동작 처리 시작
                curPage++;
                send(curPage);
            }else{
                isLoading = true;
                alert('더 이상 불러 올 게시글이 없습니다.');
            }
        }
    });

});




function send(currentPage) {
	//var randomNumber = Math.floor(Math.random() * (20000 - 10000 + 1)) + 10000;

    $('input[name="currentPage"]').val(currentPage);
    var sendDate = $('form[name=boardFrom]').serialize();

    $.ajax({
        url: "<c:url value='/board/board_ajax'/>",
        method: "POST",
        data: sendDate,/* {
        	sendDate: sendDate,
            randomNumber: randomNumber
        } */
        dataType: 'json',
        error: function(xhr, status, error) {
            alert(error);
        },
        success: function(res) {
            console.log(res); // 서버 응답 확인
  
            var replyData = "";

            $.each(res.list, function(idx, item) {
                // 랜덤 숫자 생성
               // var randomNumber = Math.floor(Math.random() * (20000 - 10000 + 1)) + 10000;
                
                var content = item.NOTICE_CONTENT;
                var date = new Date(item.REGDATE);
                var fsizeKB = item.FSIZE / 1024.0;
                var formattedFsize = Math.round(fsizeKB * 100) / 100;
                var fileSizeText = formattedFsize + " KB";
                const regdate = new Date(date.getTime()).toISOString().split('T')[0] + " " + date.toTimeString().split(' ')[0];
                
                var boardDetailURL = "<a href='<c:url value='/board/boardDetail?boardNo=" + item.BOARD_NO+"'/>'>";
                
                replyData += "<div class='notice_list_box'>";
                replyData += "<div>";
                replyData += "<div class='list_box_title'>";
                replyData += "<div class='user_img'>";
                replyData += "<img src='<c:url value='/img/defaultUSER.png'/>' alt='사원프로필'>";
                replyData += "</div>";
                replyData += "<div class='user_txt'>";
                replyData += "<span class='user_txt_name'> " + item.RANDOM_ID + "</span>"; 
                replyData += "<span class='user_txt_time'>" + regdate + "</span>";
                replyData += "</div>";
                replyData += "</div>";
                replyData += "<div class='list_box_content'>";
                replyData += "<div class='content_title'>"+ boardDetailURL + item.BOARD_TITLE + "</a></div>";
                /* replyData += "<div class='content_txt'>" + boardDetailURL +item.BOARD_CONTENT + "</a></div>"; */
                replyData += "</div>";
                replyData += "</div>";
                replyData += "</div>";
            });
            
            $("#list_content").append(replyData);
            $('input[name="totalPage"]').val(res.pagingInfo.totalPage);
            isLoading = false;
        }
    });
}
</script>
<input type="hidden" name="totalPage">
<form action="<c:url value='/board/boardList'/>" method="post"
	name="boardFrom">
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchKeyword" value="${param.searchKeyword}"> <input
		type="hidden" name="searchCondition" value="${param.searchCondition}">
</form>
<!-- Recent Sales Start -->
<div class="container-fluid pt-4 px-4" id="board_style">
	<div class="bg-secondary text-center rounded">
		<div class="bg-secondary rounded h-100 p-4">
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active">
					<div id="teamNoticeList">
						<br>
						<br>
						<form name="serchFrm" method="post"
							action="<c:url value='/board/boardList'/>">
							<div class="teamNotice_serch">
								<div class="serch_input">
									<div class="select_box">
										<select class="form-select"
											aria-label="Default select example" id="searchCondition"
											name="searchCondition">
											<option value="default" selected>선택</option>
											<%-- <option value="mem_name"
												<c:if test="${param.searchCondition=='MEM_NAME'}">
							            		selected="selected"
							            	</c:if>>이름</option> --%>
											<option value="board_title"
												<c:if test="${param.searchCondition=='BOARD_TITLE'}">
							            		selected="selected"
							            	</c:if>>제목</option>
											<option value="board_content"
												<c:if test="${param.searchCondition=='BOARD_CONTENT'}">
							            		selected="selected"
							            	</c:if>>내용</option>
										</select>
									</div>
									<div class="text_box">
										<input type="text" class="form-control" name="searchKeyword"
											id="searchKeyword" placeholder="검색어를 입력해주세요"
											value="${param.searchKeyword }">
									</div>

									<div class="serch_btn">
										<button id="searchBtn">검색</button>
									</div>
									<!-- serch_btn -->

									<div class="btnBox">
										<%-- <c:if test="${sessionScope.dept_no==1}"> --%>
										<a class="btn btn-sm btn-primary"
											href="<c:url value='/board/boardWrite'/>">글쓰기</a>
									</div>
									<!-- btnBox -->
								</div>
								<!-- serch_input -->

							</div>
							<!-- teamNotice_serch -->
						</form>
						<br>
						<br>

						<c:if test="${empty list}">
							<div class="notice_list_box">
								<div style="text-align: center">등록된 글이 없습니다.</div>
							</div>
						</c:if>

						<c:if test="${!empty list}">
							<c:if test="${!empty param.searchKeyword}">
								<div style="text-align: center">
									${pagingInfo.totalRecord}건이 검색되었습니다.</div>
								<br>
								<br>
							</c:if>
							<!-- 반복시작 -->
							<div id="list_content">
								<!-- 여기에 값들어감  -->


							</div>
						</c:if>

						<div class="list_line"></div>

					</div>
					<!-- teamNoticeList -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Recent Sales End -->

<%@include file="../inc/bottom.jsp"%>
