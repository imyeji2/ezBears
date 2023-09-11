<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>	
<!-- Recent Sales Start -->
	<!-- 넓이 높이 조절 -->
	<style>
	.ck.ck-editor {
    	max-width: 100%;
	}
	.ck-editor__editable {
	    min-height: 500px;
	    background: #000;
	}
	
	</style>

<script>
$(function () {
	CKEDITOR.replace('content', {
		filebrowserUploadUrl : "<c:url value='/adm/fileupload'/>"
	});
	
	
	 $('#title').focus();
		
	 	$('#button').click(function(){
			event.preventDefault();
			location.href="<c:url value='/board/boardList'/>";
			
		});
		
		$('input[type=submit]').click(function(){
		   $('.infobox').each(function(idx, item){
		      if($(this).val().length <1){
		         alert($(this).prev().text() + '를 입력하세요');
		         $(this).focus();
		         event.preventDefault();
		         return false;
		      }
		   });
		   
		});
		
 		/* // 고유한 랜덤 숫자 생성 함수
	    function generateUniqueRandomNumber(min, max, usedNumbers) {
	        let randomNumber;
	        do {
	            randomNumber = min + Math.floor(Math.random() * (max - min + 1));
	        } while (usedNumbers.has(randomNumber));
	        usedNumbers.add(randomNumber);
	        return randomNumber;
	    }

	    // 사용된 랜덤 숫자를 저장할 Set 생성
	    let usedRandomNumbers = new Set();

	    // 랜덤 숫자 생성 후 "randomNo" 입력 필드에 할당
	    let uniqueRandomNumber = generateUniqueRandomNumber(1, 5, usedRandomNumbers);
	    $('input[name=randomNo]').val(uniqueRandomNumber);   */
	
});//function
</script>
<c:if test="${!empty param.boardNo }">
	<c:set var="pageTitle" value="수정" />
	<c:set var="btLabel" value="수정" />
	<c:set var="url" value="/board/boardEdit" />
	<c:set var="boardNo" value="${param.boardNo }" />	
</c:if>
<c:if test="${empty param.boardNo }">
	<c:set var="pageTitle" value="등록" />
	<c:set var="btLabel" value="등록" />
	<c:set var="url" value="/board/boardWrite" />
	<c:set var="boardNo" value="0" />	
</c:if>	
	
<%-- <form action="<c:url value='/board/boardWrite'/>" method="post" name="boardFrom">
	<input type="hidden" name="random"> 
</form>	 --%>
<div class="container-fluid pt-4 px-4" id="board_style">
	<div class="bg-secondary text-center rounded p-4">
    	<div class="bg-secondary rounded h-100 p-4">
          	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><a href="#">공용</a></li>
			    <li class="breadcrumb-item active" aria-current="page"><a href="<c:url value='/board/boardList'/>">자유게시판</a></li>
			    <li class="breadcrumb-item active" aria-current="page">자유게시판 ${pageTitle }</li>
			  </ol>
			</nav>   			
			<div id="teamNoticeWrite">
				<form name="teamNotiFrm" method="post" enctype="multipart/form-data"
						action="<c:url value='${url }'/>">
		        	<div class="writeWrap">
		        	<%-- <c:if test="${!empty param.noticeNo}"> --%>
		        		<input type="hidden" name="boardNo" value="${boardNo}">
		        		<%-- <input type="text" name="randomNo" value="${randNo}"> --%>
		        	<%-- </c:if> --%>
		        		<c:if test="${sessionScope.type=='사원' }">
				        		<input type="hidden" name="memNo" value="${sessionScope.memNo}">
		        		</c:if>
		        		
		        		<c:if test="${sessionScope.type=='스태프' }">
				        		<input type="hidden" name="staffNo" value="${sessionScope.staff_no}">
		        		</c:if>
		        		
		        		<%-- <input type="text" name="memNo" value="${map['NOTICE_NO']}"> --%>
		        		<c:set var="i" value="0"/>
		        		<c:forEach var="vo" items="${list }">
							<input type="hidden" name="fileNames[${i }].fileName" value="${vo['FILE_NAME']}">
							<c:set var="i" value="${i + 1 }"/>
		        		</c:forEach>
						<%-- <c:if test="${type=='edite'}"> --%>
		        			<input type="hidden" name="boardNo" value="${boardNo}">
		        		<%-- </c:if> --%>
			        	<div class="write_title">
			        		<input type="text" class="form-control" id="title" name="boardTitle" placeholder="제목을 입력해주세요"
			        		value="${map['BOARD_TITLE']}"> <!-- name : VO컬럼이름  -->
							 
			        	</div><!-- write_title -->
			       				 
			       		<div class="write_content">
			       			<div class="write_view">
				       			 <div class="form-floating">
								  <textarea class="form-control write_form" placeholder="내용을 입력해주세요"  id="content" name="boardContent">${map['BOARD_CONTENT']}</textarea>
								</div>
			       			</div>
			       			
			       			<div class="write_file">
								<input class="form-control bg-dark" type="file" id="formFileMultiple" name="upfile" multiple="multiple">
								<c:forEach var="vo" items="${list }">
									<c:if test="${!empty param.boardNo && !empty vo['FILE_NAME'] }"> 
						            <br>
					            	<span class="sp1"></span>
					            	<span style="color:darkgreen;font-weight: bold">
					            		첨부파일을 새로 지정할 경우 기존파일 ${vo['FILE_NAME']}은 삭제됩니다.
					            	</span>
					            	</c:if>
				        		</c:forEach>
								
			       			</div>
			       			<!-- <div class="mb-3">
                                    <input type="password" class="form-control" placeholder="Password" name="pwd" id="pwd">
                            </div> -->
			       			<div class="write_option_btn">
							    <button type="submit" class="btn btn-sm btn-primary">${btLabel }</button>
			       				<!-- <button class="btn btn-sm btn-primary">등록</button>&nbsp; -->
			       				<button type="button" id="button" class="btn btn-sm btn-primary">취소</button>
			       			</div>
			       		</div><!-- write_content -->
		       		</div><!-- writeWrap -->	 
		   		</form>
			</div><!-- noticeWrite -->
		</div>
	</div>
</div>

<%@include file="../inc/bottom.jsp"%>  