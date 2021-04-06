<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>id가져오기테스트 _Controller</h2>
	<!-- <form action="/getId" >
	</form> -->
	${id}
	
	<form action="/test/1" method="get">
		<input type="date" id="cal" name="cal" />
		<input type="submit" value="go" >
	</form>
</body>
</html>