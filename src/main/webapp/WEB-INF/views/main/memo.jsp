<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../libs.jsp"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<title>MyPage</title>
<link rel="stylesheet" href="resources/css/popup.css?version=${sysVer}" type="text/css"
	media="screen">
<script src="resources/js/memo.js?version=${sysVer}" type="text/javascript"></script>
<link rel="stylesheet" href="resources/css/memo.css?version=${sysVer}" type="text/css"
	media="screen">
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
				<table class="memo-tb">
					<tr>
						<th class="memo-row aligncenter"><span id='sMSetTitle'></span><a href="#layer"
							class="fright color-3" id="addMemoT" >+</a></th>
					</tr>
					<tbody id="memoT-body"></tbody>
				</table>
			</div>
			<div class="grid_6">
				<table class="memo-tb">
					<tr>
						<th class="memo-row aligncenter"><span id='sMemoTitle'></span>&nbsp;</th>
					</tr>
					<tbody id="memo-body" id="tbContent">
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