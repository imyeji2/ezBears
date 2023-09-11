<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.deleteDiv{
		border-top: 2px solid #e2e2e2;
		border-bottom: 2px solid #e2e2e2;
	}
</style>
<%@include file="../inc/top.jsp"%>

<!-- Blank Start -->
<div class="container-fluid pt-4 px-4" style="width: 80%">
    <div class="row vh-100 bg-secondary rounded align-items-center justify-content-center mx-0">
        <div class="col-md-9 text-center">
        	<!-- 내용 시작 -->
        	
            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	           <ol class="breadcrumb">
	             <li class="breadcrumb-item active" aria-current="page">
	                <a href="<c:url value='/team/teamList'/>">선수단 관리</a>
	             </li>
	             <li class="breadcrumb-item active" aria-current="page">선수단 삭제</li>
	           </ol>
         	</nav>
            <br>
        	<div class="deleteDiv">
	            <br>
					<article class="simpleForm">
						<form name="frmOut" method="post" action="<c:url value='/team/teamDelete'/>" >
							<fieldset>	
								<legend>선수 번호 : ${map['PLAYER_NO'] }
								<br>
								선수 이름 : ${map['PLAYER_NAME'] }
								</legend>
								<br><br>
								<p class="p">선수 삭제 하시겠습니까?</p>
								<div> 	
									<input type="hidden" name="playerNo" value="${map['PLAYER_NO'] }">
								</div>
								<br>
								<div class="align_center">
									<input type="submit" id="submit" value="삭제">
									<input type="reset" value="취소">
								</div>
							</fieldset>	
						</form>
					</article>
        	</div>
        	<!-- 내용 끝 -->
        </div>
    </div>
</div>
<!-- Blank End -->


 <%@include file="../inc/bottom.jsp"%>