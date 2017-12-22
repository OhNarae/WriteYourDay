<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vo.MemberVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록 관리</title>
</head>
<body>
	<h2>**회원 목록 **</h2>
	<img src="/Spring03/image/bar.gif" width=800 />
	<table width=800 border=1>
		<tr bgcolor="pink" align="center" height="45">
			<td>번호</td>
			<td>이름</td>
			<td>등급</td>
			<td>생일</td>
			<td>포인트</td>
			<td>몸무게</td>
		</tr>
		<c:forEach var="member" items="${orange}">
			<tr height="40">
				<td align="center"><c:choose>
						<c:when test="${loginInfo.lev=='A'}">
							<a href="mdetail.do?id=${member.id}">${member.id}</a>
						</c:when>
						<c:when test="${loginInfo.lev!='A'}">	
							${member.id}
						</c:when>
					</c:choose></td>
				<td align="center">${member.name}</td>
				<td align="center"><c:choose>
						<c:when test="${member.lev == 'A'}">관리자</c:when>
						<c:when test="${member.lev == 'B'}">나무</c:when>
						<c:when test="${member.lev == 'C'}">잎새</c:when>
						<c:when test="${member.lev == 'D'}">새싹</c:when>
						<c:otherwise>오류!!</c:otherwise>
					</c:choose></td>
				<td align="center">${member.birthd}</td>
				<td align="center">${member.point}</td>
				<td align="center">${member.weight}</td>
			</tr>
		</c:forEach>
	</table>
</body>
<br>
<a href="/Spring03/mvcMember/joinForm.html">member 등록</a>
<br>
</html>