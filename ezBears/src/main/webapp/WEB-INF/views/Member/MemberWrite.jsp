<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">
<script type="text/javascript" src="<c:url value ='/js/member.js"'/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="col-12">
	<div class="bg-secondary rounded h-100 p-4">
	<h6 class="mb-4">사원 등록</h6>
		<div class="register">
			<form class="register-form" name="frmRegist" method="post" action="<%=request.getContextPath() %>/Member/write">
				<div class = "side">
					<div class ="imgdiv">
						<img alt="" src="" style="width:150px; height:200px;">
						<label for="imageUpload">사진 등록</label>
						<input type ="file" name="imageUpload" id="imageUpload"  class="infobox" style="display:none">
					</div>
					<div class ="innerSide">
						<ul class="select-box">
							<li>
						        <select name="dept" id="dept">
						        	<option value="" >부서</option>
									<!-- 반복문 -->
									<c:forEach var="deptVo" items="${deptList}">
										<option value ="${deptVo.deptNo}">${deptVo.deptName}</option>
									</c:forEach>
									<!-- 반복문 -->
						       	</select>
							</li>
							<li>
						        <select name="grade" id="grade">
						        	<option value="" >직급</option>
						            <option value="1">사원</option>
						            <option value="2">대리</option>
						            <option value="4">과장</option>
						            <option value="5">차장</option>
						            <option value="6">팀장</option>
						       	</select>
							</li>
							<li>
						        <select name="test" id="test">
						        	<option value="" >고용형태</option>
						            <option value="1">계약직</option>
						            <option value="2">정규직</option>
						       	</select>
							</li>
						</ul>
						
					<div class="form-floating">
						<input type="text" class="form-control" id="registerId" name="userId"> 
						<label for="registerId">아이디</label>
					</div>
				</div>
				</div>
				<div>
					<div class="password-form">
						<div class="form-floating">
							<input type="password" class="form-control" id="registerPassword" name="pwd"> 
							<label for="registerPassword">비밀번호</label>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="registerPassword2" name="pwd2"> 
							<label for="registerPassword">비밀번호 확인</label>
						</div>
					</div>
					<span class ="error" style="height:5px; font-size: 12px;"></span>
				</div>
				<div class="form-floating">
					<input type="text" class="form-control" id="registerName" name="name"> 
					<label for="registerName">이름</label>
				</div>
				<div class="detail">
					<div class="form-floating">
						<input type="text" class="form-control" id="birth" name="birth" maxlength="10"> 
						<label for="birth">생년월일</label>
					</div>
					<div class="form-floating">
						<input type="text" class="form-control" id="phoneNum" maxlength="13">
						<label for="phoneNum">전화번호</label>
					</div>
				</div>
				<div class='detail'>
					<div class="form-floating">
						<input type="text" class="form-control" id="sal" >
						<label for="sal">연봉</label>
					</div>
					<div class="form-floating">
						<input type="text" class="form-control" id="contract" maxlength="10" >
						<label for="contract">입사일</label>
					</div>
				</div>
			    <div class="firstdiv">
			    	<div class="form-floating address">
			    		<input type="text" class="form-control" id="zipcode" readonly="readonly">
				        <label for="zipcode">우편번호</label>
			    	</div>
			    	<div class="findZipcode">
				        <input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림" onclick="sample4_execDaumPostcode()">
			    	</div>
			    </div>
			    <div class="form-floating">
			        <input type="text" name="addressDetail" id="addressDetail" title="주소"  class="form-control"  readonly="readonly">
			        <label for="addressDetail">주소</label>
				</div>
			    <div class="form-floating">
			        <input type="text" name="addressDetail" id="addressDetail2" title="상세주소"  class="form-control">
			        <label for="addressDetail2">상세주소</label>
				</div>
				
				<button class="confirm" type="submit">등록</button>
				<input type ="text" name="chkId" id="chkId">
			</form>
		</div>
	</div>
</div>
  2023080901001   mg-230809001
 <%@include file="../inc/bottom.jsp"%>    