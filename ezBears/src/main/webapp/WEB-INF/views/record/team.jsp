<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>이젠 베어스 - 그룹웨어 시스템</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"> 

    <!-- Favicon -->
    <link href="/ezBears/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/ezBears/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/ezBears/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/ezBears/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/ezBears/css/custom.css">

    <!-- Template Stylesheet -->
    <link href="/ezBears/css/style.css" rel="stylesheet">
    <script type="text/javascript" src="/ezBears/js/jquery-3.7.0.min.js"></script>
    
    <!-- 개인 css -->
    <link href="/ezBears/css/yeji.css" rel="stylesheet">
    
</head>

		<div class="col-sm-12 col-xl-12">
			<div class="bg-secondary rounded h-100 p-4">
				<div class="col-12">
					<div class="bg-secondary rounded h-100 p-4">
						<h6 class="mb-4">팀 순위</h6>
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">팀 이름</th>
										<th scope="col">승</th>
										<th scope="col">무</th>
										<th scope="col">패</th>
										<th scope="col">경기 차</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>이젠베어스</td>
										<td>99</td>
										<td>1</td>
										<td>1</td>
										<td>0</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>SSG</td>
										<td>96</td>
										<td>1</td>
										<td>3</td>
										<td>3.0</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td>롯데 자이언츠</td>
										<td>1</td>
										<td>1</td>
										<td>99</td>
										<td>99.0</td>
									</tr>
									<tr>
										<th scope="row">4</th>
										<td>롯데 자이언츠</td>
										<td>1</td>
										<td>1</td>
										<td>99</td>
										<td>99.0</td>
									</tr>
									<tr>
										<th scope="row">5</th>
										<td>롯데 자이언츠</td>
										<td>1</td>
										<td>1</td>
										<td>99</td>
										<td>99.0</td>
									</tr>
									<tr>
										<th scope="row">6</th>
										<td>롯데 자이언츠</td>
										<td>1</td>
										<td>1</td>
										<td>99</td>
										<td>99.0</td>
									</tr>
									<tr>
										<th scope="row">7</th>
										<td>롯데 자이언츠</td>
										<td>1</td>
										<td>1</td>
										<td>99</td>
										<td>99.0</td>
									</tr>
									<tr>
										<th scope="row">8</th>
										<td>롯데 자이언츠</td>
										<td>1</td>
										<td>1</td>
										<td>99</td>
										<td>99.0</td>
									</tr>
									<tr>
										<th scope="row">9</th>
										<td>롯데 자이언츠</td>
										<td>1</td>
										<td>1</td>
										<td>99</td>
										<td>99.0</td>
									</tr>
									<tr>
										<th scope="row">10</th>
										<td>롯데 자이언츠</td>
										<td>1</td>
										<td>1</td>
										<td>99</td>
										<td>99.0</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		 <div class="container-fluid pt-4 px-4">
         <div class="row g-4">
             <div class="col-sm-12 col-xl-6">
                 <div class="bg-secondary text-center rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-4">
                         <h6 class="mb-0"></h6>
                     </div>
                     <canvas id="worldwide-sales"></canvas>
                 </div>
             </div>
             <div class="col-sm-12 col-xl-6">
                 <div class="bg-secondary text-center rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-4">
                         <h6 class="mb-0">2023 시즌 월별 승률</h6>
                     </div>
                     <canvas id="salse-revenue"></canvas>
                 </div>
             </div>
         </div>
     </div>





<%@include file="../inc/bottom.jsp"%>