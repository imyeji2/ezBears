<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(function(){
	    $('.pop_rel_keywords').hide();
	    $('#sec').hide();

	     $(document).on('click', function(event){
	         if (!$(event.target).closest('.pop_rel_keywords').length && !$(event.target).is('#searchbox')) {
	             $('.pop_rel_keywords').hide();
	             $('#sec').hide();
	         }
	     });
	     
	     
	    $('#searchbox').keyup(function(){
	        var wordlength = $('#searchbox').val().trim().length;
	        
	        if(wordlength === 0){
	            $('.pop_rel_keywords').hide();
	            $('#sec').hide();
	        }else{
	            $.ajax({
	                url: "<c:url value='/Member/memberSearch'/>",
	                type: "get",
	                data: {"searchbox" : $("#searchbox").val()},
	                dataType:"json",
	                success:function(res){
	                	var memberListVO = res.memberListVO;
	                	
	                    if(memberListVO.length > 0){
	                        var html = "";
	                        
	                        $.each(memberListVO, function(index, item){
	                         var imgPath="";
	                         
	                         if(item.MEM_IMAGE != null){
	                         	 imgPath = "<c:url value='/img/mem_images/" + item.MEM_IMAGE + "'/>";
	                         }else if(item.STAFF_IMAGE != null){
	                         	 imgPath = "<c:url value='/img/staffImages/" + item.STAFF_IMAGE + "'/>";
	                         }else{
	                         	 imgPath = "<c:url value='/img/defaultUSER.png'/>";
	                         }

	                         html += "<div class = 'totalInfo'><div class='searchMemImg'><img src='" + imgPath + "' alt='Member Image' style='width: 50px; height:50px; border-radius:40px;'></div>";
	                         
	                         
	                         if(item.MEM_NAME != null){
	                        	 html += "<div class = 'searchMemName'>"+item.MEM_NAME +"</div><div class = 'searchMemID'>" + item.MEM_ID +"</div><div class = 'searchMemDept'>" + item.DEPT_NAME+"  /  "+item.POSITION_NAME + "</div>" ;
	                         }else if (item.STAFF_NAME != null){
	                        	 html += "<div class = 'searchMemName'>"+item.STAFF_NAME +"</div><div class = 'searchMemID'>" + item.STAFF_ID +"</div><div class = 'searchMemDept'>" + item.DEPT_NAME +"  /  "+item.STAFF_POSITION+ "</div>" ;
	                         }
	                         
	                         
	                         html += "</div></div>";
	                         
	                        });
	                        
	                        $('.pop_rel_keywords').html('');
	                        $('.pop_rel_keywords').append(html);
	                        $('#sec').show();
	                        $('.pop_rel_keywords').show();
	                    }
	                },
	                error: function (xhr, status, error) {
	                    alert(status + " : " + error);
	                }
	            });
	        }
	        
	    })
		
	});
</script>
<style>
div#sec {
    display: flex;
    position: relative;
    color: #fff;
}

form.d-none.d-md-flex.ms-4 {
    flex-direction: column;
}

.pop_rel_keywords {
    position: absolute;
    background: #000;
    width: 100%;
    left: 0;
    border-radius: 5px;
    display: flex;
    flex-direction: column;
    padding: 15px 0;
}

.pop_list {
    display: flex;
    padding-left: 12px;
    color: #fff;
}

.searchMemImg {
    margin-left: 20px;
}
.searchMemName {
    width: 100px;
}
.searchMemID {
    width: 170px;
}
.totalInfo {
    display: flex;
    align-items: center;
    gap: 0 8px;
    margin-bottom: 10px;
}
.totalInfo:hover {
	background-color: #7000D8;
}
</style>

<div class="form-control bg-dark border-0" id="sec">
   <div class="pop_rel_keywords">
<%-- 		<c:if test="${empty list}">
       		<span style="text-align: center">사원이 존재하지 않습니다.</span>
        </c:if>
        <c:if test="${!empty list}">
        	<c:forEach var="map" items="${list}">
        	<div class="allMem">
	       			<div class = "searchMiniImg">
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
						<img alt="" src="<c:url value='${memImgPath}'/>" style="width: 50px; height: 50px;" class="memberImageInfo" id="searchMemImg" name="memImage">
	       			</div>
	     
	       			<div class = "selectName">	
	       				<c:choose>
						    <c:when test="${map['MEM_NAME'] != null}">
						        ${map['MEM_NAME']}
						    </c:when>
						    <c:when test="${map['STAFF_NAME'] != null}">
						        ${map['STAFF_NAME']}
						    </c:when>
						</c:choose>
	       			</div>
	       			<div class = "selectID">
	       				<c:choose>
						    <c:when test="${map['MEM_ID'] != null}">
						        ${map['MEM_ID']}
						    </c:when>
						    <c:when test="${map['STAFF_ID'] != null}">
						        ${map['STAFF_ID']}
						    </c:when>
						</c:choose>
	       			</div>
	     
       			</div>
        	</c:forEach>
        </c:if> --%>
   </div>
</div> --%>