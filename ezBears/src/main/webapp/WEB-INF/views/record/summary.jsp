<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body class="baseball flat _fs pid_34 detailbody responsive" style="">
	<div class="container__detail">
		<div id="detail" class="container__detailInner">
			<div class="fixedHeaderDuel fixedHeaderDuel--isHidden">
				<div class="fixedHeaderDuel__homeLogo ">
				
<c:set var="totalErrorsHome" value="${totalErrorsHome + map.ERRORS }"></c:set> 

					<div class="fixedHeaderParticipant__participantServe"></div>
				</div>
				<div class="smh__score smh__home smh__part--current">
					<c:set var="totalScoreHome" value="0" />
					<c:forEach var="map" items="${list }">
						<c:if
							test="${map['INNING'] == '1회초' || map['INNING'] == '2회초' || map['INNING'] == '3회초' || map['INNING'] == '4회초' || map['INNING'] == '5회초' || map['INNING'] == '6회초' || map['INNING'] == '7회초' || map['INNING'] == '8회초' || map['INNING'] == '9회초'}">
							<div
								class="smh__part smh__home smh__part--${map.INNING.charAt(1)}">${map.R}</div>
							<c:set var="totalScoreHome" value="${totalScoreHome + map.R}" />
							
						</c:if>
					</c:forEach>
					<div class="smh__part smh__score smh__home smh__part--current">${totalScoreHome} </div>
				</div>

				<div class="smh__part smh__score smh__away smh__part--current">
					<c:set var="totalScoreAway" value="0" />
					<c:forEach var="map" items="${list }">
						<c:if
							test="${map['INNING'] == '1회말' || map['INNING'] == '2회말' || map['INNING'] == '3회말' || map['INNING'] == '4회말' || map['INNING'] == '5회말' || map['INNING'] == '6회말' || map['INNING'] == '7회말' || map['INNING'] == '8회말' || map['INNING'] == '9회말'}">
							<div
								class="smh__part smh__away smh__part--${map.INNING.charAt(1)}">${map.R}</div>
							<c:set var="totalScoreAway" value="${totalScoreAway + map.R}" />
						</c:if>
					</c:forEach>
					<div class="smh__part smh__score smh__home smh__part--current">${totalScoreAway}</div>
				</div>

				<div class="fixedHeaderDuel__score">
					<div class="detailScore__matchInfo">
						<div class="fixedScore">
							<span></span><span class="fixedScore__divider">-</span><span></span>
						</div>
					</div>
				</div>
				<div class="fixedHeaderDuel__awayLogo ">
					<a class="fixedHeaderParticipant__participantLink" title="프로필 보기"><img
						class="participant__image" loading="lazy" alt="삼성"
						src="https://static.flashscore.com/res/image/data/AgKvnmEa-lpOlJAuM.png"></a>
					<div class="fixedHeaderParticipant__participantServe"></div>
				</div>
			</div>

			<div>
				<div>
					<div style="height: 100px; --adsHeight: 100px;">
						<div class="adscontent" id="lsadvert-detail_leaderboard">
							<iframe id="lsadvert-zid-4961-iframe"
								name="banx-detail_leaderboard" frameborder="0" scrolling="no"
								style="width: 640px; height: 100px;" banner-id="151407"></iframe>
						</div>
					</div>
				</div>
				<div class="adsclear"></div>
				<div class="adsenvelope adstextpad banx-detail_leaderboard_mobile"
					id="lsadvert-zid-4959"
					style="width: 320px; --adsWidth: 320px; display: none;">
					<div style="height: 50px; --adsHeight: 50px;">
						<div class="ads__text ads__text--h"></div>
					</div>
				</div>
				<div class="adsenvelope adstextvpad banx-detail_leaderboard_tablet"
					id="lsadvert-zid-4960"
					style="width: 640px; --adsWidth: 640px; display: none;">
					<div style="height: 100px; --adsHeight: 100px;">
						<div class="adscontent" id="lsadvert-detail_leaderboard_tablet">
							<iframe data-body-class="tablet_ad" id="lsadvert-zid-4960-iframe"
								name="banx-detail_leaderboard_tablet" frameborder="0"
								scrolling="no"
								style="allowTransparency: true; visibility: hidden; width: 640px; height: 100px"></iframe>
						</div>

					</div>
				</div>
			</div>

			<div></div>
			<div class="tournamentHeader tournamentHeaderDescription"></div>
			<div class="duelParticipant">
				<div class="duelParticipant__startTime">
					<div class="playDate">${gameVo.playDate }</div>
				</div>
				
				
				<div class="duelParticipant__home duelParticipant--winner">
					<a
						class="participant__participantLink participant__participantLink--team"
						 title="프로필 보기"><img
						class="participant__image" loading="lazy" alt="두산"
						src="https://static.flashscore.com/res/image/data/bJkMHaZA-UV1Mu7H3.png"></a>
					<div class="participant__participantServe"></div>
					<div class="participant__participantNameWrapper">
						<div class="participant__participantIcon"></div>
						<div class="participant__participantName participant__overflow">
							이젠</div>
					</div>
				</div>

				<div class="duelParticipant__score">
					<div class="detailScore__matchInfo">
						<div class="detailScore__wrapper">
							<span> <c:if test="${gameVo.ground != '잠실'}">
								${totalScoreHome}
							</c:if> <c:if test="${gameVo.ground == '잠실'}">
								${totalScoreAway}
							</c:if> </span>
						<span class="detailScore__divider">-</span><span><c:if test="${gameVo.ground != '잠실'}">
								${totalScoreAway}
							</c:if> <c:if test="${gameVo.ground == '잠실'}">
								${totalScoreHome}
							</c:if></span>
						</div>

					</div>
				</div>
				<div class="duelParticipant__away ">
					<div></div>
					<a
						class="participant__participantLink participant__participantLink--team"
						title="프로필 보기"><img class="participant__image" loading="lazy"
						alt="삼성"
						src="https://static.flashscore.com/res/image/data/AgKvnmEa-lpOlJAuM.png"></a>
					<div class="participant__participantServe"></div>
					<div class="participant__participantNameWrapper">
						<div class="participant__participantName participant__overflow">
							${gameVo.otherTeam }</a>
						</div>
						<div class="participant__participantIcon"></div>
					</div>
				</div>
			</div>
			<div class="tab detail__tab"></div>
			<div class="filter detail__filter"></div>
			<div class="matchReportBoxes"></div>
			<div elementtiming="SpeedCurveFRP">
				<div class="section">
					<div class="smh__summaryHeader section__title">득점</div>
					<div class="smh__template baseball">
						<div class="smh__header smh__header__score" title="득점">R</div>
						<div class="smh__header smh__header__part--1" title="1회">1</div>
						<div class="smh__header smh__header__part--2" title="2회">2</div>
						<div class="smh__header smh__header__part--3" title="3회">3</div>
						<div class="smh__header smh__header__part--4" title="4회">4</div>
						<div class="smh__header smh__header__part--5" title="5회">5</div>
						<div class="smh__header smh__header__part--6" title="6회">6</div>
						<div class="smh__header smh__header__part--7" title="7회">7</div>
						<div class="smh__header smh__header__part--8" title="8회">8</div>
						<div class="smh__header smh__header__part--9" title="9회">9</div>

						<div class="smh__border"></div>
						<div class="smh__service smh__home"></div>
						<div class="smh__participantName smh__home">
							<c:if test="${gameVo.ground != '잠실'}">
								이젠
							</c:if>
							<c:if test="${gameVo.ground == '잠실'}">
								${gameVo.otherTeam }
							</c:if>
						</div>

						<div class="smh__part smh__score smh__home smh__part--current">${totalScoreHome}
						</div>
						<c:forEach var="map" items="${list }">
							<c:if test="${map['INNING'] == '1회초'}">
								<div class="smh__part  smh__home smh__part--1" id="inning1Home">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '2회초'}">
								<div class="smh__part  smh__home smh__part--2" id="inning2Home">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '3회초'}">
								<div class="smh__part  smh__home smh__part--3" id="inning3Home">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '4회초'}">
								<div class="smh__part  smh__home smh__part--4" id="inning4Home">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '5회초'}">
								<div class="smh__part  smh__home smh__part--5" id="inning5Home">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '6회초'}">
								<div class="smh__part  smh__home smh__part--6" id="inning6Home">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '7회초'}">
								<div class="smh__part  smh__home smh__part--7" id="inning7Home">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '8회초'}">
								<div class="smh__part  smh__home smh__part--8" id="inning8Home">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '9회초'}">
								<div class="smh__part  smh__home smh__part--9" id="inning9Home">${map.R }</div>
							</c:if>
						</c:forEach>
						
						<div class="smh__service smh__away"></div>
						<div class="smh__participantName smh__away">
							<c:if test="${gameVo.ground == '잠실'}">
						이젠
					</c:if>
							<c:if test="${gameVo.ground != '잠실'}">
						${gameVo.otherTeam }
					</c:if>
						</div>
						<div class="smh__part smh__score smh__away smh__part--current">${totalScoreAway}</div>
						<c:forEach var="map" items="${list }">
							<c:if test="${map['INNING'] == '1회말'}">
								<div class="smh__part  smh__away smh__part--1" id="inning1Away">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '2회말'}">
								<div class="smh__part  smh__away smh__part--2" id="inning2Away">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '3회말'}">
								<div class="smh__part  smh__away smh__part--3" id="inning3Away">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '4회말'}">
								<div class="smh__part  smh__away smh__part--4" id="inning4Away">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '5회말'}">
								<div class="smh__part  smh__away smh__part--5" id="inning5Away">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '6회말'}">
								<div class="smh__part  smh__away smh__part--6" id="inning6Away">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '7회말'}">
								<div class="smh__part  smh__away smh__part--7" id="inning7Away">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '8회말'}">
								<div class="smh__part  smh__away smh__part--8" id="inning8Away">${map.R }</div>
							</c:if>
							<c:if test="${map['INNING'] == '9회말'}">
								<div class="smh__part  smh__away smh__part--9" id="inning9Away">${map.R }</div>
							</c:if>
						</c:forEach>
						<div class="smh__pitchers">
							투수: <span class="smh__nbsp">${gameVo.firstPitcher} [EZN]
								(승)</span>
						</div>
					</div>
				</div>
			</div>

			<div class="section">
				<div class="mi__header section__title">경기 정보</div>
				<div class="mi__data">
					<div class="mi__item">
						<span class="mi__item__name"><svg class="spectators-ico ">
							</svg>경기장:</span><span class="mi__item__val">${gameVo.ground }</span>
					</div>
				</div>
			</div>
		</div>
	</div>
<c:if test="${sessionScope.type eq '스태프'}">
	<div class="center">
		<a
			href="<c:url value='/record/gameEdit?recodeNo=${gameVo.recodeNo }'/>"
			style="color: white;">수정</a> | <a
			href="<c:url value='/record/gameDelete?recodeNo=${gameVo.recodeNo }'/>"
			style="color: white;">삭제</a> | <a
			href="<c:url value='/record/gameList'/>" style="color: white;">목록</a>
	</div>
	<div class="center">
		<a
			href="<c:url value='/record/inningWrite?recodeNo=${param.recodeNo }'/>"
			style="color: white;">이닝 정보 등록</a> | <a
			href="<c:url value='/record/inningEdit?recodeNo=${param.recodeNo }'/>"
			style="color: white;">수정</a> | <a
			href="<c:url value='/record/inningDelete?recodeNo=${param.recodeNo }'/>"
			style="color: white;">삭제</a>
	</div>		
		
</c:if>
	<script>
		// JavaScript를 사용하여 vo.R 값들을 가져와 합계 계산
		// 아래 주석은 실제 코드에 맞게 수정해야 합니다.
		/*     var voValues = []; // vo.R 값들을 저장할 배열

		 // vo.R 값들을 가져와 배열에 저장
		 var voElements = document.querySelectorAll('.smh__part--current');
		 voElements.forEach(function(element) {
		 var voValue = parseInt(element.textContent);
		 voValues.push(voValue);
		 });

		 // 배열의 합계 계산
		 var totalRSum = voValues.reduce(function(sum, value) {
		
		 return sum + value;
		 }, 0);

		 // 합계를 화면에 표시
		 var totalRSumElement = document.getElementById('totalRSum');
		 totalRSumElement.textContent = totalRSum; */

		//회차별 득점 정보 구하기
		/* 	var listFromController = ${list};
		 var inningElements = document.querySelectorAll('[id*="inning"]');
		 var inning = 
		 var score = 
		
		 inningElements.forEach(function(element) {
		 if (element.id === 'inning1Away') {
		 // 'inning1Away' 요소에 대한 작업 수행
		
		 }
		 }); */
	</script>