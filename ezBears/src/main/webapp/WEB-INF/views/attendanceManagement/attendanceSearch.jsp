<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../inc/top.jsp"%>
<style>
	.dateInput{
		width: 10%;
	}
/* 	table{
		border: 1px solid white;
	}
	tr{
		border-collapse: collapse;
	} */
</style>
<!-- Blank Start -->
<div class="container-fluid pt-4 px-4">
    <div class="row vh-100 bg-secondary rounded align-items-center justify-content-center mx-0">
        <div class="col-md-10 text-center">
  	        <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	           <ol class="breadcrumb">
	             <li class="breadcrumb-item active" aria-current="page">
	                <a href="<c:url value='/attendanceManagement/attendanceSearch'/>">근태 관리</a>
	             </li>
	             <li class="breadcrumb-item active" aria-current="page">출/퇴근 현황 검색</li>
	           </ol>
         	</nav>
        	<h3>출/퇴근 현황 </h3><br>
        	<form action="">
	        	<table>
	        		<tr>
	        			<th style="width: 10%">기간</th>
	        			<td> <input type="text" class="dateInput">년 <input type="text" class="dateInput">월 <input type="text" class="dateInput">일 
	        				~ <input type="text" class="dateInput">년 <input type="text" class="dateInput">월 <input type="text" class="dateInput">일</td>
	        		</tr>
	        		<tr>
	        			<th>부서명</th>
	        			<td><input type="text" style="width: 80%"></td>
	        		</tr>
	        		<tr>
	        			<th>사원명</th>
	        			<td><input type="text" style="width: 80%"></td>
	        		</tr>
	        	</table>
	        	<br>
	        	<input type="submit" value="검색"/>
        	
        	</form>
        
        
        
        </div>
    </div>
</div>
<!-- Blank End -->

<%@include file="../inc/bottom.jsp"%>