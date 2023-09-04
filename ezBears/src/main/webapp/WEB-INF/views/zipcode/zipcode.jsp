<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편주소</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainstyle.css'/>"/>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/paging.js'/>"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_APP_KEY&libraries=services"></script>
<style type="text/css">
	#divZip table{
		width: 430px;
		margin: 15px 0;
	}
	.blue{
		color:#006AD5;
	}
	#divPage{
		text-align: center;
	}
	
</style>

<script type="text/javascript">
	var totalCount=0;
	
	$(function() {
		$('#dong').focus();
		
	    $('#submit').click(function() {
	       if($('#dong').val().length<1){
	          alert("동을 입력하세요.");
	          $('#dong').focus();
	          return false;
	       }
	       
	       $.send(1);  //처음에는 1페이지 내용을 보여준다
	       
	       event.preventDefault();
	    });
	 });

	$.send = function(curPage){
		$('#currentPage').val(curPage);
		
		$.ajax({
			url: "<c:url value='/Member/ajaxZipcode'/>",
			type:"post",
			data:$("#frmZip").serializeArray(),
			dataType:"json",
			success:function(res){
				totalCount=res.results.common.totalCount;
				var errorCode=res.results.common.errorCode;
				var errorMessage=res.results.common.errorMessage;
				
				if(errorCode!=0){
					alert(errorCode +"=>" + errorMessage);
				}else{
					if(res!=null){
						makeList(res);
						pageMake();
					}
				}
			},
			error:function(xhr, status, error){
				alert("에러 발생 : " + error);
			}
		});
		
	}
	
	function makeList(jsonStr){
		//{"results":{"common":{"errorMessage":"정상","countPerPage":"1","totalCount":"16246","errorCode":"0","currentPage":"2"},"juso":[{"detBdNmList":"","engAddr":"160-7 Seocho-daero, Seocho-gu, Seoul","rn":"서초대로","emdNm":"방배동","zipNo":"06661","roadAddrPart2":" (방배동)","emdNo":"01","sggNm":"서초구","jibunAddr":"서울특별시 서초구 방배동 126-1 서초구립방배숲환경도서관","siNm":"서울특별시","roadAddrPart1":"서울특별시 서초구 서초대로 160-7","bdNm":"서초구립방배숲환경도서관","admCd":"1165010100","udrtYn":"0","lnbrMnnm":"126","roadAddr":"서울특별시 서초구 서초대로 160-7 (방배동)","lnbrSlno":"1","buldMnnm":"160","bdKdcd":"0","liNm":"","rnMgtSn":"116502121002","mtYn":"0","bdMgtSn":"1165010100101260001000001","buldSlno":"7"}]}}
		if(totalCount==0){
			$('#divCount').html("");
			$('#divZip').html("<p style='text-align:center'>검색된 내용이 없습니다.</p>");
			
			return;
		}
		
		$('#divCount').html("<p>도로명 주소 검색 결과 ("+ totalCount +"건)</p>");
		
		var str="<table class='box2'>";
		str+="<tr><th style='width:20%'>우편번호</th>";
		str+="<th style='width:80%'>도로명 주소</th></tr>";
		
		$(jsonStr.results.juso).each(function(idx, item){
			var roadAddr = this.roadAddr;	
			var zipNo=this.zipNo;
			str+="<tr>";
			str+="<td>"+zipNo+"</td>";
			str+="<td>";
			str+="<a href='#' onclick='setZipcode(\""+zipNo+"\",\"" +roadAddr +"\")'>";			
			str+= roadAddr + "</a></td>";			
			str+="</tr>";
		});
		
		str+="</table>";
		$('#divZip').html(str);		
	}
	
	function pageMake(){
		//페이징 처리
		var blockSize=10;
		var countPerPage=$('#countPerPage').val();
		pagination($('#currentPage').val(), countPerPage, blockSize, totalCount);
		
		//이전 블럭으로
		var str="";
		if(firstPage>1){
			str+="<a href='#' onclick='$.send("+ (firstPage-1)+")'>";
			str+="<img src='<c:url value='/images/first.JPG'/>'></a>";
		}
		
		//페이지 번호 출력
		for(var i=firstPage;i<=lastPage;i++){
			if(i==currentPage){
				str+="<span style='font-weight:bold;color:blue'>"+ i +"</span>";
			}else{
				str+="<a href='#' onclick='$.send("+i+")'>["+ i +"]</a>";
			}
		}//for
		
		//다음 블럭으로
		if(lastPage < totalPage){
			str+="<a href='#' onclick='$.send("+ (lastPage+1)+")'>";
			str+="<img src='<c:url value='/images/last.JPG'/>'></a>";
		}
		
		$('#divPage').html(str);
	}
	
	//부모창(회원가입 창)에 우편번호, 주소 셋팅하기
	function setZipcode(zipcode, address){
		$(opener.document).find('#zipcode').val(zipcode);
		$(opener.document).find('input[name=address]').val(address);
		
		self.close();
	}
</script>
</head>
<body>
<h2>도로명 주소 검색</h2><br>
<p>	도로명 주소, 건물명 또는 지번을 입력하세요</p>
<p class="blue">검색어 예 : 도로명(반포대로 58), 건물명(독립기념관), 지번(삼성동 25)</p>

	<form name="frmZip" id="frmZip" method="post">
		<label for="dong">지역명 : </label>
		<input type="text" name="dong" id="dong">
		
		<input type="hidden" name="currentPage" id="currentPage" value="1"/> <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
		<input type="hidden" name="countPerPage" id="countPerPage" value="5"/><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) -->
		<input type="hidden" name="resultType" value="json"/> <!-- 요청 변수 설정 (검색결과형식 설정, json) --> 
		<input type="hidden" name="confmKey" id="confmKey" style="width:250px;display:none" value="U01TX0FVVEgyMDIzMDcyNjE3MzY0MDExMzk2NDk="/><!-- 요청 변수 설정 (승인키) -->
		
		<input type="submit" id="submit" value="찾기">
	</form>
	
	<div id="divCount"></div>
	<div id="divZip"></div>
	<div id="divPage"></div>

</body>
</html>

