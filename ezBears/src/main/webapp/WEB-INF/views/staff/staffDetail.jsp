<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../inc/top.jsp"%>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/choong/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/choong/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/choong/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/choong/mystyle.css'/>" />

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	.divForm {
		width: 500px;
		}
</style> 

<!-- Blank Start -->
  <div class="container-fluid pt-4 px-4">
      <div class="row vh-100 bg-secondary rounded align-items-center justify-content-center mx-0">
          <div class="col-md-6 text-center">
          
				<h2>스태프 상세보기</h2>
					<div class="divForm">
						<div class="firstDiv">
							<c:if test="${!empty staffVo.staffImage }">
								<img alt="staffImage" src="<c:url value='/img/staffImages/${staffVo.staffImage }'/>" style="width:180px; height:200px;"> </span>
							</c:if>
							<c:if test="${empty staffVo.staffImage }">
								<img alt="defaultImage" src="<c:url value='/img/defaultUSER.png'/>" style="width:180px; height:200px;">
							</c:if>
						</div>
						<div>
							<span class="sp1">스태프 번호</span> <span>${staffVo.staffNo }</span>
						</div>
						<div>
							<span class="sp1">부서번호</span> <span>${staffVo.deptNo }</span>
						</div>
						<div>
							<span class="sp1">스태프 명</span> <span>${staffVo.staffName }</span>
						</div>
						<div>
							<span class="sp1">포지션</span> <span>${staffVo.staffPosition }</span>
						</div>
						<div>
							<span class="sp1">등번호</span> <span>${staffVo.staffBackNo }</span>
						</div>
						<div>
							<span class="sp1">생년월일</span> <span>${staffVo.staffBirth }</span>
						</div>
						<div>
							<span class="sp1">연봉</span> <span>${staffVo.staffSal }</span>
						</div>
						<div>
							<span class="sp1">계약시작일</span> <span>${staffVo.contractStart }</span>
						</div>
						<div>
							<span class="sp1">연락처</span> <span>${staffVo.staffTel }</span>
						</div>
						<div>
							<span class="sp1">특이사항</span> <span>${staffVo.staffInfo }</span>
						</div>
						<div>
							<span class="sp1">주소</span> <span>${staffVo.staffAddr }</span>
						</div>
						<div>
							<span class="sp1">주소상세</span> <span>${staffVo.staffAddrDetail }</span>
						</div>
						<div>
							<span class="sp1">우편번호</span> <span>${staffVo.staffZipcode }</span>
						</div>
						<div>
							<span class="sp1">스태프 상태</span> <span>${staffVo.staffStatus }</span>
						</div>
						<div class="lastDiv">
							<span class="sp1">아이디</span> <span>${staffVo.staffId }</span>
						</div>
<%-- 						<div>
							<span class="sp1">비밀번호</span> <span>${staffVo.staffPwd }</span>
						</div> --%>

						<div class="center" >
							<a href="<c:url value='/staff/staffEdit?staffNo=${staffVo.staffNo }'/>" style="color: white;">수정</a> |
				        	<a href="<c:url value='/staff/staffDelete'/>" style="color: white;">삭제</a> |
				        	<a href="<c:url value='/staff/staffList'/>" style="color: white;">목록</a>			
						</div>
					</div>

        </div>
    </div>
</div>
            <!-- Blank End -->

 <%@include file="../inc/bottom.jsp"%> 