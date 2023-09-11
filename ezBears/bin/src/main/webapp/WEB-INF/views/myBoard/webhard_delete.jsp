<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>

<div class="container-fluid pt-4 px-4" id="harddelete">
	<div class="bg-secondary rounded h-100 p-4">
	  <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="<c:url value ='/myBoard/teamNotice'/>">마이보드</a></li>
                <li class="breadcrumb-item active" aria-current="page"><a href="#">개발1팀</a></li>
                <li class="breadcrumb-item active" aria-current="page">웹하드 게시판</li>
              </ol>
            </nav>
		<form name="frmDelete" method="post"
			action="<c:url value='/myBoard/hard_delete'/>">
			<fieldset>
				<legend>웹하드 삭제</legend>
				<input type="hidden" name="no" value=""> <input
					type="hidden" name="oldFileName" value="">

				<div>
					<span class="sp">삭제하시겠습니까?</span>
				</div>
				 <div class="col-sm-12 col-xl-6">
                        <div class="bg-secondary rounded h-100 p-4">
                            <form>
                                <div class="row mb-3">
                                    <label for="inputEmail3" class="col-sm-2 col-form-label">비밀번호</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control pwd" >
                                    </div>
                                </div>
                                </form>
                                </div>
                                </div>
				<div class="center">
					<input type="submit" value="삭제" class="btn btn-sm btn-primary" /> <input
						type="Button" value="웹 하드목록" class="btn btn-sm btn-primary"
						OnClick="location.href='<c:url value='/myBoard/webhard'/>'" />
				</div>
			</fieldset>
		</form>
	</div>
</div>
<%@include file="../inc/bottom.jsp"%>

