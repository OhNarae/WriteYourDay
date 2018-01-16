<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Month</title>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/grid.css" type="text/css"
	media="screen">
<script src="resources/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script>
	function initMonth(var year, var month, var eventInfos) {
		var today = new Date();
		var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

		var start = firstDate.getDay();
		var dates = 0;
		for (var i = 0; i < 5; i++) {
			$('#month-body').append('<tr>')
			for (var j = 1; j < 8; j++) {
				var td = '<td class="month-row">';

				if (start == j) {
					start = 0;
					dates = 1;
				}

				if (dates > 0 && dates <= lastDate.getDate())
					td += '<a href="">' + dates++ + '</a><br><div style="background-color:red;color:white">고딩이생일</div>';
				td += '</td>';

				$('#month-body').append(td);

			}
			$('#month-body').append('</tr>')
		}
	}
	
/* 	$(document).ready(function(){
		$('#btnLogin').click(function(){
			$.ajax({
				type: 'Get',
				url: '/Spring03/mlogin.do',
				data: {
					id: $('#id').val(),
					password: $('#password').val()},
				success: function(result){
					$('#resultDisplay').html(result);
				}	
			})
		})
	}) */


	$(document).ready(function() {
		initMonth();		
		$.ajax({
			type: 'Post',
			url : '/WriteYourDay/getJsonByVO.do',
			dataType : "json",
			data : {
				status : '',
				data : []
			},
			success:function(data){
				if(0 != data.resultCode)
					alert(data.resultMsg);
				
 				$.each(data.monthEvents, function(i, item){
 					show += "<tr><td width='200' align='center'>퀀텀</td>";
 					show += "<td>"+item.closing_price+"</td></tr>";
 				}
				$("#qtum").append(show);
			}, error:function(e){
			}
		});
		

		$('#cal-div').hide();
		$('input[name=ck-cal1]').on('click', function() {
			$.ajax({
				url : "",
				dataType : "json",
				data : {
					status : '',
					data : []
				},
				success:function(data){
					$("#qtum").html("<tr><th>종목</th><th>실시간 시세</th></tr>");
//	 				$.each(data, function(i, item){
//	 					show += "<tr><td width='200' align='center'>퀀텀</td>";
//	 					show += "<td>"+item.closing_price+"</td></tr>";
//	 				}
					$("#qtum").append(show);
				}, error:function(e){
				}
			});
			
			if ($('input[name=ck-cal1]').is(":checked")) {
				$('#cal-div').show();
				$('#cal-body').append('<tr><td class="cal-row">이마트</td><td class="cal-row">2000</td></tr>');
			} else {
				$('#cal-div').hide();
			}
		})
		
		

	})
</script>
<style type="text/css">

/* 월별 스케쥴 테이블 스타일 */
.month-tb {
	border-collapse: collapse;
	border-spacing: 0;
	width: 700px;
}

.month-tb td {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	height: 100px
}

.month-tb th {
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

.month-tb .month-row {
	vertical-align: top
}

/* 가계부 테이블 스타일 */
.cal-tb {
	border-collapse: collapse;
	border-spacing: 0;
	width: 220px;
}

.cal-tb td {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
}

.cal-tb th {
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

.cal-tb .cal-row {
	vertical-align: top
}

.carousel {margin: 0 auto;width:700px;height:50px;overflow:hidden;position:relative;}
.carousel .next {display:block;height:22px;width:11px;position:absolute;right:0px;top:14px;background:url(resources/images/carousel-control.png) right top no-repeat;background-color: #262626}
.carousel .prev {display:block;height:22px;width:11px;position:absolute;left:0px;top:14px;background:url(resources/images/carousel-control.png) left top no-repeat;background-color: #262626}

</style>
</head>
<body id="mycalendar">
	<div class="indent-top"></div>
	<div class="main">
		<div class="container_12">
			<div class="grid_9">
				<div class="carousel">
					<a class="prev" href="#"></a>
					<h3 class="color-3 aligncenter">2018.01</h3>
					<a class="next" href="#"></a>
				</div>
				<table class="month-tb">
					<tr>
						<th class="month-row">월</th>
						<th class="month-row">화</th>
						<th class="month-row">수</th>
						<th class="month-row">목</th>
						<th class="month-row">금</th>
						<th class="month-row">토</th>
						<th class="month-row">일</th>
					</tr>
					<tbody id="month-body"></tbody>
				</table>
			</div>
			<div class="grid_3">
				<input type="checkbox" name="ck-cal1" id="ck-cal1" /><label
					for="ck-cal1" class="text-2">가계부 사용</label>
				<div id="cal-div">
					<div class="indent-top"></div>
					<div align="right">총 지출: 2000원</div>
					<div align="right">총 수입: 1000원</div>
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
					<span class="msg fleft">- 숑숑 고등학교 동창</span><br> <a
						class="abutton fright" href="#">거절</a><a class="abutton fright"
						href="#">수락</a><br> <span class="msg fleft">- 숑숑 고등학교
						동창</span><br> <a class="abutton fright" href="#">거절</a><a
						class="abutton fright" href="#">수락</a><br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>