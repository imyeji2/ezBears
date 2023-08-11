<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 <!-- Navbar End -->
 <!-- top ë©”ë‰´ ì¢…ë£Œ -->
<%@include file="inc/top.jsp"%>

	<!-- Sales Chart Start -->
     <div class="container-fluid pt-4 px-4">
         <div class="row g-4">
             <div class="col-sm-12 col-xl-6">
                 <div class="bg-secondary text-center rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-4">
                         <h6 class="mb-0">티켓 판매율</h6>
                     </div>
                     <canvas id="worldwide-sales"></canvas>
                 </div>
             </div>
             <div class="col-sm-12 col-xl-6">
                 <div class="bg-secondary text-center rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-4">
                         <h6 class="mb-0">2023 경기 기록</h6>
                     </div>
                     <canvas id="salse-revenue"></canvas>
                 </div>
             </div>
         </div>
     </div>
     <!-- Sales Chart End -->

    <!-- Recent Sales Start -->
    <div class="container-fluid pt-4 px-4">
        <div class="bg-secondary text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4">
                <h6 class="mb-0">이젠 베어스 일정</h6>
                <a href="">Show All</a>
            </div>
            <div class="table-responsive">
                 <div id="calender"></div>
            </div>
        </div>
    </div>
    <!-- Recent Sales End -->



 <%@include file="inc/bottom.jsp"%>
