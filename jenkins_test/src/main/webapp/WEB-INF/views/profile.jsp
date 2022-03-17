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
<script src="js/realtime_api.js"></script>
<script src="js/profile.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<title>회원정보</title>
</head>

<body>
	<div class="container">
		<div class="col-md-6 text-center" style="margin:3rem; margin-left:auto; margin-right:auto;">
			<div class="header-title text-center" style="margin:3rem; margin-left:auto; margin-right:auto;">
				<h1 class="wv-heading--title">Profile</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div class="myform form">
					<form class="form-horizontal" id="memberinfo" method="post">
					<div class="form-group">
						<label for="id" class="form-label" style="display:block;">Id</label>
						<input type="text" class="form-control my-input" style="margin-bottom:1rem;" id="id" name="id" value="${userinfo.id}" readonly>
					</div>

					<div class="form-group">
						<label for="email" class="form-label" style="display:block;">Email address</label> 
						<input type="email" class="form-control my-input" style="margin-bottom:1rem;" id="email" name="email" value="${userinfo.email}" readonly> 
					</div>

					<div class="form-group">
						<label for="pw" class="form-label">Password</label> 
						<input type="password" class="form-control my-input" style="margin-bottom:1rem;" id="pw" name="pw" placeholder="비밀번호를 입력하세요">
						<div id="pwmsg" class="form-text">대소문자와 숫자, 특수문자가 포함되어야 합니다.</div>
					</div>
					<div class="form-group">
						<label for="pw1" class="form-label">Check Password</label> 
						<input type="password" class="form-control my-input" style="margin-bottom:1rem;" id="pw1" name="pw1" placeholder="비밀번호를 확인하세요">
						<div id="pw1msg" class="form-text"></div>
					</div>

					<div class="form-group">
						<label for="nickname" class="form-label" style="display:block;">Nickname</label> 
						<input type="text" class="form-control my-input" style="margin-bottom:1rem;" id="nickname" name="nickname" value="${userinfo.nickname}" readonly>
					</div>
					
					<div class="form-group">
						<label for="address" class="form-label" style="display:block;">Address</label>
						<div id="address" name="address" style="display:flex;">
							<select class="form-select" name="region_1" id="region_1" aria-label="시/도" onchange="addrchange(this)" style="width:150px; margin-right:20px;" required>
								<option selected value="${region_1}" disabled>${region_1}</option>
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
								<option selected disabled>${region_2}</option>
							</select>
						</div>
						<div id="addressmsg" style="margin-bottom:1rem;"></div>

						<div class="text-center" style="display:block;">
							<input type='button' class="btn btn-block send-button tx-tfm" id="modify" value='수정 '>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>