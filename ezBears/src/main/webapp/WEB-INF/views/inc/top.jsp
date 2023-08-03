<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
    
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
</head>

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
                <div class="d-flex align-items-center ms-4 mb-4">
                	<div>
                	</div>

                </div>
                <!-- 사원정보 -->
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
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">공용</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="#" class="dropdown-item">공지사항</a>
                            <a href="#" class="dropdown-item">자유게시판</a>
                        </div>
                    </div>                
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">경영지원팀</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="#" class="dropdown-item">사원관리</a>
                            <a href="#" class="dropdown-item">근태관리</a>
                            <a href="#" class="dropdown-item">게시글관리</a>
                            <a href="#" class="dropdown-item">부서관리</a>
                            <a href="#" class="dropdown-item">스태프관리</a>
                            <a href="#" class="dropdown-item">선수단관리</a>                         
                        </div>
                    </div>           
                             
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">나의보드</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="#" class="dropdown-item">개발1팀</a>
                            <a href="#" class="dropdown-item">프로젝트팀</a>
                        </div>
                    </div>
                    
                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">팀관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="#" class="dropdown-item">경기기록</a>
                            <a href="#" class="dropdown-item">선수기록</a>
                            <a href="#" class="dropdown-item">팀통계</a>
                            <a href="#" class="dropdown-item">선수통계</a>
                        </div>
                    </div>
                    <a href="#" class="nav-item nav-link">임직원정보</a>
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
                <div class="navbar-nav align-items-center ms-auto">
                	<span class="d-none d-lg-inline-flex">운영1팀</span>
                	<span class="d-none d-lg-inline-flex">&nbsp;|&nbsp;</span>
                	<span class="d-none d-lg-inline-flex">제이든</span>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link " data-bs-toggle="dropdown">
                            <img class=" me-lg-2" src="<c:url value='/img/user.jpg'/>" alt="사원프로필" style="width: 40px; height:40px;">
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">My Profile</a>
                            <a href="#" class="dropdown-item">Settings</a>
                            <a href="#" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->
            <!-- top 메뉴 종료 -->
