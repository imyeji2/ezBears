<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link type="text/css" rel="stylesheet"
	href="https://static.flashscore.com/res/_fs/build/LivesportFinderLatin.06df268.css"
	media="all">
<link type="text/css" rel="stylesheet"
	href="https://static.flashscore.com/res/_fs/build/variables.b647ed2.css"
	media="all">
<link type="text/css" rel="stylesheet"
	href="https://static.flashscore.com/res/_fs/build/themes.17e5560.css"
	media="all">
<link type="text/css" rel="stylesheet"
	href="https://static.flashscore.com/res/_fs/build/detail_section_form.86751c8.css"
	media="all">
<link type="text/css" rel="stylesheet"
	href="https://static.flashscore.com/res/_fs/build/detail_sections.b6db74e.css"
	media="all">
<link type="text/css" rel="stylesheet"
	href="https://static.flashscore.com/res/_fs/build/tabs_filters.0656451.css"
	media="all">

	
<div class = "background" style = "background-color: white;">
<div class="lf__lineUp">
	<div class="section">
		<div class="section__title lf__header  section__title--center">타자</div>
		<div class="lf__sidesBox">
			<div class="lf__sides">
		<c:forEach var="map" items="${list }">
			<c:if test="${map['B_POSITION_NO'] != 1 }">
				<div class="lf__side">
					<div class="lf__participant">
						<div class="lf__participantNumber">${map['BACK_NO'] }</div>
						<div class="lf__participantFlag" title="대한민국"></div>
						<div class="lf__participantName">${map['PLAYER_NAME'] }</div>
						<div class="lf__incidents"></div>
					</div>
				</div>
				</c:if>
			</c:forEach>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="section__title lf__header  section__title--center">투수</div>
		<div class="lf__sidesBox">
			<div class="lf__sides">
				<div class="lf__side">
					<div class="lf__participant ">
						<div class="lf__participantNumber">17</div>
						<div class="lf__participantFlag" title="대한민국">
							<span class="flag fl_106" title=""></span>
						</div>
						<div class="lf__participantName">홍건희</div>
						<div class="lf__seasonResult" title="(패, 0-5)">(패, 0-5)</div>
						<div class="lf__incidents"></div>
					</div>
					<div class="lf__participant ">
						<div class="lf__participantNumber">46</div>
						<div class="lf__participantFlag" title="대한민국">
							<span class="flag fl_106" title=""></span>
						</div>
						<div class="lf__participantName">김명신</div>
						<div class="lf__incidents"></div>
					</div>
					<div class="lf__participant ">
						<div class="lf__participantNumber">1</div>
						<div class="lf__participantFlag" title="대한민국">
							<span class="flag fl_106" title=""></span>
						</div>
						<div class="lf__participantName">박치국</div>
						<div class="lf__incidents"></div>
					</div>
					<div class="lf__participant ">
						<div class="lf__participantNumber">43</div>
						<div class="lf__participantFlag" title="도미니카공화국">
							<span class="flag fl_66" title=""></span>
						</div>
						<div class="lf__participantName">R. 알칸타라</div>
						<div class="lf__incidents"></div>
					</div>
					<div class="lf__participant ">
						<div class="lf__participantNumber">29</div>
						<div class="lf__participantFlag" title="대한민국">
							<span class="flag fl_106" title=""></span>
						</div>
						<div class="lf__participantName">이병헌</div>
						<div class="lf__incidents"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
</div>
