<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../inc/top.jsp"%>

<link type="text/css" rel="stylesheet"
	href="https://static.flashscore.com/res/_fs/build/detail_sections.d2636fb.css"
	media="all">

<div class="container-fluid" id="board_style">
	<div class="col-sm-12 col-xl-12">
		<div class="bg-secondary rounded h-100 p-4">
			<nav
				style="--bs-breadcrumb-divider: url(&amp; amp; amp; amp; amp; amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&amp;amp;"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">경기기록</a></li>
					<li class="breadcrumb-item active" aria-current="page">상세</li>
				</ol>
			</nav>
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active tap_txt" id="pills-home-tab"
						data-bs-toggle="pill" data-bs-target="#pills-home" type="button"
						role="tab" aria-controls="pills-home" aria-selected="true">개요</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link tap_txt" id="pills-profile-tab"
						data-bs-toggle="pill" data-bs-target="#pills-profile"
						type="button" role="tab" aria-controls="pills-profile"
						aria-selected="false">통계</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link tap_txt" id="pills-contact-tab"
						data-bs-toggle="pill" data-bs-target="#pills-contact"
						type="button" role="tab" aria-controls="pills-contact"
						aria-selected="false">라인업</button>
				</li>
			</ul>
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="pills-home"
					role="tabpanel" aria-labelledby="pills-home-tab">
					<c:import url="/record/summary">
						<c:param name="recodeNo" value="${param.recodeNo}"></c:param>
					</c:import>
				</div>

				<div class="tab-pane fade" id="pills-profile" role="tabpanel"
					aria-labelledby="pills-profile-tab">
					<%@include file="gameRecordDetail2.jsp"%>
				</div>

				<div class="tab-pane fade" id="pills-contact" role="tabpanel"
					aria-labelledby="pills-contact-tab">
					<c:import url="/record/lineup">
						<c:param name="recodeNo" value="${param.recodeNo}"></c:param>
					</c:import>
				</div>
			</div>
			<div class="center">
				<a
					href="<c:url value='/record/gameEdit?recodeNo=${gameVo.recodeNo }'/>"
					style="color: white;">수정</a> | <a
					href="<c:url value='/record/gameDelete?recodeNo=${gameVo.recodeNo }'/>"
					style="color: white;">삭제</a> | <a
					href="<c:url value='/record/gameList'/>" style="color: white;">목록</a>
			</div>

		</div>
	</div>
</div>


<%@include file="../inc/bottom.jsp"%>