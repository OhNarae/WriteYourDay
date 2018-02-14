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
<link rel="stylesheet" href="resources/css/talk.css?version=${sysVer}" type="text/css"
	media="screen">
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
								<span class="fright" id="iTalkSpan">입력 중..</span>
							</form>
						</td>
					</tr>
					<tbody id="talk-body"></tbody>
				</table>
			</div> 
		</div>
</html>