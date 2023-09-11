<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/Dcss.css" rel="stylesheet">
<script>
	$(function(){
		
		
	    $('.pop_rel_keywords').hide();
	    $('#sec').hide();
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
	    
	    
	     $(document).on('click', function(event){
	         if (!$(event.target).closest('.pop_rel_keywords').length && !$(event.target).is('#searchbox')) {
	             $('.pop_rel_keywords').hide();
	             $('#sec').hide();
	         }
	     });
	    
	     $(document).on('click','.totalInfo', function(event){
	    	 var memNo = $(this).find('.empNo').val();
	            var staffNo = $(this).find('.empNo2').val();

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
	                    
	                    if (memNo) {
	                        // memNo에 따른 처리
		                	var MemImgUrl = "<c:url value='/img/mem_images/" + res.memberVo.memImage + "'/>";
	                        $('.popup-inner #pop_previewImage').attr("src", MemImgUrl);
	                        $('.popup-inner #deptName').val(res.memberVo.deptName);
	                        $('.popup-inner #positionName').val(res.memberVo.positionName);
	                        $('.popup-inner #memName').val(res.memberVo.memName);
	                        $('.popup-inner #memId').val(res.memberVo.memId);
	                        $('.popup-inner #memTel').val(res.memberVo.memTel);

	                        if(res.memberVo.contractDone != null){
	                            $('.popup-inner #staffInfo').val('퇴사');
	                        }
	                        
	                        if(res.memberVo.memImage === null){
		                        $('.popup-inner #previewImage').attr("src", "<c:url value='/img/defaultUSER.png'/>");
	                        }

	                        if (res.memberVo.memBirth) {
	                            $('.popup-inner #memBirth').val(res.memberVo.memBirth.substring(0, 10));
	                        }
	                    } else if (staffNo) {
		                	var StaffImgUrl = "<c:url value='/img/staffImages/" + res.staffVo.staffImage + "'/>";
	                        // staffNo에 따른 처리
	                        $('.popup-inner #pop_previewImage').attr("src",StaffImgUrl);
	                        $('.popup-inner #deptName').val("스태프");
	                        $('.popup-inner #positionName').val(res.staffVo.staffPosition);
	                        $('.popup-inner #memName').val(res.staffVo.staffName);
	                        $('.popup-inner #memId').val(res.staffVo.staffId);
	                        $('.popup-inner #memTel').val(res.staffVo.staffTel);
	                        $('.popup-inner #staffInfo').val(res.staffVo.staffInfo);

	                        if(res.staffVo.staffImage === null){
		                        $('.popup-inner #pop_previewImage').attr("src", "<c:url value='/img/defaultUSER.png'/>");
	                        }
	                        
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
	                        	 html += "<div class = 'hiddenMemNo'><input type='hidden' class ='empNo' value='"+item.MEM_NO +"'></div>" ;
	                         }else if (item.STAFF_NAME != null){
	                        	 html += "<div class = 'searchMemName'>"+item.STAFF_NAME +"</div><div class = 'searchMemID'>" + item.STAFF_ID +"</div><div class = 'searchMemDept'>" + item.DEPT_NAME +"  /  "+item.STAFF_POSITION+ "</div>" ;
	                        	 html += "<div class = 'hiddenMemNo'><input type='hidden' class ='empNo2' value='"+item.STAFF_NO +"'></div>" ;
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
    cursor: pointer;
}
.totalInfo:hover {
	background-color: #7000D8;
}
</style>

<div class="form-control bg-dark border-0" id="sec">
   <div class="pop_rel_keywords">
		
   </div>
   <%@include file="../Member/memberPopup.jsp"%>
</div>