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

<style>
.lf__sides {
    display: block; /* 다른 스타일 속성들 */
}
</style>

	
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
		<c:forEach var="map" items="${list2 }">
			<c:if test="${map['B_POSITION_NO'] == 1 }">
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
	

</div>
</div>
<br><br>
<c:if test="${sessionScope.type eq '스태프'}">
	<div class="divBtn">
		<a href="<c:url value='/record/pitcherRecordWrite?recodeNo=${param.recodeNo }'/>">투수 기록정보
			등록</a>
	</div>
	<div class="divBtn">
		<a href="<c:url value='/record/pitcherRecordEdit?recodeNo=${param.recodeNo} '/>">투수 기록정보
			수정</a>
	</div>
	<div class="divBtn">
		<a href="<c:url value='/record/pitcherRecordDelete?recodeNo=${param.recodeNo }'/>">투수 기록정보
			삭제</a>
	</div>
	
	<div class="divBtn">
		<a href="<c:url value='/record/hitterRecordWrite?recodeNo=${param.recodeNo }'/>">타자 기록정보
			등록</a>
	</div>
	<div class="divBtn">
		<a href="<c:url value='/record/hitterRecordEdit?recodeNo=${param.recodeNo }'/>">타자 기록정보
			수정</a>
	</div>
	<div class="divBtn">
		<a href="<c:url value='/record/hitterRecordDelete?recodeNo=${param.recodeNo }'/>">타자 기록정보
			삭제</a>
	</div>
</c:if>
