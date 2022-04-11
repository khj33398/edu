<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 차트 사용을 위한 chart.js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

<!-- 사용자 정의 자바스크립트 -->
<!-- <script src="js/linechart.js"></script> -->
<script src="js/weather_location.js"></script>
<script src="js/analysisweather.js"></script>

<title></title>

</head>
<body>
	<div class="container" style="margin-bottom: 2rem;">
		<div class="form-group" style="float: left; margin-right: 20px;">
			<label for="loc" class="form-label" style="display: block;">관측소</label>
			<div id="loc" name="loc" style="display: flex;">
				<select class="form-select" name="loc_state" id="loc_state"
					aria-label="시/도" onchange="statechange(this)"
					style="width: 150px; margin-right: 20px;" required>
					<option selected disabled>시/도</option>
					<option value="서울">서울</option>
					<option value="경기도">경기도</option>
					<option value="강원도">강원도</option>
					<option value="전라남도">전라남도</option>
					<option value="전라북도">전라북도</option>
					<option value="충청남도">충청남도</option>
					<option value="충청북도">충청북도</option>
					<option value="경상남도">경상남도</option>
					<option value="경상북도">경상북도</option>
					<option value="제주도">제주도</option>
					<option value="세종">세종</option>
				</select> <select class="form-select" name="loc_detail" id="loc_detail"
					aria-label="상세관측소" style="width: 150px;" required>
					<option selected disabled>관측소명</option>
				</select>
			</div>
		</div>
		<button class="btn btn-outline-primary" id="weatherquery" style="margin-top:2rem;">조회</button>
	</div>
	<div style="width:1000px; height:750px;">
		<canvas id="line-chart"></canvas>
	</div>
</body>

</html>