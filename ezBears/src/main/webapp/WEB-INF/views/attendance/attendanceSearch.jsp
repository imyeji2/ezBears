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
        	<h3>출/퇴근 현황 </h3><br>
        	<form action="">
	        	<table>
	        		<tr>
	        			<th style="width: 10%">기간</th>
	        			<td> <input type="text" class="dateInput">년 <input type="text" class="dateInput">월 <input type="text" class="dateInput">일 
	        				~ <input type="text" class="dateInput">년 <input type="text" class="dateInput">월 <input type="text" class="dateInput">일</td>
	        		</tr>
	        		<tr>
	        			<th>사원명</th>
	        			<td><input type="text" style="width: 80%"></td>
	        		</tr>
	        		<tr>
	        			<th>부서</th>
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