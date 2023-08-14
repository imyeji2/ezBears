<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../inc/top.jsp"%>
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
		<div class="col-sm-12 col-xl-12">
		    <div class="bg-secondary rounded h-100 p-4">
		        <h6 class="mb-4">스태프 리스트</h6>
		        <table class="table table-hover">
		            <thead>
		                <tr>
		                    <th scope="col">이름</th>
		                    <th scope="col">포지션</th>
		                    <th scope="col">특이사항</th>
		                </tr>
		            </thead>
		            <tbody>
		            	<c:if test="${empty list }">
		            		<tr>
		            			<th colspan="3">등록된 사원이 존재하지 않습니다.</th>
		            		</tr>
		            	</c:if>
		            	<c:if test="${!empty list }">
			            	<c:forEach var="vo" items="${list }">
				                <tr>
				                    <td>${vo.staffName }</td>
				                    <td>${vo.staffPosition }</td>
				                    <td>${vo.staffInfo }</td>
				                </tr>
			            	</c:forEach>
		            	</c:if>
		            </tbody>
		        </table>
		        
		        
		        
				<div class="divBtn">
				    <a href="<c:url value='/staff/staffWrite'/>">스태프 등록</a>
				</div>
				
		    </div>
		</div>
	</div>
</div>

 <%@include file="../inc/bottom.jsp"%>