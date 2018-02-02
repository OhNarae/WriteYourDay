<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../libs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>친구를 선택하세요.</title>
</head>
<body>
<!-- Body Starts Here -->
<body id="body" style="overflow:hidden;">
<div id="abc">
<!-- Popup Div Starts Here -->
<div id="popupContact">
<!-- Contact Us Form -->
<form action="#" id="form" method="post" name="form">
<img id="close" src="images/3.png" onclick ="div_hide()">
<h2>Contact Us</h2>
<hr>
<input id="name" name="name" placeholder="Name" type="text">
<input id="email" name="email" placeholder="Email" type="text">
<textarea id="msg" name="message" placeholder="Message"></textarea>
<a href="javascript:%20check_empty()" id="submit">Send</a>
</form>
</div>
<!-- Popup Div Ends Here -->
</div>
<!-- Display Popup Button -->
<h1>Click Button To Popup Form Using Javascript</h1>
<button id="popup" onclick="div_show()">Popup</button>
</body>
<!-- Body Ends Here -->
<%-- 	<div class="indent-top"></div>
	<div class="quote">
		<h3 class="prev-indent-bot">
			<span>친구를 선택해주세요.</span>
		</h3>
	</div>
	<div class="main">
		<div class="container_12">
			<div class="grid_3"> 
				<table class="menu-tb">
					<tbody id="menuL-fbody">
						<tr>
							<td><c:forEach var="item" items="${friendList}">
									<li><a href="talkbody.do?seq=${item.seq}"
										target="talkbody">${item.id}</a></li>
								</c:forEach></td>
						</tr>
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
					</tbody>
					<tbody id="menuL-body"></tbody>
				</table>
			</div>
		</div>
	</div>  --%>
</body>
</html>