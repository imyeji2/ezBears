<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../inc/top.jsp"%>
	<style>
	
	.nav-link{
		color:#6c7293!important;
	}
	
	.nav-link.active{
		color:#fff!important ;
		background:#7000D8 !important;
	}
	</style>

    <!-- Recent Sales Start -->
    <div class="container-fluid pt-4 px-4">
        <div class="bg-secondary text-center rounded p-4">
            <div class="bg-secondary rounded h-100 p-4">
                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                            aria-selected="true">공지사항</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-profile" type="button" role="tab"
                            aria-controls="pills-profile" aria-selected="false">업무게시판</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-contact" type="button" role="tab"
                            aria-controls="pills-contact" aria-selected="false">스케줄</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-contact1" type="button" role="tab"
                            aria-controls="pills-contact1" aria-selected="false">결재</button>
                    </li>      
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-contact2" type="button" role="tab"
                            aria-controls="pills-contact2" aria-selected="false">웹하드</button>
                    </li>                                  
                </ul>
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                        Sit sanctus et stet dolor kasd kasd takimata. Dolor stet dolores nonumy et dolor et eos lorem et, diam ipsum nonumy elitr sanctus dolores voluptua sit dolor, at et et amet nonumy elitr ea et ipsum. Elitr lorem et dolore invidunt eirmod voluptua lorem sed. Sed eirmod sadipscing eos tempor.
                    </div>
                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                        Invidunt rebum voluptua lorem eirmod dolore. Amet no sed sanctus lorem ea. Nonumy sit stet sit magna. Rebum rebum ipsum clita erat consetetur, sit dolor sit clita et amet. Est et clita dolore takimata, sea dolores tempor erat consetetur lorem. Consetetur sea sadipscing dolor et dolores et stet, tempor elitr.
                    </div>
                    <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                        Et diam et est sed vero ipsum voluptua dolor et, sit eos justo ipsum no ipsum amet sed aliquyam dolore, ut ipsum sanctus et consetetur. Sit ea sit clita lorem ea gubergren. Et dolore vero sanctus voluptua ipsum sadipscing amet at. Et sed dolore voluptua dolor eos tempor, erat amet.
                    </div>
                    <div class="tab-pane fade" id="pills-contact1" role="tabpanel" aria-labelledby="pills-contact1-tab">
						결재
                    </div>
                    <div class="tab-pane fade" id="pills-contact2" role="tabpanel" aria-labelledby="pills-contact2-tab">
						웹하드
                    </div>
                                                            
                </div>
            </div>
        </div>
    </div>
    <!-- Recent Sales End -->


   
 <%@include file="../inc/bottom.jsp"%>       
