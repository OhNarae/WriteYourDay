<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>** join finish **</title>
</head>
<body>
	<c:choose>
		<c:when test="${isJoin=='T'}">
			<h1>${joinID} 님, 회원 가입을 축하 드립니다!</h1>
			<img src="/Spring03/image/event_1.png" width=600 height=350>
			<br>
			<br>
			<h2>
				<a href="/Spring03/mvcLogin/login_form.jsp">Login</a>
			</h2>
		</c:when>
		<c:when test="${isJoin!='T'}">
			<h1>회원 가입이 실패 하였습니다.</h1>
			<img src="/Spring03/image/event_1.png" width=600 height=350>
			<br>
			<br>
			<h2>
				<a href="/Spring03/mvcMember/joinForm.html">memberJoin</a>
			</h2>
		</c:when>
	</c:choose>
	<h1></h1>
</body>
</html>