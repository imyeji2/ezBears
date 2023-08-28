<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.ez.ezBears.attendance.model.AttendanceVO"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>이젠 베어스 - 그룹웨어 시스템</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
    <script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
    <script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    

    
    <style>
    	a{
    	color:#7000D8;
    	}
    	
    	.btn-primary{
    	    color: #fff;
		    background-color:#7000D8;
		    border-color:#7000D8;
    	} 
    	
    	
    	.boardTop{
    		width:100%;
    		padding:0px 5px 10px 18px;
    		font-size:16px;
    		font-weight: 800;
    		overflow: hidden;
    	}
    	
    	.boardTop_txt{
    		float: left;
    	}
    	
    	.boardTop_btn{
    		float: right;
    	}
    	
    	.boardTop_btn img:hover{
    		cursor: pointer;
    	}
    </style>

    <!-- 개인 css -->
    <link href="${pageContext.request.contextPath}/css/park.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/gopanju.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/yeji.css" rel="stylesheet">

</head>

<script type="text/javascript">
	$(function () {
		  	var status = "<%=(String)session.getAttribute("status")%>";
			
			var topStatus = "";
			var confirmText = "";
			if(status =="퇴근" || status == ""){
				  topStatus = "출근";
				  confirmText = "출근 처리";
			}else if(status=="근무 중"){
				  topStatus = "근무 중";
				  confirmText = "퇴근 처리";
			}
			
			 $('#btnInOut').text(topStatus);
		
	})
	
	function attendanceInOut() {
		  	var status = "<%=(String)session.getAttribute("status")%>";
			alert(status);
			
			var topStatus = "";
			var confirmText = "";
			if(status =="퇴근" || status == ""){
				  topStatus = "출근";
				  confirmText = "출근 처리";
			}else if(status=="근무 중"){
				  topStatus = "근무 중";
				  confirmText = "퇴근 처리";
			}
			alert(topStatus);
			
			 $('#btnInOut').text(topStatus);
			alert(confirmText);
		if(confirm(confirmText + '하시겠습니까?')){
			
			var today = new Date();
	        var today_year = today.getFullYear();
	        var today_month = today.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줌
	        var today_date = today.getDate(); // 날짜를 가져와야 함

	        // 날짜 값이 한 자리일 경우 앞에 0 추가하여 두 자리로 만듦
	        var formattedMonth = today_month < 10 ? '0' + today_month : today_month;
	        var formattedDate = today_date < 10 ? '0' + today_date : today_date;

	        var day = today_year + '-' + formattedMonth + '-' + formattedDate; // 날짜 형식 조정
			
	        
			location.href="<c:url value='/mypage/attendanceInOut?date='/>"+day;
		}
	}

</script>

<body>
    <div class="container-fluid position-relative d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <a href="<c:url value='/'/>" class="navbar-brand mx-4 mb-3">
                    <img src="<c:url value='/img/logo.png'/>" alt="logo" style="width:100%">
                </a>
                <!-- 사원정보 -->
               <div id="top_membox">
	                <div class="d-flex user_info">
	                    <div class="position-relative">
	                        <img class="member_img" src="<c:url value='/img/user.jpg'/>" alt="프로필 이미지">
	                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
	                    </div>
	                    <div class="ms-3 lign-items-center">
	                        <h6 class="mb-0">${sessionScope.name }/${sessionScope.position}</h6>
		                       <span>💼${sessionScope.dept_name }</span>
	                    </div>
	                </div>
	               	<button class="inoutBtn" onclick="attendanceInOut()" id="btnInOut"></button>
                </div>
                <!-- 사원정보 끝-->

                <!-- 사이드 메뉴 시작 -->
                <div class="navbar-nav w-100">
                	<div class="boardTop">
                		<div class="boardTop_txt">워크보드</div>
                		<div class="boardTop_btn">
                			<img src="<c:url value='/img/plus.svg'/>" alt="보드 추가 버튼" style="margin-right:10px;">
                			<img src="<c:url value='/img/gear-wide.svg'/>" alt="보드 관리 버튼"/>
                			
                		</div>
                	</div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                      	 	<i class="bi bi-building me-2"></i>공용
                        </a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="<c:url value='/notice/noticeList'/>" class="dropdown-item">
                           		<i class="far fa-bell me-2"></i>공지사항
                           	</a>
                            <a href="#" class="dropdown-item">
                            	<i class="bi bi-chat-square-dots-fill me-2"></i>자유게시판
                            </a>
                        </div>
                    </div>                
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        	<i class="bi bi-folder-fill me-2"></i>경영지원팀
                        </a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="<c:url value='/Member/list'/>" class="dropdown-item">
                            	<i class="bi bi-person-badge me-2"></i>사원관리
                            </a>
                            <a href="<c:url value='/attendanceManagement/attendanceSearch'/>" 
                            class="dropdown-item">
                            	<i class="bi bi-calendar3 me-2"></i>근태관리
                            </a>
                            <a href="#" class="dropdown-item">
                            	<i class="bi bi-list-task me-2"></i>게시글관리
                            </a>
                            <a href="<c:url value='/dept/list'/>" class="dropdown-item">
                            	<i class="bi bi-briefcase-fill me-2"></i>부서관리
                            </a>
                            <a href="<c:url value='/staff/staffList'/>" class="dropdown-item">
                            <i class="bi bi-person me-2"></i>스태프관리
                            </a>
                            <a href="<c:url value='/team/teamList'/>" class="dropdown-item">
                           		<i class="bi bi-person-square me-2"></i>선수단관리
                            </a>                         
                        </div>
                    </div>           
                             
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        	<i class="bi bi-text-center me-2"></i>나의보드
                        </a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <c:import url="/myBoard/myBoardList"></c:import>
                        </div>
                    </div>
                    
                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                       		<i class="bi bi-clipboard-data me-2"></i>팀관리
                       	</a>
                        <div class="dropdown-menu bg-transparent border-0">
                             <a href="<c:url value='/record/gameList'/>" class="dropdown-item">
                            	<i class="bi bi-trophy-fill me-2"></i>경기기록
                            </a>
                            <a href="<c:url value='/record/teamList'/>" class="dropdown-item">
                               <i class="bi bi-person-square me-2"></i>선수기록
                            </a>
                            <a href="#" class="dropdown-item">
                            	<i class="bi bi-pie-chart-fill me-2"></i>팀통계
                            </a>
                            <a href="#" class="dropdown-item">
                            	<i class="bi bi-journal-text me-2"></i>선수통계
                            </a>
                        </div>
                    </div>
                    <a href="#" class="nav-item nav-link">
                    	<i class="bi bi-people-fill me-2"></i>임직원정보
                    	</a>
                </div>
                <!-- 사이드 메뉴 종료 -->
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
        	<!-- top 메뉴 시작 -->
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top py-0">
            	<div style="width:900px; ">
	                <form class="d-none d-md-flex ms-4">
	                    <input class="form-control bg-dark border-0" type="search" placeholder="사원을 검색하세요">
	                </form>
                </div>
                
                <div class="navbar-nav align-items-center ms-auto" style="margin-right:20px;">
                
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-bell me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">알림</span>                   
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">전체 공지사항 업데이트</h6>
                                <small>15분 전</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">휴가 신청 승인 완료</h6>
                                <small>1시간 전</small>
                            </a>
                        </div>
                        
                   	</div>
					<div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                           <i class="fa bi-person-fill me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">${sessionScope.name }</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">마이페이지</a>
                            <a href="<c:url value='/login/logout'/>" class="dropdown-item">로그아웃</a>
                        </div>
                    </div>                   	
              	</div>
            </nav>
            <!-- Navbar End -->
            <!-- top 메뉴 종료 -->