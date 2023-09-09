<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
		<script type="text/javascript" src="<c:url value='/js/chattingScripts.js'/>"></script>
		<link href="${pageContext.request.contextPath}/css/chattingStyle.css" rel="stylesheet">
    </head>
<style>
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

.chat-container {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 93vh; 
}

.chat-messages {
    flex-grow: 1; 
    overflow-y: auto; 
    padding: 10px;
}

.fixed-textarea {
    width: 100%;
    padding: 10px;
    resize: none; 
    position: fixed; 
    bottom: 0;
    background-color: #f2f2f2;
}
</style>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">채팅</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Dashboard</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Shortcuts</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Overview</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Events</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Profile</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Status</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">채팅 리스트</button>
                      
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
				    <div class="chat-container">
				        <div class="chat-messages">
				            <!-- 채팅 메시지가 표시되는 부분 -->
				        </div>
				        
						<div class="input-group mb-3 chat-input">
						  <textarea class="form-control fixed-textarea" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2"></textarea>
						  <button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
						</div>				            
				        
				    </div>
               </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
