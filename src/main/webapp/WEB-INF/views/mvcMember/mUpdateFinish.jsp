<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>** update finish **</title>
</head>
<body>
	<c:choose>
		<c:when test="${isUpdate=='T'}">
			<h1>${updateID} 님, 업데이트 성공하였습니다!</h1>
			<img src="/Spring03/image/event_1.png" width=600 height=350>
			<br>
			<br>
			<h2><a href="/Spring03/mlist.do">memberList</a></h2>	
		</c:when>
		<c:when test="${isUpdate!='T'}">
			<h1>업데이트가 실패하였습니다.</h1>
			<img src="/Spring03/image/event_1.png" width=600 height=350>
			<br>
			<br>
			<h2>
				<a><img src="/Spring03/image/kuma.gif" ><b> [ 정보수정 ] </b></a>
			</h2>
		</c:when>
	</c:choose>
	<h1></h1>
</body>
</html>