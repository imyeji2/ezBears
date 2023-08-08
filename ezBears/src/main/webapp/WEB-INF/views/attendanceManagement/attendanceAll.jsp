<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../inc/top.jsp"%>
<div id="attendanceAll">
	<div class="container-fluid pt-4 px-4">
	    <div class="row g-4">
			<div class="col-sm-12 col-xl-12">
			    <div class="bg-secondary rounded h-100 p-4">
			        <h6 class="mb-4">출/퇴근 현황</h6>
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