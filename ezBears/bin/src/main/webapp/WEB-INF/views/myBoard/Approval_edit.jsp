<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/css/jquery-ui.min.css'/>"type="text/css">
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script>


	var jb = jQuery.noConflict();
	jb(function() {
		jb("#startVacation").datepicker({
			dateFormat: 'yy-mm-dd',
			changeYear: true,
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		});
		
		jb("#endVacation").datepicker({
			dateFormat: 'yy-mm-dd',
			changeYear: true,
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		});
	});
	
</script>


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
		<form id="appform" action="<c:url value='/myBoard/Approval_edit'/>"  method="post" enctype="multipart/form-data" >
				<input type ="hidden" name ="userid" id="userid" value="${userid }">
				<input type="hidden" name="myBoardNo" id="myBoardNo"value="${signMemInfoVo.myBoardNo}"> 
				<input type="hidden" name="memNo" id="memNo" value="${signMemInfoVo.memNo}"> 
				<input type="hidden" name="MBoardNo" id="MBoardNo" value="${signMemInfoVo.MBoardNo}"> 
				<input type="hidden" name="deptNo" id="deptNo" value="${signMemInfoVo.deptNo}">
				<input type="hidden" name="positionNo" id="positionNo" value="${signMemInfoVo.positionNo}">
				<input type="hidden" name="memName" id="memName" value="${myBoardInfoVo.memName}">
				 
			<table class="table" id="table" border="1">
				<tr class="tr-s">
					<td class="td-1" rowspan="2" >문서번호
					 <input type ="text"  name="docNo" class="docNo"  value="${list['DOC_NO'] }" readonly><!-- 문서 번호 불러오기 -->
					 </td> 
					<td class="td-2" rowspan="2"colspan="2">담당</td><!-- 결재 담당자 -->
			    	<c:forEach var ="map" items="${listMap }">
						<td class="td-3 mem" colspan="3">${map['MEM_NAME'] }</td><!-- 결재 담당자 -->
					</c:forEach>
			   		 <!-- 중간 결재자  -->
			   		 <td class="td-2"rowspan="2" colspan="2">
			   		 </td>
			        <!-- 최종 결재자 -->
			        <td class="td-3 mem"rowspan="2"colspan="1">${vo2.memName }</td>   
				    
				    <td class="td-2"rowspan="2" >
				    
				    </td>
				    
					<td>
					
					<c:if test="${list['STATUS'] eq '처리중' && userMap['DEPT_NO'] eq 1}">
						<input type="button" class=" btn-sm btn-primary appoveBtn " value="승인" onclick="approveDocument2()">
					</c:if>
					
					</td>
				</tr>
				<tr></tr>
				<tr class="tr-s">
					<td class="td-1" rowspan="2" colspan="2">기안자</td>
					<td class="td-5" rowspan="2" colspan="3" > 
						<input type ="text" name="memName" class="memName" id="memName" value="${list['MEM_NAME'] }" readonly>
					</td>
					<td class="td-1 rdate" colspan="2">기안일</td>
					<td class="td-2" colspan="3">
					<input name="regdate" id="regdate" class="regdate" value="${list['REGDATE'] }" readonly>
				</tr>
				
				<tr class="tr-s">		
				</tr>
			
				<tr id="tr-title" class="tr-m">
					<td class="td-1 ">제목</td>
					<td colspan="8">
					<input type="text" class="form-control" id="floatingInput" name="docTitle"
					 value="${list['DOC_TITLE'] }" >
						</td>
				</tr>

	               
	                <tr class="tr-m">
	            	<td colspan="7">
	            	<!-- <input class="form-control appfile" type="file" id="app_file"> -->	
							<div class="signfile">
								<div class="fileupload">
									<a href="#" class="fileinfo">첨부파일</a>		
									<input class="form-control appfile app_file2" type="file" id="app_file2" name="file">
									<c:forEach var="map" items="${filemap }">
									<label style="color: red">
										새로운 파일 업로드시 ${map['ORIGIN_FILENAME']}&nbsp; 
										(<fmt:formatNumber value="${map['FSIZE'] /1024.0}" type="number" pattern="#.##" /> KB)
										은 삭제됩니다.		
									</label>								
									</c:forEach>
								</div>
							</div>
				    	</tr>
					
	      

	                <tr>
	                    <td class="td-1">결재 내용</td>
	                    </tr>
	                    <tr>
	                    <td colspan="9" id="td-leave-reason">
	                    	<textarea name="docContent" style="white-space: pre;" >
	                    	${list['DOC_CONTENT'] }
	                    	</textarea>
                    	</td>
	                </tr>
			</table>
			<div>
			 
			        <input type="submit" class="btn btn-sm btn-primary btn" value="수정"/> 
			   
		</div>
			</form>
		</div>
		</div><!--appbox  -->
		</div>
	</div> 
	
</div>
	<script>
		// 결재 요청 확인창
		function docSave2() {
		 window.location.href = "<c:url value='/myBoard/Approval'/>?mBoardNo=" + MBoardNo;
		 
		}
		
		var ckEditor = CKEDITOR.replace('docContent', {
			filebrowserUploadUrl : "<c:url value='/ck/fileupload'/>", /*ck에디터파일 업로드 컨트롤러  */
			height : '500px',
			removePlugins: "exportpdf"
		});
		
		function approveDocument() {
		    var docNo = "${list['DOC_NO']}";
		    var positionNo = parseInt("${myBoardInfoVo.positionNo}");
		    var status = "${list['STATUS'] }";
		    
		    console.log("status",status);
		    console.log("positionNo 값: ", positionNo);
		    console.log("docNo 값: ", docNo);

		    // position_no가 6인 경우에만 승인 가능
		    if (positionNo === 6) {
		        // AJAX
		        $.ajax({
		            url: "<c:url value='/myBoard/statusUpdate'/>",
		            method: "POST",
		            data: {
		                docNo: docNo,
		                positionNo: positionNo
		            },
		            success: function (response) {
		                if (response.success) {
		                    alert("문서가 승인되었습니다.");

		                    // 승인 성공 후 상태 갱신
		                    $.ajax({
		                        url: "<c:url value='/myBoard/getDocumentStatus'/>",
		                        method: "GET", 
		                        data: {
		                            docNo: docNo
		                        },
		                        cache: false, // 캐싱 비활성화
		                        success: function (statusResponse) {
		                        	location.reload();
		                        },
		                        error: function () {
		                            alert("문서 상태를 가져오는데 실패했습니다.");
		                        }
		                    });
		                } else {
		                    alert("문서 승인에 실패했습니다.");
		                }
		            },
		            error: function () {
		                alert("오류가 발생했습니다. 다시 시도해주세요.");
		            }
		        });
		    } else {
		        alert("해당 직책에서는 승인 권한이 없습니다.");
		    }
		}


	</script>
<%@include file="../inc/bottom.jsp"%>