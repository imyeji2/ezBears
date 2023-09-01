<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">

	<div class="col-12">
	    <div class="bg-secondary rounded h-100 p-4">
		    <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	           <ol class="breadcrumb">
	             <li class="breadcrumb-item active" aria-current="page">
	                <a href="<c:url value='/Member/list'/>">메세지</a>
	             </li>
	             <li class="breadcrumb-item active" aria-current="page">메세지 리스트</li>
	           </ol>
	         </nav>
	         <div class = "msgList">
	         
	         </div>
	         <div class = "msgContext">
	         
	         </div>
	         
	         
	         
	    </div>
	</div>

<%@include file="../inc/bottom.jsp"%>    