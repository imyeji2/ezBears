<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		var url =window.location.pathname;
		var type =url.lastIndexOf("/");
		var id= url.substr(type+1);
		$('#'+id).addClass('active');
		
		$('#dept').hide();
		
		
		$('#selectTo').change(function() {
            var selectedValue = $(this).val();
            if (selectedValue === 'selectDept') {
                $('#dept').show();
            } else {
                $('#dept').hide();
            }
        });
		
	});
	
</script>
<style>
input.sender {
    background: none;
    border: none;
    color: #fff;
}

select#selectTo, select#dept {
    outline: none;
    cursor: pointer;
    padding: 10px 15px;
    border-radius: 5px;
    background-color: #000;
    color: #fff;
    border: 0;
}

textarea#MSGtextArea {
    background: none;
    border-radius: 5px;
    width: 700px;
    height: 300px;
}

input.MSGContext {
    background: none;
    border: none;
    color: #fff;
}
</style>

	<div class="col-12">
	    <div class="bg-secondary rounded h-100 p-4" id="rounded">
	    <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	           <ol class="breadcrumb">
	             <li class="breadcrumb-item active" aria-current="page">
	                <a href="<c:url value='/Member/list'/>">사원관리</a>
	             </li>
	           </ol>
	         </nav>
	        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			    <li class="nav-item" role="presentation">
			        <a class="nav-link tap_txt" id="list" href="<c:url value='/Member/list'/>">사원 리스트</a>
			    </li>
			    <li class="nav-item" role="presentation">
			        <a class="nav-link tap_txt" id="sendMSG" href="<c:url value='/Member/sendMSG'/>">SMS전송</a>
			    </li>                                 
			</ul>
			<div class = "sendto">
				<input type="text" class = "sender" value = "받는사람">
		        <select name="selectTo" id="selectTo">
		        	<option value="" >전송 대상</option>
					<option >전체</option>
					<option class="selectDept" value="selectDept">부서별</option>
		       	</select>
		       	<select name="deptNo" id="dept">
		        	<option value="" >부서</option>
					<!-- 반복문 -->
					<c:forEach var="deptVo" items="${deptList}">
						<option value ="${deptVo.deptNo}">${deptVo.deptName}</option>
					</c:forEach>
					<!-- 반복문 -->
		       	</select>
			</div>
			<div class = "msgContext">
				<input type="text" class = "MSGContext" value = "내용">
				<textarea class = "MSGContext" id="MSGtextArea"></textarea>
			</div>
	    </div>
	</div>

<%@include file="../inc/bottom.jsp"%>    