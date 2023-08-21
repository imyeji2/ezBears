<!-- 백업 -->>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../inc/top.jsp"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>이젠 베어스 - 그룹웨어 시스템</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
</head>


<div class="container-fluid pt-4 px-4">
	<div class="row g-4">
		<div class="col-sm-12 col-xl-12">
			<div class="bg-secondary rounded h-100 p-4">
				<div class="col-12">
					<div class="bg-secondary rounded h-100 p-4">


						<div id="contents" class="content01">
							<!--sub title & location -->
							<div class="location">
								<h3 class="tit-page">선수조회</h3>
								<!-- // sub title & location -->
								<div class="sub-content">
									<div id="cphContents_cphContents_cphContents_udpRecord">

										<div class="compare">
											<div class="styled-select03 mt5 bar01"></div>
											<div class="styled-select03 mt5">
												<select
													name="ctl00$ctl00$ctl00$cphContents$cphContents$cphContents$ddlPosition"
													onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ctl00$ctl00$cphContents$cphContents$cphContents$ddlPosition\&#39;,\&#39;\&#39;)&#39;, 0)"
													id="cphContents_cphContents_cphContents_ddlPosition"
													class="select02">
													<option selected="selected" value="">포지션 선택</option>
													<option value="1">투수</option>
													<option value="2">포수</option>
													<option value="3,4,5,6">내야수</option>
													<option value="7,8,9">외야수</option>
												</select>
											</div>
											<span class=""><input
												name="ctl00$ctl00$ctl00$cphContents$cphContents$cphContents$txtSearchPlayerName"
												type="text"
												id="cphContents_cphContents_cphContents_txtSearchPlayerName"
												class="srch_all"
												onkeypress="if(event.keyCode == 13){__doPostBack(&#39;ctl00$ctl00$ctl00$cphContents$cphContents$cphContents$btnSearch&#39;,&#39;&#39;);return false;}" /></span>
											<input type="submit"
												name="ctl00$ctl00$ctl00$cphContents$cphContents$cphContents$btnSearch"
												value="검색"
												id="cphContents_cphContents_cphContents_btnSearch"
												class="btn_srch02" />
										</div>

										<div class="inquiry">
											<p class="title">
												<strong>검색결과 : <span class="point">0</span>건
												</strong>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@include file="../inc/bottom.jsp"%>