
$(document).ready(function() {
	var monthInfo = new Date($('#monthTitle').text()+'.01');	

	setMonth(monthInfo.getFullYear(), monthInfo.getMonth(), null);	
	
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

/*var events = [
	{start_date: '2018-01-03',end_date: '2018-01-06',title: '기린은 길어 길으면 기차 기차는 빨라123456789', color:'#FFE05C'},
	{start_date: '2018-01-05',end_date: '2018-01-08',title: '빠르면비행기비행기는높아높으면백두산', color:'#C6D6F7'},
	{start_date: '2018-01-08',end_date: '2018-01-09',title: '새로운이벤트입니다.', color:'#E18060'}
];//
*/
/*function getMSetList(){
	$.ajax({
		type: 'Get',
		url: '/WriteYourDay/events/list.do',
		data:{
			startdate : $('#monthTitle').text()+'.01'
		},
		success: function(out){
			var monthInfo = new Date($('#monthTitle').text()+'.01');
			setMonth(monthInfo.getFullYear(), monthInfo.getMonth());	
        }	
	})
}*/

function setMonth(year, month, events){
	
	var firstDate = new Date(year, month, 1);  
	var lastDate = new Date(year, month + 1, 0);
	
	//events 준비
	var dayEventsLimit = 4;//하루에 이벤트 몇개를 보여줄지 
	var dayEventsStrLens = 6; //하루에 보여줄 수 있는 이벤트 제목의 글자 갯수
	var dayEvents = new Array(lastDate.getDate());
	for(var i = 0 ; i < dayEvents.length ; i++) 
		dayEvents[i] = new Array(dayEventsLimit);

	if(events != null){		
		for(var e = 0 ; e < events.length ; e++){
			var start_date = new Date(events[e].start_date);
			var end_date = new Date(events[e].end_date);
			
			var start = start_date.getDate() - 1;
			if(start_date.getTime() < firstDate.getTime())
				start = 0;
			var term = end_date.getDate() - start;
		   
			var place = -1;
		    for(var i = 0; i < term ; i++){	    	
		    	var day = i + start;
		    	for(var j = 0 ; j < dayEventsLimit ; j++){
		    		if(j < place || dayEvents[day][j]) continue;
		    		else{
		    			dayEvents[day][j] = [events[e].color, events[e].title.substring(i*dayEventsStrLens, (i+1)*dayEventsStrLens)]
		    			place = j;
		    			break;
		    		}
		    	}	    		
		    }
		}
	}	
	
	var start = firstDate.getDay(); 
	var dates = 0;
	
	for (var i = 0; i < 5; i++) {
		$('#month-body').append('<tr>')
		for (var j = 0; j < 7; j++) {
			var td = '<td class="month-row">';

			if (start == j) {
				start = -1;
				dates = 1;
			}

			if (dates > 0 && dates <= lastDate.getDate()){
				td += '<a href="/WriteYourDay/myday.do?date='+year+'.'+(month+1)+'.'+dates+'">' + dates + '</a><br>';
				for(var k = 0 ; k < dayEventsLimit ; k++){
					if(dayEvents[dates-1][k]){
						td += '<div style="background-color: ' + dayEvents[dates-1][k][0] + '"><strong><FONT face="Arial Black">' + dayEvents[dates-1][k][1] + '</FONT><strong></div>';
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

