<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>	

<style>
	.selectBox{
		border:1px solid#7000D8;
	}
	
	.noneSelectBox{
		border:none;
	}
	
	input[type='date']::before {
	  content: attr(data-placeholder);
	  width: 100%;
	}	

	input[type='date']:focus::before,
	input[type='date']:valid::before {
  		display: none;
	}
</style>
<script>
$(function(){
	var todoCount = 0;
	$('#todoCountTxt').text(todoCount);
	
	
	//ck에디터
	var editor = CKEDITOR.replace('teamBoardContent', {
		filebrowserUploadUrl : "<c:url value='/ck/fileupload'/>",
		height : '300px',
		resize_enabled: false
	});
	
	$('#cencelBtn').click(function(){
		event.preventDefault();
		location.href="<c:url value='/myBoard/teamWorkBoard?mBoardNo=${myBoardListVo.MBoardNo}'/>";
	});
	
	var index=0;
	//투두리스트 추가
	$('#addWorkBtn').click(function(){
		var index =0;
		var inputTxt = $('#writeWorkInput').val();
		var innerContent = document.querySelectorAll('form[name=workBoardWriteFrom] .todoList');
		var add="";
		
		if(inputTxt.length<1){
			alert('업무를 입력하세요');
			$('#writeWorkInput').focus();
			return false;
		}
		
		$('.todoListWrap').html('');
		
		innerContent.forEach(function(element) {
		    var todoContent = element.querySelector('.todoInput').value;
		    var todoDetailNo = element.querySelector('#todoDetailNo').value;
		    
			add ="<div class='d-flex align-items-center border-bottom py-2 todoList'>";
			add+="<div class='w-100 ms-3' id='addWrokBox'>"
			add+="<div class='d-flex w-100 align-items-center justify-content-between toDoContentInputBox'>";
			add+="<input class='form-control border-0 todoInput' type='text'name='items["+index+"].todoContent' value='"+todoContent+"'>";
			add+="<input type='hidden' name='items["+index+"].todoDetailNo' value='"+todoDetailNo+"' id='todoDetailNo'>";
			add+="<button class='btn btn-sm' id='delWorkBtn'><i class='fa fa-times'></i></button>";
			add+="</div>";
			add+="</div>";
			add+="</div><!--todoList-->";
			
			index++;
		    console.log(todoContent);
			$('.todoListWrap').append(add);
		});
		
		add ="<div class='d-flex align-items-center border-bottom py-2 todoList'>";
		add+="<div class='w-100 ms-3' id='addWrokBox'>"
		add+="<div class='d-flex w-100 align-items-center justify-content-between toDoContentInputBox'>";
		add+="<input class='form-control border-0 todoInput' type='text'name='items["+index+"].todoContent' value='"+inputTxt+"'>";
		add+="<input type='hidden' name='items["+index+"].todoDetailNo' value='0' id='todoDetailNo'>";
		add+="<button class='btn btn-sm' id='delWorkBtn'><i class='fa fa-times'></i></button>";
		add+="</div>";
		add+="</div>";
		add+="</div><!--todoList-->";
		index++;
		$('.todoListWrap').append(add);
		$('#writeWorkInput').val('');
		todoCount=index;
		$('#todoCountTxt').text(index+1);
		
	});
	
	//투두 삭제 버튼
	$(document).on('click', '#delWorkBtn',function(e) {   
		var index=0;
		event.preventDefault(); // 이벤트의 기본 동작 방지
		$delContent = $(this).closest('.todoList');
		$delContent.remove();
		
		var innerContent = document.querySelectorAll('form[name=workBoardWriteFrom] .todoList');
		console.log(innerContent);
		$('.todoListWrap').html('');
		var add="";
		
		innerContent.forEach(function(element) {
		    var todoContent = element.querySelector('.todoInput').value;
		    var todoDetailNo = element.querySelector('#todoDetailNo').value;
		    
			add ="<div class='d-flex align-items-center border-bottom py-2 todoList'>";
			add+="<div class='w-100 ms-3' id='addWrokBox'>"
			add+="<div class='d-flex w-100 align-items-center justify-content-between toDoContentInputBox'>";
			add+="<input class='form-control border-0 todoInput' type='text'name='items["+index+"].todoContent' value='"+todoContent+"'>";
			add+="<input type='hidden' name='items["+index+"].todoDetailNo' value='"+todoDetailNo+"' id='todoDetailNo'>";
			add+="<button class='btn btn-sm' id='delWorkBtn'><i class='fa fa-times'></i></button>";
			add+="</div>";
			add+="</div>";
			add+="</div><!--todoList-->";
			
			index++;
		    console.log(todoContent);
			$('.todoListWrap').append(add);
		});
		
		todoCount=index;
		$('#todoCountTxt').text(index);
	});
	
	
	//날짜 포커스
	$('input[type=date]').focus(function(){
		$(this).parent('div').css('border','1px solid #7000D8');
	});
	
	$('input[type=date]').blur(function(){
		$(this).parent('div').css('border','none');
	})
	
	
	//시작일 유효성 검사
	$('#startDate').on('change',function(){
		var startDay = $(this).val();
		var endDay = $('#endDate').val();
		
		if(endDay!=='' && startDay > endDay){
			alert('시작일은 종료일 이후 날짜로 설정할 수 없습니다.');
			$(this).val('');
			$(this).focus();
			return false;
		}
	});
	
	//종료일 유효성 검사
	$('#endDate').on('change',function(){
		var startDay = $('#startDate').val();
		var endDay = $(this).val();
	         
	    if(startDay!=='' && endDay < startDay) {
			alert('종료일은 시작일 이전 날짜로 설정할 수 없습니다.')
			$(this).val('');
			$(this).focus();
			return false;
		}
	});
	
	

	
	//등록 버튼
	$('#writeBtn').click(function(){
		event.preventDefault();//이벤트 기본 동작 방지
		var editorContent = editor.getData().trim();
		
		//제목 유효성 검사
		if($('#teamBoardTitle').val().length<1){
			alert('제목을 입력해주세요');
			$('#title').focus();
			return false;
		}
		
		//내용 유효성 검사
		if (editorContent === "") {
            // CKEditor 내용이 비어있을 때
            editor.focus();
            alert('내용을 입력하세요');
            return false;
		}
			    
		
		//시작일 유효성 검사
 		if($('#startDate').val().length<1){
			alert('시작일을 입력해주세요');
			$('#startDate').focus();
			return false;
		}
		
		//종료일 유효성 검사
		if($('#endDate').val().length<1){
			alert('종료일을 입력해주세요');
			$('#endDate').focus();
			return false;
		}
		
		//두투 유효성 검사1
		if($('.todoList').length<1){
			alert('업무를 추가해주세요');
			$('#writeWorkInput').focus();
			return false;
		}
		
		//투두 유효성 검사(input)
		var bool=true;
		$('.toDoContentInputBox > input[type=text]').each(function() {
			if($(this).val().length<1){
				alert('항목을 입력해주세요');
				$(this).focus();
				bool = false;
				return false;
			}
		});
		
		if(!bool){
			return false;
		}
		
		

			 
		$('form[name=workBoardWriteFrom]').submit();
		
	});
	
});//function
</script>
<!-- Recent Sales Start -->

<form name="delFrm" method="post" url="#">

</form>

<form name="addFrm" method="post" url="#">

</form>
<div class="container-fluid pt-4 px-4" id="board_style">
	<div class="bg-secondary text-center rounded p-4">
    	<div class="bg-secondary rounded h-100 p-4">
          	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item active" aria-current="page">
			    	<a href="<c:url value='/myBoard/teamNotice?mBoardNo=${myBoardListVo.MBoardNo}'/>">${myBoardListVo.MBoardName}</a>
			    </li>
			    <li class="breadcrumb-item active" aria-current="page">업무게시판</li>
			  </ol>
			</nav>   			
			<div id="teamWorkBoardWrite">
				<form name="workBoardWriteFrom" method="post" action="<c:url value='/myBoard/teamWorkBoardWrite?mBoardNo=${myBoardListVo.MBoardNo}'/>" enctype="multipart/form-data">
		        	<input type="hidden" name="mBoardNo" value="${myBoardListVo.MBoardNo}">
		        	<input type="hidden" name="myBoardNo" value="${myBoardListVo.myBoardNo}">
		        	<input type="hidden" name="memNo" value="${myBoardListVo.memNo}">
		        	<div class="writeWrap">
			        	<div class="write_title">
			        		<input type="text" class="form-control" name="teamBoardTitle"
			        		id="teamBoardTitle" placeholder="제목을 입력해주세요">
			        	</div><!-- write_title -->
			        
			       		<div class="border-line"></div>		 
			       		<div class="write_content">
			       			<div class="write_view">
				       			 <div class="form-floating">
								  <textarea class="form-control write_form" id="content"
								  	name="teamBoardContent" placeholder="내용을 입력해주세요" id="#"></textarea>
								</div>	
			       			</div>
			       			<br>
			       			<div class="writeTodoList">
			       				<div class="todoTitle">
			       					<h6 class="mb-0">
			       						ToDoList(<span id="todoCountTxt"></span>)
			       					</h6>
			       					<div class="todoDate">
			       						<div class="dateBox" style="margin-bottom:10px;">
			       							<span>프로젝트 시작일</span>
			       							<input class="dateinput" id="startDate" type="date" name="startRegdate" data-placeholder="날짜 선택" >
						
			       						</div>

			       						<div class="dateBox">
			       							<span>프로젝트 종료일</span>
			       							<input class="dateinput" id="endDate" type="date" name="doneRegdate" data-placeholder="날짜 선택">
			       						</div>
			       					</div>
			       				</div>
	                            <div class="d-flex mb-2">
	                                <input class="form-control border-0 todoInput" type="text" 
	                                id ="writeWorkInput" placeholder="업무를 입력하세요">
	                                <button type="button" class="btn btn-primary ms-2" id="addWorkBtn">Add</button>
	                            </div>
	                            <div class="todoListWrap">
	                            <!-- todoList 입력 영역 -->

	                            
								<!-- todoList 입력 영역 -->
		                    	</div><!-- todoListWrap -->                  
			       			</div> <!--writeTodoList -->
			       			
			       			
			       			<div class="write_file">
								<input class="form-control" type="file" id="formFile" name="upfile">
			       			</div>
			       			<div class="write_option_btn">
			       				<button class="btn btn-sm btn-primary" id="writeBtn">등록</button>&nbsp;
			       				<button class="btn btn-sm btn-primary" id="cencelBtn">취소</button>
			       			</div>
			       		</div><!-- write_content -->
		       		</div><!-- writeWrap -->	 
	       		</form>
			</div><!-- teamNoticeWrite -->
		</div>
	</div>
</div>
<%@include file="../inc/bottom.jsp"%>  