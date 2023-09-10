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
		<form id="appform2" action="" method="post" enctype="multipart/form-data" >
				<input type ="hidden" name ="userid" id="userid" value="${userid }">
				<input type="hidden" name="myBoardNo" id="myBoardNo"value="${signMemInfoVo.myBoardNo}"> 
				<input type="hidden" name="memNo" id="memNo" value="${signMemInfoVo.memNo}"> 
				<input type="hidden" name="MBoardNo" id="MBoardNo" value="${signMemInfoVo.MBoardNo}"> 
				<input type="hidden" name="positionNo" id="positionNo" value="${memberVo.positionNo}">
			
			
			
			<table class="table" id="table" border="1">
				<tr class="tr-s">
					<td class="td-1" rowspan="2" >문서번호
					 <input type ="text"  name="docNo" class="docNo"  value="${list['DOC_NO'] }" readonly><!-- 문서 번호 불러오기 -->
					 </td> 
					<td class="td-2" rowspan="2"colspan="2">담당</td><!-- 결재 담당자 -->
			    	  <c:choose>
				    <c:when test="${empty list2}">
				        <td class="td-3 mem" rowspan="2">팀장이 없습니다.</td>
				    </c:when>
				    <c:otherwise>
				        <c:forEach var="map" items="${list2}">
				            <td class="td-3 mem" rowspan="2">
				            <div> <!-- td 사이에 div 주고 영역 늘리기  -->
				           	 ${map['MEM_NAME']}
				            </div>
				            </td>
				        </c:forEach>
				    </c:otherwise>
				</c:choose>
			      <!-- 중간 결재자  -->
			   		 <td class="td-2"rowspan="2" colspan="2">
			   		 <c:if test="${list['STATUS'] eq '대기' && userMap['POSITION_NO'] eq 6}">
						<input type="button" class=" btn-sm btn-primary appoveBtn " value="승인" onclick="approveDocument()">
					</c:if>
					
			   		 <c:if test="${list['STATUS'] eq '처리중' || list['STATUS'] eq '완료'}">
			    		<img alt="처리중이미지" name ="stamp1"  src="<c:url value ='/img/OkStamp.png'/>">
			   		 </c:if>
			   		 </td>
			        <!-- 최종 결재자 -->
			        <td class="td-3 mem"rowspan="2"colspan="1">${vo2.memName }</td>   
				    
				    <td class="td-2"rowspan="2" >
				     <c:if test="${list['STATUS'] eq '완료'}">
				    	<img alt="처리중이미지" name ="stamp2" src="<c:url value ='/img/OkStamp.png'/>">
				     </c:if>
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
					 value="${list['DOC_TITLE'] }" readonly>
						</td>
				</tr>
				
				
				
				<c:if test="${!empty filemap }">
	                <tr class="tr-m">
	            	<td colspan="7">
	            	<!-- <input class="form-control appfile" type="file" id="app_file"> -->	
							<div class="signfile">
								<div class="fileupload">
									<a href="#" class="fileinfo">첨부파일</a>		
									<c:forEach var="map" items="${filemap }">
									
										<a class="fileinfo2" href="<c:url value='/myBoard/Filedownload?docNo=${map["DOC_NO"]}&fileName=${map["FILENAME"]}&fileNo=${map["FILE_NO"] }'/>">
										${map['ORIGIN_FILENAME']}&nbsp; 
										(<fmt:formatNumber value="${map['FSIZE'] /1024.0}" type="number" pattern="#.##" /> KB)
										</a>		
																	
									</c:forEach>
								</div>
							</div>
				    	</tr>
					</c:if>	
	      

	                <tr>
	                    <td class="td-1">결재 내용</td>
	                    </tr>
	                    <tr>
	                    <td colspan="8" id="td-leave-reason">
	                    	<textarea name="docContent" style="white-space: pre;" readonly>
	                    	${list['DOC_CONTENT'] }
	                    	</textarea>
                    	</td>
	                </tr>
			</table>
			<div>
			    <c:if test="${sessionScope.name eq list['MEM_NAME']}">
					<c:if test="${list['STATUS'] eq '대기' }">
			        <input type="button" class="btn btn-sm btn-primary btn" id="deleteButton" value="삭제" />
			        <input type="button" class="btn btn-sm btn-primary btn" value="수정" onclick="editApp()"/>
			    	</c:if>
			    </c:if>
			</div>
			
			<!-- 비밀번호 입력 창 -->
		<!-- 	<div id="passwordInput" style="display: none;">
			    <input type="password" id="password" placeholder="비밀번호 입력" />
			    <input type="button" id="confirmPasswordButton" value="확인" />
			</div> -->
			</form>
		</div>
		</div><!--appbox  -->
		</div>
	</div> 
	
</div>
	<script>
	
	 function editApp() {
	        var docNo = "${list['DOC_NO']}";
	        // docNo를 URL에 추가하여 수정 페이지로 이동
	        window.location.href = "<c:url value='/myBoard/Approval_edit'/>?docNo=" + docNo;
	    }
	 function deleteApp() {
	        var docNo = "${list['DOC_NO']}";
	        // docNo를 URL에 추가하여 수정 페이지로 이동
	        window.location.href = "<c:url value='/myBoard/Approval_delete'/>?docNo=" + docNo;
	    }
		
		var ckEditor = CKEDITOR.replace('docContent', {
			filebrowserUploadUrl : "<c:url value='/ck/fileupload'/>", /*ck에디터파일 업로드 컨트롤러  */
			height : '500px',
			removePlugins: "exportpdf"
		});
		
		function approveDocument() {
		    var docNo = "${list['DOC_NO']}";
		    var positionNo = parseInt("${memberVo.positionNo}");
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
		
		//처리중 에서 완료 로 넘어가는 처리
		function approveDocument2() {
		    var docNo = "${list['DOC_NO']}";
		    var positionNo = parseInt("${memberVo.positionNo}");
		    var status = "${list['STATUS'] }";
		    
		    console.log("status",status);
		    console.log("positionNo 값: ", positionNo);
		    console.log("docNo 값: ", docNo);

		    // position_no가 6인 경우에만 승인 가능
		    if (positionNo === 6) {
		        // AJAX
		        $.ajax({
		            url: "<c:url value='/myBoard/statusUpdate2'/>",
		            method: "POST",
		            data: {
		                docNo: docNo,
		                positionNo: positionNo
		            },
		            success: function (response) {
		                if (response.success) {
		                    alert("결재가 최종 승인되었습니다.");

		                    // 승인 성공 후 상태 갱신
		                    $.ajax({
		                        url: "<c:url value='/myBoard/getDocumentStatus'/>",
		                        method: "GET", 
		                        data: {
		                            docNo: docNo
		                        },
		                        cache: false, // 캐싱 비활성화
		                        success: function (statusResponse) {
		                        	location.href = "<c:url value='/signManagement/completeApproval'/>"
		                        },
		                        error: function () {
		                            alert("문서 상태를 가져오는데 실패했습니다.");
		                        }
		                    });
		                } else {
		                    alert("결재 최종 승인에 실패했습니다.");
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
		
		$("#deleteButton").click(function () {
		    if (confirm("정말로 이 문서를 삭제하시겠습니까?")) {
		        // 사용자가 확인을 눌렀을 때만 삭제 수행
		        deleteAppDoc("${list['DOC_NO']}");
		    }
		});

		function deleteAppDoc(docNo) {
			var mBoardNo = "${signMemInfoVo.MBoardNo}";
			console.log("mBoardNo",mBoardNo);
		    // AJAX
		    $.ajax({
		        url: "<c:url value='/myBoard/deleteAppDoc'/>",
		        method: "POST",
		        data: {
		            docNo: docNo
		        },
		        success: function () {
		            alert("문서가 삭제되었습니다.");
		            window.location.href = "<c:url value='/myBoard/Approval?mBoardNo='/>"+mBoardNo;
		        },
		        error: function () {
		            alert("문서 삭제 중 오류가 발생했습니다.");
		        }
		    });
		}

	</script>
<%@include file="../inc/bottom.jsp"%>