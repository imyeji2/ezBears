<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/choong/chi.css" rel="stylesheet">

<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
		<div class="col-sm-12 col-xl-12">
		    <div class="bg-secondary rounded h-100 p-4">
	    
			    <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
		           <ol class="breadcrumb">
		             <li class="breadcrumb-item active" aria-current="page">
		                <a href="<c:url value='/message/messageList'/>">메세지</a>
		             </li>
		             <li class="breadcrumb-item active" aria-current="page">메세지 리스트</li>
		           </ol>
		         </nav>
		         <!-- 여기까지 nav -->
		         
		         <div class="msgTotal">
		         
			         <div class = "msgList" style="border: 1px solid white; width: 30%;">
			         	<p>메세지 리스트들 띄우는 공간</p>
			         </div>
			         <div class = "msgContext" style="border: 1px solid white; width: 65%;" >
			         	<p>메세지 내용을 띄우는 공간</p>
			         </div>
			         
		         </div>
	         
	         
			</div>
		</div>
	</div>
</div>

<%@include file="../inc/bottom.jsp"%>    