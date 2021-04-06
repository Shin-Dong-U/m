<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- kakao javascript key: 	4b05fd2d74e9a888964b8cb8e9cfcbb6 -->
<a href="javascript:kakaoLogin();"><img src="/resources/home/image/kakao_login_bt.png" style="height:50px;width:auto;"></a>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	window.Kakao.init("4b05fd2d74e9a888964b8cb8e9cfcbb6");

	function kakaoLogin(){
		window.Kakao.Auth.login({
			scope:'profile, account_email, gender, birthday',
			success:function(authObj){
				console.log(authObj);
				window.Kakao.API.request({
					url:'/v2/user/me',
					success:res=>{
						const kakao_account=res.kakao_account;
						console.log(kakao_account);
					}
				});
			}
		});
	}
</script>
</body>
</html>