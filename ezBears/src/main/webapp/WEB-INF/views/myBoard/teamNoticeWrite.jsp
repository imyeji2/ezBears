<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>	
<!-- Recent Sales Start -->

	<script>
		$(function () {
			CKEDITOR.replace('teamNoticeContent', {
				filebrowserUploadUrl : "<c:url value='/adm/fileupload'/>",
				height : '300px',
				resize_enabled: false
			});
			
			$('#write').click(function(){
				$('form[name=teamNotiFrm]').submit();
			});
		});
	</script>
<div class="container-fluid pt-4 px-4" id="board_style">
	<div class="bg-secondary text-center rounded p-4">
    	<div class="bg-secondary rounded h-100 p-4">
          	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item active" aria-current="page">
			    	<a href="<c:url value='/myBoard/teamNotice?myBoardNo=${myBoardNo}'/>">${myBoardName}</a>
			    </li>
			    <li class="breadcrumb-item active" aria-current="page">공지사항</li>
			  </ol>
			</nav>   			
			<div id="teamNoticeWrite">
				<form name="teamNotiFrm" method="post" enctype="multipart/form-data" 
					action="<c:url value='/myBoard/teamNoticeWrite'/>">
		        	<div class="writeWrap">
		        		<input type="hidden" name="myBoardNo" value="${myBoardNo}">
		        		<input type="hidden" name="memNo" value="${userNo}">
			        	<div class="write_title">
			        		<input type="text" class="form-control" name="teamNoticeTitle" id="title"
							 placeholder="제목을 입력해주세요">
			        	</div><!-- write_title -->
			        
			       				 
			       		<div class="write_content">
			       			<div class="write_view">
				       			 <div class="form-floating">
								  <textarea class="form-control write_form"
								  	 placeholder="내용을 입력해주세요"  
								  	 name="teamNoticeContent" id="teamNoticeContent"></textarea>
								</div>
			       			</div>
			       			
			       			<div class="write_file">
								<input class="form-control" type="file" name="upfile" id="upfile">
			       			</div>
			       			<div class="write_option_btn">
			       				<button class="btn btn-sm btn-primary" id="write">등록</button>&nbsp;
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