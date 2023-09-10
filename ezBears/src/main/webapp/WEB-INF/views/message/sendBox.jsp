<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/choong/chi.css" rel="stylesheet">

<script type="text/javascript">
	$(function () {
		
		$('.btnDel').click(function () {
			if(confirm('선택 목록을 삭제하시겠습니까?')){
				var delNo = $('.delNo:checked').val();
				if(!delNo){
					alert('삭제할 쪽지를 선택해주세요.');
					return false;
				}
				/*
				이거 주석 풀면 메세지 한개 지우는 기능은 됨
				근데 다중삭제 도전
				else{
					
		            
	                var url = "<c:url value='/message/receiveMessageDel?delNo=" + delNo + "'/>";
	                $('.btnDel').attr('action', url); 
					$('.btnDel').submit();
				}
				*/
			}
			else{
				return false;
			};
			
		})
		
	})
</script>

<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
		<div class="col-sm-12 col-xl-12">
		    <div class="bg-secondary rounded h-100 p-4">
	    
		    <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	           <ol class="breadcrumb">
	             <li class="breadcrumb-item active" aria-current="page">
	                <a href="<c:url value='/message/messageList'/>">메세지</a>
	             </li>
	             <li class="breadcrumb-item active" aria-current="page">보낸 쪽지함</li>
	           </ol>
	         </nav>
	         <!-- 여기까지 nav -->
	         <h3 style="text-align: center;">보낸 쪽지함</h3><br>
	         
	         <table class="table table-hover">
	         	<form action="<c:url value='/message/sendMessageDel'/>" >
		            <thead>
		                <tr style="border-top: 1px solid white;">
		                	<th scope="col"><input type="submit" value="삭제" class="btnDel"></th>
		                    <th scope="col">받는사람</th>
		                    <th scope="col">내용</th>
		                    <th scope="col">보낸날짜</th>
		                </tr>
		            </thead>
			         <tbody>
			         <div class="msgTotal">
				         <div class = "msgList" style="width: 30%;">
				         	<c:if test="${empty sendBoxList }">
				         		<tr>
			            			<td colspan="3">검색 결과가 없습니다.</td>
			            		</tr>
				         	</c:if>
				         	<c:if test="${!empty sendBoxList }">
				            	<c:forEach var="map" items="${sendBoxList }">
					                <tr>
					                	<td style="text-align: center;">
					                		<%-- <input type="checkbox" class="delNo" name="ReceiveMessages[${idx }].messageSendNo" value="${map['MESSAGESENDNO'] }"> --%>
				                			<input type="checkbox" class="delNo" name="messageSendNos" value="${map['MESSAGESENDNO'] }">
				                		</td>
					                	<td scope="row">
						                    <a href="<c:url value='/message/messageWrite?receiveNo=${map.RECEIVEUSERNO }'/>" style="color: #fff">
						                    	${map['RECEIVERDEPT'] }  ${map['RECEIVERPOSITION'] }  ${map['RECEIVER'] }
						                    </a>
					                    </td>
					                    <td style="width: 70%">${map['CONTENT'] }</td>
					                    <th><fmt:formatDate value="${map['SENDTIME'] }" pattern="yyyy-MM-dd HH:mm:ss"/></th>
					                </tr>
				            	</c:forEach>
			            	</c:if>
				         	
				         </div>
				         
				         
			         </div>
		            </tbody>
		        </table>
	         
		         <div class="center" style="text-align: center;">
					<a href="<c:url value='/message/messageWrite'/>" style="color: white;">메세지 작성</a> |
		        	<a href="<c:url value='/message/receiveBox'/>" style="color: white;">받은 쪽지함</a>
				</div>
	         
	         
	         
			</div>
		</div>
	</div>
</div>

<%@include file="../inc/bottom.jsp"%>    