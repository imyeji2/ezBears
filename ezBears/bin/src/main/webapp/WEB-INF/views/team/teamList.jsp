<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../inc/top.jsp"%>
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
		<div class="col-sm-12 col-xl-12">
		    <div class="bg-secondary rounded h-100 p-4">
		        <h6 class="mb-4">선수단 리스트</h6>
		        <table class="table table-hover">
		            <thead>
		                <tr>
		                    <th scope="col">Player_NO</th>
		                    <th scope="col">Position_NO</th>
		                    <th scope="col">부서번호</th>
		                    <th scope="col">Back_No</th>
		                    <th scope="col">이름</th>
		                    <th scope="col">연봉</th>
		                </tr>
		            </thead>
		            <tbody>
		                <tr>
		                    <th scope="row">1</th>
		                    <td>1</td>
		                    <td>400</td>
		                    <td>20</td>
		                    <td>kiki</td>
		                    <td>40,000,000</td>
		                </tr>
		                <tr>
		                    <th scope="row">2</th>
		                    <td>2</td>
		                    <td>400</td>
		                    <td>14</td>
		                    <td>Otto</td>
		                    <td>110,000,000</td>
		                </tr>
		                <tr>
		                    <th scope="row">3</th>
		                    <td>2</td>
		                    <td>400</td>
		                    <td>33</td>
		                    <td>Mark</td>
		                    <td>210,000,000</td>
		                </tr>
		            </tbody>
		        </table>
		    </div>
		</div>
	</div>
</div>

 <%@include file="../inc/bottom.jsp"%>