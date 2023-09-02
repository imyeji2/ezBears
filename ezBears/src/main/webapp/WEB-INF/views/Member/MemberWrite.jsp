<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/jquery-ui.min.css" rel="stylesheet">
<script type="text/javascript" src="<c:url value ='/js/member.js"'/>"></script>
<script type="text/javascript" src="<c:url value ='/js/jquery-ui.min.js"'/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.imgdiv {
    width: 200px;
}

</style>
<script>
    var jb = jQuery.noConflict();
    jb(function(){
        jb('#birth').datepicker({
            dateFormat:'yy-mm-dd',
            changeYear:true,
            dayNamesMin:['일','월','화','수','목','금','토'],
            monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
        });

        jb('#contract').datepicker({
            dateFormat:'yy-mm-dd',
            changeYear:true,
            dayNamesMin:['일','월','화','수','목','금','토'],
            monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
        });
    });
</script>


<div class="col-12">
	<div class="bg-secondary rounded h-100 p-4">
	   	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
         <ol class="breadcrumb">
           <li class="breadcrumb-item active" aria-current="page">
              <a href="<c:url value='/Member/list'/>">사원관리</a>
           </li>
           <li class="breadcrumb-item active" aria-current="page">사원 등록</li>
         </ol>
       </nav>
		<div class="register">
			<form class="register-form" name="frmRegist" method="post" action="<%=request.getContextPath() %>/Member/write" enctype="multipart/form-data" autocomplete="off">
				<div class = "side">
					<div class ="imgdiv">
						<img alt="" src="<c:url value = '/img/defaultUSER.png'/>" style="width:180px; height:200px;" id="previewImage" name="memImage">
						<label for="imageUpload">사진 등록</label>
						<input type ="file" name="imageUpload" id="imageUpload"  class="infobox" style="display:none">
					</div>
					<div class ="innerSide">
						<ul class="select-box">
							<li>
						        <select name="deptNo" id="dept">
						        	<option value="" >부서</option>
									<!-- 반복문 -->
									<c:forEach var="deptVo" items="${deptList}">
										<option value ="${deptVo.deptNo}">${deptVo.deptName}</option>
									</c:forEach>
									<!-- 반복문 -->
						       	</select>
							</li>
							<li>
						        <select name="positionNo" id="grade">
						        	<option value="" >직급</option>
						        	<!-- 반복문 -->
									<c:forEach var="positionVo" items="${positionList}">
										<option value ="${positionVo.positionNo}">${positionVo.positionName}</option>
									</c:forEach>
						        	<!-- 반복문 -->
						       	</select>
							</li>
							<li>
						        <select name="type" id="test">
						        	<option value="" >고용형태</option>
						            <option value="계약직">계약직</option>
						            <option value="정규직">정규직</option>
						       	</select>
							</li>
						</ul>
						
					<div class="form-floating">
						<input type="text" class="form-control" id="registerId" name="memId" value="${memberId}"> 
						<label for="registerId">아이디</label>
					</div>
				</div>
				</div>
				<div>
					<div class="password-form">
						<div class="form-floating">
							<input type="password" class="form-control" id="registerPassword" name="memPwd"> 
							<label for="registerPassword">비밀번호</label>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="registerPassword2" name="memPwd2"> 
							<label for="registerPassword">비밀번호 확인</label>
						</div>
					</div>
					<span class ="error" style="height:5px; font-size: 12px;"></span>
				</div>
				<div class="form-floating">
					<input type="text" class="form-control" id="registerName" name="memName"> 
					<label for="registerName">이름</label>
				</div>
				<div class="detail">
					<div class="form-floating">
						<input type="text" class="form-control" id="birth" name="memBirth" maxlength="10"> 
						<label for="birth">생년월일</label>
					</div>
					<div class="form-floating">
						<input type="text" class="form-control" id="phoneNum" maxlength="13" name="memTel">
						<label for="phoneNum">전화번호</label>
					</div>
				</div>
				<div class='detail'>
					<div class="form-floating">
						<input type="text" class="form-control" id="sal" name="memSal" style="width:100%;">
						<label for="sal">연봉</label>
					</div>
					<div class="form-floating">
						<input type="text" class="form-control" id="contract" name="contractStart" maxlength="10"> 
						<label for="contract">입사일</label>
					</div>

				</div>
			    <div class="firstdiv">
			    	<div class="form-floating address">
			    		<input type="text" class="form-control" id="zipcode" readonly="readonly" name="memZipcode">
				        <label for="zipcode">우편번호</label>
			    	</div>
			    	<div class="findZipcode">
				        <input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림" onclick="sample4_execDaumPostcode()">
			    	</div>
			    </div>
			    <div class="form-floating">
			        <input type="text" name="memAddress" id="addressDetail" title="주소"  class="form-control"  readonly="readonly">
			        <label for="addressDetail">주소</label>
				</div>
			    <div class="form-floating">
			        <input type="text" name="memAddressDetail" id="addressDetail2" title="상세주소"  class="form-control">
			        <label for="addressDetail2">상세주소</label>
				</div>
				
				<button class="confirm" type="submit">등록</button>
			</form>
		</div>
	</div>
</div>
 <%@include file="../inc/bottom.jsp"%>    