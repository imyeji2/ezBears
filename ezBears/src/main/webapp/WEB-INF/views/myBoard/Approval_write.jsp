<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/css/jquery-ui.min.css'/>"type="text/css">
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>


<div class="container-fluid pt-4 px-4" id ="Approval_wr">
	<div class="col-sm-12 col-xl-6">
		<div class="bg-secondary rounded h-100 p-4 Appfrm">
		 <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="<c:url value ='/myBoard/teamNotice?mBoardNo=16'/>">마이보드</a></li>
                <li class="breadcrumb-item active" aria-current="page">결재 게시판</li>
              </ol>
            </nav>
	<div class="appbox">
		<div class="form-floating mb-3">
<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strDate = simpleDate.format(date);

%>

		<form id="appform" action="<c:url value='/myBoard/Approval_write?mBoardNo=${myBoardListVo.MBoardNo}'/>" method="post" enctype="multipart/form-data" >
				<input type ="hidden" name ="userid" id="userid" value="${userid }">
				<input type="hidden" name="myBoardNo" id="myBoardNo"value="${myBoardInfoVo.myBoardNo}"> 
				<input type="hidden" name="memNo" id="memNo" value="${myBoardInfoVo.memNo}"> 
				<input type="hidden" name="MBoardNo" id="MBoardNo" value="${myBoardInfoVo.MBoardNo}"> 
				<input type="hidden" name="deptNo" id="deptNo" value="${myBoardInfoVo.deptNo}">
 
				 
			<table class="table" id="table" border="1">
				<tr class="tr-s">
					<td class="td-1" rowspan="2" colspan="2" >문서번호
					 <input type ="hidden"  name="docNo" class="docNo" value="0"><!-- 문서 번호 불러오기 -->
					 </td>
					
								
			    <td class="td-2" rowspan="2">담당</td>
			   
			   <c:choose>
				    <c:when test="${empty list}">
				        <td class="td-3" rowspan="2">팀장이 없습니다.</td>
				    </c:when>
				    <c:otherwise>
				        <c:forEach var="map" items="${list}">
				            <td class="td-3 mem" rowspan="2">${map['MEM_NAME']}</td>
				        </c:forEach>
				    </c:otherwise>
				</c:choose>

				
			    <td class="td-2"rowspan="2" >  </td><!-- 결재 승인 이미지 -->
			    
			        <td class="td-3 mem"rowspan="2">${vo2.memName}</td><!-- 결재 담당자 -->
			    <td class="td-2"rowspan="2" >
			    
			    </td><!-- 결재 담당자 -->
				 
				</tr>
		
		<tr></tr>
				<tr class="tr-s">
					<td class="td-1" rowspan="2" colspan="1">기안자</td>
					<td class="td-2" rowspan="2" colspan="2"> ${myBoardInfoVo.memName }</td>
					<td class="td-2" colspan="1">기안일</td>
					<td class="td-3" colspan="2"><%=strDate %></td>
				</tr>
				
				<tr class="tr-s">		
				</tr>
			
				<tr id="tr-title" class="tr-m">
					<td class="td-1 ">제목</td>
					<td colspan="6">
					<input type="text" class="form-control" id="floatingInput" name="docTitle" placeholder="제목">
						 <label for="floatingInput">  </label></td>
				</tr>

	         		<tr>
	            	<td colspan="4">
	            	<input class="form-control appfile" type="file" id="app_file" name="file">

				    </td>
				    </tr>
	
	                <tr>
	                    <td class="td-1">결재 내용</td>
	                    </tr>
	                    <tr>
	                    <td colspan="7" id="td-leave-reason">
	                    	<textarea name="docContent" style="white-space: pre;"></textarea>
                    	</td>
	                </tr>
			</table>
			<div>
				<input type="button" class="btn btn-sm btn-primary btn" value="결재"  onclick="docSave()"/>
		    </div>
			
		
			</form>
		</div>
		</div><!--appbox  -->
		</div>
	</div>
</div>
	<script>
		// 결재 요청 확인창
		function docSave() {
			var result = confirm("결재 요청하시겠습니까?");
			if(result == true) {
				$("#appform").submit();
			}
		}
	/* 	// CK에디터
		if("${form.formName}" !== "휴가신청서"){
			CKEDITOR.replace( 'docContent', {
				height: 500,
				
			} );
		} */
		
		var ckEditor = CKEDITOR.replace('docContent', {
			filebrowserUploadUrl : "<c:url value='/ck/fileupload'/>", /*ck에디터파일 업로드 컨트롤러  */
			height : '500px',
			removePlugins: "exportpdf"
		});
	</script>
<%@include file="../inc/bottom.jsp"%>