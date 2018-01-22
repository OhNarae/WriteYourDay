<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>MyPage</title>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/style.css?version=201801"
	type="text/css" media="screen">
<link rel="stylesheet" href="resources/css/grid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/popup.css" type="text/css"
	media="screen">
<script src="resources/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="resources/js/talk.js?version=201801" type="text/javascript"></script>
<script>


</script>
<style type="text/css">
.menu-tb {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
}

.menu-tb tr {
	border-style: solid;
	border-width: 1px;
}

.menu-tb th {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	padding: 10px;
	overflow: hidden;
	word-break: normal;
	height: 10px;
	background-color: #ff9601;
}

.menu-tb td {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	padding: 10px;
	overflow: hidden;
	word-break: normal;
	height: 10px;
}

.menu-tb .menu-row {
	vertical-align: top
}

.talk-tb {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
}

.talk-tb td {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	padding: 10px;
	overflow: hidden;
	word-break: normal;
	height: 10px;
/* 	background-color: #ff9601; */
	border-style: solid;
	border-width: 1px; 
}

.talk-tb .talk-row {
	vertical-align: top
}

textarea {
	float: left;
	height: 50px;
	overflow: auto;
	width: 100%;
	font-size: 13px;
	line-height: 1.23em;
	color: #404040;
	/* 	padding: 6px;*/
	margin: 10px 0px 10px 0px;
	font-family: Arial, Helvetica, sans-serif;
	border: 1px solid #d9d9d9;
	background: #fcfcfc;
	outline: none
}
</style>
</head>
<body>
	<div class="indent-top"></div>
	<div class="main">
		<div class="container_12">
			<div class="grid_3">
				<table class="menu-tb">
					<tr>
						<th class="menu-row aligncenter">me</th>
					</tr>
					<tbody id="menuL-body">
						<tr>
							<td>친구1<br> 친구2<br> 친구3<br>
							</td>
						</tr>
						<tr>
							<td>
								<form id="search-form" method="post">
									<fieldset>
										<div class="search-field">
											<input name="search" type="text" /> <a class="search-button"
												href="#"
												onClick="document.getElementById('search-form').submit()"><span>search</span></a>
										</div>
									</fieldset>
								</form>

							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="grid_9">
				<table class="talk-tb" style="width: 100%;" id="tbContent">
					<tr>
						<td>
							<form id="iTalkForm" enctype="multipart/form-data">
								<input type="text" id="member_seq" name="member_seq"
									value="${sessionScope.loginInfo.seq}"
									style="visibility: hidden;">
								<div>
									<img id="thumbnail" src="">&nbsp; <input type="file"
										id="getfile" accept="image/*">
								</div>
								<textarea name="contents_talk"></textarea>
								<input type="submit" class="fright" id="iTalkBtn" value="입력">
							</form>
						</td>
					</tr>
					<tbody id="talk-body"></tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>