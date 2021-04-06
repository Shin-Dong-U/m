<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
	<h1>Custom Logout Page</h1><hr/>
		
	<!-- name의 설정값은 무조건 username과 password로 사용된다. -->
	<form method="post" action="/sample/logout">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		<button>로그아웃</button>
	</form>
</body>
</html>