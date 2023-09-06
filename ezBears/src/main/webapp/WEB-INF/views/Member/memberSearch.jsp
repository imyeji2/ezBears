<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(function(){
	    $('.pop_rel_keywords').hide();
	    
	    $('#searchbox').click(function(){
	    	$('#searchbox').focus();
	    	 $('.pop_rel_keywords').hide();
	    });
	    
	    $('#searchbox').keyup(function(){
	        var wordlength = $('#searchbox').val().trim().length;
	        
	        if(wordlength === 0){
	            $('.pop_rel_keywords').hide();
	        }else{
	            $.ajax({
	                url: "<c:url value='/Member/memberSearch'/>",
	                type: "get",
	                data: {"searchbox" : $("#searchbox").val()},
	                dataType:"json",
	                success:function(res){
	                    if(res.length > 0){
	                        var html = "";
	                        
	                        $.each(res, function(index, item){
	                            var memListVo = item.memListVo;
	                            var index = word.toLowerCase().indexOf($("#searchbox").val().toLowerCase());
	                            var length = $("#searchbox").val().length;
	                            
	                            // 검색한 부분 색깔 바꾸기
	                         /*    var result = word.substr(0,index) + "<span style='color:#7000D8;'>" + word.substr(index, length) + "</span>" + word.substr(index + length); */
	                            html += "<span class='result' style='cursor:pointer;'>" + memListVo.memName + "</span><br>";
	                        });
	                        
	                        $('.pop_rel_keywords').html(html);
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
    padding-bottom: 15px;
}
.allMem {
    display: flex;
    align-items: center;
}
.pop_list {
    display: flex;
    padding-left: 12px;
    color: #fff;
}
</style>

<div class="form-control bg-dark border-0" id="sec">
   <div class="pop_rel_keywords">
		<c:if test="${empty list}">
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
        </c:if>
   </div>
</div> --%>