<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login 페이지</title>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/grid.css" type="text/css"
	media="screen">
<script src="resources/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script>
	$(document).ready(function() {
/* 		$('#msg').text(''); */
	})

	function submit() {
		$('#msg').text("");
		if ($('#id').val() == ""){ $('#msg').text('ID를 입력해주세요'); return; }
		if ($('#password').val() == ""){ $('#msg').text('패스워드를 입력해주세요'); return; }
		
		if ($('#msg').text().length > 0) return;
		

/* 		$('#contact-form').id.value = $('#id').val(); //POST방식으로 넘기고 싶은 값
		$('#contact-form').password.value = $('#password').val(); //POST방식으로 넘기고 싶은 값 */
/* 		    f.src_name.value = s_name; //POST방식으로 넘기고 싶은 값
		    f.src_value.value = s_value;//POST방식으로 넘기고 싶은 값
		    f.action="XXXXXXX.php";//이동할 페이지
		    f.method="post";//POST방식 */
		$('#contact-form').action = "login.do";
		$('#contact-form').method="post";
		$('#contact-form').submit();


		
		/* document.getElementById('contact-form').submit(); */
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