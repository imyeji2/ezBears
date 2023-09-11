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
          
		            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			           <ol class="breadcrumb">
			             <li class="breadcrumb-item active" aria-current="page">
			                <a href="<c:url value='/team/teamList'/>" style="color: #7000D8">선수단 관리</a>
			             </li>
			             <li class="breadcrumb-item active" aria-current="page">선수단 상세보기</li>
			           </ol>
		         	</nav>
					<div class="divForm">
						<div class="firstDiv">
							<c:if test="${!empty map['PLAYER_IMAGE'] }">
								<img alt="teamImage" src="<c:url value='/img/teamImages/${map["PLAYER_IMAGE"] }'/>" style="width:180px; height:200px;"> </span>
							</c:if>
							<c:if test="${empty map['PLAYER_IMAGE'] }">
								<img alt="defaultImage" src="<c:url value='/img/defaultUSER.png'/>" style="width:180px; height:200px;">
							</c:if>
						</div>
						<div>
							<span class="sp1">선수 번호</span> <span>${map['PLAYER_NO']}</span>
						</div>
						<div>
							<span class="sp1">선수 포지션</span> <span>${map['B_POSITION_NAME']}</span>
						</div>
<!-- 						<div>
							<span class="sp1">부서 번호</span> <span>부서 번호</span>
						</div> -->
						<div>
							<span class="sp1">등번호</span> <span>${map['BACK_NO'] }</span>
						</div>
						<div>
							<span class="sp1">선수 이름</span> <span>${map['PLAYER_NAME'] }</span>
						</div>
						<div>
							<span class="sp1">생년월일</span> <span>
							<fmt:formatDate value="${map['PLAYER_BIRTH'] }" pattern="yyyy-MM-dd"/></span>
						</div>
						<div>
							<span class="sp1">키</span> <span>${map['HEIGHT'] }</span>
						</div>
						<div>
							<span class="sp1">몸무게</span> <span>${map['WEIGHT'] }</span>
						</div>
						<div>
							<span class="sp1">연봉</span> <span>${map['PLAYER_SAL'] } 원</span>
						</div>
						<div>
							<span class="sp1">계약시작일</span> <span>
							<fmt:formatDate value="${map['CONTRACT_START'] }" pattern="yyyy-MM-dd"/></span>
						</div>
						<div>
							<span class="sp1">계약종료일</span> <span>
							<fmt:formatDate value="${map['CONTRACT_DONE'] }" pattern="yyyy-MM-dd"/></span>
						</div>
						<div>
							<span class="sp1">연락처</span> <span>${map['PLAYER_TEL'] }</span>
						</div>
						<div>
							<span class="sp1">선수 상태</span> <span>${map['PLAYER_INFO'] }</span>
						</div>
<%-- 						<div>
							<span class="sp1">상태</span> <span>${map['PLAYER_STATUS'] }</span>
						</div> --%>
						<div>
							<span class="sp1">주소</span> <span>${map['PLAYER_ADDRESS'] }</span>
						</div>
						<div>
							<span class="sp1">주소상세</span> <span>${map['PLAYER_ADDRESS_DETAIL'] }</span>
						</div>
						<div class="lastDiv">
							<span class="sp1">우편번호</span> <span>${map['PLAYER_ZIPCODE'] }</span>
						</div>

						<div class="center" >
							<a href="<c:url value='/team/teamEdit?playerNo=${map["PLAYER_NO"] }'/>" style="color: white;">수정</a> |
				        	<a href="<c:url value='/team/teamDelete?playerNo=${map["PLAYER_NO"] }'/>" style="color: white;">삭제</a> |
				        	<a href="<c:url value='/team/teamList'/>" style="color: white;">목록</a>			
						</div>
					</div>

        </div>
    </div>
</div>
            <!-- Blank End -->

 <%@include file="../inc/bottom.jsp"%> 


