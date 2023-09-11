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
					location.href="<c:url value='/notice/noticeList'/>";
					
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
			
		});
	</script>
	
<c:if test="${!empty param.noticeNo }">
	<c:set var="pageTitle" value="수정" />
	<c:set var="btLabel" value="수정" />
	<c:set var="url" value="/notice/noticeEdit" />
	<c:set var="noticeNo" value="${param.noticeNo }" />	
</c:if>
<c:if test="${empty param.noticeNo }">
	<c:set var="pageTitle" value="등록" />
	<c:set var="btLabel" value="등록" />
	<c:set var="url" value="/notice/noticeWrite" />
	<c:set var="noticeNo" value="0" />	
</c:if>	
	
	
<div class="container-fluid pt-4 px-4" id="board_style">
	<div class="bg-secondary text-center rounded p-4">
    	<div class="bg-secondary rounded h-100 p-4">
          	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><a href="#">공용</a></li>
			    <li class="breadcrumb-item active" aria-current="page"><a href="<c:url value='/notice/noticeList'/>">공지사항</a></li>
			    <li class="breadcrumb-item active" aria-current="page">공지사항 ${pageTitle }</li>
			  </ol>
			</nav>   			
			<div id="teamNoticeWrite">
				<form name="teamNotiFrm" method="post" enctype="multipart/form-data"
						action="<c:url value='${url }'/>">
		        	<div class="writeWrap">
		        	<%-- <c:if test="${!empty param.noticeNo}"> --%>
		        		<input type="hidden" name="noticeNo" value="${noticeNo}">
		        	<%-- </c:if> --%>
		        		<input type="hidden" name="memNo" value="${sessionScope.memNo}">
		        		<%-- <input type="text" name="memNo" value="${map['NOTICE_NO']}"> --%>
		        		<c:set var="i" value="0"/>
		        		<c:forEach var="vo" items="${list }">
							<input type="hidden" name="fileNames[${i }].fileName" value="${vo['FILE_NAME']}">
							<c:set var="i" value="${i + 1 }"/>
		        		</c:forEach>
						<%-- <c:if test="${type=='edite'}"> --%>
		        			<input type="hidden" name="noticeNo" value="${noticeNo}">
		        		<%-- </c:if> --%>
			        	<div class="write_title">
			        		<input type="text" class="form-control" id="title" name="noticeTitle" placeholder="제목을 입력해주세요"
			        		value="${map['NOTICE_TITLE']}"> <!-- name : VO컬럼이름  -->
							 
			        	</div><!-- write_title -->
			       				 
			       		<div class="write_content">
			       			<div class="write_view">
				       			 <div class="form-floating">
								  <textarea class="form-control write_form" placeholder="내용을 입력해주세요"  id="content" name="noticeContent">${map['NOTICE_CONTENT']}</textarea>
								</div>
			       			</div>
			       			
			       			<div class="write_file">
								<input class="form-control bg-dark" type="file" id="formFileMultiple" name="upfile" multiple="multiple">
								<c:forEach var="vo" items="${list }">
									<c:if test="${!empty param.noticeNo && !empty vo['FILE_NAME'] }"> 
						            <br>
					            	<span class="sp1"></span>
					            	<span style="color:darkgreen;font-weight: bold">
					            		첨부파일을 새로 지정할 경우 기존파일 ${vo['FILE_NAME']}은 삭제됩니다.
					            	</span>
					            	</c:if>
				        		</c:forEach>
								
			       			</div>
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