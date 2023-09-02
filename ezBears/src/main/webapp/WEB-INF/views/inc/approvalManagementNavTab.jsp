<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function (){
		var url =window.location.pathname;
		var type =url.lastIndexOf("/");
		var id= url.substr(type+1);
		
		$('#'+id).addClass('active');
		
		if(id==="teamNotice"){
			$('#detail_li').text("공지사항");
		}
	});
</script>

<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">결재관리</a></li>
    <li class="breadcrumb-item active" aria-current="page">결재관리</li>
  </ol>
</nav>

<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
    <li class="nav-item" role="presentation">
        <a class="nav-link tap_txt" id="teamNotice" href="<c:url value='/signManagement/underApproval'/>">결재 처리중</a>
    </li>
    <li class="nav-item" role="presentation">
        <a class="nav-link tap_txt" id="teamWorkBoard" href="<c:url value='/signManagement/completeApproval'/>">결재 완료</a>
    </li>
</ul>