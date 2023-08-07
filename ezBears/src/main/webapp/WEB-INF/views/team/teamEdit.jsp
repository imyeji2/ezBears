<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../inc/top.jsp"%>

       <!-- Sign In Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="index.html" class="">
                                <h3 style="color:  #6f42c1;">
                                <img src="<c:url value='/img/free-icon-baseball-5407760.png'/>" alt="logo" style="width:30%">
                                Ezen Bears</h3>
                            </a>
                            <h3>Team Edit</h3>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="position_no">
                            <label for="floatingInput">position_no</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="dept_no">
                            <label for="floatingInput">dept_no</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="back_no">
                            <label for="floatingInput">back_no</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="player_name">
                            <label for="floatingInput">player_name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="player_birth">
                            <label for="floatingInput">player_birth</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="height">
                            <label for="floatingInput">height</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="weight">
                            <label for="floatingInput">weight</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="player_sal">
                            <label for="floatingInput">player_sal</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="date" class="form-control" id="floatingInput" placeholder="contract_start">
                            <label for="floatingInput">contract_start</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="date" class="form-control" id="floatingInput" placeholder="contract_done">
                            <label for="floatingInput">contract_done</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="player_tel">
                            <label for="floatingInput">player_tel</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="player_info">
                            <label for="floatingInput">player_info</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="player_status">
                            <label for="floatingInput">player_status</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="player_addr">
                            <label for="floatingInput">player_addr</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="player_addr_detail">
                            <label for="floatingInput">player_addr_detail</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="player_zipcode">
                            <label for="floatingInput">player_zipcode</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="player_image">
                            <label for="floatingInput">player_image</label>
                        </div>
                        <!-- <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="player_id">
                            <label for="floatingInput">player_id</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="player_pwd">
                            <label for="floatingPassword">player_pwd</label>
                        </div> -->
                        <!-- <div class="d-flex align-items-center justify-content-between mb-4">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Check me out</label>
                            </div>
                            <a href="">Forgot Password</a>
                        </div> -->
                        <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Sign In</button>
                        <!-- <p class="text-center mb-0">Don't have an Account? <a href="">Sign Up</a></p> -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign In End -->


 <%@include file="../inc/bottom.jsp"%> 