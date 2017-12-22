<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>** login_status.jsp **</title>
</head>
<body>
	<br>
	<br>
	<c:if test="${not empty loginInfo}">
	${loginInfo.id} 님은 로그인 된 상태입니다. 내용확인 가능 합니다.<br>
		<br>
		<br>
	*** 접속 정보 ***<br>
		<br>
	세션  ID : ${loginInfo.id} <br>
		<br>
	최초접속시간 : ${loginInfo.loginTime} <br>
		<br>
		<a href="index.jsp"> <img src="/Jsp02/image/home.gif"><b>
				[ index ] </b></a>
		<a href="logout.jsp"><img src="/Jsp02/image/yyy.gif"><b>
				[ logout ]</b></a>
	</c:if>
	<c:if test="${empty loginInfo}">
		로그인 정보가 없습니다. 로그인 하고 오세요 ~ <br>
		<br>
		<a href="login_form.jsp"><img src="/Spring03/image/pen1.gif"><b>[login_form]</b></a>
	</c:if>
</body>
</html>




