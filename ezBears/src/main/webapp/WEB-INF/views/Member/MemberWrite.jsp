<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">
<script type="text/javascript" src="<c:url value ='/js/member.js"'/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">	
	$(function(){
		$('.confirm').click(function(){
			if($('#registerId').val().length < 1){
				alert("아이디를 입력해주세요.");
				$('#registerId').focus();
				return false;
			}
			
			if($('#registerPassword').val().length < 1){
				alert("비밀번호를 입력해주세요.");
				$('#registerPassword').focus();
				return false;
			}

			if($('#registerName').val().length < 1){
				alert("이름을 입력해주세요.");
				$('#registerName').focus();
				return false;
			}
			
			if($('#sal').val().length < 1){
				alert("연봉을 입력해주세요.");
				$('#sal').focus();
				return false;
			}
			
		});
		
		//ajax
		
		$('#registerId').keyup(function(event) {
		    var key = event.charCode || event.keyCode || 0;
		    $input = $(this);
		    
		    var value = $input.val();
		    var newValue = value.replace(/[^a-zA-Z0-9_]/g, ''); // 제한된 문자와 숫자만 남기기
		    
		    if (value !== newValue) {
		        $input.val(newValue);
		    }
		    
		    return true;
		});
		
		$('#phoneNum').keydown(function(event) {
		    var key = event.charCode || event.keyCode || 0;
		    $text = $(this); 
		    if (key !== 8 && key !== 9) {
		        if ($text.val().length === 3) {
		            $text.val($text.val() + '-');
		        }
		        if ($text.val().length === 8) {
		            $text.val($text.val() + '-');
		        }
		    }
		 
		    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));           
		});
		
		$('#birth').keydown(function(event) {
		    var key = event.charCode || event.keyCode || 0;
		    $text = $(this); 
		    if (key !== 8 && key !== 9) {
		        if ($text.val().length === 4) {
		            $text.val($text.val() + '-');
		        }
		        if ($text.val().length === 7) {
		            $text.val($text.val() + '-');
		        }
		    }
		 
		    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));           
		});
		
		$('#contract').keydown(function(event) {
		    var key = event.charCode || event.keyCode || 0;
		    $text = $(this); 
		    if (key !== 8 && key !== 9) {
		        if ($text.val().length === 4) {
		            $text.val($text.val() + '-');
		        }
		        if ($text.val().length === 7) {
		            $text.val($text.val() + '-');
		        }
		    }
		 
		    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));           
		});

		//우편번호
	});
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

</script>
<div class="col-12">
	<div class="bg-secondary rounded h-100 p-4">
	<h6 class="mb-4">사원 등록</h6>
		<div class="register">
			<form class="register-form" name="frmRegist" method="post" action="<%=request.getContextPath() %>/Member/write">
				<div class ="imgdiv">
					<img alt="" src="" style="width:150px; height:200px;">
					<input type ="file" name="imageUpload" id="imageUpload"  class="infobox">
				</div>
				<div class ="firstdiv">
					<div class="form-floating">
						<input type="text" class="form-control" id="registerId" name="userId" > 
						<label for="registerId">아이디</label>
					</div>
					<div class="dup">
						<input type="text" id = "btnChkId" value="중복체크">
					</div>	
				</div>
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
			    		<input type="text" class="form-control" id="contract" readonly="readonly">
				        <label for="zipcode">우편번호</label>
			    	</div>
			    	<div class="findZipcode">
				        <input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림" onclick="sample4_execDaumPostcode()">
			    	</div>
			    </div>
			    <div class="form-floating">
			        <input type="text" name="addressDetail" id="addressDetail" title="주소"  class="form-control" readonly="readonly">
			        <label for="addressDetail">주소</label>
				</div>
			    <div class="form-floating">
			        <input type="text" name="addressDetail" id="addressDetail2" title="상세주소"  class="form-control">
			        <label for="addressDetail2">상세주소</label>
				</div>
				<ul class="select-box">
					<li>
				        <select name="dept" id="dept">
				        	<option value="" hidden>부서</option>
				            <option value="management">경영지원팀</option>
				            <option value="operation1">운영1팀</option>
				            <option value="operation2">운영2팀</option>
				            <option value="scout">스카우트팀</option>
				            <option value="marketing">마케팅팀</option>
				       	</select>
					</li>
					<li>
				        <select name="grade" id="grade">
				        	<option value="" hidden>직급</option>
				            <option value="1">인턴</option>
				            <option value="2">사원</option>
				            <option value="3">대리</option>
				            <option value="4">과장</option>
				            <option value="5">차장</option>
				            <option value="6">팀장</option>
				            <option value="7">단장</option>
				            <option value="8">구단주</option>
				       	</select>
					</li>
					<li>
				        <select name="test" id="test">
				        	<option value="" hidden>고용형태</option>
				            <option value="1">계약직</option>
				            <option value="2">정규직</option>
				       	</select>
					</li>
				</ul>
				<button class="confirm" type="submit">등록</button>
				<input type ="text" name="chkId" id="chkId">
			</form>
		</div>
	</div>
</div>
  
 <%@include file="../inc/bottom.jsp"%>    