<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../inc/top.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
                        
<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-sm-12 col-xl-12">
			<div class="bg-secondary rounded h-100 p-4">
				<div class="col-12">
					<div class="bg-secondary rounded h-100 p-4">
						<div id="contents" class="content01">
							<div class="location">
								<h3 class="tit-page">방어율 순위</h3>
								<br>
								<div class="inquiry">
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th scope="col">선수 등번호</th>
													<th scope="col">선수 이름</th>
													<th scope="col">포지션</th>
													<th scope="col">삼진</th>
													<th scope="col">투구이닝</th>
													<th scope="col">평균자책점</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty list3 }">
													<tr>
														<th colspan="6">기록이 존재하지 않습니다.
													</tr>
												</c:if>
												<c:if test="${!empty list3 }">
													<c:forEach var="map" items="${list3 }, ${list4 }">
														<tr>
															<td>${list4[0].['BACK_NO']}</td>
															<td>${list4[0].PLAYER_NAME}</td>
															<td>투수</td>
															<td>${map.SO }</td>
															<td>${map.IP }</td>
															<td>${map.ERA }</td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>
										<br> <br>
									</div>
									<br>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



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
	</div>
</div>
  
 
<script>
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
 
 $(function() {
	 $.ajax({
		url : "ajax_pitcher1",
		data : param,
		type : 'post',
		success : function(data){
			var results = data.Pitcher1;
			var str = '<TR>';
			$.each(results , function(i){
                str += '<TD>' + results[i].back_no + '</TD><TD>' + results[i].BB + '</TD><TD>' + results[i].SO + '</TD>';
                str += '</TR>';
           });
           $("#Pticher1").append(str); 
        },
        error : function(){
            alert("error");
		}
	 })
	 
	 
 }
 
 
 
 
 
 
</script>






<%@include file="../inc/bottom.jsp"%>