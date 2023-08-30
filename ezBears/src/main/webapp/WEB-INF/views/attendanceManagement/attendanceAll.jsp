<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../inc/top.jsp"%>
<div id="attendanceAll">
	<div class="container-fluid pt-4 px-4">
	    <div class="row g-4">
			<div class="col-sm-12 col-xl-12">
			    <div class="bg-secondary rounded h-100 p-4">
	   	            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			           <ol class="breadcrumb">
			             <li class="breadcrumb-item active" aria-current="page">
			                <a href="<c:url value='/attendanceManagement/attendanceSearch'/>">근태 관리</a>
			             </li>
			             <li class="breadcrumb-item active" aria-current="page">출/퇴근 현황</li>
			           </ol>
		         	</nav>
		         	<div class="col-md-12 text-center">
        				<h3>출/퇴근 현황</h3>
        			</div><br>
        			
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
        			
        			
			        <table class="table table-hover">
			            <thead>
			                <tr>
			                    <th scope="col">일자</th>
			                    <th scope="col">사원명</th>
			                    <th scope="col">출근시간</th>
			                    <th scope="col">퇴근시간</th>
			                    <th scope="col">근무시간</th>
			                </tr>
			            </thead>
			            <tbody>
			                <tr>
			                    <th scope="row">2023-08-03</th>
			                    <td>충치</td>
			                    <td>2023-08-03 9:00:24</td>
			                    <td>2023-08-03 18:03:57</td>
			                    <td>8시간 3분</td>
			                </tr>
			                <tr>
			                    <th scope="row">2</th>
			                    <td>Mark</td>
			                    <td>Otto</td>
			                    <td>mark@email.com</td>
			                </tr>
			                <tr>
			                    <th scope="row">3</th>
			                    <td>Jacob</td>
			                    <td>Thornton</td>
			                    <td>jacob@email.com</td>
			                </tr>
			            </tbody>
			        </table>
			    </div>
			</div>
		</div>
	</div>
</div>
 <%@include file="../inc/bottom.jsp"%>