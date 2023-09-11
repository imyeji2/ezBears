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
        	
            <h3 style="color:  #6f42c1;">이닝 기록 삭제</h3>
            <br>
        	<div class="deleteDiv">
	            <br>
					<article class="simpleForm">
						<form name="frmOut" method="post" action="<c:url value='/record/pitcherRecordDelete'/>" >
							<fieldset>	
								<legend>이닝번호 : ${inningVo.inningNo }<br>
								경기 날짜 : ${inningVo.regdate }</legend>
								<br><br>
								<p class="p">이닝 기록을 기록 삭제 하시겠습니까?</p>
								<br>
								<div> 	
									<input type="hidden" name="staffNo" value="${inningVo.inningNo }">
								</div>
								<div class="align_center">
									<input type="submit" id="submit" value="삭제">
									<input type="reset" value="취소">
								</div>
								<br>
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