<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>** login_success.jsp **</title>
</head>
<body>
	<br>
	<h1>
		회원님의 Login 정보는 다음과 같습니다. <br> id : ${loginInfo.id}<br> pw :
		${loginInfo.password}<br> loginTime : ${loginInfo.loginTime}<br>
		<br> 환영 합니다 ~~~
	</h1>
	<br>
	<br>

	<a href="/Spring03/mdetail.do"><img src="/Spring03/image/kuma.gif"><b>
			[ 정보 수정 ] </b></a>
	<a href="/Spring03/mvcLogin/login_status.jsp"> <img src="/Spring03/image/kuma.gif"><b>
			[ login_status ] </b></a>
	<a href="/Spring03/mvcLogin/logout.jsp"><img
		src="/Spring03/image/yyy.gf"><b>[ logout ]</b></a>
	<a href="/Spring03/mdelete.do"> <img src="/Spring03/image/kuma.gif"><b>
			[ 회원 탈퇴 ] </b></a>
</body>
</html>
