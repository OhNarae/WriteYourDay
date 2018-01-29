<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../libs.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Month</title>
<script src="resources/js/myday.js?version=1" type="text/javascript"></script>
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
	height: 50px;
	overflow: auto;
	width: 100%;
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
	<div class="quote">
		<h3 class="prev-indent-bot">
			<span id="dayTitle"></span>
		</h3>
	</div>	
	<div class="container_12 text-2">
		<div class="grid_12">
			<table class="memo-tb" style="width: 100%;">
				<tr>
					<th class="memo-row aligncenter">Today's Memo</th>
				</tr>
				<tbody id="memo-body">
					<tr>
						<td><textarea id="memoContents"></textarea><br> <a
							class="fright" id="updateMemo">저장</a></td>
					</tr>
				</tbody>
			</table>
			<div class="indent-top"></div>
			<table class="memo-tb" style="width: 100%;">
				<tr>
					<th class="memo-row aligncenter">Event<a href="#layer"
						class="fright color-3" id="addMemoT">+</a></th>
				</tr>
				<tr>
					<td>
						<label for="title">Title : </label><input type="text" id="title">
						<a href="#none" style="padding:0 0 5px 20px;margin-left:5px;background-color: #E18060"></a>
						<a href="#none" style="padding:0 0 5px 20px;margin-left:5px;background-color: #FFA556"></a>
						<a href="#none" style="padding:0 0 5px 20px;margin-left:5px;background-color: #FFE05C"></a>
						<a href="#none" style="padding:0 0 5px 20px;margin-left:5px;background-color: #DDFFAA"></a>
						<a href="#none" style="padding:0 0 5px 20px;margin-left:5px;background-color: #C6D6F7"></a>
						<label class="indent-left" for="start_date">Date : </label>
						<input type="text" id="start_date" value="2018.01.29 12:40"> - <input type="text" id="end_date" value="2018.02.01 19:00">
						<br>
					</td>
				</tr>
				<tbody id="memoT-body"></tbody>
			</table>
			<div class="indent-top"></div>
			<table class="memo-tb" style="width: 100%;">
				<tr>
					<th class="memo-row aligncenter">가계부 <a href="#layer"
						class="fright color-3" id="addMemoT">+</a></th>
				</tr>
				<tbody id="memoT-body"></tbody>
			</table>
		</div>
	</div>
</body>
</html>