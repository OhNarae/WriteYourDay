<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>MyPage</title>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/grid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/popup.css" type="text/css"
	media="screen">
<script src="resources/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="resources/js/memo.js?version=000001 " type="text/javascript"></script>
<script>


</script>
<style type="text/css">

.memo-tb {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
}

.memo-tb td {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	height: 10px
}

.memo-tb th {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	background-color: #ff9601;
}

.memo-tb .memo-row {
	vertical-align: top
}

textarea {
	float: left;
	height: 192px;
	overflow: auto;
	width: 95%;
	font-size: 13px;
	line-height: 1.23em;
	color: #404040;
	padding: 6px 10px;
	margin: 0;
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
				<div class="dim-layer">
					<div class="dimBg"></div>
					<div id="layer" class="pop-layer">
						<a href="#" class="btn-layerClose" id="popBtnClose"><img
							src="resources/images/close.png" alt="이전 이벤트 보기" /></a>
						<div class="pop-container">
							<div class="pop-conts">
								<div class="btn-r">
									<input id="popName" type=text> <a href="#"
										class="btn-layer" id="popBtn"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<table class="memo-tb">
					<tr>
						<th class="memo-row aligncenter">메모 카테고리 <a href="#layer"
							class="fright color-3" id="addMemoC">+</a>
						</th>
					</tr>
					<tbody id="memoL-body"></tbody>
				</table>
			</div>
			<div class="grid_3">
				<table class="memo-tb" style="width: 100%;">
					<tr>
						<th class="memo-row aligncenter">메모 제목 <a href="#layer"
							class="fright color-3" id="addMemoT" >+</a></th>
					</tr>
					<tbody id="memoT-body"></tbody>
				</table>
			</div>
			<div class="grid_6">
				<table class="memo-tb" style="width: 100%;" id="tbContent">
					<tr>
						<th class="memo-row aligncenter">메모 내용</th>
					</tr>
					<tbody id="memo-body">
						<tr>
							<td><textarea id="memoContents"></textarea><br> <a
								class="fright" id="updateMemo">수정</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>