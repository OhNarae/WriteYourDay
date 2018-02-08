<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../libs.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>talkbody</title>
<link rel="stylesheet" href="resources/css/popup.css" type="text/css"
	media="screen">
<script src="resources/js/talkbody.js?version=${sysVer}" type="text/javascript"></script>
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
						<td>
							${target.id}님의 Talk 
  						    <span id="checkFriend">
  						    <c:if test="${sessionScope.loginInfo.seq != target.seq}">
  						    	<c:if test="${friendInfo == null}">
									<a href="javascript:getFriend(${target.seq})">[친구요청]</a>
								</c:if>
								<c:if test="${friendInfo != null}">[친구]</c:if>
							</c:if>
							</span> 
						</td>
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