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
	function editDeptInfo(deptName, deptNo, deptTel){
		$('#deptName').val(deptName);
		$('#deptTel').val(deptTel);
		$('#deptNo').val(deptNo);
		
		$('#btnEdit').show();
		$('#btnAdd').hide();
	}
	
    // "등록" 버튼 클릭 시
 	function InsertDept(){
    	$('#deptNo').val('');
    	$('.btn-form').attr('action',"<c:url value='/dept/insert'/>");
    	$('.btn-form').submit();
    }

    // "수정" 버튼 클릭 시
 	function EditDept(){
    	$('.btn-form').attr('action',"<c:url value='/dept/edit'/>");
    	$('.btn-form').submit();
    }

    // "삭제" 버튼 클릭 시
    document.getElementById("btnDelete").onclick = function() {
        document.forms["frm1"].action = "<c:url value='/dept/delete'/>";
        document.forms["frm1"].submit();
    };

</script>
	<div class="col-12">
	    <div class="bg-secondary rounded h-100 p-4">
	        <h6 class="mb-4">부서 관리</h6>
	        <form class="btn-form" name="frm1" method="post">
				<div class = "btns">
					<input type="hidden" class="addDept" id = "deptNo" name ="deptNo" placeholder="부서번호">
					<input type="text" class="addDept" id = "deptName" name ="deptName" placeholder="부서명">
					<input type="text" class="addDept" id = "deptTel"  name ="deptTel" placeholder="부서전화번호">
					<button type="submit" class="btnAdd" id="btnAdd" onclick = "InsertDept()" value="등록">등록</button>
					<button type="submit" class="btnEdit" id="btnEdit" onclick = "EditDept()"value="수정">수정</button>
					<button type="button" class="btnDelete" id="btnDelete">삭제</button>
				</div>
		        <div class="table-responsive">
		            <table class="table">
		                <thead>
		                    <tr>
		                        <th scope="col">-</th>
		                        <th scope="col">번호</th>
		                        <th scope="col">부서이름</th>
		                        <th scope="col">전화번호</th>
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
			                			<td><input type="checkbox"></td>
			                			<td>${deptVo.deptNo}</td>
			                			<td onclick="editDeptInfo('${deptVo.deptName}','${deptVo.deptNo}','${deptVo.deptTel}')">${deptVo.deptName}</td>
			                			<td onclick="editDeptInfo('${deptVo.deptName}','${deptVo.deptNo}','${deptVo.deptTel}')">${deptVo.deptTel}</td>
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