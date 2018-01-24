


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
	var today = new Date();
	
	$('#monthTitle').text(today.getFullYear() + '.' + today.getMonth() + 1)
	setMonth(today.getFullYear(), today.getMonth());		

	$('#cal-div').hide();
	$('input[name=ck-cal1]').on('click', function() {
		if ($('input[name=ck-cal1]').is(":checked")) {
			$('#cal-body').append('<tr><td class="cal-row">이마트</td><td class="cal-row">2000</td></tr>');
			$('#cal-div').show();
		} else {
			$('#cal-div').hide();
		}
	})
})

var events = [
	{start_date: '2018-01-03',end_date: '2018-01-05',title: '가나다라마바사아자차카타파하123456789'},
	{start_date: '2018-01-06',end_date: '2018-01-07',title: '123456789가나다라마바사아자차카타파하'}
];

function setMonth(year, month){//, events){//var year, var month, var eventInfos) {
	
	var firstDate = new Date(year, month, 1);
	var lastDate = new Date(year, month + 1, 0);
	
	//events 준비
	var dayEventsLimit = 4;//하루에 이벤트 몇개를 보여줄지 
	var dayEventsStrLens = 5; //하루에 보여줄 수 있는 이벤트 제목의 글자 갯수
	var dayEvents = new Array(lastDate.getDate());
	for(var i = 0 ; i < dayEvents.length ; i++) 
		dayEvents[i] = new Array(dayEventsLimit);
		
	for(var e = 0 ; e < events.length ; e++){
		var start_date = new Date(events[e].start_date);
		var end_date = new Date(events[e].end_date);
		
		var start = start_date.getDate() - 1;
		if(start_date.getTime() < firstDate.getTime())
			start = 0;
		var term = end_date.getDate() - start;
	   
	    for(var i = 0; i < term ; i++){
	    	var place = -1;
	    	var day = i + start;
	    	for(var j = 0 ; j < dayEventsLimit ; j++){
	    		if(j < place || dayEvents[day][j]) continue;
	    		else{
	    			dayEvents[day][j] = events[e].title.substring(i*dayEventsStrLens, (i+1)*dayEventsStrLens)
	    			place = j;
	    			break;
	    		}
	    	}	    		
	    }
	}

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

			if (dates > 0 && dates <= lastDate.getDate()){
				td += '<a href="">' + dates + '</a><br>';
				for(var k = 0 ; k < dayEventsLimit ; k++){
					if(dayEvents[dates-1][k]){
						td += '<div>' + dayEvents[dates-1][k] + '</div>';
					}
					else
						td += '<br>';
				}	
				dates++;
			}
			td += '</td>';
			$('#month-body').append(td);
		}
		$('#month-body').append('</tr>')		
	}
}

