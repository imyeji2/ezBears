<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
        document.addEventListener('DOMContentLoaded', function() {
            // 모든 탭 버튼 요소를 선택
            const tabButtons = document.querySelectorAll('.subFilter__filter');

            // 모든 탭 컨텐츠 요소를 선택
            const tabContents = document.querySelectorAll('.tab-content_detail');

            // 초기에는 첫 번째 탭을 선택한 것으로 설정
            let selectedTabIndex = 0;

            // 각 탭 버튼에 클릭 이벤트 리스너 추가
            tabButtons.forEach(function(button, index) {
                button.addEventListener('click', function() {
                    // 클릭된 탭 버튼에 대한 데이터-title 속성을 가져옴
                    const targetTitle = button.getAttribute('data-title');

                    // 선택된 탭 버튼 스타일 업데이트
                    tabButtons[selectedTabIndex].classList.remove('active');
                    button.classList.add('active');

                    // 해당 탭의 인덱스를 찾아서 저장
                    selectedTabIndex = index;

                    // 모든 탭 컨텐츠 숨김
                    tabContents.forEach(function(content) {
                        content.style.display = 'none';
                    });

                    // 선택된 탭 버튼에 해당하는 컨텐츠를 보이게 함
                    const selectedContent = document.querySelector('#tab-' + (index + 1));
                    if (selectedContent) {
                        selectedContent.style.display = 'block';
                    }
                });
            });
        });
 </script>    
    
<div class="background" style="background-color: white;">
	<div role="tablist" class="subFilter__group">
		<a title="경기" aria-current="page" class="active"
			href="#/match-summary/match-statistics/0"><button role="tab"
				class="subFilter__filter subFilter__filter--selected" id="tab-main">경기</button></a>
		<c:forEach begin="1" end="9" var="inning">
			<a title="${map['INNING']}"
				href="#/match-summary/match-statistics/${map['INNING']}">
				<button role="tab" class="subFilter__filter" id="tab-${map['INNING']}">
					${map['INNING']}</button>
			</a>
		</c:forEach>
	</div>
	<div class="tab-content" id="tab-main">
		<c:forEach var="map" items="${list }">
		<div>
			<div class="section">
				<div class="stat__row">
					<div class="stat__category">
					<c:if test="${map['INNING'].includes('초')}">
						<div class="stat__homeValue">"${map.H }"</div>
					</c:if>
						<div class="stat__categoryName">안타</div>
						<div class="stat__awayValue">9</div>
					</div>
					<div class="stat__bar">
						<div class="stat__barBg stat__home">
							<div class="stat__worseSideOrEqualBackground"
								data-testid="homeBar" style="width: 50%;"></div>
						</div>
						<div class="stat__barBg stat__away">
							<div class="stat__worseSideOrEqualBackground"
								data-testid="awayBar" style="width: 50%;"></div>
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
								data-testid="homeBar" style="width: 100%;"></div>
						</div>
						<div class="stat__barBg stat__away">
							<div class="stat__worseSideOrEqualBackground"
								data-testid="awayBar" style="width: 0%;"></div>
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
							<div class="stat__worseSideOrEqualBackground"
								data-testid="homeBar" style="width: 50%;"></div>
						</div>
						<div class="stat__barBg stat__away">
							<div class="stat__worseSideOrEqualBackground"
								data-testid="awayBar" style="width: 50%;"></div>
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
							<div class="stat__worseSideOrEqualBackground"
								data-testid="homeBar" style="width: 44%;"></div>
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
							<div class="stat__worseSideOrEqualBackground"
								data-testid="homeBar" style="width: 50%;"></div>
						</div>
						<div class="stat__barBg stat__away">
							<div class="stat__worseSideOrEqualBackground"
								data-testid="awayBar" style="width: 50%;"></div>
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
							<div class="stat__worseSideOrEqualBackground"
								data-testid="homeBar" style="width: 50%;"></div>
						</div>
						<div class="stat__barBg stat__away">
							<div class="stat__worseSideOrEqualBackground"
								data-testid="awayBar" style="width: 50%;"></div>
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
							<div class="stat__worseSideOrEqualBackground"
								data-testid="homeBar" style="width: 50%;"></div>
						</div>
						<div class="stat__barBg stat__away">
							<div class="stat__worseSideOrEqualBackground"
								data-testid="awayBar" style="width: 50%;"></div>
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
							<div class="stat__worseSideOrEqualBackground"
								data-testid="homeBar" style="width: 46%;"></div>
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
							<div class="stat__worseSideOrEqualBackground"
								data-testid="awayBar" style="width: 47%;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	
<c:forEach var="map" items"${list }">
	<div class="tab-content_detail" id="tab-1">

		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">0</div>
				<div class="stat__categoryName">안타</div>
				<div class="stat__awayValue">0</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__defaultBackground" data-testid="homeBar"
						style="width: 50%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__defaultBackground" data-testid="awayBar"
						style="width: 50%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">0</div>
				<div class="stat__categoryName">실책</div>
				<div class="stat__awayValue">0</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__defaultBackground" data-testid="homeBar"
						style="width: 50%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__defaultBackground" data-testid="awayBar"
						style="width: 50%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">0</div>
				<div class="stat__categoryName">홈런</div>
				<div class="stat__awayValue">0</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__defaultBackground" data-testid="homeBar"
						style="width: 50%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__defaultBackground" data-testid="awayBar"
						style="width: 50%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">0</div>
				<div class="stat__categoryName">타점</div>
				<div class="stat__awayValue">0</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__defaultBackground" data-testid="homeBar"
						style="width: 50%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__defaultBackground" data-testid="awayBar"
						style="width: 50%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">0</div>
				<div class="stat__categoryName">볼넷</div>
				<div class="stat__awayValue">0</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__defaultBackground" data-testid="homeBar"
						style="width: 50%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__defaultBackground" data-testid="awayBar"
						style="width: 50%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">0</div>
				<div class="stat__categoryName">삼진</div>
				<div class="stat__awayValue">2</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__worseSideOrEqualBackground" data-testid="homeBar"
						style="width: 0%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__barIsFullAway stat__betterSideBackground"
						data-testid="awayBar" style="width: 100%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">0</div>
				<div class="stat__categoryName">도루</div>
				<div class="stat__awayValue">0</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__defaultBackground" data-testid="homeBar"
						style="width: 50%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__defaultBackground" data-testid="awayBar"
						style="width: 50%;"></div>
				</div>
			</div>
		</div>
		<div class="stat__row">
			<div class="stat__category">
				<div class="stat__homeValue">3</div>
				<div class="stat__categoryName">타석</div>
				<div class="stat__awayValue">3</div>
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
				<div class="stat__homeValue">0</div>
				<div class="stat__categoryName">타율</div>
				<div class="stat__awayValue">0</div>
			</div>
			<div class="stat__bar">
				<div class="stat__barBg stat__home">
					<div class="stat__defaultBackground" data-testid="homeBar"
						style="width: 50%;"></div>
				</div>
				<div class="stat__barBg stat__away">
					<div class="stat__defaultBackground" data-testid="awayBar"
						style="width: 50%;"></div>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
</div>

<div class="center">
	<a
		href="<c:url value='/record/inningEdit?recodeNo=${gameVo.recodeNo }'/>"
		style="color: white;">수정</a> | <a
		href="<c:url value='/record/inningDelete?recodeNo=${gameVo.recodeNo }'/>"
		style="color: white;">삭제</a> | <a
		href="<c:url value='/record/gameRecordDetail?recodeNo'/>" style="color: white;">목록</a>
</div>

