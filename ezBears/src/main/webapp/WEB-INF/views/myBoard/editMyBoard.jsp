<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="editMyBoard" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		<div class="modal-header">
			<h1 class="modal-title fs-5" id="staticBackdropLabel" style="color:#191C24">나의보드 수정</h1>
		</div><!-- modal-header -->	    
		<div class="modal-body">
		<form name="addMyBoardFrm" method="post" action="<c:url value='/myBoard/addMyBoard'/>">
			<input type="hidden" name="memNo" value="${memNo}">
			<div id="addBox">
				<div class="input-group mb-3">
				  <input type="text" class="form-control" name="MBoardName"placeholder="추가할 보드 이름을 입력하세요" 
				  aria-label="추가할 보드 이름을 입력하세요" aria-describedby="button-addon2" id="editBoardName">
				  <button class="btn btn-outline-secondary" type="button" id="AddBoardBtn">추가</button>
				</div>
				<p id="addBoardError" style="color:red"></p>
			</div><!-- addBox -->
		</form>	
      </div><!-- modal-body -->
      <div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div><!-- Modal-footer -->
    </div><!-- modal-content -->
  </div>
</div>
<!--Modal-->	