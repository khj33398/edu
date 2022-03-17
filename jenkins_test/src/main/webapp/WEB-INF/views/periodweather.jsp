<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 차트 사용을 위한 chart.js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

<!-- 날짜 선택기(DatePicker) 사용을 위한 처리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js" charset = "UTF-8"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 사용자 정의 자바스크립트 -->
<!-- <script src="js/linechart.js"></script> -->
<script src="js/weather_location.js"></script>
<script src="js/periodweather.js"></script>

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
		<div class="form-group" style="float: left;  margin-right: 20px;">
			<label for="period" class="form-label" style="display: block;">기간</label>
			<div id="period" name="period" style="display: flex;">
				<input type="text" id="datepicker_start" style="width:140px; height:40px; border-radius:5px; margin-right: 20px;" placeholder="시작일">
				<input type="text" id="datepicker_end" style="width:140px; height:40px; border-radius:5px;" placeholder="종료일">
			</div>
		</div>
		<button class="btn btn-outline-primary" id="weatherquery" style="margin-top:2rem;">조회</button>
	</div>
	<div style="width:1000px; height:750px;">
		<canvas id="line-chart"></canvas>
	</div>
</body>

<script>
	$(function() {
		$("#datepicker_start").datepicker({
			dateFormat : "yy-mm-dd"
		});
		
		$("#datepicker_end").datepicker({
			dateFormat : "yy-mm-dd"
		});
	});

	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : '년'
	});
	
	$(function() {
		$("#datepicker_start").datepicker();
		$("#datepicker_end").datepicker();
	});
</script>
</html>