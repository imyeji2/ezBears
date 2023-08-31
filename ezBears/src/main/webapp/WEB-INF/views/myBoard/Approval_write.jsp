<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../inc/top.jsp"%>



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
		<form id="appform" action="" method="post" enctype="multipart/form-data" >

			<table class="table" id="table" border="1">
				<tr class="tr-s">
					<td class="td-1" rowspan="2">문서번호</td>
					<td class="td-2" rowspan="2" colspan="3"></td> <!-- 문서 번호 불러오기 -->
					<td class="td-3">담당</td><!-- 결재 담당자 -->
					<td class="td-4">담당자 목록 추가버튼</td><!-- 결재 담당자 -->

				</tr>

				<tr class="tr-m">
					<td class="td-1">기안일</td>
					<td class="td-2">날짜 출력하기</td>
				</tr>
				<tr class="tr-s">
					<td class="td-1" rowspan="2" colspan="3">기안자</td>
					<td class="td-5" rowspan="2">로그인한 아이디 예 : ${userid }</td>
				</tr>
				<tr class="tr-s">		
				</tr>
			
				<tr id="tr-title" class="tr-m">
					<td class="td-1">제목</td>
					<td colspan="7"><input type="email" class="form-control" id="floatingInput"
						placeholder="으아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ">
						 <label for="floatingInput">  </label></td>
				</tr>

	                <tr class="tr-m">
	                    <td class="td-1">휴가종류</td>
	                    <td colspan="3">
	                        <select class="form-select" id="floatingSelect"
						aria-label="Floating label select example">
	                            <option value="">선택</option>
	                            <option value="연차">연차</option>
	                            <option value="반차">반차</option>
	                            <option value="특별휴가">특별휴가</option>
	                            <option value="공가">공가</option>
	                            <option value="병가">병가</option>
	                        </select>
	                    </td>
	            	<td colspan="4">
	            	<input class="form-control appfile" type="file" id="app_file">
				    </td>
				    </tr>
	                <tr class="tr-m">
	                    <td class="td-1" colspan="1">휴가기간</td>
	                    <td colspan="2" id="td-leave-date">휴가시작일</td>
	                    <td  id="td-leave-date"></td>
	                    <td colspan="2" id="td-leave-date">휴가종료일</td>
	                    <td  id="td-leave-date">일</td>
	                </tr>

	                <tr>
	                    <td class="td-1">휴가사유</td>
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