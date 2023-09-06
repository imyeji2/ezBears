<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../inc/top.jsp"%>
<script type="text/javascript">

	
</script>

    <!-- Recent Sales Start -->
    <div class="container-fluid pt-4 px-4" id="board_style">
        <div class="bg-secondary text-center rounded">
            <div class="bg-secondary rounded h-100 p-4">
           	 <c:import url="/myBoard/myBoardNavTab?mBoardNo=${mBoardNo}"></c:import>
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active">
						<div id="myBoardMember">
						 
       
						</div><!-- teamNoticeList -->
					</div>
				</div>
            </div>
        </div>
    </div>
    <!-- Recent Sales End -->

 <%@include file="../inc/bottom.jsp"%>    					