<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../libs.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Day</title>
<script src="resources/js/myday.js?version=00001" type="text/javascript"></script>
<style type="text/css">
.day-tb {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
}

.day-tb td {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	height: 10px
}

.day-tb th {
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

.day-tb .day-row {
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

.select-editable {
	position: relative;
	background-color: white;
	border: solid grey 1px;
	width: 220px;
	height: 18px;
}

.select-editable select {
	position: absolute;
	top: 0px;
	left: 0px;
	font-size: 14px;
	border: none;
	width: 220px;
	margin: 0
}

.select-editable input {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 200px;
	padding: 1px;
	font-size: 12px;
	border: none;
}

.select-editable select:focut, .select-editable input:focus {
	outline: none;
}
</style>
</head>
<body>
	<div class="indent-top"></div>
	<div class="quote">
		<h3 class="prev-indent-bot">
			<span id="dayTitle">${date}</span>
		</h3>
	</div>
	<div class="container_12 text-2">
		<div class="grid_12">
			<table class="day-tb" style="width: 100%;">
				<tr>
					<th class="day-row aligncenter">Today's Memo</th>
				</tr>
				<tbody id="day-body">
					<tr>
						<td><textarea id="memoContents"></textarea><br> <a
							class="fright" id="updateMemo">저장</a></td>
					</tr>
				</tbody>
			</table>
			<div class="indent-top"></div>
			<table class="day-tb" style="width: 100%;">
				<tr>
					<th class="day-row aligncenter">Event</th>
				</tr>
				<tr>
					<td><label for="title">Title : </label><input type="text"
						id="title"> <a href="#none"
						style="padding: 0 0 5px 20px; margin-left: 5px; background-color: #E18060"></a>
						<a href="#none"
						style="padding: 0 0 5px 20px; margin-left: 5px; background-color: #FFA556"></a>
						<a href="#none"
						style="padding: 0 0 5px 20px; margin-left: 5px; background-color: #FFE05C"></a>
						<a href="#none"
						style="padding: 0 0 5px 20px; margin-left: 5px; background-color: #DDFFAA"></a>
						<a href="#none"
						style="padding: 0 0 5px 20px; margin-left: 5px; background-color: #C6D6F7"></a>
						<label class="indent-left" for="start_date">Date : </label> <input
						type="text" id="start_date" value="${date} 00:00"> - <input
						type="checkbox" name="use_end_date" /><input type="text"
						id="end_date" value="${date} 23:59" readonly="readonly"> <a
						class="fright" id="insertEvent">저장</a></td>
				</tr>
				<tbody id="eventT-body"></tbody>
			</table>
			<div class="indent-top"></div>
			<table class="day-tb" style="width: 100%;">
				<tr>
					<th class="day-row aligncenter" colspan="4">가계부</th>
				</tr>
				<%-- 				<tr>
					<td><input type="text" id="pay_date" value="${date} 00:00:00" class="fleft spacing2">
						<span class="select-editable spacing2"> <select
							onchange="this.nextElementSibling.value=this.value">
								<option value=""></option>
								<option value="#마트">#마트</option>
								<option value="#식료품">#식료품</option>
								<option value="살구">살구</option>
						</select> <input type="text" id="pay_place" value="#수지#이마트"></span>
						 <span class="select-editable spacing2"> <select
							onchange="this.nextElementSibling.value=this.value">
								<option value=""></option>
								<option value="#마트">#마트</option>
								<option value="#식료품">#식료품</option>
								<option value="살구">살구</option>
						</select> <input type="text" id="pay_things" value="">
					</span> <input type="text" id="price" value="2,000" class="fleft"> <a
						class="fright" id="insertCashBook">저장</a></td>
				</tr> --%>
				<tr>
					<td><input type="text" id="pay_date" value="${date} 00:00:00"
						class="fleft spacing2"></td>
					<td><span class="select-editable"> 
					<select onchange="this.nextElementSibling.value=this.value">
								<option value=""></option>
								<option value="#마트">#마트</option>
								<option value="#식료품">#식료품</option>
								<option value="살구">살구</option>
						</select> <input type="text" id="pay_place" value="#수지#이마트"></span></td>
					<td>	 <span class="select-editable"> 
						<select onchange="this.nextElementSibling.value=this.value">
							<option value=""></option>
							<option value="#마트">#마트</option>
							<option value="#식료품">#식료품</option>
							<option value="살구">살구</option>
					</select> <input type="text" id="pay_things" value="">
					</span>
					</td>
					<td><input type="text" id="price" value="2,000" class="fleft">
					<a class="fright" id="insertCashBook">저장</a>
					</td>
					
				
				</tr>
				<tbody id="cashbookT-body"></tbody>
			</table>
		</div>
	</div>
</body>
</html>