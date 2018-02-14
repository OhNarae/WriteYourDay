<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../libs.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Month</title>
<script src="resources/js/month.js?version=${sysVer}" type="text/javascript"></script>
<link rel="stylesheet" href="resources/css/month.css?version=${sysVer}" type="text/css"
	media="screen">
</head>
<body id="mycalendar">
	<div class="indent-top"></div>
	<div class="main">
		<div class="container_12">
			<div class="grid_9">
				<div class="carousel">
					<a class="prev" href="/WriteYourDay/month.do?month=${month}&direction=pre"></a>
					<h3 class="color-3 aligncenter"><span id="monthTitle">${month}</span></h3>
					<a class="next" href="/WriteYourDay/month.do?month=${month}&direction=next"></a>
				</div>
				<table class="month-tb">
					<tr>
						<th class="month-row">일</th>
						<th class="month-row">월</th>
						<th class="month-row">화</th>
						<th class="month-row">수</th>
						<th class="month-row">목</th>
						<th class="month-row">금</th>
						<th class="month-row">토</th>
					</tr>
					<tbody id="month-body"></tbody>
				</table>
			</div>
			<div class="grid_3">
				<input type="checkbox" name="ck-cal1" id="ck-cal1" /><label
					for="ck-cal1" class="text-2">가계부 사용</label>
				<div id="cal-div">
					<div class="indent-top"></div>
					<div align="right">총 지출: <span id="totalCal"></span>원</div>
					<table class="cal-tb">
						<tr>
							<th class="cal-row">장소</th>
							<th class="cal-row">금액</th>
						</tr>
						<tbody id="cal-body"></tbody>
					</table>
				</div>
				<div class="wrapper">
					<div class="indent-top"></div>
					<div id="eventShareList"></div>	
				</div>
			</div>
		</div>
	</div>
</body>
</html>