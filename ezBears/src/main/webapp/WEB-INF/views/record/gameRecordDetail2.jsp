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

<script>
	
</script>    
    
    <div class = "background" style = "background-color: white;">
	<div class="subFilter detail__subFilter detail__subFilter--stats">
		<div role="tablist" class="subFilter__group">
			<a title="경기" class="active"
				href="#/match-summary/match-statistics/0" aria-current="page"><button
					role="tab" class="subFilter__filter subFilter__filter--selected">경기</button></a><a
				title="1회" class="" href="#/match-summary/match-statistics/1"><button
					role="tab" class="subFilter__filter">1회</button></a><a title="2"
				class="" href="#/match-summary/match-statistics/2"><button
					role="tab" class="subFilter__filter">2</button></a><a title="3"
				class="" href="#/match-summary/match-statistics/3"><button
					role="tab" class="subFilter__filter">3</button></a><a title="4"
				class="" href="#/match-summary/match-statistics/4"><button
					role="tab" class="subFilter__filter">4</button></a><a title="5"
				class="" href="#/match-summary/match-statistics/5"><button
					role="tab" class="subFilter__filter">5</button></a><a title="6"
				class="" href="#/match-summary/match-statistics/6"><button
					role="tab" class="subFilter__filter">6</button></a><a title="7"
				class="" href="#/match-summary/match-statistics/7"><button
					role="tab" class="subFilter__filter">7</button></a><a title="8"
				class="" href="#/match-summary/match-statistics/8"><button
					role="tab" class="subFilter__filter">8</button></a><a title="9"
				class="" href="#/match-summary/match-statistics/9"><button
					role="tab" class="subFilter__filter">9</button></a>
		</div>
	</div>
	
	<div class="section">
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">9</div>
				<div class="stat__categoryName">안타</div>
				<div class="stat__awayValue">9</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__worseSideOrEqualBackground" data-testid="homeBar"
						style="width: 50%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__worseSideOrEqualBackground" data-testid="awayBar"
						style="width: 50%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">1</div>
				<div class="stat__categoryName">실책</div>
				<div class="stat__awayValue">0</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__barIsFullHome stat__betterSideBackground"
						data-testid="homeBar" ></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__worseSideOrEqualBackground" data-testid="awayBar"
						style="width: 0%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">2</div>
				<div class="stat__categoryName">홈런</div>
				<div class="stat__awayValue">2</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__worseSideOrEqualBackground" data-testid="homeBar"
						style="width: 50%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__worseSideOrEqualBackground" data-testid="awayBar"
						style="width: 50%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">4</div>
				<div class="stat__categoryName">타점</div>
				<div class="stat__awayValue">5</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__worseSideOrEqualBackground" data-testid="homeBar"
						style="width: 44%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__betterSideBackground" data-testid="awayBar"
						style="width: 56%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">2</div>
				<div class="stat__categoryName">볼넷</div>
				<div class="stat__awayValue">2</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__worseSideOrEqualBackground" data-testid="homeBar"
						style="width: 50%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__worseSideOrEqualBackground" data-testid="awayBar"
						style="width: 50%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">5</div>
				<div class="stat__categoryName">삼진</div>
				<div class="stat__awayValue">5</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__worseSideOrEqualBackground" data-testid="homeBar"
						style="width: 50%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__worseSideOrEqualBackground" data-testid="awayBar"
						style="width: 50%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">1</div>
				<div class="stat__categoryName">도루</div>
				<div class="stat__awayValue">1</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__worseSideOrEqualBackground" data-testid="homeBar"
						style="width: 50%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__worseSideOrEqualBackground" data-testid="awayBar"
						style="width: 50%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">31</div>
				<div class="stat__categoryName">타석</div>
				<div class="stat__awayValue">36</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__worseSideOrEqualBackground" data-testid="homeBar"
						style="width: 46%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__betterSideBackground" data-testid="awayBar"
						style="width: 54%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">0.29</div>
				<div class="stat__categoryName">타율</div>
				<div class="stat__awayValue">0.25</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__betterSideBackground" data-testid="homeBar"
						style="width: 53%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__worseSideOrEqualBackground" data-testid="awayBar"
						style="width: 47%;"></div>
				</div>
			</div>
		</div>
	</div>

</div>


<c:if test="${sessionScope.type eq '스태프'}">
<div class="center">
	<a
		href="<c:url value='/record/inningEdit?recodeNo=${gameVo.recodeNo }'/>"
		style="color: white;">수정</a> | <a
		href="<c:url value='/record/inningDelete?recodeNo=${gameVo.recodeNo }'/>"
		style="color: white;">삭제</a> | <a
		href="<c:url value='/record/gameRecordDetail?recodeNo'/>"
		style="color: white;">목록</a>
</div>
</c:if>
