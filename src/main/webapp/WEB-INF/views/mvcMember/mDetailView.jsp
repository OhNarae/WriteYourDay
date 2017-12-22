<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>** member Detail Form **</title>
</head>
<body>
	<h1>** member Detail Form **</h1>
	<img alt="환영해요" src="/Spring03/image/bbb1.gif">
	<br>
	<form action="/Spring03/mupdate.do" method="post">
		<table border="1">
			<tr height="40">
				<td bgcolor="gray" width="100" align="center">ID</td>
				<td align="left"><input type="text" name="id" value="${orange.id}" readonly></input></td>
			</tr>
			<tr>
				<td bgcolor="gray" width="100" align="center">Password</td>
				<td align="left"><input type="text" name="password" value="${orange.password}" readonly></input></td>
			</tr>
			<tr>
				<td bgcolor="gray" width="100" align="center">Name</td>
				<td align="left"><input type="text" name="name"  value="${orange.name}"></input></td>
			</tr>
			<tr>
				<td bgcolor="gray" width="100" align="center">Level</td>
				<td align="left"><select name="lev">
						<option value="A" ${orange.lev eq 'A' ? 'selected': null} >관리자</option>
						<option value="B" ${orange.lev eq 'B' ? 'selected': null} >나무</option>
						<option value="C" ${orange.lev eq 'C' ? 'selected': null} >잎새</option>
						<option value="D" ${orange.lev eq 'D' ? 'selected': null} >새싹</option>
				</select></td>
			</tr>
			<tr>
				<td bgcolor="gray" width="100" align="center">BirthDay</td>
				<td align="left"><input name="birthd" type="date"
					 value="${orange.birthd}" /></input></td>
			</tr>
			<tr>
				<td bgcolor="gray" width="100" align="center">Point</td>
				<td align="left"><input type="text" name="point"  value="${orange.point}"></input></td>
			</tr>
			<tr>
				<td bgcolor="gray" width="100" align="center">Weight</td>
				<td align="left"><input type="text" name="weight"  value="${orange.weight}"></input></td>
			</tr>
			<tr height="40">
				<td colspan="2" align="center"><input type="reset" value="취 소" /><input
					type="submit" value="수  정" /></td>
			</tr>
		</table>
	</form>
	<br><br>
	<c:if test="${loginInfo.lev=='A'}">
		<a href="/Spring03/mdelete.do?id=${orange.id}"> <img src="/Spring03/image/kuma.gif"><b>
			[탈퇴 시키기] </b></a>
	</c:if>
</body>
</html>