<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/choong/chi.css" rel="stylesheet">

	<form name="frmEdit" method="post" action="<c:url value='/record/hitterRecordEdit'/>">
        <input type="hidden" name="staffNo" value="${sessionScope.staff_no}">
		<input type="hidden" name="recodeNo" value="${param.recodeNo}">

	<!-- Sign In Start -->
	<div class="container-fluid">
		<div class="row h-100 align-items-center justify-content-center">
			<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
				<div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
					<div class="d-flex align-items-center justify-content-between mb-3">
						<h3>타자 기록 수정</h3>
					</div>

					<div style="width: 60%; height: 80%; margin: 0 auto;">
						<div class="form-floating mb-3">
							<select class="form-select" id="floatingSelect"
								aria-label="Floating label select example" name="playerNo">
								<!-- 반복문 -->
								<option value="" selected="selected">선수</option>
								<c:forEach var="hitter" items="${hitterRecordList}">
									<option value="${hitter['PLAYER_NO']}">${hitter['PLAYER_NAME']}</option>
								</c:forEach>
								<!-- 반복문 -->
							</select> <label for="floatingSelect">선수를 선택하세요</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="AB" name="AB"> <label for="floatingInput">타수</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="RS" name="RS"> <label for="floatingInput">득점</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="H" name="H"> <label for="floatingInput">안타</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="RBI" name="RBI"> <label for="floatingInput">타점</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="BB" name="BB"> <label for="floatingInput">사구</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="SO" name="SO"> <label for="floatingInput">삼진</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="HR" name="HR"> <label for="floatingInput">홈런</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="BA" name="BA"> <label for="floatingInput">타율</label>
						</div>
						<button type="submit" class="btn btn-primary py-3 w-100 mb-4">기록
							수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

 <%@include file="../inc/bottom.jsp"%> 