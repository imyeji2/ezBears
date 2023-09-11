<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>이젠 베어스 - 그룹웨어 시스템</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
    <script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
    <script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    
    <style>
    	a{
    	color:#7000D8;
    	}
    	
    	.btn-primary{
    	    color: #fff;
		    background-color:#7000D8;
		    border-color:#7000D8;
    	} 
    	
    	
    	.boardTop{
    		width:100%;
    		padding:0px 5px 10px 18px;
    		font-size:16px;
    		font-weight: 800;
    		overflow: hidden;
    	}
    	
    	.boardTop_txt{
    		float: left;
    	}
    	
    	.boardTop_btn{
    		float: right;
    	}
    	
    	.boardTop_btn img:hover{
    		cursor: pointer;
    	}
    </style>

    <!-- 개인 css -->
    <link href="${pageContext.request.contextPath}/css/park.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/gopanju.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/yeji.css" rel="stylesheet">

</head>

<body>
<article class="simpleForm">
	<form name="frmLogin" method="post"	action="<c:url value='/login/login'/>">
<div class="container-fluid position-relative d-flex p-0">
	<!-- Sign In Start -->
	<div class="container-fluid">
		<div class="row h-100 align-items-center justify-content-center"
			style="min-height: 100vh;">
			<div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
				<div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
					<div class="d-flex align-items-center justify-content-between mb-3">
						<!-- <a href="index.html" class=""> -->
							<h3>
								<i class="fa fa-user-edit me-2"></i>로그인
							</h3>
						</a>
						<h3>Sign In</h3>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="userid" id="userid"
							placeholder="name@example.com"> 
							<label for="floatingInput">ID</label>
					</div>
					<div class="form-floating mb-4">
						<input type="password" class="form-control" name="pwd" id="pwd"
							placeholder="Password"> <label for="floatingPassword">Password</label>
					</div>
					<div class="d-flex align-items-center justify-content-between mb-4">
						<div>
							 <select class="form-select mb-3" name="dept" id="dept">
                                <option selected value="front">프론트</option>
                                <option value="staff">스태프</option>
                            </select>
						</div>
						<div class="form-check">
							<input type="checkbox" class="form-check-input" name="chkSave" id="chkSave"
								<c:if test="${!empty cookie.ck_userid }">
									checked="checked"
								</c:if>
							> 
							<label class="form-check-label" for="chkSave">Check me out</label>
						</div>
					</div>
					<input type="submit" class="btn btn-primary py-3 w-100 mb-4" id="lg_submit" value="Sign In">
					<!-- <p class="text-center mb-0">
						Would you like to go back? <a href="">back</a>
					</p> -->
				</div>
			</div>
		</div>
	</div>
	<!-- Sign In End -->
</div>
</form>
</article>
</body>
</html>