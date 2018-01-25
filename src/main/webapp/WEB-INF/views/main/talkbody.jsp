<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>talkbody</title>
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
<script src="resources/js/talkbody.js?version=201801" type="text/javascript"></script>
<style type="text/css">
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
	<div class="container_12">
 		<div class="grid_8"> 
				<table class="talk-tb" style="width: 98%;" id="tbContent">
					<tr>
						<td>${target == null ? sessionScope.loginInfo.id : target.id}님의 Talk</td>
					</tr>	
					<tr>
						<td>
							<form id="iTalkForm" enctype="multipart/form-data">
								<input type="text" id="member_seq" name="member_seq"
									value="${target == null ? sessionScope.loginInfo.seq : target.seq}"
									style="visibility: hidden;">
								<div>
									<img id="thumbnail" src="">&nbsp; <input type="file"
										id="getfile" accept="image/*">
								</div>
								<textarea name="contents_talk"></textarea>
								<a class="abutton fright" id="iTalkBtn">입력</a>
							</form>
						</td>
					</tr>
					<tbody id="talk-body"></tbody>
				</table>
			</div> 
		</div>
</html>