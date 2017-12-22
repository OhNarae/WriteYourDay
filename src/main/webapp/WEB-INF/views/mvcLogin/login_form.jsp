<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>** Login Form **</title>
</head>
<body>
	<h2>==> Login 하기</h2>
	<br>
	<form action="/Spring03/mlogin.do" method="post">
		<table align="center">
			<tr>
				<td>ID :</td>
				<td><input type="text" name="id" size="10"></td>
			</tr>
			<tr>
				<td>Password :</td>
				<td><input type="password" name="password" size="10"></td>
			</tr>
			<tr height=60>
				<td></td>
				<td><input type="submit" value="Login "></td>
			</tr>
		</table>
	</form>
</body>
</html>