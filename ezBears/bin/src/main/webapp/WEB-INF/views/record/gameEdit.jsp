<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/choong/chi.css" rel="stylesheet">

	<form name="frmEdit" method="post" action="<c:url value='/record/gameEdit'/>">
        <!-- Sign In Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center">
                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                    <div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <h3>경기기록 수정</h3>
                        </div>
                        <input type="hidden" name="recodeNo" value="${gameVo.recodeNo }">
                        <div style="width: 60%; height: 80%; margin: 0 auto;" >
	                        <div class="form-floating mb-3">
	                            <input type="text" class="form-control" id="playDate" placeholder="playDate" max="9999-12-31" name="playDate" maxlength="10">
	                            <label for="floatingInput">경기 날짜</label>
	                        </div>
	                        <div class="form-floating mb-3">
	                            <input type="text" class="form-control" id="floatingInput" placeholder="firstPitcher" name="firstPitcher">
	                            <label for="floatingInput">선발투수</label>
	                        </div>
	                        <div class="form-floating mb-3">
	                            <input type="text" class="form-control" id="floatingInput" placeholder="otherTeam" name="otherTeam">
	                            <label for="floatingInput">상대팀</label>
	                        </div>
	                        <div class="form-floating mb-3">
	                            <input type="text" class="form-control" id="floatingInput" placeholder="ground" name="ground" >
	                            <label for="floatingInput">구장</label>
	                        </div>
	                        <div class="form-floating mb-3">
	                            <input type="text" class="form-control" id="floatingInput" placeholder="win" name="win">
	                            <label for="floatingInput">승무패</label>
	                        </div>
	                        <button type="submit" class="btn btn-primary py-3 w-100 mb-4">경기 기록 수정</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</form>
	
<script type="text/javascript">
$(function () {
$('#regdate').on('input', function() {
    var inputTel = $(this).val();
    
    // Remove existing "-" characters
    var cleanedTel = inputTel.replace(/-/g, '');

    if (cleanedTel.length >= 5) {
        cleanedTel = cleanedTel.substring(0, 4) + '-' + cleanedTel.substring(4);
    }
    if (cleanedTel.length >= 8) {
        cleanedTel = cleanedTel.substring(0, 7) + '-' + cleanedTel.substring(7);
    }
    
    // Update the value of the input field
    $(this).val(cleanedTel);
});
}
</script>
 <%@include file="../inc/bottom.jsp"%> 