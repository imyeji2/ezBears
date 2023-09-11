<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="inc/top.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>

<script>
	$(function(){
		//네이버 뉴스 api 호출
		naverNewsLoad();
		setInterval(naverNewsLoad,10000);
		//600000
		
        // onGeoOk();//현재 위치 찾기 -> 시연 시 위치 정보 활성화 불가로 일단 비활성화
        OpenWeatherMap(37.4923615, 127.0292881);
		
        // 차트 컨테이너의 크기에 맞게 canvas 크기 조절
        var chartContainer = document.getElementById('todoChart');
        var canvas = document.getElementById('myChart');
        
        canvas.width = chartContainer.clientWidth;
        canvas.height = chartContainer.clientWidth; // 정사각형으로 유지
        
        // 도넛 차트 데이터 설정
       
        var resultTodo = $('#resultTodo').val();
        
        var ctx = canvas.getContext('2d');
        var myDoughnutChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [resultTodo, 100-resultTodo],
                    backgroundColor: ['#7000D8', '#31354e'],
                    borderColor: ['#7000D8', '#31354e']
                }]
            },
            options: {
                responsive: false,
                maintainAspectRatio: false,
                cutoutPercentage: 60,
                tooltips: { enabled: false },
                hover: { mode: null },
                legend: { display: false }
            }
        });	
        
		
    	$('#changeBoard').on('shown.bs.modal', function () {
    		selectMyBoardList();
    	});
    	
    	
        $('#changeBoard').on('hide.bs.modal', function () {
        	location.reload();   
        });  
    	
    	$('#changeBoardBtn').click(function(){
    		event.preventDefault();
    		var mainMboardNo = $('#mainMboardNo').val();
    		var mBoardNo = $('#mBoardNo').val();
    		
    		if(mainMboardNo === mBoardNo){
    			alert('이미 적용된 보드입니다.');
    			return false;
    		}

    	       $.ajax({
    	            type: 'post',
    	            url: "<c:url value='/ajax_updateMainBoard'/>",
    	            data:{mBoardNo:mBoardNo},
    	            dataType: 'json',
    	            error: function(xhr, status, error) {
    	                alert(error);
    	            },
    	            success: function(res) {
    	                console.log(res);
    	                if(res===1){
    	                	alert('보드가 변경되었습니다.');
    	                	$('#changeBoard').modal('hide');
    	                }else{
    	                	alert('다시 시도해주세요');
    	                	return false;
    	                }
    	            }
    	       });
    	});
    	
		
	});//$(function(){
	
		
		
		
		
		
		
		
	
	//카카오 로컬 api
	function kakaoLocalAPI(lat,lon){
		const apiKey = 'e8b1be33da3da4477e59ef1650fbd429';
		const apiUrl = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x="+lon+"&y="+lat+"&input_coord=WGS84";

		$.ajax({
		  url: apiUrl,
		  type: 'GET',
		  headers: {
		    'Authorization': 'KakaoAK '+ apiKey ,
		  },
		  success: function (data) {
		    // API 요청이 성공한 경우의 처리
		    console.log(data);
		    var address1 = data.documents[0].address.region_1depth_name; 
		    var address2 = data.documents[0].address.region_2depth_name; 
		    var address3 = data.documents[0].address.region_3depth_name;
		    var address = address1 + " " + address2 + " " + address3;
		    $('.place').append(address);
		  },
		  error: function (error) {
			console.error('API 요청 중 오류 발생:', error);
		  },
		});
	}

	//날씨 api 호출
	function OpenWeatherMap(lat,lon){
		$.ajax({
			  url: "https://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&appid=e27bb9d898f2ce8fcd7c8a56b3219198",
			  method: 'GET',
			  dataType: 'json',
			  success: function (data) {
			    console.log(data); 
				//오늘날짜
			    var currentTime = convertTime()+" 날씨";
		        $('.nowtime').append(currentTime);
		        
		        kakaoLocalAPI(lat,lon);
		       
		        var nowTeamp = (data.main.temp -273.15).toFixed(1);
		        var lowTemp = (data.main.temp_min - 273.15).toFixed(1);
		      	var hightTemp = (data.main.temp_max - 273.15).toFixed(1);
		        
		        $('.nowTemp').append(nowTeamp);
		        $('.lowTemp').append(lowTemp);
		        $('.hightTemp').append(hightTemp);

		        //날씨아이콘출력
		        var weathericonUrl =
		            '<img src= "http://openweathermap.org/img/wn/'
		            + data.weather[0].icon +
		            '.png" alt="' + data.weather[0].description + '"/>'

		        $('.weatherIcon').html(weathericonUrl);
		        
			  },
			  error: function (error) {
			    console.error('API 요청 중 오류 발생:', error);
			  },
			});		
	}
		
	
/* 	//현재 위치 (위도, 경도) 찾기 + 날씨 api (OpenWeatherMap API)
    function onGeoOk(position) {
        const lat = position.coords.latitude;
        const lon = position.coords.longitude;
        OpenWeatherMap(lat, lon)
	}
	
	
	
	function onGeoError() {
	    alert("날씨를 제공할 위치를 찾을 수 없습니다.")
	}
	navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError); */
	
	
	//오늘 날짜출력
    function convertTime() {
    	var now = new Date();
    	var year = now.getFullYear();
    	var month = (now.getMonth() + 1).toString().padStart(2, '0');
    	var date = now.getDate().toString().padStart(2, '0');
    	return year + '년 ' + month + '월 ' + date + '일';
       
    }


	
	//네이버 뉴스 api
	function naverNewsLoad(){
		var newContent="";
		
        $.ajax({
            type: 'post',
            url: "<c:url value='/api/naverNews'/>",
            dataType: 'json',
            error: function(xhr, status, error) {
                alert(error);
            },
            success: function(res) {
                console.log(res);
              	$('#naverNews thead').html('');
               	$('#naverNews tbody').html('');
               	
                $.each(res.items, function(idx, item){
                	newContent+="<tr>";
                	newContent+="<td>";
                	newContent+="<a href='"+item.link+"'>"+item.title+"</a>";
                	newContent+="</td>";
                	newContent+="</tr>";
   	
                });

                const TIME_ZONE = 9 * 60 * 60 * 1000; // 9시간
                const d = new Date(res.lastBuildDate);

                const date = new Date(d.getTime() + TIME_ZONE).toISOString().split('T')[0];
                const time = d.toTimeString().split(' ')[0];

                console.log();

                var newsDate="<tr>";
                newsDate+="<th scope='col'>"+date + ' ' + time.substring(0, 5)+" 기준</th>"; // 시간 문자열에서 앞 5글자만 가져옴 (시:분)
                newsDate+="</tr>";


			    
              	$('#naverNews thead').append(newsDate);
               	$('#naverNews tbody').append(newContent);

            }
        });
	}
	
	
	//메인 보드에 변경 할 수 있는 마이보드 리스트 호출
	function selectMyBoardList(){
		var selectDate="";
		
        $.ajax({
            type: 'post',
            url: "<c:url value='/ajax_selectMyBoardList'/>",
            dataType: 'json',
            error: function(xhr, status, error) {
                alert(error);
            },
            success: function(res) {
                console.log(res);
                $('#mBoardNo').html('');
                selectDate="<option selected value='0'>보드 선택</option>";
                $.each(res, function(idx, item){
                	selectDate+="<option value='"+item.M_BOARD_NO+"'>"+item.M_BOARD_NAME+"</option>";
                });
                
                $('#mBoardNo').append(selectDate);

            }
        });			
	}
	
	
</script>

 <!-- Navbar End -->
 <!-- top ë©”ë‰´ ì¢…ë£Œ -->
<div id="main">
<c:if test="${type=='사원'}">
     <!-- 1번째 줄 -->
     <div class="container-fluid pt-4 px-4">
         <div class="row g-4">
             <div class="col-sm-12 col-md-6 col-xl-4">
                 <div class="h-100 bg-secondary rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-2">
                         <h6 class="mb-0">이번 달 업무 달성률</h6>
                        
                     </div>
                     <div class="d-flex align-items-center py-3">
	                     <div class="todoChartBox">
	                     	<div class="todoChart" id="todoChart">
	                     		<canvas id="myChart" ></canvas>
						         <div class="chartText">
						         	<c:if test="${totalCount==0}">
						         		<c:set var="result" value="0"></c:set>
						         	</c:if>
						         	<c:if test="${totalCount!=0}">
						         		<c:set var="result" value="${(completedCount / totalCount) * 100}"></c:set>
						         	</c:if>						         	
						         	
						         	<fmt:formatNumber var="result1" value="${result}" pattern="#,###"/>
						            <span class="chartText1">${result1}%</span><br>
						            <span class="chartText2">미완료 : ${incompleteCount}개</span><br>
						            <span class="chartText2">완료 : ${completedCount}개</span><br>
						            <span class="chartText2">전체 : ${totalCount}개</span>
						            <input type="hidden" id="resultTodo" value="${result1}">
						        </div>
	                     	</div>                    	
	                     </div>            
                     </div>
                    
                 </div>
             </div>

             <div class="col-sm-12 col-md-6 col-xl-4">
                 <div class="h-100 bg-secondary rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-2">
                         <h6 class="mb-0">Weather</h6>
                     </div>
                     <div class="d-flex mb-2 todayWeather">
                     	<div class="weatherContent">
	                       	<div class="place">
	                       		<i class="bi bi-geo-alt-fill"></i>
	                       	</div>
	                       	<div class="weatherIcon"></div>
	                       	<div class="weatherTemp">
	                       		<p class="nowTemp">현재기온 :</p>
	                       		<p class="lowTemp">최저기온 : </p>
	                       		<p class="hightTemp">최대기온 : </p>
	                       	</div>
	                       	<p class="nowtime"></p>
                       	</div>
                     </div>

                 </div>
             </div>
             
             <div class="col-sm-12 col-md-6 col-xl-4 naverNews">
                 <div class="h-100 bg-secondary rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-4">
                         <h6 class="mb-0">최신 뉴스</h6>
                     </div>
                     <table class="table text-truncate" style="max-width: 95%;" id="naverNews">
						 <thead>

						  </thead>
						  <tbody>
						    						    
						</tbody>
					</table>                       
                 </div>
             </div>             
         </div>
     </div>
     <!-- <!-- 1번째 줄 --> 
     

     <!-- 2번째 줄 게시판 모음 -->   
     <div class="container-fluid pt-4 px-4">
         <div class="row g-4">
             <div class="col-sm-12 col-xl-6">
                 <div class="bg-secondary rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-2">
                         <h6 class="mb-0">공지사항</h6>
                     </div>
                     <div class="d-flex align-items-center py-3">
			           		<table class="table">
							 <thead>
							    <tr>
							      <th scope="col">제목</th>
							      <th scope="col">작성자</th>
							      <th scope="col">등록일</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:if test="${empty noticeList}">
							  	<tr>
							  		<th scope="row" colspan="4">등록된 게시글이 없습니다.</th>
							  	</tr>
							  </c:if>
							  <c:if test="${!empty noticeList}">
							  	<c:forEach var="noticeMap" items="${noticeList}">
							  	<fmt:formatDate var="regdate" value="${noticeMap['REGDATE']}" pattern="yyyy-MM-dd"/>
								    <tr>
								      <td>
								      	<a href="<c:url value='/notice/noticeDetail?noticeNo=${noticeMap["NOTICE_NO"]}'/>">
								      		${noticeMap['NOTICE_TITLE']}
								      	</a>
								      </td>
								      <td>${noticeMap['MEM_NAME']}</td>
								      <td>
								      	<c:if test="${noticeMap['DATEGAP']<1}">방금전</c:if>	
							      		<c:if test="${noticeMap['DATEGAP']>=1}">${regdate}</c:if>	
								      </td>
								    </tr>				  		
							  	</c:forEach>
							  </c:if>			    
							</tbody>
						</table>
                     </div>
                 </div>
             </div>
                        
             <div class="col-sm-12 col-xl-6">
                 <div class="bg-secondary text-center rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-2">
                         <h6 class="mb-0">${mBoardName}</h6>
                         <input type="hidden" name="mBoardNo" id="mainMboardNo" value="${mBoardNo}">
                         <a href="" data-bs-toggle="modal" data-bs-target="#changeBoard">변경하기</a>
                     </div>
                     <div class="d-flex align-items-center py-3">
			           		<table class="table">
							 <thead>
							    <tr>
							      <th scope="col">제목</th>
							      <th scope="col">작성자</th>
							      <th scope="col">등록일</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:if test="${empty myNoticeList}">
							  	<tr>
							  		<th scope="row" colspan="4">등록된 게시글이 없습니다.</th>
							  	</tr>
							  </c:if>
							  <c:if test="${!empty myNoticeList}">
							  	<c:forEach var="myNoticeMap" items="${myNoticeList}">
							  	<fmt:formatDate var="regdate" value="${myNoticeMap['REGDATE']}" pattern="yyyy-MM-dd"/>
								    <tr>
								      <td style="text-align:left;">
								      	<a href="<c:url value='/myBoard/teamNoticeDetail?mBoardNo=${myNoticeMap["M_BOARD_NO"]}&teamNoticeNo=${myNoticeMap["TEAM_NOTICE_NO"]}'/>">
								      		${myNoticeMap['TEAM_NOTICE_TITLE']} 
										</a>								      		
								      		
								      </td>
								      <td>${myNoticeMap['MEM_NAME']}</td>
								      <td>
							      		<c:if test="${myNoticeMap['DATEGAP']<1}">방금전</c:if>	
							      		<c:if test="${myNoticeMap['DATEGAP']>=1}">${regdate}</c:if>									      	
								      </td>
								    </tr>				  		
							  	</c:forEach>
							  </c:if>			    
							</tbody>
						</table>
                     </div>
                 </div>
             </div>                
          </div>
     </div>
     
	<!-- Modal -->
	<div class="modal fade" id="changeBoard" data-bs-backdrop="static" data-bs-keyboard="false">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	   	  	<h1 class="modal-title fs-5" style="color:#191C24">보드 선택</h1>
	   	  </div>				    
	      <div class="modal-body">
	      
	      <form name="changeBoardFrm"  method="post" action="<c:url value='#'/>">
      			<div class="changeBoardBox">
			       	<select class="form-select" name="mBoardNo" id="mBoardNo">
				       
					</select>
					<div class="changeBoardBtn">
						<button class="btn btn-outline-secondary" id="changeBoardBtn">변경</button>
					</div>					
				</div>
			</form>
	      </div>
	      <div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div><!-- Modal-footer -->
	    </div><!-- modal-content -->
	  </div>
	</div>
	<!--Modal-->	     
   <!-- 2번째 줄 게시판 끝 -->   
 	</c:if>
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	<!-- 스태프 메인 -->
 	<c:if test="${type=='스태프'}">
     <!-- 1번째 줄 -->
     <div class="container-fluid pt-4 px-4">
         <div class="row g-4">
             <div class="col-sm-12 col-md-6 col-xl-4">
                 <div class="h-100 bg-secondary rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-2">
                         <h6 class="mb-0">공지사항</h6>
                     </div>
                     <div class="d-flex align-items-center py-3">
			           		<table class="table staff">
							 <thead>
							    <tr>
							      <th scope="col">제목</th>
							      <th scope="col">작성자</th>
							      <th scope="col">등록일</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:if test="${empty noticeList}">
							  	<tr>
							  		<th scope="row" colspan="4">등록된 게시글이 없습니다.</th>
							  	</tr>
							  </c:if>
							  <c:if test="${!empty noticeList}">
							  	<c:forEach var="noticeMap" items="${noticeList}">
							  	<fmt:formatDate var="regdate" value="${noticeMap['REGDATE']}" pattern="yyyy-MM-dd"/>
								    <tr>
								      <td>
								      	<a href="<c:url value='/notice/noticeDetail?noticeNo=${noticeMap["NOTICE_NO"]}'/>">
								      		${noticeMap['NOTICE_TITLE']}
								      	</a>
								      </td>
								      <td>${noticeMap['MEM_NAME']}</td>
								      <td>
								     	 <c:if test="${noticeMap['DATEGAP']<1}">방금전</c:if>	
							      		 <c:if test="${noticeMap['DATEGAP']>=1}">${regdate}</c:if>	
								      </td>
								    </tr>				  		
							  	</c:forEach>
							  </c:if>			    
							</tbody>
						</table>
                     </div>
                    
                 </div>
             </div>

             <div class="col-sm-12 col-md-6 col-xl-4">
                 <div class="h-100 bg-secondary rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-2">
                         <h6 class="mb-0">Weather</h6>
                     </div>
                     <div class="d-flex mb-2 todayWeather">
                     	<div class="weatherContent">
	                       	<div class="place">
	                       		<i class="bi bi-geo-alt-fill"></i>
	                       	</div>
	                       	<div class="weatherIcon"></div>
	                       	<div class="weatherTemp">
	                       		<p class="nowTemp">현재기온 :</p>
	                       		<p class="lowTemp">최저기온 : </p>
	                       		<p class="hightTemp">최대기온 : </p>
	                       	</div>
	                       	<p class="nowtime"></p>
                       	</div>
                     </div>

                 </div>
             </div>
             
             <div class="col-sm-12 col-md-6 col-xl-4 naverNews">
                 <div class="h-100 bg-secondary rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-4">
                         <h6 class="mb-0">최신 뉴스</h6>
                     </div>
                     <table class="table text-truncate" style="max-width: 95%;" id="naverNews">
						 <thead>

						  </thead>
						  <tbody>
						    						    
						</tbody>
					</table>                       
                 </div>
             </div>             
         </div>
     </div>
    <!-- 1번째 줄 --> 
    
    
    

     <!-- 2번째 줄 게시판 모음 -->   
     <div class="container-fluid pt-4 px-4">
         <div class="row g-4">
	          <div class="col-sm-12 col-xl-6">
	              <div class="bg-secondary text-center rounded p-4">
						<div class="d-flex align-items-center justify-content-between mb-4">
							<h6 class="mb-0">승률 현황</h6>
						</div>
						<div class="d-flex align-items-center py-3">
	                    	<div class="staffChartBox">
	                     		<div class="staffChart" id="staffChart">							
									<canvas id="myChart3"></canvas>
								</div>
							</div>
						</div>
	              </div>
	          </div>
                        
             <div class="col-sm-12 col-xl-6">
                 <div class="bg-secondary text-center rounded p-4">
                     <div class="d-flex align-items-center justify-content-between mb-2">
                         <h6 class="mb-0">경기기록</h6>
                     </div>
                     <div class="d-flex align-items-center py-3">
			       	 <table class="table">
							 <thead>
							    <tr>
							      <th scope="col">경기날짜</th>
							      <th scope="col">상대팀</th>
							      <th scope="col">결과</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:if test="${empty gameVo}">
							  	<tr>
							  		<th scope="row" colspan="4">등록된 게시글이 없습니다.</th>
							  	</tr>
							  </c:if>
							  <c:if test="${!empty gameVo}">
							  	<c:forEach var="vo" items="${gameVo}">
							  	<fmt:parseDate var="parsedDate" value="${vo.playDate}" pattern="yyyy-MM-dd HH:mm:ss" />
							  	<fmt:formatDate var="playDate" value="${parsedDate}" pattern="yyyy-MM-dd" />
								    <tr>
								      <td>
								      	${playDate}							      		
								      </td>
								      <td>
								      	<a href="<c:url value='/record/gameRecordDetail?recodeNo=${vo.recodeNo}'/>">${vo.otherTeam}</a>
								      </td>
								      <td>${vo.win}</td>
								    </tr>				  		
							  	</c:forEach>
							  </c:if>			    
							</tbody>
						</table>
                     </div>
                 </div>
             </div>                
          </div>
     </div>
   <!-- 2번째 줄 게시판 끝 -->    	 
 	</c:if>
</div><!-- main -->
<script>
/* // 승률 차트
var winrateData = $("#myChart3").data("winlist");

var ctx1 = $("#myChart3").get(0).getContext("2d");
var myChart1 = new Chart(ctx1, {
    type: "bar",
    data: {
        labels: ["4월", "5월", "6월", "7월", "8월", "9월"],
        datasets: [{
                label: "승률",
                data: winrateData,
                backgroundColor: "#7000D8"
            },                
        ]
        },
    options: {
        responsive: true
    }
});
 */
/* var winrateData = $("#myChart3").data("winlist");

var ctx1 = $("#myChart3").get(0).getContext("2d");
var myChart1 = new Chart(ctx1, {
    type: "bar",
    data: {
        labels: ["4월", "5월", "6월", "7월", "8월", "9월"],
        datasets: [{
                label: "승률",
                data: winrateData,
                backgroundColor: "#7000D8"
            },                
        ]
        },
    options: {
        responsive: true
    }
}); 
 */
 // 페이지 로드 후 실행
 $(function() {
     // AJAX 요청 보내기
     $.ajax({
         url: "ajax_winRate",
         type: "GET",
         dataType: "json",
         success: function(data) {
             // 서버에서 받아온 데이터를 사용하여 차트 생성
             var months = [];
             var winRates = [];

             // 데이터 추출
             data.forEach(function(item) {
                 months.push(item.월);
                 winRates.push(item.월별_승률);
             });
             
             // 차트 컨테이너의 크기에 맞게 canvas 크기 조절
             var chartContainer2 = document.getElementById('staffChart');
             var canvas2 = document.getElementById('myChart3');
             
             // 부모 요소의 너비를 100%로 설정
             chartContainer2.style.width = '100%';
             canvas2.style.width = '100%';
            
             
             // 차트 생성
             var ctx = canvas2.getContext("2d");
             var myChart = new Chart(ctx, {
                 type: "bar",
                 data: {
                     labels: months,
                     datasets: [{
                         label: "승률",
                         data: winRates,
                         backgroundColor: "#7000D8"
                     }]
                 },
                 options: {
                     responsive: true,
                     scales: {
                         y: {
                             ticks: {
                                 stepSize: 10 // X 축 레이블 간격 설정
                             }
                         }
                     }
                 }
             });
         },
         error: function(xhr, status, error) {
             console.error(error);
             alert("데이터를 불러오는 도중 오류가 발생했습니다.");
         }
     });
 });
</script>

 <%@include file="inc/bottom.jsp"%>
