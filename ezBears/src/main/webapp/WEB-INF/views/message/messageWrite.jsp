<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/choong/chi.css" rel="stylesheet">

<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
		<div class="col-sm-12 col-xl-12">
		    <div class="bg-secondary rounded h-100 p-4">
	    
		    <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	           <ol class="breadcrumb">
	             <li class="breadcrumb-item active" aria-current="page">
	                <a href="<c:url value='/message/messageList'/>">메세지</a>
	             </li>
	             <li class="breadcrumb-item active" aria-current="page">메세지 작성</li>
	           </ol>
	         </nav>
	         <!-- 여기까지 nav -->
	         <br>
	         <div class="msgWrite" style="width: 50%">
	         	
	         	<form name="frmWrite" method="post" action="<c:url value='/message/messageWrite'/>">
	         		<!-- 발신자 hidden 으로 넘길거! -->
	         		<input type="hidden" id="sendUserNo" name="sendUserNo" value="${sendUserNo }">
		         	<!-- <div class="form-floating mb-3">
	                    <input type="text" class="form-control" id="receiveUserId" placeholder="receiveUserId" name="receiveUserId" style="width: 400px">
	                    <label for="floatingInput">받는사람</label>
	                </div> -->
	                <div class="form-floating mb-3">
                            <select class="form-select" id="receiveUserId"
                                aria-label="Floating label select example" name="receiveUserNo" style="width: 400px">
								<!-- 반복문 -->
								<option value="">선택</option>
								<c:forEach var="mem" items="${memList}">
									<option value ="${mem['MEM_NO']}"
										<c:if test="${mem['MEM_NO'] == receiveNo}">
											selected
										</c:if>
									>${mem['DEPT_NAME']} ${mem['POSITION_NAME']} ${mem['MEM_NAME']}</option>
								</c:forEach>
								<!-- 반복문 -->
                            </select>
                            <label for="floatingSelect">받는 사람을 선택하세요</label>
                        </div>
	                <div class="form-floating">
                        <textarea class="form-control" placeholder="Leave a comment here"
                            id="content" name="content" style="height: 130px; width: 400px"></textarea>
                        <label for="floatingTextarea">Comments</label>
                        <br>
		                <button type="submit" class="btn btn-primary" id="btnSubmit" style="width: 400px">메세지 보내기</button>
                    </div>
	            </form>
	            
	            
		        
		         
	         </div>
	         <br>
	         <div class="center" style="margin-left: 100px">
	        	<a href="<c:url value='/message/receiveBox'/>" style="color: white;">받은 쪽지함</a> |
				<a href="<c:url value='/message/sendBox'/>" style="color: white;">보낸 쪽지함</a>
			</div>
	         
			</div>
		</div>
	</div>
</div>

<%@include file="../inc/bottom.jsp"%>    