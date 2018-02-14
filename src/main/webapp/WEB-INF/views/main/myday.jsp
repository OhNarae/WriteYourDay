<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../libs.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>MyDay</title>
<script src="resources/js/myday.js?version=${sysVer}" type="text/javascript"></script>
<link rel="stylesheet" href="resources/css/popup.css?version=${sysVer}" type="text/css" media="screen">
<link rel="stylesheet" href="resources/css/month.css?version=${sysVer}" type="text/css"
	media="screen">
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
				<tr class="day-input-tb">
					<td><textarea id="memoContents">${memo.contents}</textarea><br> <a
						class="fright" href="javascript:updateMemo(${memo.set_seq}, ${memo.seq}, '${memo.name}')">저장</a></td>
				</tr>
			</table>
			<div class="indent-top"></div>
			<table class="day-tb" style="width: 100%;">
				<tr>
					<th colspan="3" class="day-row aligncenter">Event</th>
				</tr>
				<tr class="day-input-tb">
					<td colspan="3"><label for="e_title">Title : </label><input type="text" id="e_title"> 
						<span id="ecolor"></span>
						<label class="indent-left" for="e_start_date">Date : </label> 
						<input type="text" id="e_start_date" value="${date} 00:00"> 
						- <input type="checkbox" name="e_use_end_date" id="e_use_end_date" />
						<input type="text" id="e_end_date" readonly="readonly"> 
						<a class="fright" id="insertEvent">저장</a></td>
				</tr>
				<tbody id="eventT-body">
				</tbody>
			</table>
			<div class="dim-layer">
					<div class="dimBg"></div>
					<div id="layer" class="pop-layer">
						<a href="#" class="btn-layerClose" id="popBtnClose"><img
							src="resources/images/close.png" alt="닫기" /></a>
						<div class="pop-container">
							<div class="pop-conts">
<!-- 								<label for="#">event:</label><span class="pop-input">숭구리당당</span> <br> -->
								<label for="#">event:</label><input id="pop-title" value="숭구리당당"> <br>
								<label for="#">start:</label><input id="pop-start"value="2018-01-16 12:00"> <br>
								<label for="#">end:</label><input id="pop-end"value="2018-01-17 12:00"> <br>
								<label for="#">friend:</label><select id="pop-friends"></select>
								<div class="btn-r">
									<input id="popName" type=text> 									
									<a href="#" class="btn-layer" id="popBtn">공유</a>
								</div>
							</div>
						</div>
					</div>
			</div>
			<div class="indent-top"></div>
			<table class="day-tb" style="width: 100%;">
				<tr>
					<th class="day-row aligncenter" colspan="5">가계부</th>
				</tr>
				<tr class="day-input-tb">
					<td colspan="5"><input type="text" id="pay_date" value="${date} 00:00:00" class="fleft spacing2">
						<span class="select-editable spacing2"> <select 
							onchange="this.nextElementSibling.value=this.value">
								<option value=""></option>
								<option value="#스타벅스">#스타벅스</option>
								<option value="#이디아">#이디아</option>
								<optgroup label="#수지">
							        <option value="#수지#이마트">#수지#이마트</option>
							        <option value="#수지#롯데리아">#수지#롯데리아</option>
							     </optgroup>
						</select> <input type="text" id="pay_place" value="#"></span>
						 <span class="select-editable spacing2"> <select
							onchange="this.nextElementSibling.value=this.value">
								<option value=""></option>
								<option value="#마트">#마트</option>
								<option value="#식료품">#식료품</option>
								<option value="#간식">#간식</option>
						</select> <input type="text" id="pay_things" value="#">
					</span> <input type="text" id="price" value="2,000" class="fleft"> <a
						class="fright" id="insertCashBook">저장</a>
					</td>
				</tr> 
				<tbody id="cashbookT-body"></tbody>
			</table>
		</div>
	</div>
</body>
</html>