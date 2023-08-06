<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/css/gopanju.css" rel="stylesheet">

<%@include file="../inc/top.jsp"%>	

<div id="board_list">
	<br>
	<div id="board_list">
		<div class="serch_input">
		
			<div class="select_box">
				<select class="form-select" aria-label="Default select example"  style="width:100px;">
					<option selected>선택</option>
					<option value="name">이름</option>
					<option value="subject">제목</option>
					<option value="content">내용</option>
				</select>
			</div>
			
			<div class="text_box">
				<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="검색어를 입력해주세요">
			</div>

			<div class="serch_btn">
				<button>검색</button>
			</div>
			
		</div><!-- serch_btn -->
		
	</div><!-- serch_input -->
	
	<br>
</div><!-- board_list -->

 <div data-role="content">  
   <div class="ui-grid-a">
    <div class="ui-block-a" style="width:60%;">
     <input id="Amount" name="Amount" type="number"/>
    </div>
    
    <div class="ui-block-b" style="width:40%;">
     <select name="time" id="time" data-mini="true">
       <option value="KRW">KRW</option>
       <option value="USD">USD</option>
       <option value="TWN">TWN</option>
     </select>
    </div>
   
   </div>
  </div>

<%@include file="../inc/bottom.jsp"%>