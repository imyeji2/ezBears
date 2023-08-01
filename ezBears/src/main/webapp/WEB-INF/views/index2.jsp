<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 반응형에 필요 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 기본 js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- ck에디터  -->
<script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
<!-- 생성 css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css" />
<style type="text/css">
footer {
    position: fixed !important;
    left: 0 !important;
    bottom: 0 !important;
    width: 100% !important;
    padding: 20px !important;
}
</style>
<script type="text/javascript">
   $(function(){
      $('.admin_menu_box_in').hide();
      
      //마우스 오버 시 반전 효과
      $('.admin_menu_box').hover(function(){
         var img =$(this).find('img').attr('name');
         $(this).addClass('admin_menu_box_hover');
         $(this).find('img').attr('src','<%=request.getContextPath()%>/images/admin/admin_menu_icon_'+img+'(b).svg');

      },function(){
         var img =$(this).find('img').attr('name');
         $(this).removeClass('admin_menu_box_hover');
         $(this).find('img').attr('src','<%=request.getContextPath()%>/images/admin/admin_menu_icon_'+img+'.svg');
      });
     
      
      $('.admin_menu_box').click(function(){
    	  $(this).addClass('admin_menu_box_hover');
      });
      
      $('#statistics').click(function(){
         $('#statistics_menu').slideToggle();
         
      });
      
      $('#board').click(function(){
          $('#board_menu').slideToggle();
       });   
      
   /*    var body = document.body,
      html = document.documentElement;
      var height = Math.max( body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight )-60;
      $('aside').css('height',height);
 */
   });
</script>
<title>무비라이크-관리자 페이지</title>
</head>
<body>
   <div class="wrap"><!-- 전체 div -->
      <header>
         <div>
            <img src="<%=request.getContextPath()%>/images/logo-white.png" class="logo_img">

         </div>
      </header>
      <div class="admin_content">
          <aside id="admin_menu">
               <div class="admin_menu_box" id="movie">
                  <img src="<%=request.getContextPath()%>/images/admin/admin_menu_icon_movie.svg" name="movie" alt="영화관리아이콘 ">
                  <span style="margin-left:20px"><a href="<%=request.getContextPath()%>/admin/movie/movieList.jsp">영화 관리</a></span>
               </div>
               <div class="admin_menu_box" id="main">
                  <img src="<%=request.getContextPath()%>/images/admin/admin_menu_icon_main.svg" name="main" alt="메인관리아이콘 ">
                  <span style="margin-left:20px"><a href="<%=request.getContextPath()%>/admin/collection/collectionList.jsp">컬렉션 관리</a></span>
               </div>   
               <div class="admin_menu_box" id="member">
                  <img src="<%=request.getContextPath()%>/images/admin/admin_menu_icon_member.svg" name="member" alt="회원영관리아이콘 ">
                  <span style="margin-left:20px"><a href="<%=request.getContextPath()%>/admin/member/memberList.jsp">회원 정보 관리</a></span>
               </div>   
               <div class="admin_menu_box" id="board">
                  <img src="<%=request.getContextPath()%>/images/admin/admin_menu_icon_board.svg" name="board" alt="게시판관리아이콘 ">
                  <span style="margin-left:20px"><a href="#">공지/FAQ등록</a></span>
               </div>   
               
               <div class="admin_menu_box_in" id="board_menu">
	                <div>
	                   <img src="<%=request.getContextPath()%>/images/admin/admin_menu_icon_arrow.svg">
	                   <span><a href="<%=request.getContextPath()%>/admin/board/noticeList.jsp">공지사항</a></span>
	                </div>
	                <div>
	                   <img src="<%=request.getContextPath()%>/images/admin/admin_menu_icon_arrow.svg">
	                   <span><a href="<%=request.getContextPath()%>/admin/board/faqList.jsp">FAQ</a></span>
	                </div>
            
            	</div>
                
               <div class="admin_menu_box" id="review">
                  <img src="<%=request.getContextPath()%>/images/admin/admin_menu_icon_review.svg" name="review" alt="리뷰관리아이콘 ">
                  <span style="margin-left:20px"><a href="<%=request.getContextPath()%>/admin/board/reviewList.jsp">리뷰 관리</a></span>
               </div>   
               <div class="admin_menu_box" id="statistics">
                  <img src="<%=request.getContextPath()%>/images/admin/admin_menu_icon_statistics.svg" name="statistics" alt="통계관리아이콘 ">
                  <span style="margin-left:20px"><a href="<%=request.getContextPath()%>/admin/statistics/adminStatistics.jsp">통계</a></span>
               </div>
              
               <div class="admin_menu_box">
                 <img src="<%=request.getContextPath()%>/images/admin/admin_menu_icon_logout.svg" name="logout" alt="통계관리아이콘 ">
                 <span style="margin-left:20px"><a href="<%=request.getContextPath()%>/admin_login/admin_logout.jsp">로그아웃</a></span>
               </div> 
          </aside> 
                                                     
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>