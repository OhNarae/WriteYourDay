<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Join</title>
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
		$('#id').focusout(function() {
			var id = $('#id').val();
			if (id.length < 3 | id.length > 16) {
				$('#id_msg').text('3자 이상 16자 이하로 입력해주세요.');
			} else if (!/^[A-Za-z]$/.test(id[0])) {
				$('#id_msg').text('첫번째는 반드시 알파벳이어야 합니다.');
			} else if (!/^[A-Za-z0-9]+$/.test(id)) {
				$('#id_msg').text('ID는 알파벳,숫자만 가능합니다.');
			} else {
				$('#id_msg').text('');
			}
		})

 		$('#password').focusout(function() {
			var password = $('#password').val();
			if (password.length < 4 | password.length > 16) {
				$('#password_msg').text('4자 이상 16자 이하로 입력해주세요.');
			} else if (!/^[A-Za-z0-9]+$/.test(password)) {
				$('#password_msg').text('패스워드는 알파벳, 숫자 만 가능합니다.');
			} else {
				$('#password_msg').text('');
			}
		})
		
		$('#name').focusout(function() {
			var name = $('#name').val();
			if (name.length < 1) {
				$('#name_msg').text('이름을 입력해주세요.');
				result = false;
			} else if (name.replace(/[가-힣]/g, '').length > 0) {
				$('#name_msg').text('이름은 한글만 가능합니다.');
				result = false;
			} else {
				$('#name_msg').text('');
			}
		 })

		$('#pnumber').focusout(function() {
			var pnumber = $('#pnumber').val();
			
 			if(pnumber.length < 1){
				$('#pnumber_msg').text('전화번호을 입력해주세요. (010-1234-5678)');				
			}  else if(!/^\d{3}-\d{3,4}-\d{4}$/.test(pnumber)){
				$('#pnumber_msg').text('전화번호가 올바르지 않습니다. (010-1234-5678)');
			}  else {
				$('#pnumber_msg').text('');
			}  
		}) 


		$('#birth').focusout(function() {
			var birth = $('#birth').val();
			var birthD = new Date($('#birth').val());
			
			if (birth.length < 1){
				$('#birth_msg').text('생년월일을 입력해주세요. (1980-01-01)');
			} else if(!/^\d{4}-\d{2}-\d{2}$/.test(birth)){
				$('#birth_msg').text('태어난 날짜가 올바르지 않습니다. (1980-01-01)');
			} else if(isNaN(birthD.valueOf())){
				$('#birth_msg').text('존재하지 않는 날짜 입니다.');
			}else {
				$('#birth_msg').text('');
			}
		})


		$('#email').focusout(function() {
			var email = $('#email').val();
			if (email.length < 1) {
				$('#email_msg').text('이메일를 입력해주세요 (test@gamil.com)');
			} else if (!/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test(email)) {
				$('#email_msg').text('이메일이 올바르지 않습니다. (test@gamil.com)');
			} else {
				$('#email_msg').text('');
			}
		})  
	})

	function submit() {
		if ($('#id').val() == "") $('#id_msg').text('ID를 입력해주세요.'); 
		if ($('#password').val() == "") $('#password_msg').text('패스워드를 입력해주세요.');
		if ($('#name').val() == "") $('#name_msg').text('이름을 입력해주세요.');
		if ($('#pnumber').val() == "") $('#pnumber_msg').text('전화번호을 입력해주세요. (010-1234-5678)');
		if ($('#birth').val() == "") $('#birth_msg').text('생년월일을 입력해주세요. (1980-01-01)');
		if ($('#email').val() == "") $('#email_msg').text('이메일을 입력해주세요. (test@company.com)');

		if ($('#id_msg').text().length > 0) return false;
		if ($('#password_msg').text().length > 0) return false;
		if ($('#name_msg').text().length > 0) return false;
		if ($('#pnumber_msg').text().length > 0) return false;
		if ($('#birth_msg').text().length > 0) return false;
		if ($('#email_msg').text().length > 0) return false;
		
		document.getElementById('contact-form').submit();
	}
	
	function clear(){
		$('#id').val(""); $('#id_msg').text("");
		$('#password').val(""); $('#password_msg').text("");
		$('#name').val(""); $('#name_msg').text("");
		$('#pnumber').val(""); $('#pnumber_msg').text("");
		$('#birth').val(""); $('#birth_msg').text("");
		$('#email').val(""); $('#email_msg').text("");
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
							<h3 class="p2">회원가입</h3>
							<form id="contact-form" action="join.do" method="post">
								<fieldset>
									<label class="label1"><span class="text-msg"
										id="id_msg"></span></label> <label><span class="text-form">ID:</span>
										<input id="id" name="id" type="text" /><br></label> <label
										class="label1"><span class="text-msg"
										id="password_msg"></span></label> <label><span
										class="text-form">PASSWORD:</span><input id="password"
										name="password" type="password" /></label> <label class="label1"><span
										class="text-msg" id="name_msg">이름은 한글입니다.</span></label> <label><span
										class="text-form">이름:</span> <input id="name" name="name"
										type="text" /><br></label> <label class="label1"><span
										class="text-msg" id="pnumber_msg">전화번호을 입력해주세요.
											(010-1234-5678)</span></label> <label><span class="text-form">전화번호:</span>
										<input id="pnumber" name="pnumber" type="text" /><br></label> <label
										class="label1"><span class="text-msg" id="birth_msg">생년월일을
											입력해주세요. (1980-01-01)</span></label> <label><span class="text-form">생년월일:</span><input
										id="birth" name="birth" type="text" /></label> <label class="label1"><span
										class="text-msg" id="email_msg">이메일을 입력해주세요.
											(test@company.com)</span></label> <label><span class="text-form">e-mail:</span><input
										id="email" name="email" type="text" /></label>
									<div class="buttons">
										<a class="button" href="javascript:clear()">reset</a> <a
											class="button" href="javascript:submit()">회원가입</a>
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