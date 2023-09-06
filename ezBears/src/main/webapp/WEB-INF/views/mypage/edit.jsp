<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>

<input type="hidden" id="sample6_extraAddress" placeholder="참고항목"><!-- 없애면 주소입력 및 창이 안꺼짐  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function mypagEdit() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memZipcode').value = data.zonecode;
                document.getElementById("memAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("memAddressDetail").focus();
            }
        }).open();
    }
</script>
<article class="simpleForm">
<div class="form-container">
	<form action="<c:url value='/mypage/mypage'/>" method="post">
	
		<div class="container-fluid">
			<div class="row h-100 align-items-center justify-content-center"
				style="min-height: 100vh;">
				<div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
					<div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
						<div
							class="d-flex align-items-center justify-content-between mb-3">
							<a href="index.html" class="">
								<h3 class="text-primary">
									<i class="fa fa-user-edit me-2"></i>회원정보 수정
								</h3>
							</a>
						</div>
						<div class="form-floating mb-3">
						    <input type="text" name="memId" id="id" class="form-control" id="floatingText" value="${sessionScope.userid}" disabled>
						    <label for="floatingText">아이디</label>
						</div>
						<div class="form-floating mb-3">
						    <input type="text" name="memName" id="name" class="form-control" id="floatingText" value="${sessionScope.name}" disabled>
						    <label for="floatingText">이름</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" name="memZipcode" id="memZipcode" class="form-control" id="floatingText" value="${memberVo.memZipcode }"> 
							<label for="floatingText">우편번호</label>
							<input class="btn btn-primary w-30 m-2" type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림" onclick="mypagEdit()"><br/>
						</div>
						<div class="form-floating mb-3">
							<input type="text" name="memAddress" id="memAddress" class="form-control" id="floatingText" value="${memberVo.memAddress }"> 
							<label for="floatingText">주소</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" name="memAddressDetail" id="memAddressDetail" class="form-control" id="floatingText" value="${memberVo.memAddressDetail }"> 
							<label for="floatingText">상세주소</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" name="memTel" id="hp" class="form-control" id="floatingInput" value="${memberVo.memTel }"> 
							<label for="floatingInput">핸드폰 번호(- 포함)</label>
						</div>
						
						<button type="submit" class="btn btn-primary py-3 w-100 mb-4">수정</button>
						<p class="text-center mb-0">
							Would you like to go back? <a href="<c:url value='/'/>">click</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		
	</form>
</div>
</article>
<%@include file="../inc/bottom.jsp"%>