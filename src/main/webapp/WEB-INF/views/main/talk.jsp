<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../libs.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>MyPage</title>
<script src="resources/js/talk.js?version=${sysVer}" type="text/javascript"></script>
<link rel="stylesheet" href="resources/css/talk.css?version=${sysVer}" type="text/css"
	media="screen">
</head>
<body>
	<div class="indent-top"></div>
	<div class="main">
		<div class="container_12">
			<div class="grid_3">
				<table class="menu-tb">
					<tr>
						<th class="menu-row aligncenter"><a
							href="talkbody.do?seq=${sessionScope.loginInfo.seq}"
							target="talkbody" class="color-3">me</a></th>
					</tr>
					<tbody id="menuL-fbody"></tbody>
					<tr>
						<td>
							<div id="search-form">
								<fieldset>
									<div class="search-field">
										<input id="searchId" name="searchId" type="text" /> <a
											class="search-button" href="#" id="sMemberBtn"><span>search</span></a>
									</div>
								</fieldset>
							</div>
						</td>
					</tr>
					<tbody id="menuL-body"></tbody>
				</table>
			</div>
			<div class="grid_9">
				<iframe id="talkbody" src="talkbody.do" name="talkbody"
					style="width: 650px; height: 900px"></iframe>
			</div>
		</div>
	</div>
</body>
</html>