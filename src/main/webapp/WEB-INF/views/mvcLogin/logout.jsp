<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>logout.jsp</title>
</head>
<body>
<%
	session.invalidate();
// 로그아웃 메서드 : 세션이 종료되고 기존에 생성된 세션 삭제
// 유효시간 설정 : session.setMaxInactiveInterval() : 설정시간 지나면 자동 종료됨

%>
로그아웃 되었습니다.<br>
<a href="/Spring03/mvcLogin/login_status.jsp">[로그인 상태보기]</a>

</body>
</html>