<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<!-- CSS only -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/signup.css" rel="stylesheet" />

<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/signup.js"></script>
<script src="js/realtime_api.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<title>회원가입</title>
</head>

<body>
	<div class="container">
		<div class="col-md-6 text-center" style="margin:3rem; margin-left:auto; margin-right:auto;">
			<div class="header-title text-center" style="margin:3rem; margin-left:auto; margin-right:auto;">
				<h1 class="wv-heading--title">Sign Up</h1>
				<h2 class="wv-heading--subtitle">Welcome to our Website!</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div class="myform form">
					<form class="form-horizontal" id="signup" method="post">
					<div class="form-group">
						<label for="id" class="form-label" style="display:block;">Id</label>
						<input type="text" class="form-control my-input" style="display:inline; float:left; width:70%;" id="id" name="id" placeholder="Id를 입력하세요">
						<a class="btn btn-outline-primary" style="width:30%;" id="idcheck" role="button">중복 확인</a>
						<div id="idmsg" class="form-text"></div>
					</div>

					<div class="form-group">
						<label for="email" class="form-label" style="display:block;">Email address</label> 
						<input type="email" class="form-control my-input" style="display:inline; float:left; width:70%;" id="email" name="email" placeholder="Email을 입력하세요"> 
						<a class="btn btn-outline-primary" style="width:30%;" id="emailcheck" role="button">중복 확인</a>
						<div id="emailmsg" class="form-text"></div>
					</div>

					<div class="form-group">
						<label for="pw" class="form-label">Password</label> 
						<input type="password" class="form-control my-input" id="pw" name="pw" placeholder="비밀번호를 입력하세요">
						<div id="pwmsg" class="form-text">대소문자와 숫자, 특수문자가 포함되어야 합니다.</div>
					</div>
					<div class="form-group">
						<label for="pw1" class="form-label">Check Password</label> 
						<input type="password" class="form-control my-input" id="pw1" name="pw1" placeholder="동일한 비밀번호를 입력하세요">
						<div id="pw1msg" class="form-text"></div>
					</div>

					<div class="form-group">
						<label for="nickname" class="form-label" style="display:block;">Nickname</label> 
						<input type="text" class="form-control my-input" style="display:inline; float:left; width:70%;" id="nickname" name="nickname" placeholder="Nickname을 입력하세요"> 
						<a class="btn btn-outline-primary" style="width:30%;" id="nicknamecheck" role="button">중복 확인</a>
						<div id="nicknamemsg" class="form-text"></div>
					</div>
					
					<!-- address 추가-> 수정해야 함 -->
					<div class="form-group">
						<label for="address" class="form-label" style="display:block;">Address</label>
						<div id="address" name="address" style="display:flex;">
							<select class="form-select" name="region_1" id="region_1" aria-label="시/도" onchange="addrchange(this)" style="width:150px; margin-right:20px;" required>
								<option selected disabled>시/도</option>
								<option value="서울특별시">서울특별시</option>
								<option value="경기도">경기도</option>
								<option value="강원도">강원도</option>
								<option value="인천광역시">인천광역시</option>
								<option value="대전광역시">대전광역시</option>
								<option value="대구광역시">대구광역시</option>
								<option value="울산광역시">울산광역시</option>
								<option value="광주광역시">광주광역시</option>
								<option value="부산광역시">부산광역시</option>
								<option value="전라남도">전라남도</option>
								<option value="전라북도">전라북도</option>
								<option value="충청남도">충청남도</option>
								<option value="충청북도">충청북도</option>
								<option value="경상남도">경상남도</option>
								<option value="경상북도">경상북도</option>
								<option value="제주특별자치도">제주특별자치도</option>
								<option value="세종특별자치시">세종특별자치시</option>
							</select>
							<select class="form-select" name="region_2" id="region_2" aria-label="시/군/구" style="width:150px;" required>
								<option selected disabled>시/군/구</option>
							</select>
						</div>
						<div id="addressmsg" style="margin-bottom:1rem;"></div>

						<div class="text-center" style="display:block;">
							<input type='button' class="btn btn-block send-button tx-tfm" id="signupbtn" value='회원가입 '>
						</div>
					</div>
					<p class="small mt-3">
						By signing up, you are indicating that you have read and agree to the 
						<a href="#" class="ps-hero__content__link">Terms of Use</a>and <a href="#">Privacy Policy</a>.
					</p>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>