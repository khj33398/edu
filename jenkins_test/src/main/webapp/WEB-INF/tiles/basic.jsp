<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Tiles Framework를 사용하기 위한 처리-->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!-- List를 순회하기 위해서 태그 라이브러리 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- List의 데이터가 있는지 없는지 확인하기 위해서 List의 길이를 확인하는 태그 라이브러리 설정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>WAnalysis</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS -> Toggle과 관련된 작업 -->
<script src="js/scripts.js"></script> 

</head>

<body>

	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-light"><a href = "/" style="text-decoration:none">Weather Analysis</a></div>
			<div class="list-group list-group-flush">
				<a class="list-group-item list-group-item-action list-group-item-light p-3" href="getultrasrtncst">실시간 날씨 현황</a> 
				<a class="list-group-item list-group-item-action list-group-item-light p-3" href="periodweather">기간별 날씨 현황</a> 
				<a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">날씨 예측</a> 
				<c:if test="${userinfo.group_id == 'admin'}">
					<a class="list-group-item list-group-item-action list-group-item-light p-3" href="adminpage">관리자 페이지</a>
				</c:if>
				<c:if test="${LOGIN != null}">
					<a class="list-group-item list-group-item-action list-group-item-light p-3" href="profile">Profile</a> 
				</c:if>
				<a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Status</a>
			</div>
		</div>
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<div class="container-fluid">
					<button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
							
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<c:if test="${LOGIN == null}">
									<a class="btn btn-outline-primary" href="signin" role="button">Sign in</a>
									<a class="btn btn-primary" href="signup" role="button">Sign up</a>
								</c:if>
								<c:if test="${LOGIN != null}">
									<p>${userinfo.nickname} 님 &nbsp;&nbsp;</p>
									<a class="btn btn-outline-primary" href="profile" role="button">my page</a>
									<a class="btn btn-outline-primary" href="signout" role="button">Log out</a>
								</c:if>
							</div>
						</ul>
					</div>
				</div>
			</nav>
			<!-- Page content-->
			<div class="container-fluid">
				<div id="main"><tiles:insertAttribute name="body" /></div>
			</div>
		</div>
	</div>
</body>

</html>
