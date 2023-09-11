<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
/* CSS 스타일 */
.stat__home {
	background-color: #7000D8; /* 홈팀 색상 */
}

.stat__away {
	background-color: red; /* 어웨이팀 색상 */
}
</style>


    <div class = "background" style = "background-color: white;">
	<div class="subFilter detail__subFilter detail__subFilter--stats">
		<div role="tablist" class="subFilter__group">
			<a title="경기" class="active"
				href="#/match-summary/match-statistics/0" aria-current="page"><button
					role="tab" class="subFilter__filter subFilter__filter--selected">경기</button></a>

		</div>
	</div>
	
					<div class="smh__score smh__home smh__part--current">
					
					<c:set var="totalScoreHome" value="0" />
					<c:set var="totalHitHome" value="0" />
					<c:set var="totalErrorsHome" value="0" />
					<c:set var="totalHRHome" value="0" />
					<c:set var="totalFBHome" value="0" />
					<c:set var="totalStealHome" value="0" />
					<c:set var="totalLeftOnBaseHome" value="0" />
					
					<c:forEach var="map" items="${list }">
						<c:if
							test="${map['INNING'] == '1회초' || map['INNING'] == '2회초' || map['INNING'] == '3회초' || map['INNING'] == '4회초' || map['INNING'] == '5회초' || map['INNING'] == '6회초' || map['INNING'] == '7회초' || map['INNING'] == '8회초' || map['INNING'] == '9회초'}">
							<div
								class="smh__part smh__home smh__part--${map.INNING.charAt(1)}"></div>
							<c:set var="totalHitHome" value="${totalHitHome + map.H }" />
							<c:set var="totalErrorsHome" value="${totalErrorsHome + map.ERRORS }" />
							<c:set var="totalHRHome" value="${totalHRHome + map.HR }" />
							<c:set var="totalFBHome" value="${totalFBHome + map.FOURBALL }" />
							<c:set var="totalStealHome" value="${totalStealHome + map.STEAL }" />
							<c:set var="totalScoreHome" value="${totalScoreHome + map.R}" />
							<c:set var="totalLeftOnBaseHome" value="${totalLeftOnBaseHome + map.LEFT_ON_BASE }" />
						</c:if>
					</c:forEach>
				</div>

				<div class="smh__part smh__score smh__away smh__part--current">
				
					<c:set var="totalScoreAway" value="0" />
					<c:set var="totalHitAway" value="0" />
					<c:set var="totalErrorsAway" value="0" />
					<c:set var="totalHRAway" value="0" />
					<c:set var="totalFBAway" value="0" />
					<c:set var="totalStealAway" value="0" />
					<c:set var="totalLeftOnBaseAway" value="0" />
					
					<c:forEach var="map" items="${list }">
						<c:if
							test="${map['INNING'] == '1회말' || map['INNING'] == '2회말' || map['INNING'] == '3회말' || map['INNING'] == '4회말' || map['INNING'] == '5회말' || map['INNING'] == '6회말' || map['INNING'] == '7회말' || map['INNING'] == '8회말' || map['INNING'] == '9회말'}">
							<div
								class="smh__part smh__away smh__part--${map.INNING.charAt(1)}"></div>
							<c:set var="totalHitAway" value="${totalHitAway + map.H }" />
							<c:set var="totalErrorsAway" value="${totalErrorAway + map.ERRORS }" />
							<c:set var="totalHRAway" value="${totalHRAway + map.HR }" />
							<c:set var="totalFBAway" value="${totalFBAway + map.FOURBALL }" />
							<c:set var="totalStealAway" value="${totalStealAway + map.STEAL }" />
							<c:set var="totalScoreAway" value="${totalScoreAway + map.R}" />
							<c:set var="totalLeftOnBaseAway" value="${totalLeftOnBaseAway + map.LEFT_ON_BASE }" />
						</c:if>
					</c:forEach>
				</div>

	<div class="section">
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">${totalHitHome + map.H }</div>
				<div class="stat__categoryName">안타</div>
				<div class="stat__awayValue">${totalHitAway + map.H }</div>
			</div>



		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">${totalErrorsHome + map.ERRORS }</div>
				<div class="stat__categoryName">실책</div>
				<div class="stat__awayValue">${totalErrorsAway + map.ERRORS }</div>
			</div>



		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">${totalHRHome + map.HR }</div>
				<div class="stat__categoryName">홈런</div>
				<div class="stat__awayValue">${totalHRAway + map.HR }</div>
			</div>


		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">${totalFBHome + map.FOURBALL }</div>
				<div class="stat__categoryName">볼넷</div>
				<div class="stat__awayValue">${totalFBAway + map.FOURBALL }</div>
			</div>


		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">${totalStealHome + map.STEAL }</div>
				<div class="stat__categoryName">도루</div>
				<div class="stat__awayValue">${totalStealHome + map.STEAL }</div>
			</div>



		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">${totalLeftOnBaseHome + map.LEFT_ON_BASE }</div>
				<div class="stat__categoryName">잔루</div>
				<div class="stat__awayValue">${totalLeftOnBaseAway + map.LEFT_ON_BASE }</div>
			</div>


		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">${totalScoreHome + map.R}</div>
				<div class="stat__categoryName">득점</div>
				<div class="stat__awayValue">${totalScoreAway + map.R}</div>
			</div>


		</div>
	</div>
</div>



<script>
    // JavaScript를 사용하여 그래프 너비 동적으로 조절
    const homeValues = document.querySelectorAll('.stat__homeValue');
    const awayValues = document.querySelectorAll('.stat__awayValue');
    const homeBars = document.querySelectorAll('.stat__barBg.stat__home');
    const awayBars = document.querySelectorAll('.stat__barBg.stat__away');

    homeValues.forEach((homeValue, index) => {
        const homeScore = parseFloat(homeValue.textContent);
        const awayScore = parseFloat(awayValues[index].textContent);
        const totalScore = homeScore + awayScore;
        const homePercentage = (homeScore / totalScore) * 100;
        const awayPercentage = (awayScore / totalScore) * 100;

        homeBars[index].querySelector('.stat__worseSideOrEqualBackground').style.width = `${homePercentage}%`;
        awayBars[index].querySelector('.stat__worseSideOrEqualBackground').style.width = `${awayPercentage}%`;
    });    

</script>

