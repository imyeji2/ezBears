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
	var todoCount=0;
	var delIndex=0;
	var inputTxt = $('#writeWorkInput').val();
	var innerContent = document.querySelectorAll('form[name=workBoardWriteFrom] .todoList');
	$('#todoCountTxt').text(innerContent.length);
	
	
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
	
	
	
	//투두리스트 추가
	$('#addWorkBtn').click(function(){
		var inputTxt = $('#writeWorkInput').val();
		var innerContent = document.querySelectorAll('form[name=workBoardWriteFrom] .todoList');
		var index = 0;
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
		
		$('.todoListWrap').append(add);
		$('#writeWorkInput').val('');
		todoCount=index;
		$('#todoCountTxt').text(index+1);

	});
	
	
	
	//투두 삭제 버튼
	$(document).on('click', '#delWorkBtn',function(e) { 
		var index = 0;
		event.preventDefault(); // 이벤트의 기본 동작 방지
		
		$delContent = $(this).closest('.todoList');
		var todoDetailNo = $delContent.find('#todoDetailNo').val();
		
		if(todoDetailNo>0){
			var delDate="<input type='hidden' name='items["+delIndex+"].todoDetailNo' value='"+todoDetailNo+"'>";
			delIndex++;
		}
		
		$('form[name=delFrm]').append(delDate);
		$delContent.remove();
		
		var innerContent = document.querySelectorAll('form[name=workBoardWriteFrom] .todoList');
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
			$('.todoListWrap').append(add);
		});	
		
		index++;
		todoCount = index-1;
		$('#todoCountTxt').text(todoCount);
		
		
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
		

	
	//수정 버튼
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
				return false;
			}
		});
		
		if($('.list_box_file2').length<1){
			var sendDate = $('form[name=workBoardWriteFrom]').serialize();
			$.ajax({
			        url: "<c:url value='/myBoard/teamWorkBoardDeleteFile'/>",
			        method: "POST",
			        data: sendDate,
			        dataType: 'json',
			        error: function(xhr, status, error) {
			            alert(error);
			        },
			        success: function(res) {
			            console.log(res); 
			            if(res<0){
			            	alert('파일 삭제 실패');
			            	return false;
			            }
			        }
				});	
		}		
		
		var delDate = $('form[name=delFrm]').serialize();
		var delCount = $('form[name="delFrm"]').find('input').length;
		if(delCount>0){
			$.ajax({
		        type: 'post',
		        url: "<c:url value='/myBoard/deleteDotoDetail'/>",
		        data: delDate,
		        dataType: 'json',
		        error: function(xhr, status, error){
		            alert(error);
		        },
		        success: function(res){
		            console.log(res); // 서버 응답 확인  
		            if(res<0){
		            	alert('수정중 오류가 발생했습니다.');
		            }else{
		            	$('form[name=workBoardWriteFrom]').submit();
		            }
		        }
		    });
		}else{
			$('form[name=workBoardWriteFrom]').submit();
		}
			
	});
	
	$('#upfile').click(function(){
	    if ($('#isFile').length > 0) { 
	        if (!confirm('새로운 파일을 첨부하면 기존 파일은 삭제 됩니다.')) {
	        	event.preventDefault(); 
	        }
	    }
	});
	
	
	$('#upfile').on('change',function(e){
		 var selectedFile = e.target.files[0]; 
		    if (selectedFile) {
		    	var fileSize = (selectedFile.size / 1024).toFixed(2);
		    	var text = selectedFile.name+"("+fileSize+" KB)";
		        $('.list_box_file2').text(text);
		    }		
	});
	
	$(document).on('click', '#delBtn',function(e) {  
		event.preventDefault(); 
    	if(confirm('정말 삭제하시겠습니까?')){
    		$('#oldFileName').val('');
    		$('.list_box_file2').remove();
		}
	});	
	
});//function
</script>
<!-- Recent Sales Start -->

<fmt:parseDate var="startRegdateFmt" value="${toDoList.startRegdate}" pattern="yyyy-MM-dd" />
<fmt:parseDate var="doneRegdateFmt" value="${toDoList.doneRegdate}" pattern="yyyy-MM-dd" />	
	
<form name="delFrm" method="post" url="#"></form>

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
				<form name="workBoardWriteFrom" method="post" action="<c:url value='/myBoard/teamWorkBoardEdit'/>" enctype="multipart/form-data">
		        	<input type="hidden" name="mBoardNo" value="${myBoardListVo.MBoardNo}">
		        	<input type="hidden" name="myBoardNo" value="${myBoardListVo.myBoardNo}">
		        	<input type="hidden" name="memNo" value="${myBoardListVo.memNo}">
		        	<input type="hidden" name="teamBoardNo" value="${map['TEAM_BOARD_NO']}">
		        	<input type="hidden" name="todolistNo" value="${toDoList.todolistNo}">
		        	<input type="hidden" name="oldFileName" id="oldFileName" value="${map['FILENAME']}">
		        	<div class="writeWrap">
			        	<div class="write_title">
			        		<input type="text" class="form-control" name="teamBoardTitle"
			        		id="teamBoardTitle" placeholder="제목을 입력해주세요" value="${map['TEAM_BOARD_TITLE']}"}>
			        	</div><!-- write_title -->
			        
			       		<div class="border-line"></div>		 
			       		<div class="write_content">
			       			<div class="write_view">
				       			 <div class="form-floating">
								  <textarea class="form-control write_form" id="content"
								  	name="teamBoardContent" placeholder="내용을 입력해주세요" id="#">${map['TEAM_BOARD_CONTENT']}</textarea>
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
			       							<input class="dateinput" id="startDate" type="date" name="startRegdate" data-placeholder="날짜 선택" 
			       							  value="<fmt:formatDate value="${startRegdateFmt}" pattern="yyyy-MM-dd"/>">
						
			       						</div>

			       						<div class="dateBox">
			       							<span>프로젝트 종료일</span>
			       							<input class="dateinput" id="endDate" type="date" name="doneRegdate" data-placeholder="날짜 선택" 
			       								value="<fmt:formatDate value="${doneRegdateFmt}" pattern="yyyy-MM-dd"/>">
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
	                            <c:set var="index" value="0"/>
	                            <c:if test="${!empty toDoListDetailList}">
	                            	<c:forEach var="list" items="${toDoListDetailList}">
	                            		 <div class="d-flex align-items-center border-bottom py-2 todoList">
			                                <div class="w-100 ms-3">
			                                    <div class="d-flex w-100 align-items-center justify-content-between">
			                                        <input class="form-control border-0 todoInput" type="text" name="items[${index}].todoContent" value="${list['TODO_CONTENT']}">
			                                        <input type="hidden" name="items[${index}].todoDetailNo" value="${list['TODO_DETAIL_NO']}" id="todoDetailNo">
			                                        <button class="btn btn-sm" id="delWorkBtn"><i class="fa fa-times"></i></button>
			                                    </div>
			                                </div>
			                            </div>
			                            <input type="hidden" name="index" value="${index+1}"> 
	                            	</c:forEach>
	                            	   
	                            </c:if>
	                            
								<!-- todoList 입력 영역 -->
		                    	</div><!-- todoListWrap -->   
		                    	           
			       			</div> <!--writeTodoList -->
			       			
			       			
			       			<div class="write_file">
								<input class="form-control" type="file" id="upfile" name="upfile">
									<c:if test="${!empty map['ORIGIN_FILENAME']}">
						       			<div class="list_box_file2" id="isFile">
							       			${map['ORIGIN_FILENAME']}&nbsp;
							       			(<fmt:formatNumber value="${map['FSIZE'] /1024.0}" type="number" pattern="#.##"/> KB)
							       			<button class='btn btn-sm' id='delBtn'><i class='fa fa-times'></i></button>
						       			</div>
									</c:if>
			       			</div>
			       			<div class="write_option_btn">
			       				<button class="btn btn-sm btn-primary" id="writeBtn">수정</button>&nbsp;
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