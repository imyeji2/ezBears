	$(function(){
	
		
		
		$('.confirm').click(function(){
			if($('#registerId').val().length < 5){
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
		 
		
		$('#registerPassword2').keyup(function(){
			var pwd1 = $('#registerPassword').val();
			var pwd2 = $(this).val();
			
			if(pwd2 !== pwd1){
				$('.error').text('비밀번호가 일치하지 않습니다.').css('color','red');
			
			}else{
				$('.error').text('비밀번호 일치');
			
			}
			
		});
		
		
		$('#phoneNum').on('input', function(event) {
		    var $text = $(this);
		    var inputValue = $text.val();
		    
		    // 정규식을 사용하여 숫자와 하이픈(-)만 남기고 다른 문자 제거
		    var cleanedValue = inputValue.replace(/[^\d-]/g, '');
		    
		    // 숫자가 3개와 8개가 아닐 경우 하이픈 추가
		    if (cleanedValue.length === 3 || cleanedValue.length === 8) {
		        cleanedValue += '-';
		    }
		    
		    // 입력값 업데이트
		    $text.val(cleanedValue);
		});
		 
		$('#birth').on('input', function(event) {
		    var $text = $(this);
		    var inputValue = $text.val();
		    
		    // 정규식을 사용하여 숫자와 하이픈(-)만 남기고 다른 문자 제거
		    var cleanedValue = inputValue.replace(/[^\d-]/g, '');
		    
		    // 숫자가 3개와 8개가 아닐 경우 하이픈 추가
		    if (cleanedValue.length === 4 || cleanedValue.length === 7) {
		        cleanedValue += '-';
		    }
		    
		    // 입력값 업데이트
		    $text.val(cleanedValue);
		});
		 
		$('#contract').on('input', function(event) {
		    var $text = $(this);
		    var inputValue = $text.val();
		    
		    // 정규식을 사용하여 숫자와 하이픈(-)만 남기고 다른 문자 제거
		    var cleanedValue = inputValue.replace(/[^\d-]/g, '');
		    
		    // 숫자가 3개와 8개가 아닐 경우 하이픈 추가
		    if (cleanedValue.length === 4 || cleanedValue.length === 7) {
		        cleanedValue += '-';
		    }
		    
		    // 입력값 업데이트
		    $text.val(cleanedValue);
		});
	});
		
		//우편번호
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
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addressDetail").value = roadAddr;
             
                
            }
        }).open();
    }

