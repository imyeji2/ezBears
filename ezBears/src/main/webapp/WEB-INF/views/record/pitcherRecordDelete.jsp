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
        	
            <h3 style="color:  #6f42c1;">스태프 삭제</h3>
            <br>
        	<div class="deleteDiv">
	            <br>
					<article class="simpleForm">
						<form name="frmOut" method="post" action="<c:url value='/record/pitcherRecordDelete'/>" >
							<fieldset>	
								<legend>선수번호 : ${PitcherVo.playerNo }<br>
								선수 이름 : ${PitcherVo.playerName }</legend>
								<br><br>
								<p class="p">선수 삭제 하시겠습니까?</p>
								<br>
								<div> 	
									<input type="hidden" name="staffNo" value="${PitcherVo.playerNo }">
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