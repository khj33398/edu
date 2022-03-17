<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LocGrid</title>
</head>
<body>
	<h3>LocGrid 파일 업로드</h3>
	<form action="uploadlocgrid" id="upload" method="post" enctype="multipart/form-data">
		DB에 업로드 할 파일 : <input type="file" name="excel" /> <br /> 
		<input type="submit" id="submit" value="업로드"/>
	</form>
</body>

</html>