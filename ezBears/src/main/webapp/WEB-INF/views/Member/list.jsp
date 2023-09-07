<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">
<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}

	$(function(){
		$('.popup-inner').hide();

		$('.popup-background').click(function() {
			$('.popup').removeClass('open');
		});
		
		$('.close-btn').click(function() {
			$('.popup').removeClass('open');
		});
		
		$(document).keyup(function(e) {
		    if (e.key === "Escape") { 
		        $('.popup-inner').hide(); 
		        $('.popup.members-popup').removeClass('open');
		    }
		});
		
		$('.infodiv #btInfo').click(function () {
		    var memNo = $(this).closest('.memList').find('.empNo').val();
		    var staffNo = $(this).closest('.memList').find('.empNo2').val();

		    var data = {};

		    if (memNo) {
		        data.empNo = memNo;
		    } else if (staffNo) {
		        data.empNo = staffNo;
		    }

		    $.ajax({
		        url: "<c:url value='/Member/memberDetail'/>",
		        type: 'get',
		        data: data,
		        dataType: 'json',
		        success: function (res) {
		            console.log(res);
		            if (memNo) {
		                // memNo에 따른 처리
		                $('.popup-inner #previewImage').attr("src", "../img/mem_images/" + res.memberVo.memImage);
		                $('.popup-inner #deptName').val(res.memberVo.deptName);
		                $('.popup-inner #positionName').val(res.memberVo.positionName);
		                $('.popup-inner #memName').val(res.memberVo.memName);
		                $('.popup-inner #memId').val(res.memberVo.memId);
		                $('.popup-inner #memTel').val(res.memberVo.memTel);

		                if(res.memberVo.contractDone != null){
			                $('.popup-inner #staffInfo').val('퇴사');
		                }
		                
		                if (res.memberVo.memBirth) {
		                    $('.popup-inner #memBirth').val(res.memberVo.memBirth.substring(0, 10));
		                }
		            } else if (staffNo) {
		                // staffNo에 따른 처리
		                $('.popup-inner #previewImage').attr("src", "../img/staffImages/" + res.staffVo.staffImage);
		                $('.popup-inner #deptName').val("스태프");
		                $('.popup-inner #positionName').val(res.staffVo.staffPosition);
		                $('.popup-inner #memName').val(res.staffVo.staffName);
		                $('.popup-inner #memId').val(res.staffVo.staffId);
		                $('.popup-inner #memTel').val(res.staffVo.staffTel);
		                $('.popup-inner #staffInfo').val(res.staffVo.staffInfo);

		                if (res.staffVo.staffBirth) {
		                    $('.popup-inner #memBirth').val(res.staffVo.staffBirth.substring(0, 10));
		                }
		            }

		            $('.popup-inner').show();
		            $('.popup.members-popup').addClass('open');
		        },
		        error: function (xhr, status, error) {
		            alert(status + " : " + error);
		        }
		    });
		});
		
	
		$('#MemDeptNo').change(function() {
			
	        var deptName = $(this).val();

	        $('#txtboxSearch').val(deptName);
	        $('form[name=frm1]').submit();
	    });
		
	    $('.searchAll').click(function() {
	    	
	        $('#txtboxSearch').val('');
	        $('form[name=frm1]').submit();
	    });
		
	})

</script>
<style>

.table tbody {
    display: flex;
    flex-wrap: wrap;
}

tr.memList {
    width: 330px;
}


</style>
<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" action="<c:url value='/Member/memberInfo'/>">
	<input type="hidden" name="currentPage">	
	<input type="hidden" id="keywordBox" name="searchKeyword" value="${param.searchKeyword}">
</form>
<!-- 페이징 처리 form 끝 -->

	<div class="col-12">
	    <div class="bg-secondary rounded h-100 p-4" id="rounded">
		    <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	           <ol class="breadcrumb">
	             <li class="breadcrumb-item active" aria-current="page">
	                <a href="<c:url value='/Member/memberInfo'/>">주소록</a>
	             </li>
	             <li class="breadcrumb-item active" aria-current="page">사원 리스트</li>
	           </ol>
	         </nav>
	      
			<form class="btn-form" name="frm1" method="post" action="<c:url value ='/Member/memberInfo'/>">
				<div class="btns">
					<input type="text" class ="txtboxSearch" id="txtboxSearch" name="searchKeyword" value="${param.searchKeyword}" placeholder="검색어를 입력해주세요" style="text-align: center;">
					<button type="submit" class="btnSearch" id="btnSearch" >
						<img class ="searchImg" alt="" src="<c:url value='/img/search.png'/>" >
					</button>
				</div>
			
				<br>
		        <div class="table-responsive">
		            <table class="table">
		                <thead>
		                    <tr>
		                        <th scope="col" style="text-align: center">
									<div>
										<c:if test="${empty param.searchKeyword}">
										   <p class="Allcnt">총 ${pagingInfo.totalRecord}명의 사원이 검색되었습니다.</p>
										</c:if>   
										<c:if test="${!empty param.searchKeyword}">
										   <p class="Allcnt">'${param.searchKeyword}' 검색한 결과, ${pagingInfo.totalRecord}명의 사원이 검색되었습니다.</p>
										</c:if>   
									</div>
				                    <div class="searchbtn">
				                    	<button class="searchAll">전체</button>
				                    
				                    	<select name="MemDeptNo" id="MemDeptNo">
								        	<option value="" >부서별</option>
										
											<c:forEach var="deptVo" items="${deptList}">
												<c:if test="${deptVo.deptName != '선수'}">
													<option class="memClass" value ="${deptVo.deptName}">${deptVo.deptName}</option>
												</c:if>
											</c:forEach>
											
								       	</select>
				                    </div>
		                       	</th>
		                    </tr>
		                </thead>
		                <tbody>
		                <c:if test="${empty list}">
		                	<tr>
		                		<td style="text-align: center">사원이 존재하지 않습니다.</td>
		                	</tr>
		                </c:if>
		                <c:if test="${!empty list }">
		                	<c:forEach var="map" items="${list}">
		                		<tr class="memList">
		                			<td>
		                			<div class="perPerson">
										<div class ="imgdiv">
											<c:choose>
											    <c:when test="${map['MEM_IMAGE'] != null}">
											        <c:set var="memImgPath" value="/img/mem_images/${map['MEM_IMAGE']}" />
											    </c:when>
											    <c:when test="${map['STAFF_IMAGE'] != null}">
											        <c:set var="memImgPath" value="/img/staffImages/${map['STAFF_IMAGE']}" />
											    </c:when>
											    <c:otherwise>
											        <c:set var="memImgPath" value="/img/defaultUSER.png" />
											    </c:otherwise>
											</c:choose>
											<img alt="" src="<c:url value='${memImgPath}'/>" style="width: 110px; height: 120px;" class="memberImageInfo" id="previewImage" name="memImage">
										</div>
										<div class = "hiddenNo">
											<c:choose>
												    <c:when test="${map['MEM_NO'] != null}">
												    	<input type="hidden" class="empNo" id="empNo" value = "${map['MEM_NO']}" >
												    </c:when>
												    <c:when test="${map['STAFF_NO'] != null}">
												    	<input type="hidden" class="empNo2" id="empNo2" value = "${map['STAFF_NO']}" >
												    </c:when>
												</c:choose>
										</div>
										<div class = "infodiv">
			                				<a id="AdeptName">${map['DEPT_NAME']}</a>
			                				<br>
			                				<a id="AmemPosition">
				                				<c:choose>
												    <c:when test="${map['POSITION_NAME'] != null}">
												    	${map['POSITION_NAME']}
												    </c:when>
												    <c:when test="${map['STAFF_POSITION'] != null}">
												    	${map['STAFF_POSITION']}
												    </c:when>
												</c:choose>
			                				</a>
			                				<br>
			                				<a id="AmemName">
			                					<c:choose>
												    <c:when test="${map['MEM_NAME'] != null}">
												    	${map['MEM_NAME']}
												    </c:when>
												    <c:when test="${map['STAFF_NAME'] != null}">
												    	${map['STAFF_NAME']}
												    </c:when>
												</c:choose>
											</a>
		                					<br>
		                					<br>
		                					<div class ="twoBt">
		                						<a id="btChat">채팅</a>
		                						<a id="btInfo">정보</a>
		                					</div>
											<%@include file="../Member/memberPopup.jsp"%>    
		                				</div>
	                				</div>
		                		</tr>
		                	</c:forEach>
		                </c:if>
		                </tbody>
		            </table>
		        </div>
	        </form>
	        <div class="divPage" style="text-align: center" >		
				<!-- 페이지 번호 추가 -->		
				<c:if test="${pagingInfo.firstPage>1 }">
					<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">			
					    <img src='<c:url value="/images/first.JPG" />'  border="0">	</a>
				</c:if>
								
				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<c:forEach var="i" begin="${pagingInfo.firstPage }" 
				end="${pagingInfo.lastPage }">
					<c:if test="${i==pagingInfo.currentPage }">
						<span style="color:#7000D8;font-weight:bold" class="curPageNum">${i}</span>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">						
						<a href="#" onclick="pageFunc(${i})" style="color:white" class="etcPageNum">
							${i}
						</a>
					</c:if>
				</c:forEach>
					
				<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
					<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">			
						<img src="<c:url value="/images/last.JPG" />" border="0">
					</a>
				</c:if>
				<!--  페이지 번호 끝 -->
			</div>
	    </div>
	</div>
<%@include file="../inc/bottom.jsp"%>    