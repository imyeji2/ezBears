<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../inc/top.jsp"%>	
<!-- Recent Sales Start -->

	<script>
		$(function(){
			
			var editor = CKEDITOR.replace('teamNoticeContent', {
				filebrowserUploadUrl : "<c:url value='/adm/fileupload'/>",
				height : '300px',
				resize_enabled: false
			});
			
			
			$('#write').click(function(){
				var editorContent = editor.getData().trim();
				
			    if ($('#title').val().length < 1) {
			        $('#title').focus();
			        alert('제목을 입력하세요');
			        return false;
				}else if (editorContent === "") {
		            // CKEditor 내용이 비어있을 때
		            editor.focus();
		            alert('내용을 입력하세요');
		            return false;
		        }
			    
				$('form[name=teamNotiFrm]').submit();
				
			});
			
			$('#cencel').click(function(){
				event.preventDefault();
				location.href="<c:url value='/myBoard/teamNotice?mBoardNo=${myBoardListVo.MBoardNo}'/>";
				
			});
		});
	</script>
	
<c:if test="${type=='write'}">
	<c:set var="btnTxt" value="등록"/>
	<c:set var="url" value="/myBoard/teamNoticeWrite?mBoardNo=${myBoardListVo.MBoardNo}"/>
</c:if>

<c:if test="${type=='edite'}">
	<c:set var="btnTxt" value="수정"/>
	<c:set var="url" value="/myBoard/teamNoticeEdit?mBoardNo=${myBoardListVo.MBoardNo}"/>
</c:if>
<div class="container-fluid pt-4 px-4" id="board_style">
	<div class="bg-secondary text-center rounded p-4">
    	<div class="bg-secondary rounded h-100 p-4">
          	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item active" aria-current="page">
			    	<a href="<c:url value='/myBoard/teamNotice?mBoardNo=${myBoardListVo.MBoardNo}'/>">${myBoardListVo.MBoardName}</a>
			    </li>
			    <li class="breadcrumb-item active" aria-current="page">공지사항</li>
			  </ol>
			</nav>   			
			<div id="teamNoticeWrite">
				<form name="teamNotiFrm" method="post" enctype="multipart/form-data" 
					action="<c:url value='${url}'/>">
		        	<div class="writeWrap">
		        		<input type="hidden" name="myBoardNo" value="${myBoardListVo.MBoardNo}">
		        		<input type="hidden" name="memNo" value="${myBoardListVo.memNo}">
		        		<input type="hidden" name="oldFileName" value="${map['FILENAME']}">
		        		<input type="hidden" name="teamNoticeNo" value="${teamNoticeNo}">
			        	<div class="write_title">
			        		<input type="text" class="form-control" name="teamNoticeTitle" id="title"
							 placeholder="제목을 입력해주세요" value="${map['TEAM_NOTICE_TITLE']}">
			        	</div><!-- write_title -->
			        
			       				 
			       		<div class="write_content">
			       			<div class="write_view">
				       			 <div class="form-floating">
								  <textarea class="form-control write_form" 
								  	 placeholder="내용을 입력해주세요"  
								  	 name="teamNoticeContent" id="teamNoticeContent">${map['TEAM_NOTICE_CONTENT']}</textarea>
								</div>
			       			</div>
			       			
			       			<div class="write_file">
								<input class="form-control" type="file" name="upfile" id="upfile" value="${map['ORIGINNAME']}">
								<c:if test="${!empty map['ORIGINNAME']}">
					       			<div class="list_box_file">
						       			${map['ORIGINNAME']}&nbsp;
						       			(<fmt:formatNumber value="${map['FSIZE'] /1024.0}" type="number" pattern="#.##"/> KB)
					       			</div>
								 	<p class="fileText" >첨부파일을 새로 지정할 경우 기존 파일
								 		<span style="font-weight: bold">"${map['ORIGINNAME']}"</span> 은 삭제됩니다.
								 	</p>
								</c:if>
								
			       			</div>
			       			<div class="write_option_btn">
			       				<button class="btn btn-sm btn-primary" id="write">${btnTxt}</button>&nbsp;
			       				<button class="btn btn-sm btn-primary" id="cencel">취소</button>
			       			</div>
			       		</div><!-- write_content -->
		       		</div><!-- writeWrap -->	 
		   		</form>
			</div><!-- teamNoticeWrite -->
		</div>
	</div>
</div>
<%@include file="../inc/bottom.jsp"%>  