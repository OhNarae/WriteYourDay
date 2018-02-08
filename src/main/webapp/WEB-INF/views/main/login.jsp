<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../libs.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Login</title>
<script>
	$(document).ready(function() {
/* 		$('#msg').text(''); */
	})

	function submit() {
		$('#msg').text("");
		if ($('#id').val() == ""){ $('#msg').text('ID를 입력해주세요'); return; }
		if ($('#password').val() == ""){ $('#msg').text('패스워드를 입력해주세요'); return; }
		
		if ($('#msg').text().length > 0) return;

		$('#contact-form').action = "login.do";
		$('#contact-form').method="post";
		$('#contact-form').submit();
		
	}
</script>
</head>
<body>
	<div class="container_12">
		<div class="wrapper">
			<div class="grid_12">
				<div class="indent-top3">
					<div class="lmain">
						<div class="indent-left">
							<h3 class="p2">Login</h3>
							<form id="contact-form">
								<fieldset>
									<label class="label1"><span class="text-msg" id="msg">${msg}</span></label>
									<label><span class="text-form">ID:</span><input id="id"
										name="id" type="text" /></label> <label><span
										class="text-form">PASSWORD:</span><input id="password"
										name="password" type="password" /></label>
									<div class="buttons">
										<a class="button" href="join.do" target="article">회원가입</a> <a
											class="button" href="javascript:submit()">Login</a>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>