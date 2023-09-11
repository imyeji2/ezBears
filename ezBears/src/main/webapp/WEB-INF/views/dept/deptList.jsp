<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">


<style>

.addDept {
    outline: none;
    background-color: #191C24;
    border: 1px solid #6C7293;
    color: #fff;
    padding: 5px 15px;
    border-radius: 5px;
}


</style>

<script>
$(function(){
	$('#btnEdit').hide();
});
	
	function cancle() {
	    $('#deptNo').val('');
	    $('#EditdeptName').val('');
	    $('#deptTel').val('');
		$('#btnEdit').hide();
		$('#btnAdd').show();
	}

	function editDeptInfo(deptName, deptNo, deptTel){
		$('#EditdeptName').val(deptName);
		$('#deptTel').val(deptTel);
		$('#deptNo').val(deptNo);
		
		$('#btnEdit').show();
		$('#btnAdd').hide();
	}
	
    // "등록" 버튼 클릭 시
 	function InsertDept(){
    	$('.btn-form').attr('action',"<c:url value='/dept/insert'/>");
    	$('.btn-form').submit();
    }

    // "수정" 버튼 클릭 시
 	function EditDept(){
		$('#deptNo').prop('disabled', false);
		
    	$('.btn-form').attr('action',"<c:url value='/dept/edit'/>");
    	$('.btn-form').submit();
    }

    // "삭제" 버튼 클릭 시
    
    function DelDept(){

		$('#deptNo').prop('disabled', false);
		
		var chkbox = $('.deptChk:checked');
		
		if(chkbox.length > 0){
			if (confirm("삭제하시겠습니까?")) {
		        var deptNo = $('.deptChk:checked').closest('tr').find('.selectdeptNo').val();
		        var url = "<c:url value='/dept/delete?deptNo=" + deptNo + "'/>";
		        $('.btn-form').attr('action', url);
		        $('.btn-form').submit();
			}else {
		    	event.preventDefault();
			}
		}else{
			alert("삭제할 부서를 선택해주세요.");
			event.preventDefault();
		}
    }
    

</script>
	<div class="col-12">
	    <div class="bg-secondary rounded h-100 p-4" id="rounded">
	    	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	           <ol class="breadcrumb">
	             <li class="breadcrumb-item active" aria-current="page">
	                <a href="<c:url value='/dept/list'/>">부서 관리</a>
	             </li>
	           </ol>
	         </nav>
	        <form class="btn-form" name="frm1" method="post">
				<div class = "btns">
					<input type="hidden" class="addDept" id = "deptNo" name ="deptNo" placeholder="부서번호" disabled="disabled">
					<input type="text" class="addDept" id = "EditdeptName" name ="deptName" placeholder="부서명">
					<input type="text" class="addDept" id = "deptTel"  name ="deptTel" placeholder="부서전화번호">
					<button type="submit" class="btnAdd" id="btnAdd" onclick = "InsertDept()" value="등록">등록</button>
					<button type="submit" class="btnEdit" id="btnEdit" onclick = "EditDept()"value="수정">수정</button>
					<button type="button" class="cancel" id="cancel" onclick="cancle()" value="취소">취소</button>
					<button type="submit" class="btnDelete" id="btnDelete"  onclick = "DelDept()"value="삭제">삭제</button>
				</div>
				<br>
		        <div class="table-responsive">
		            <table class="table">
		                <thead>
		                    <tr>
		                        <th scope="col">-</th>
		                        <th scope="col">번호</th>
		                        <th scope="col">부서이름</th>
		                        <th scope="col">전화번호</th>
		                        <th scope="col">사원 수</th>
		                    </tr>
		                </thead>
		                <tbody>
							<c:if test="${empty list}">
			                	<tr>
			                		<td colspan="3" style="text-align: center">부서가 존재하지 않습니다.</td>
			                	</tr>
			                </c:if>
			                <c:if test="${!empty list}">
			                	<c:forEach var="deptVo" items="${list}"> 
			                		<tr class="memList">
			                			<td><input type="checkbox" class="deptChk"></td>
			                			<td ondblclick="editDeptInfo('${deptVo.deptName}','${deptVo.deptNo}','${deptVo.deptTel}')" class ="deptNoTd"><input type="text" class = "selectdeptNo" value="${deptVo.deptNo}"></td>
			                			<td ondblclick="editDeptInfo('${deptVo.deptName}','${deptVo.deptNo}','${deptVo.deptTel}')">${deptVo.deptName}</td>
			                			<td ondblclick="editDeptInfo('${deptVo.deptName}','${deptVo.deptNo}','${deptVo.deptTel}')">${deptVo.deptTel}</td>
			                			<td>
			                				<c:choose>
				                				<c:when test="${deptVo.deptNo eq '2'}">
				                					<a href="<c:url value='/staff/staffList'/>">${staffCnt}</a>
				                				</c:when>
				                				<c:when test="${deptVo.deptNo eq '3'}">
				                					<a href="<c:url value='/team/teamList'/>">${teamCnt}</a>
				                				</c:when>
				                				<c:otherwise>
					                				<a href="<c:url value='/Member/list?searchKeyword=${deptVo.deptName}'/>">
							                			${deptVo.memberCount}
					                				</a>
				                				</c:otherwise>
			                				</c:choose>
			                			</td>
			                		</tr>
			                	</c:forEach>
			                </c:if>
		                </tbody>
		            </table>
		        </div>
	        </form>

			<br>
			<c:if test="${pagingInfo.firstPage>1 }">
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
			</c:if>
	    </div>
	</div>

<%@include file="../inc/bottom.jsp"%>    