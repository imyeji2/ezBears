<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>

<div id=" board_list ">
	<div class="col-sm-12 col-xl-9 board_listbox">
		<br>
		<div class="bg-secondary board_listsize">
			<div class="serch_input">
				<div class="select_box">
					<select class="form-select" aria-label="Default select example">
						<option selected>선택</option>
						<option value="name">이름</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select>
				</div>
				<div class="text_box">
					<input type="text" class="form-control"
						id="exampleFormControlInput1" placeholder="검색어를 입력해주세요">
				</div>

				<div class="serch_btn">
					<button type="button" class="btn btn-dark m-2">검색</button>
				</div>
				<!-- serch_btn -->
			</div>
			<!-- serch_input -->
			<hr>


			<div id="facebook-feed">


				<div class="post">


					<div class="user-profile">


						<img src="user_profile1.jpg" alt="User Profile">


					</div>


					<div class="post-content">


						<div class="post-header">


							<p class="display-name">John Doe</p>


							<p class="post-date">Posted on: August 6, 2023</p>


						</div>


						<div class="post-image">


							<img src="post_image1.jpg" alt="Post Image">


						</div>


						<div class="post-caption">


							<p>This is the caption for post 1. #facebook #feed</p>


						</div>


						<div class="comment-section">


							<div class="comment">


								<p class="comment-author">Jane Smith:</p>


								<p class="comment-content">Nice post! #awesome</p>
							</div>


							<!-- Add more comments here -->


							<div class="comment">


								<p class="comment-author">Mike Johnson:</p>

								


								<p class="comment-content">Great photo! #beautiful</p>
							</div>


						</div>


						<div class="add-comment">


							<input type="text" class="form-control"
								placeholder="댓글입력창">
						</div>
					</div>


				</div>






				<div class="post">


					<!-- Another post with comments and add-comment section -->
				</div>






				<!-- Add more posts here -->
			</div>



		</div>
		<!-- board_search -->
		<br>
	</div>
	<!-- board_search_list  -->





</div>
<%@include file="../inc/bottom.jsp"%>