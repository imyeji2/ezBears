<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 <!-- Navbar End -->
 <!-- top 메뉴 종료 -->
<%@include file="inc/top.jsp"%>
    <!-- Sale & Revenue Start -->

    <!-- Recent Sales Start -->
    <div class="container-fluid pt-4 px-4">
        <div class="bg-secondary text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4">
                <h6 class="mb-0">경기 및 훈련스케줄</h6>
                <a href="">Show All</a>
            </div>
            <div class="table-responsive">
                 <div id="calender"></div>
            </div>
        </div>
    </div>
    <!-- Recent Sales End -->


   
 <%@include file="inc/bottom.jsp"%>       
